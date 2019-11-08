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
    document.querySelector("#conversationDivPrivate").style.display="none";

    const sendMessageBtn = document.getElementById("sendMessageBtn");
    sendMessageBtn.addEventListener("click",function(){
        let data = getMessageTextData();
        sendPrivateMessage(adminAvailableId,data);
        saveDialog(adminAvailableId,data);
        displayDialog(adminAvailableId);
    });


    const  displayDialog=(admin) =>{
        const dialogBox = document.getElementById('dialog-box');

        dialogBox.innerHTML="";
        const dialog=fetchDialogFromStorage(admin);
        //create displaying message
        dialog.forEach(function(data){
            const p = document.createElement("p");
            p.textContent= "From: "+data.from + " Text: "+ data.text +" Timestamp: "+data.timestamp;
            dialogBox.appendChild(p);
        });
        return dialogBox;
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
                    saveDialog(adminAvailableId,data);
                    displayDialog(adminAvailableId);
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
        fetch("/user-get-available-admin").then((data)=> data.text()).then((res)=> adminAvailable(res))
    }

    const adminAvailable=(adminId)=>{
        const conversationDivPrivate = document.querySelector("#conversationDivPrivate");
        if(adminId!=="not available"){
            adminAvailableId=adminId;
            conversationDivPrivate.style.display="block";
            document.querySelector(".panel-heading").innerHTML = "Hello! How can i help you?";
        }
        else{
            conversationDivPrivate.style.display="none";
            document.querySelector(".panel-heading").innerHTML = "Admin not available";
            console.log(adminId);
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
    const fetchDialogFromStorage =(admin)=>{
        let dialog = [];
        if(localStorage.getItem(admin)===null){
            dialog = [];
        }
        else{
            dialog = JSON.parse(localStorage.getItem(admin))
        }
        return dialog;
    }


    //save dialog in json in local storage
    const saveDialog=(admin, data)=>{
        const dialog = fetchDialogFromStorage(admin);
        dialog.push(data);
        localStorage.setItem(admin,JSON.stringify(dialog));
    }

    //delete dialog in json in local storage
    const deleteDialogInStorage=(admin)=>{
        localStorage.removeItem(admin);
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
