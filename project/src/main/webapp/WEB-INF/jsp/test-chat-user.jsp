<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%--
  Created by IntelliJ IDEA.
  User: giagkas
  Date: 31/10/19
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <title>User Chat</title>
    <style>
        body {font-family: Arial, Helvetica, sans-serif;}
        * {box-sizing: border-box;}

        .open-button,
        .close-button {
            padding: 10px;
            position: fixed;
            bottom: 23px;
            right: 28px;
            width: 280px;
            font-size: 20px;
            border-radius: 40px;
            text-align: center;
            box-shadow: none;
        }


        .icon {
            margin-right: 15px;
            size: 7rem;
        }

        .send-button {
            padding: 11px 12px;
            /* opacity: 0.8; */
            float:left;
            border-radius: 10px;
        }

        .chat {
            display: none;
            position: fixed;
            bottom: 78px;
            right: 15px;
            border: 3px solid #f1f1f1;
            border-radius: 10px;
            width: 400px;
            max-width: 600px;
            padding: 10px;
            background-color: white;

        }

        textarea {
            width: 80%;
            padding: 10px;
            margin: 0px 10px  5px 0;
            border-radius: 10px;
            border: 1px solid;
            background: #f1f1f1;
            resize: none;
            height: 50px;
            float: left;
        }

        .chat textarea:focus {
            background-color: #ddd;
            outline: none;
        }

        .chat{
            display: none;
        }
    </style>
</head>
<body>


<button type="button" class="btn btn-info open-button" onclick="openChat(); connect(); getAdmin();"><i
        class="far fa-question-circle icon"></i>Need help?</button>


<div class="chat panel panel-default">
    <div>
        <input type="text" hidden id="from" value=<c:out value="${userNickname}"/> />

    </div>

    <div class="panel-heading"></div>

    <div id="dialog-box"></div>

    <%--<div>--%>
        <%--<button id="connect" onclick="connect();">Connect</button>--%>
        <%--<button id="disconnect" disabled="disabled" onclick="disconnect();">--%>
            <%--Disconnect--%>
        <%--</button>--%>
    <%--</div>--%>

    <div id="conversationDivPrivate">
        <textarea id="textPrivate" placeholder="Write a Private message..." required></textarea>
        <button id="delete-history-btn" type="button" class="btn btn-warning">Delete History</button>
        <button id="sendMessageBtn" class=" btn btn-secondary send-button">Send</button>
    </div>

    <div>
        <button type="button" class="btn btn-info close-button" onclick="closeChat(); disconnect();"><i class="far fa-window-close icon"></i>Close</button>
    </div>




</div>



<script type="text/javascript">
    //Chat Functionality
    let stompClient = null;
    let adminAvailableId;
    let adminAvailableAvatar;
    let storageKeyId= "QuizbotService-" +document.getElementById('from').value;
    document.querySelector("#conversationDivPrivate").style.display="none";

    const sendMessageBtn = document.getElementById("sendMessageBtn");
    sendMessageBtn.addEventListener("click",function(){
        let data = getMessageTextData();
        sendPrivateMessage(adminAvailableId,data);
        saveDialog(storageKeyId,data);
        displayDialog(storageKeyId);
    });


    const  displayDialog=(storageKeyId) =>{
        const dialogBox = document.getElementById('dialog-box');

        dialogBox.innerHTML="";
        const dialog=fetchDialogFromStorage(storageKeyId);
        //create displaying message
        dialog.forEach(function(data){
            const p = document.createElement("p");
            p.textContent= "From: "+data.from + " Text: "+ data.text +" Timestamp: "+data.timestamp;
            dialogBox.appendChild(p);
        });
        return dialogBox;
    }

    const createDeleteHistoryListener=()=>{
        const deleteHistoryBtn = document.getElementById("delete-history-btn");
        deleteHistoryBtn.addEventListener("click",()=>{
            deleteDialogInStorage(storageKeyId);
            displayDialog(storageKeyId);
        });
    }


    const connect =()=>{
        let socket = new SockJS("/chat");
        stompClient = Stomp.over(socket);
        stompClient.connect(
            {}, function(frame){
                console.log('Connected: ' + frame);

                stompClient.subscribe("/user/queue/errors", function(message){
                });

                stompClient.subscribe("/user/queue/private", function(message){
                    console.log(message.body);
                    const data = JSON.parse(message.body);
                    saveDialog(storageKeyId,data);
                    displayDialog(storageKeyId);
                });

            }
        );
    }

    const disconnect=()=>{
        if(stompClient!=null){
            stompClient.disconnect();
        }
        console.log("Disconnected");
    }


    //fetch admin
    const getAdmin =()=>{
        fetch("/user-get-available-admin").then((data)=> data.json()).then((res)=> adminAvailable(res));
    }

    const adminAvailable=(admin)=>{
        const conversationDivPrivate = document.querySelector("#conversationDivPrivate");
        if(admin.sessionId!=="not available"){
            adminAvailableId=admin.sessionId;
            adminAvailableAvatar=admin.avatarId;
            conversationDivPrivate.style.display="block";
            createDeleteHistoryListener();
            displayDialog(storageKeyId);
            document.querySelector(".panel-heading").innerHTML = "Hello! How can i help you?";
        }
        else{
            conversationDivPrivate.style.display="none";
            document.querySelector(".panel-heading").innerHTML = "Admin not available";

        }
    }

    const sendPrivateMessage =(sendTo, data)=>{

        stompClient.send("/user/"+sendTo+"/queue/private",{}, JSON.stringify(data));
        return(data);
    }

    const getMessageTextData=()=>{
        const from = document.getElementById('from').value;
        const text = document.getElementById('textPrivate').value;
        const dt = new Date();
        const utcDate = dt.toUTCString();

        const data ={from:from, text:text, timestamp:utcDate};
        return data;
    }



    //retrieve dialog in json from local storage  based on userNickname
    const fetchDialogFromStorage =(storageKeyId)=>{
        let dialog = [];
        if(localStorage.getItem(storageKeyId)===null){
            dialog = [];
        }
        else{
            dialog = JSON.parse(localStorage.getItem(storageKeyId))
        }
        return dialog;
    }


    //save dialog in json in local storage
    const saveDialog=(storageKeyId, data)=>{
        const dialog = fetchDialogFromStorage(storageKeyId);
        dialog.push(data);
        localStorage.setItem(storageKeyId,JSON.stringify(dialog));
    }

    //delete dialog in json in local storage
    const deleteDialogInStorage=(storageKeyId)=>{
        localStorage.removeItem(storageKeyId);
    }

    function openChat() {
        document.querySelector(".chat").style.display = "block";
    }

    function closeChat() {
        document.getElementById('dialog-box').innerHTML = '';
        document.querySelector(".chat").style.display = "none";
    }




</script>



</body>
</html>
