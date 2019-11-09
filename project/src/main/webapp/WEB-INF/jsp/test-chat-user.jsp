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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>

    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <title>User Chat</title>
    <link rel="stylesheet" type="text/css" href="/css/user-chat.css">


</head>
<body>


<button type="button" class="btn btn-info open-button" onclick="openChat(); connect(); getAdmin();"><i
        class="far fa-question-circle icon"></i>Need help?</button>


<section class="container chat">
        <div>
            <input type="text" hidden id="from" value=<c:out value="${userNickname}"/> />
        </div>

        <div class="chat-header bg-light p-2 m-1"></div>

        <div id="chat-body">
            <div id="dialog-box"></div>

            <div id="conversationDivPrivate" >
                <button id="delete-history-btn" type="button" class="btn btn-secondary">Clear History</button>
                <textarea id="textPrivate" placeholder="Write a Private message..." class="col-9" required></textarea>
                <button id="sendMessageBtn" class="col-2 btn btn-secondary send-button">Send</button>
            </div>
        </div>

        <button type="button" class="btn btn-info close-button" onclick="closeChat(); disconnect();"><i class="far fa-window-close icon"></i>Close</button>
</section>



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

    sendMessageBtn.addEventListener("click", clearMessage);


    const displayDialog=(storageKeyId) =>{
        const dialogBox = document.getElementById('dialog-box');

        dialogBox.innerHTML="";
        const dialog=fetchDialogFromStorage(storageKeyId);
        //create displaying message
        dialog.forEach(function(data){
            const div1 = document.createElement("div");
            div1.className = "message";
            const div2 = document.createElement("div");
            div2.className = "photo";
            div2.textContent = data.from + ": Avatar";
            div1.appendChild(div2);
            const div3 = document.createElement("div");
            div3.className = "online";
            div2.appendChild(div3);
            const p1 =document.createElement("p");
            p1.className = "text";
            p1.textContent = data.text;
            div1.appendChild(p1);
            const p = document.createElement("p");
            p.className = "time";
            p.textContent = data.timestamp;
            dialogBox.appendChild(div1);
            dialogBox.appendChild(p);
        });
        return dialogBox;
    }


    // const displayDialog=(storageKeyId) =>{
    //     const dialogBox = document.getElementById('dialog-box');
    //
    //     dialogBox.innerHTML="";
    //     const dialog=fetchDialogFromStorage(storageKeyId);
    //     //create displaying message
    //     dialog.forEach(function(data){
    //         const p = document.createElement("p");
    //         p.textContent= "From: "+data.from + " Text: "+ data.text +" Timestamp: "+data.timestamp;
    //         dialogBox.appendChild(p);
    //     });
    //     return dialogBox;
    // }

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
        const chatBody = document.querySelector("#chat-body");
        const chat = document.querySelector(".chat");
        if(admin.sessionId!=="not available"){
            adminAvailableId=admin.sessionId;
            adminAvailableAvatar=admin.avatarId;
            conversationDivPrivate.style.display="block";
            createDeleteHistoryListener();
            displayDialog(storageKeyId);
            document.querySelector(".chat-header").innerHTML = "Hello! How can i help you?";
        }
        else{
            chatBody.style.display="none";
            chat.style.width = "300px";
            document.querySelector(".chat-header").innerHTML = "Admin not available";

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
        // document.getElementById("#dialog-box").innerHTML = '';
        document.querySelector(".chat").style.display = "none";
    }

    function clearMessage() {
        const textarea = document.querySelector("#textPrivate");
        textarea.value = " ";
    }

</script>



</body>
</html>
