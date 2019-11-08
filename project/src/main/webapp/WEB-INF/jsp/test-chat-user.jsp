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
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <title>User Chat</title>
</head>
<body>


<div onload="disconnect()">
    <div>
        <input type="text" id="from" placeholder="Choose a nickname"/>
    </div>
    <br />
    <div>
        <button id="connect" onclick="connect();">Connect</button>
        <button id="disconnect" disabled="disabled" onclick="disconnect();">
            Disconnect
        </button>
    </div>
    <br />

    <button id="checkAdmin" onclick="getAdmin();">Check Available Admin</button>
    <br/>

    <div id="conversationDivPrivate">
        <input type="text" id="textPrivate" placeholder="Write a Private message..."/>
        <button id="sendMessageBtn" ">Send</button>
        <div id="dialog-box"></div>
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

    const setConnected=(connected)=>{
        document.getElementById('connect').disabled = connected;
        document.getElementById('disconnect').disabled = !connected;

        document.getElementById('dialog-box').innerHTML = '';
    }


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
                setConnected(true);
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
        setConnected(false);
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
        }
        else{
            conversationDivPrivate.style.display="none";
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



</script>



</body>
</html>
