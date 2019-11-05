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



        <div>
            Send private message:
            <input type="text" id="send-to" placeholder="Choose a nickname"/>
        </div>

        <div id="conversationDivPrivate">
            <input type="text" id="textPrivate" placeholder="Write a Private message..."/>
            <button id="sendMessagePrivate" onclick="sendPrivateMessage();">Send</button>
            <p id="response"></p>
        </div>
    </div>




    <script>
    const ul = document.querySelector("ul");


    const createUserDataBox= (id, nickname) =>{
        //create td element to click containing a user info
        const userData = document.createElement("li");
        userData.className+="userBox";

        userData.setAttribute("id",id);
        userData.innerText=nickname;

        //create row and append

        ul.appendChild(userData)
    }



    const retrieveUserDtoList=()=>{
        fetch("/admin-get-users").then(data=>data.json()).then(function(data){
            data.forEach(function(item){
               createUserDataBox(item.userId,item.userNickname);
            });
        });
    }



    retrieveUserDtoList();









    //Chat Functionality
    let stompClient = null;

    const setConnected=(connected)=>{
        document.getElementById('connect').disabled = connected;
        document.getElementById('disconnect').disabled = !connected;

        document.getElementById('response').innerHTML = '';
    }


    const  showMessageOutput=(messageOutput) =>{
        const response = document.getElementById('response');
        const p = document.createElement('p');
        p.style.wordWrap = 'break-word';
        p.appendChild(document.createTextNode("from: "+messageOutput.body.from +" Content: "+  messageOutput.body.text));
        response.appendChild(p);
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
                    // showMessageOutput(message.body);
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


    const sendPrivateMessage =()=>{
        const to = document.getElementById('send-to').value;
        console.log(to);
        const from = document.getElementById('from').value;
        const text = document.getElementById('textPrivate').value;
        stompClient.send("/user/"+to+"/queue/private",{}, JSON.stringify({from:from, text:text}));
    }


</script>
</body>
</html>
