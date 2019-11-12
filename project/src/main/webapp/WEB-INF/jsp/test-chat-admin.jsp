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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="/css/admin-chat.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <title>Admin</title>

<style>
    .container{max-width:1170px; margin:auto;}
    img{ max-width:100%;}
    .inbox_people {
        background: #f8f8f8 none repeat scroll 0 0;
        float: left;
        overflow: hidden;
        width: 40%; border-right:1px solid #c4c4c4;
    }
    .inbox_msg {
        border: 1px solid #c4c4c4;
        clear: both;
        overflow: hidden;
    }
    .top_spac{ margin: 20px 0 0;}


    .recent_heading {float: left; width:40%;}
    .srch_bar {
        display: inline-block;
        text-align: right;
        width: 60%; padding:
    }
    .headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

    .recent_heading h4 {
        color: #05728f;
        font-size: 21px;
        margin: auto;
    }
    .srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
    .srch_bar .input-group-addon button {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        padding: 0;
        color: #707070;
        font-size: 18px;
    }
    .srch_bar .input-group-addon { margin: 0 0 0 -27px;}

    .chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
    .chat_ib h5 span{ font-size:13px; float:right;}
    .chat_ib p{ font-size:14px; color:#989898; margin:auto}
    .chat_img {
        float: left;
        width: 11%;
    }
    .chat_ib {
        float: left;
        padding: 0 0 0 15px;
        width: 88%;
    }

    .chat_people{ overflow:hidden; clear:both;}
    .chat_list {
        border-bottom: 1px solid #c4c4c4;
        margin: 0;
        padding: 18px 16px 10px;
    }
    .inbox_chat { height: 550px; overflow-y: scroll;}

    .active_chat{ background:#ebebeb;}

    .incoming_msg_img {
        display: inline-block;
        width: 6%;
    }
    .received_msg {
        display: inline-block;
        padding: 0 0 0 10px;
        vertical-align: top;
        width: 92%;
    }
    .received_withd_msg p {
        background: #ebebeb none repeat scroll 0 0;
        border-radius: 3px;
        color: #646464;
        font-size: 14px;
        margin: 0;
        padding: 5px 10px 5px 12px;
        width: 100%;
    }
    .time_date {
        color: #747474;
        display: block;
        font-size: 12px;
        margin: 8px 0 0;
    }
    .received_withd_msg { width: 57%;}
    .mesgs {
        float: left;
        padding: 20px 15px 0 25px;
        width: 60%;
    }

    .sent_msg p {
        background: #05728f none repeat scroll 0 0;
        border-radius: 3px;
        font-size: 14px;
        margin: 0; color:#fff;
        padding: 5px 10px 5px 12px;
        width:100%;
    }
    .outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
    .sent_msg {
        float: right;
        width: 46%;
    }
    .input_msg_write input {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        color: #4c4c4c;
        font-size: 15px;
        min-height: 48px;
        width: 100%;
    }

    .type_msg {border-top: 1px solid #c4c4c4;position: relative;}
    .msg_send_btn {
        background: #05728f none repeat scroll 0 0;
        border: medium none;
        border-radius: 50%;
        color: #fff;
        cursor: pointer;
        font-size: 17px;
        height: 33px;
        position: absolute;
        right: 0;
        top: 11px;
        width: 33px;
    }
    .messaging { padding: 0 0 50px 0;}

    #msg_history {
        height: 516px;
        overflow-y: auto;
    }

    /*MY-CSS*/
    body {
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
    }

    /* ----------------CONTAINER CHAT---------------- */

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
        padding-bottom: 5px;
        background-color: white;
    }

    /* ----------------CHAT HEADER---------------- */

    .header {
        background-color: #e3effd !important;
        border: none;
        margin: 0px;
        padding: 5px;
        padding-left: 10px;
        align-items: center;
        display: flex;
        justify-content: space-between;
    }

    .chat-header {
        float: left;
        color: gray;
        font-weight: 600;
        margin-right: 10px;
    }

    #delete-history-btn {
        float: right;
        border-radius: 50%;
        background-color: darksalmon;
        margin-right: 5px;
        opacity: 0.8;
    }

    #delete-history-btn:hover {
        opacity: 1;
    }

    /* ----------------CHAT BODY---------------- */

    #dialog-box {
        max-height: 400px;
        overflow-y: scroll;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .message {
        display: flex;
        align-items: center;
        margin-bottom: 8px;
    }

    .message .photo {
        display: block;
        width: 45px;
        height: 45px;
        background-color: #E6E7ED;
        border-radius: 50px;
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
    }

    .online {
        position: relative;
        top: 16px;
        left: -10px;
        width: 13px;
        height: 13px;
        background-color: #8BC34A;
        border-radius: 13px;
        border: 3px solid #FAFAFA;
    }

    .text {
        margin: 0 10px;
        background-color: #5BC0DE;
        padding: 15px;
        border-radius: 12px;
        word-break: break-all
    }

    .time {
        font-size: 10px;
        color: lightgrey;
        margin-bottom: 10px;
        margin-left: 70px;
    }

    .response {
        display: flex;
        margin-right: 0px !important;
        margin-left: auto;
        justify-content: flex-end;
    }

    .response .photo {
        margin-left: auto;
        order: 2;
    }

    .response .online {
        order: 2;
        top: 28px;
        left: -50px;
    }

    .response .text {
        background-color: #e3effd !important;
        order: 1;
    }

    #conversationDivPrivate {
        justify-content: space-between;
        width: 680px;
        border-top: 3px solid #f1f1f1;
        margin-left: 2px;
        margin-right: 10px;
        padding-top: 5px;
        height: 70px;
    }

    textarea {
        width: 70%;
        padding: 10px;
        margin: 10px 15px;
        border-radius: 10px;
        border: 1px solid gray;
        background: #f1f1f1;
        resize: none;
        height: 50px;
        position: fixed;
    }

    .chat textarea:focus {
        background-color: #ddd;
        outline: none;
    }

    #sendMessageBtn {
        margin-right: 10px;
        margin-bottom: 10px;
        border-radius: 50%;
        opacity: 0.8;
        font-size: 15px;
        background: #5BC0DE none repeat scroll 0 0;
        border: medium none;
        color: #fff;
        position: absolute;
        right: 0;
        top: 11px;
        width: 40px;
        height: 35px;
    }

    #sendMessageBtn:hover {
        opacity: 1;
    }

    .write_msg {
        margin-bottom: 5px;
    }

    /* ----------------OPEN-CLOSE BUTTONS---------------- */

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
        border: none;
    }

    .icon {
        margin-right: 15px;
        size: 7rem;
    }

</style>
</head>


<body>

<div class="container" onload="disconnect()">
    <div class="messaging">
        <div class="inbox_msg">
            <div>
                <input id="adminNickname" type="text" hidden id="from" value=<c:out value="${adminNickname}"/> />
                <input id="adminAvatarId" type="text" hidden value=<c:out value="${adminAvatarId}"/> />
            </div>

            <div class="inbox_people">
                <div class="headind_srch">
                    <div class="recent_heading">
                        <h4>Players</h4>
                    </div>
                    <div class="srch_bar">
                        <div class="stylish-input-group">
                            <input type="text" class="search-bar" placeholder="Search">
                            <span class="input-group-addon">
                                    <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                                </span> </div>
                    </div>
                </div>
                <%--users--%>
                <div class="inbox_chat"></div>
            </div>

            <div class="mesgs">

                <div class="message-header">
                    <button id="connect" type="button" class="btn"  data-toggle="tooltip" data-placement="bottom" title="Connect" onclick="connect();"><i class="fas fa-sign-in-alt"></i></button>
                    <button id="disconnect" type="button" class="btn"  data-toggle="tooltip" data-placement="bottom" title="Disconnect" disabled="disabled" onclick="disconnect();"><i class="fas fa-sign-out-alt"></i></button>
                    <div class="chat-header">Quizbot Chat</div>
                    <button id="delete-history-btn" type="button" class="btn"  data-toggle="tooltip" data-placement="bottom" title="Delete history"><i class="fas fa-trash-alt"></i></button>
                </div>


                <div id="msg_history">
                    <div id="messageboard"></div>


                </div>
                <div class="type_msg">
                    <div class="input_msg_write">
                        <input type="text" class="write_msg" placeholder="Type a message" />
                        <button id="sendMessageBtn" class="btn" type="button"><i class="fas fa-paper-plane"></i></button>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>

<script>
     // -----------Admin Chat Functionality-----------

    const inboxChat = document.querySelector(".inbox_chat");
    const adminNickname = document.getElementById("adminNickname").value;
    const adminAvatarId = document.getElementById("adminAvatarId").value;
    let currentlyActiveUserBox;

     // -----------CREATE LIST OF USERS-----------

     const retrieveUserDtoList=()=>{
         fetch("/admin-get-users").then(data=>data.json()).then(function(data){
             data.forEach(function(item){
                 createUserDataBox(item.userId,item.userNickname);
             });
         });
     }

     retrieveUserDtoList();

    const createUserDataBox= (id, nickname) =>{
        const div1 = document.createElement("div");
        div1.className = "chat_list";
        div1.setAttribute("id", id);
        const div2 = document.createElement("div");
        div2.className = "chat_people";
        div1.appendChild(div2);
        const div3 = document.createElement("div");
        div3.className = "chat_img";
        const div4 = document.createElement("div");
        div4.className = "chat_ib";
        div2.appendChild(div3);
        div2.appendChild(div4);
        const img = document.createElement("img");
        img.src = "/images/" + id + ".jpg";
        img.alt = "user's avatar";
        const h5 = document.createElement("h5");
        h5.textContent = nickname;
        h5.setAttribute("id", id);
        div3.appendChild(img);
        div4.appendChild(h5);
        h5.addEventListener("click",handleClickOnUserBox);
        inboxChat.appendChild(div1);
    }

     // -----------HANDLE CLICK ON USER BOX-----------

    const handleClickOnUserBox =(e)=>{
        const userId = e.target.getAttribute("id");
        const userNickname = e.target.textContent;
        console.log(userId);
        retrieveUserSessionId(userId, userNickname);
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

     // -----------CREATE PRIVATE USER CHAT WINDOW-----------
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
