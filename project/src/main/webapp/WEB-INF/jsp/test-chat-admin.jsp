<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <link rel="stylesheet" type="text/css" href="/css/admin-chat.css">
    <title>Admin</title>
</head>
<body>


<%--users--%>
    <ul></ul>


<%--chat--%>
    <div onload="disconnect()">
        <div>
            <input id="adminNickname" type="text" hidden id="from" value=<c:out value="${userNickname}"/> />

        </div>
        <div>
            <button id="connect" onclick="connect();">Connect</button>
            <button id="disconnect" disabled="disabled" onclick="disconnect();">
                Disconnect
            </button>
        </div>
        <br />
        


        <div id="messageboard">

        </div>

    </div>




    <script>


    const ul = document.querySelector("ul");
    const adminNickname = document.getElementById("adminNickname").value;
    let currentlyActiveUserBox;

    const handleClickOnUserBox =(e)=>{
        const userId = e.target.getAttribute("id");
        const userNickname = e.target.textContent;
        console.log(userId);
        retrieveUserSessionId(userId, userNickname);
    }

    const createUserDataBox= (id, nickname) =>{
        //create li element to click containing a user info
        const userData = document.createElement("li");
        userData.className+="userBox";

        userData.setAttribute("id",id);
        userData.innerText=nickname;

        //add Event Listener
        userData.addEventListener("click",handleClickOnUserBox);

        ul.appendChild(userData)
    }


    const retrieveUserSessionId=(userId, userNickname)=>{
        const URL = "/admin-get-user-session-id?user-id="+userId;
        fetch(URL).then(res=>res.text()).then(data=>{
            console.log(data)
            if(data!=="not available"){
                createPrivateChatWindow(data, userId, userNickname);
            }
        });
    }

    const retrieveUserDtoList=()=>{
        fetch("/admin-get-users").then(data=>data.json()).then(function(data){
            data.forEach(function(item){
               createUserDataBox(item.userId,item.userNickname);
            });
        });
    }



    retrieveUserDtoList();



    //create private user chat window
    const createPrivateChatWindow=(sessionId, userId, userNickname)=>{

        let privateChatWindowExists = document.getElementById("private-chat-window-"+userId);
        if(privateChatWindowExists){
            return;
        }

        const messageBoard = document.querySelector("#messageboard");
        const div = document.createElement("div");
        div.id = "private-chat-window-"+userId;
        div.style.border="1px black solid";
        div.addEventListener("click",()=>{
            const userBox = document.getElementById(userId);
            userBox.style.backgroundColor="white";
            userBox.style.color="black";
        });
        const p = document.createElement("p");

        p.textContent="Send message to: "+userNickname;
        const messageArea = document.createElement("input");
        messageArea.setAttribute("type","text");

        const btnSend = document.createElement("button");
        btnSend.textContent="Send";
        btnSend.addEventListener("click",()=>{
            sendPrivateMessage(adminNickname,sessionId,messageArea.value);
            const dialog = {from:adminNickname,text:messageArea.value,timestamp:getTimestamp()};
            saveDialog(userNickname,dialog);
            displayDialog(userNickname);

        });

        //dialog box
        const dialog  = displayDialog(userNickname);

        const deleteHistoryBtn =  createDeleteHistoryBtn(userId,userNickname);


        div.appendChild(p);
        div.appendChild(messageArea);
        div.appendChild(btnSend);
        div.appendChild(deleteHistoryBtn);
        div.appendChild(dialog);
        messageBoard.appendChild(div);
    }






    const createDialogBox=(userNickname)=>{
        const dialogBox  = document.createElement("div");
        dialogBox.id=userNickname;

        return dialogBox;
    }

    const displayDialog=(userNickname)=>{
        let dialogBox = document.querySelector("#"+userNickname);
        if(dialogBox===null){
            dialogBox= createDialogBox(userNickname);
        }

            dialogBox.innerHTML="";
            const dialog=fetchDialogFromStorage(userNickname);
            //create displaying message
            dialog.forEach(function(data){
               const p = document.createElement("p");
               p.textContent= "From: "+data.from + " Text: "+ data.text +" Timestamp: "+data.timestamp;
               dialogBox.appendChild(p);
            });
        return dialogBox;
    }


    //retrieve dialog in json from local storage  based on userNickname
    const fetchDialogFromStorage =(userNickname)=>{
        let dialog = [];
        if(localStorage.getItem(userNickname)===null){
            dialog = [];
        }
        else{
            dialog = JSON.parse(localStorage.getItem(userNickname))
        }
        return dialog;
    }


    //save dialog in json in local storage
    const saveDialog=(userNickname, data)=>{
       const dialog = fetchDialogFromStorage(userNickname);
       dialog.push(data);
       localStorage.setItem(userNickname,JSON.stringify(dialog));
    }

    //delete dialog in json in local storage
    const deleteDialogInStorage=(userNickname)=>{
        localStorage.removeItem(userNickname);
    }


    //notification
    const notify=(userNickname)=>{
        fetchUserId(userNickname);
    }


    //check if userNickname matches  user id
    const fetchUserId=(userNickname)=>{
        const URL = "/admin-get-user-id-by-nickname?userNickname="+userNickname;
        fetch(URL).then(res=>res.text()).then(data=>{
            if(data!==undefined){
                const userBox = document.getElementById(data);
                if(userBox!==null){
                    userBox.style.backgroundColor="green";
                    userBox.style.color="white";
                }
            }
        });
    }


    const getTimestamp=()=>{
        const dt = new Date();
        const utcDate = dt.toUTCString();
        return utcDate;
    }


    //Chat Functionality Stomp
    let stompClient = null;

    const setConnected=(connected)=>{
        document.getElementById('connect').disabled = connected;
        document.getElementById('disconnect').disabled = !connected;


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
                    let data = JSON.parse(message.body);
                    saveDialog(data.from,data);
                    notify(data.from);
                    displayDialog(data.from);
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


    const sendPrivateMessage =(from, to, text)=>{
        stompClient.send("/user/"+to+"/queue/private",{}, JSON.stringify({from:from, text:text, timestamp:getTimestamp()}));
    }


    const createDeleteHistoryBtn= (userId, userNickname)=>{
        const btn = document.createElement("button");
        btn.id="delete-history-btn-"+userId;
        btn.textContent="Delete history";
        btn.addEventListener("click",()=>{
            deleteDialogInStorage(userNickname);
            displayDialog(userNickname);
        });
        return btn;
    }



</script>
</body>
</html>
