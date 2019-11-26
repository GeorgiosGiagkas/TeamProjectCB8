<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/admin-chat.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <title>Admin</title>

<style>
    /* ----------------- GENERAL SETTINGS ----------------- */
    * {
        box-sizing: border-box;
    }

    .container{
        max-width:1170px;
        margin:auto;
        font-family: Arial, Helvetica, sans-serif;
        box-sizing: border-box;
    }

    .messaging {
        padding: 0 0 50px 0;
    }

    .inbox_msg {
        border: 1px solid #c4c4c4;
        clear: both;
        overflow: hidden;
        height: 595px;
    }

    /* ----------------- INBOX - LIST OF PLAYERS ----------------- */

    /* Inbox-Heading */

    .inbox_players {
        background: #f8f8f8 none repeat scroll 0 0;
        float: left;
        overflow: hidden;
        width: 40%;
        border-right: 1px solid #c4c4c4;
    }

    .inbox_heading,
    .message-header {
        padding:10px 29px 10px 20px;
        overflow:hidden;
        border-bottom:1px solid #c4c4c4;
    }

    .heading_title h4,
    .chat-header {
        color: #05728f;
        font-size: 21px;
        margin: auto;
        font-weight: 600;
    }
    .heading_title {
        float: left;
        width:40%;
    }

    .heading_search {
        display: inline-block;
        text-align: right;
        width: 60%;
    }

    .heading_search input {
        border:1px solid #cdcdcd;
        border-width:0 0 1px 0;
        width:80%;
        padding:2px 0 4px 6px;
        background:none;
    }

    .heading_search .input-group-addon button {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        padding: 0;
        color: #707070;
        font-size: 18px;
    }

    .heading_search .input-group-addon {
        margin: 0 0 0 -27px;
    }

    /* Inbox-Chat */

    .inbox_chat {
        height: 550px;
        overflow-y: scroll;
    }

    .chat_list {
        border-bottom: 1px solid #c4c4c4;
        margin: 0;
        padding: 10px 16px;
    }

    .active_chat{
        background:#93969691;
    }

    .chat_people{
        overflow:hidden;
        clear:both;
        align-items: center;
        display: flex;
        flex-flow: row nowrap;
        justify-content: flex-start;
        align-items: center;
        align-content: flex-start;
    }

    .chat_userImg {
        float: left;
        width: 15%;
    }

    .userImg {
        max-width:100%;
        border-radius: 50%;
    }

    .chat_ib {
        float: left;
        padding: 0 0 0 15px;
        width: 70%;
    }

    .chat_ib h5 {
         font-size:15px;
         color:#464646;
         margin:0 0 8px 0;
         cursor: pointer;
     }

    .chat_ib h5:hover {
        opacity: 0.8
    }


    .newMsg {
        width: 30px;
        /*display: inline-block;*/
        align-self: flex-start;
        display: none;
        position: relative;
        /*height: 10px;*/
    }


    /* ----------------- MESSAGES ----------------- */

    .messages {
        float: left;
        padding: 0px 10px;
        width: 60%;
    }

    /* MESSAGE-HEADER */

    .message-header {
        height: 51px;
    }
    .chat-header {
        float: left;
    }

    #connect,
    #disconnect {
        float: right;
        margin-left: 10px;
        color: #05728f;
    }

    /* MESSAGEBOARD */

    #messageboard {
        height: 480px;
    }

    .nav-link {
        background-color: #f8f8f8;
        color: #05728f;
        padding: 8px;
    }


    .tab-content {
        padding-bottom: 0;
    }

    .tab-pane {
        padding-top: 5px !important;
        background-color: #f8f8f8;
        padding-bottom: 0px !important;
    }

    .row {
        padding-right: 15px;
        margin-bottom: 5px;
    }

    .deleteBtn {
        /* float: right; */
        border-radius: 50%;
        background-color: darksalmon;
        margin-right: 5px;
        opacity: 0.8;
        margin-left: auto;
    }

    .deleteBtn:hover {
        opacity: 1;
    }

    .userMsgHistory {
        height: 380px;
        overflow-y: auto;
    }

    .message {
        display: flex;
        align-items: center;
        margin-bottom: 8px;
    }

    .message .photo {
        display: block;
        width: 45px;
        max-height: 50px;
        background-color: #E6E7ED;
        border-radius: 50px;
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
    }

    .text {
        margin: 0 10px;
        background-color: #5BC0DE;
        padding: 10px 15px;
        border-radius: 12px;
        word-break: break-all;
    }

    .time {
        font-size: 10px;
        color: lightgrey;
        margin-bottom: 10px;
        margin-left: 56px;
    }

    .responseTime {
        width: 100%;
        text-align: right;
        padding-right: 115px;
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

    .response .text {
        background-color: #e3effd !important;
        order: 1;
    }

    .type_msg {
        border-top: 1px solid #c4c4c4;
        position: relative;
        padding: 5px 10px 0px 10px;
    }

    textarea {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        color: #4c4c4c;
        font-size: 15px;
        height: 50px;
        width: 86%;
        padding: 10px;
        resize: none;
    }

    textarea:focus {
        background-color: #f1f1f1;
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

    .closeTab {
        color: #05728f;
        opacity: 0.5;
        position: relative;
        padding-left: 7px;
    }

    .closeTab:hover {
        color: #05728f;
        opacity: 1;
        cursor: pointer;
    }
</style>
</head>


<body>

<div class="container">
    <div class="messaging">
        <div class="inbox_msg">
            <div>
                <input id="adminNickname" type="text" hidden id="from" value=<c:out value="${adminNickname}"/> />
                <input id="adminAvatarId" type="text" hidden value=<c:out value="${adminAvatarId}"/> />
                <div id="sound" hidden></div>
            </div>

            <div class="inbox_players">
                <div class="inbox_heading">
                    <div class="heading_title">
                        <h4>Players</h4>
                    </div>
                    <div class="heading_search">
                        <input type="text" id="search-bar" placeholder="Search">
                        <span class="input-group-addon">
                             <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                         </span>
                    </div>
                </div>
                <%--users--%>
                <div class="inbox_chat"></div>
            </div>

            <div class="messages">

                <div class="message-header">
                    <div class="chat-header">Quizbot Chat</div>
                    <button id="disconnect" type="button" class="btn"  data-toggle="tooltip" title="Disconnect" onclick="disconnect();"><i class="fas fa-sign-out-alt"></i></button>
                    <button id="connect" type="button" class="btn"  data-toggle="tooltip" title="Connect" onclick="connect();"><i class="fas fa-sign-in-alt"></i></button>
                </div>


                <div id="messageboard">
                    <ul class="nav nav-tabs" id="myTab" role="tablist"></ul>
                    <div class="tab-content" id="myTabContent"></div>
                </div>


                <div class="type_msg">
                    <div class="input_msg_write">
                        <textarea class="write_msg" placeholder="Type a message" onfocus="clearContents(this);"></textarea>
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
    const sendMessageBtn = document.getElementById("sendMessageBtn");
    const writeMsg = document.querySelector(".write_msg");

     // -----------CREATE LIST OF USERS-----------

     const retrieveUserDtoList=()=>{
         fetch("/admin-get-users").then(data=>data.json()).then(function(data){
             data.forEach(function(item){
                 createUserDataBox(item.userId,item.userNickname, item.selectedAvatarId);
             });
         });

     }

     retrieveUserDtoList();

    const createUserDataBox= (id, nickname, userAvatarId) =>{
        const div1 = document.createElement("div");
        div1.className = "chat_list";
        div1.setAttribute("data-toggle", "tooltip");
        const div2 = document.createElement("div");
        div2.className = "chat_people";
        div1.appendChild(div2);
        const div3 = document.createElement("div");
        div3.className = "chat_userImg";
        const div4 = document.createElement("div");
        div4.className = "chat_ib";
        const div5 = document.createElement("div");
        div5.className = "chat_newMsg";
        div2.appendChild(div3);
        div2.appendChild(div4);
        div2.appendChild(div5);
        const img = document.createElement("img");
        img.src = "/images/" + userAvatarId + ".jpg";
        img.alt = "user's avatar";
        img.className= "userImg";
        const h5 = document.createElement("h5");
        h5.textContent = nickname;
        h5.setAttribute("id", id);
        h5.addEventListener("click",handleClickOnUserBox);
        h5.addEventListener("mouseover", handleHoverOnUserBox);
        const img2 = document.createElement("img");
        img2.src = "/images/newMsg.jpg";
        img2.alt = "new message";
        img2.className = "newMsg";
        div3.appendChild(img);
        div4.appendChild(h5);
        div5.appendChild(img2);
        inboxChat.appendChild(div1);
    }

     // -----------HANDLE EVENTS ON USER BOX-----------

     const handleHoverOnUserBox = (e)=>{
         const h5 = e.target;
         const userId = h5.getAttribute("id");
         if(h5 !== null){
             const chatList = h5.parentNode.parentNode.parentNode;
             const URL = "/admin-get-user-session-id?user-id=" + userId;
             fetch(URL).then(res => res.text()).then(data => {
                 if (data !== "not available") {
                     chatList.setAttribute("title", "available");
                     h5.style.color = "green";
                     h5.style.cursor = "pointer";
                 } else {
                     chatList.setAttribute("title", "not available");
                     h5.style.color = "red";
                     h5.style.cursor = "no-drop";
                 }
                 setTimeout(function() {
                     h5.style.color = "";
                 }, 500);
             });
         }
     }

    const handleClickOnUserBox =(e)=>{
        const userId = e.target.getAttribute("id");
        if(userId !== null) {
            const userNickname = e.target.textContent;
            const userTab = document.getElementById("tab-" + userId);
            console.log(userId);
            retrieveUserSessionId(userId, userNickname);
            if (userTab !== null) {
                switchTabColors(userTab);
                const inboxUser = document.getElementById(userId);
                switchInboxUserColor(inboxUser);
            }
        }
     }

    const retrieveUserSessionId=(userId, userNickname)=>{
        const URL = "/admin-get-user-session-id?user-id="+userId;
        const currentTab = document.getElementById("tab-" + userNickname);
        fetch(URL).then(res=>res.text()).then(data=>{
            console.log(data)
            if(data!=="not available" && currentTab === null){
                createPrivateChatWindow(data, userId, userNickname);
                formatUserInNewMsg(userId, "#f8f8f8", "500", "none");
            } else if (data!=="not available" && currentTab !== null){
                const inboxUser = document.getElementById(userId);
                currentTab.classList.add("active");
                removeActiveClassFromSiblings(currentTab);
                switchInboxUserColor(inboxUser);
            }
        });
    }

     // -----------CREATE PRIVATE USER CHAT WINDOW-----------

    const createPrivateChatWindow=(sessionId, userId, userNickname)=>{
        const navTab = document.querySelector("#myTab");
        const tabContent = document.querySelector("#myTabContent");
        const li = document.createElement("li");
        li.className = "nav-item";
        const tab = document.createElement("a");
        tab.className = "nav-link";
        tab.id = "tab-" + userId;
        tab.href = "#tab-" + userNickname;
        tab.setAttribute("data-toggle", "tab");
        tab.setAttribute("role", "tab");
        tab.textContent = userNickname;
        const span = document.createElement("span");
        span.className = "closeTab";
        tab.appendChild(span);
        const closeTabIcon = document.createElement("i");
        closeTabIcon.className = "far fa-times-circle";
        closeTabIcon.addEventListener("click", registerCloseEvent);
        span.appendChild(closeTabIcon);
        tab.addEventListener("click", handleClickOnUserTab);
        li.appendChild(tab);
        navTab.appendChild(li);
        const currentTabPane = document.createElement("div");
        currentTabPane.className = "tab-pane fade show p-3 active";
        currentTabPane.id = "tab-" + userNickname;
        currentTabPane.setAttribute("role", "tabpanel");
        let privateChatWindowExists = document.getElementById("private-chat-window-"+userId);
        if(privateChatWindowExists){
            return;
        }
        const div = document.createElement("div");
        div.id = "private-chat-window-"+userId;
        div.style.height="430px"
        //dialog box
        const dialog = displayDialog(userNickname);
        const deleteHistoryBtn =  createDeleteHistoryBtn(userId,userNickname);
        div.appendChild(deleteHistoryBtn);
        div.appendChild(dialog);
        currentTabPane.appendChild(div);
        tabContent.appendChild(currentTabPane);
        let dialogBox = document.querySelector("#"+userNickname);
        scrollToBottom(dialogBox);

        writeMsg.addEventListener("click", ()=> {
            if(currentTabPane.classList.contains("active")) {
                formatUserInNewMsg(userId, "#f8f8f8", "500", "none");
            }
        });
        // SEND BUTTON
        sendMessageBtn.addEventListener("click", ()=>{
            if(currentTabPane.classList.contains("active")) {
                sendPrivateMessage(adminNickname, sessionId, writeMsg.value);
                const dialog = {from: adminNickname, text: writeMsg.value, timestamp: getTimestamp()};
                saveDialog(userNickname, dialog);
                displayDialog(userNickname);
            }
        });

        const currentTab = document.getElementById("tab-" + userNickname);
        removeActiveClassFromSiblings(currentTab);
    }

     const sendPrivateMessage =(from, to, text)=>{
         stompClient.send("/user/"+to+"/queue/private",{}, JSON.stringify({from:from, text:text, timestamp:getTimestamp()}));
     }

     const getTimestamp=()=>{
         const dt = new Date();
         const utcDate = dt.toLocaleString();
         return utcDate;
     }

     // -----------DIALOG MESSAGES-----------

     const createDialogBox=(userNickname)=>{
         const dialogBox  = document.createElement("div");
         dialogBox.id=userNickname;
         dialogBox.className="userMsgHistory";
         return dialogBox;
     }

     const displayDialog=(userNickname)=>{
         const userAvatarSrc = document.querySelector(".userImg").src;
         let dialogBox = document.querySelector("#"+userNickname);
         if(dialogBox===null){
             dialogBox= createDialogBox(userNickname);
         }
         dialogBox.innerHTML="";
         const dialog=fetchDialogFromStorage(userNickname);
         //create displaying messages
         dialog.forEach(function(data){
             if (data.from !== adminNickname) {
                 const div1 = document.createElement("div");
                 div1.className = "message";
                 const img = document.createElement("img");
                 img.className = "photo";
                 img.src = userAvatarSrc;
                 img.alt = "user's avatar";
                 div1.appendChild(img);
                 const p1 = document.createElement("p");
                 p1.className = "text";
                 p1.textContent = data.text;
                 div1.appendChild(p1);
                 const p = document.createElement("p");
                 p.className = "time";
                 p.textContent = data.timestamp;
                 dialogBox.appendChild(div1);
                 dialogBox.appendChild(p);
                 scrollToBottom(dialogBox);

             } else {
                 const div1 = document.createElement("div");
                 div1.className = "message";
                 const div2 = document.createElement("div");
                 div2.className = "response";
                 div1.appendChild(div2);
                 const img = document.createElement("img");
                 img.className = "photo";
                 img.src = "/images/" + adminAvatarId + ".jpg";
                 img.alt = "admin's avatar";
                 div2.appendChild(img);
                 const p1 = document.createElement("p");
                 p1.className = "text";
                 p1.textContent = data.text;
                 div2.appendChild(p1);
                 const p = document.createElement("p");
                 p.className = "time responseTime";
                 p.textContent = data.timestamp;
                 dialogBox.appendChild(div1);
                 dialogBox.appendChild(p);
                 scrollToBottom(dialogBox);

             }
         });
         return dialogBox;

     }

     //retrieve dialog in json from local storage based on userNickname
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

     const scrollToBottom=(dialogBox)=>{
         dialogBox.scrollTop = dialogBox.scrollHeight;
     }

     // -----------USER TAB-----------

     const handleClickOnUserTab = (e) => {
         // Activate private chat window for user in tab
         const userNickname = e.target.textContent;
         const currentTab = document.getElementById("tab-" + userNickname);
         if(currentTab !== null) {
             currentTab.classList.add("active");
             removeActiveClassFromSiblings(currentTab);
         }
         // Change tab colors
         switchTabColors(e.target);
         // Change user colors in user List
         const URL = "/admin-get-user-id-by-nickname?userNickname=" + userNickname;
         fetch(URL).then(res => res.text()).then(data => {
             const inboxUser = document.getElementById(data);
             switchInboxUserColor(inboxUser, "none");
         });
     }

     const switchTabColors=(element)=>{
         const tabList = document.getElementsByTagName("a") ;
         for (var i = 0 ; i < tabList.length ; i ++) {
             tabList.item(i).style.fontWeight = "500";
             tabList.item(i).style.backgroundColor = "white";
             tabList.item(i).style.borderBottom = "1px solid #dee2e6";
         }
         element.style.fontWeight = "700";
         element.style.color = "black";
         element.style.backgroundColor = "#f8f8f8";
         element.style.borderBottom = "1px solid #f8f8f8";
     }

     const registerCloseEvent=(e)=>{
         console.log(e.target);
         // Remove Tab
         const userNickname = e.target.parentNode.parentNode.textContent;
         const userNavItem = e.target.parentNode.parentNode.parentNode;
         userNavItem.parentNode.removeChild(userNavItem);
         // Remove Private Chat Window
         const currentTab = document.getElementById("tab-" + userNickname);
         currentTab.classList.remove("active");
         currentTab.remove();
         // Show first tab and its private chat window
         const myTab = document.querySelector("#myTab>li>a");
         if(myTab !== null){
             myTab.classList.add("show");
             const userLabel = myTab.textContent;
             const userWindow = document.getElementById("tab-" + userLabel);
             if(!(userWindow.classList.contains("active"))) {
                 userWindow.classList.add("active");
                 removeActiveClassFromSiblings(userWindow);
             }
         }
     }

     // -----------REMOVE ACTIVE CLASS FROM PRIVATE CHAT WINDOWS-----------

     const removeActiveClassFromSiblings=(elem)=>{
        if(getSiblings(elem) !== null) {
            var siblings = getSiblings(elem);
            for (var i = 0; i < siblings.length; i++) {
                if (siblings[i].classList.contains('active')) {
                    siblings[i].classList.remove('active');
                    break;
                }
            }
        } else {
            return;
        }
     }

     const getSiblings=(elem)=>{
         // Setup siblings array and get the first sibling
         var siblings = [];
         if(elem !== null) {
             var sibling = elem.parentNode.firstChild;
             // Loop through each sibling and push to the array
             while (sibling) {
                 if (sibling.nodeType === 1 && sibling !== elem) {
                     siblings.push(sibling);
                 }
                 sibling = sibling.nextSibling;
             }
             return siblings;
         } else {
             return;
         }
     };


     // -----------FORMAT USER BOX-----------

     const switchInboxUserColor=(inboxUser)=>{
        if(inboxUser !== null) {
            const h5 = document.getElementsByTagName("h5");
            for (var i = 0; i < h5.length; i++) {
                h5.item(i).style.color = "#464646";
                h5.item(i).style.fontWeight = "500"
            }
            inboxUser.style.color = "#05728";
            inboxUser.style.fontWeight = "700";
        }
     }

     const moveToTop=(chatList)=>{
         chatList.parentNode.removeChild(chatList);
         const inboxChat = document.querySelector(".inbox_chat");
         inboxChat.insertBefore(chatList, inboxChat.childNodes[0]);
     }

     const formatUserInNewMsg = (userId, bcgColor, fWeight, display) => {
         const userData = document.getElementById(userId);
         const chatList = userData.parentNode.parentNode.parentNode;
         const inboxPlayers = userData.parentNode.parentNode;
         if (userData !== null) {
             chatList.style.backgroundColor = bcgColor;
             userData.style.fontWeight = fWeight;
             const newMsg = inboxPlayers.children[2].children[0];
             newMsg.style.display = display;
             moveToTop(chatList);
             chatList.scrollIntoView();
         }
     }

    // -----------CONNECT / DISCONNECT-----------

    //Chat Functionality Stomp
    let stompClient = null;

    const setConnected=(connected)=>{
        const connectBtn = document.getElementById('connect');
        connectBtn.disabled = connected;
        const disconnectBtn = document.getElementById('disconnect');
        disconnectBtn.disabled = !connected;
        disableMessages(connected);
        if(connected){
            connectBtn.style.backgroundColor = "#C0C0C0";
            disconnectBtn.style.backgroundColor = "#e07f61be";
        } else {
            connectBtn.style.backgroundColor = "#7ae061be";
            disconnectBtn.style.backgroundColor = "#C0C0C0";
        }
    }

    const disableMessages = (connected)=> {
        const textarea = document.querySelector('textarea');
        textarea.disabled = !connected;
        const sendBtn = document.querySelector('#sendMessageBtn');
        sendBtn.disabled = !connected;
        const messageboard = document.querySelector('#messageboard');
        const typeMsg = document.querySelector('.type_msg');
        const navLink = document.querySelector('a');
        const deleteBtn = document.querySelector('.deleteBtn');
        if(deleteBtn !== null){
            deleteBtn.disabled = !connected;
        }
        if(!connected){
            textarea.value = "";
            textarea.placeholder = "Currently disconnected...";
            messageboard.style.color = "#93969691";
            messageboard.style.backgroundColor = "#f8f8f8";
            typeMsg.style.backgroundColor = "#f8f8f8";
            if(navLink !== null){
                navLink.href='';
            }
        } else {
            textarea.placeholder = "Type a message...";
            messageboard.style.color = "#212529";
            messageboard.style.backgroundColor = "#fff";
            typeMsg.style.backgroundColor = "#fff";
        }
    }

     setConnected(false);

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

     //notification
     const notify=(userNickname)=>{
         fetchUserId(userNickname);
         playSound("new_message_sound");
     }


     //check if userNickname matches  user id
     const fetchUserId=(userNickname)=> {
         const URL = "/admin-get-user-id-by-nickname?userNickname=" + userNickname;
         fetch(URL).then(res => res.text()).then(data => {
             if (data !== undefined) {
                 formatUserInNewMsg(data, "white", "700", "block");
             }
         });
     }

     // play sound on new message
     const playSound=(filename)=>{
         var mp3Source = '<source src="/sound/'+ filename +'.mp3" type="audio/mpeg">';
         document.getElementById("sound").innerHTML='<audio autoplay="autoplay">' + mp3Source +'</audio>';
     }


    // -----------DELETE HISTORY BUTTON-----------

    const createDeleteHistoryBtn= (userId, userNickname)=>{
        const row = document.createElement("div");
        row.className = "row";
        const btn = document.createElement("button");
        btn.id="delete-history-btn-"+userId;
        btn.className="btn deleteBtn";
        btn.setAttribute("data-toggle", "tooltip");
        btn.setAttribute("data-placement", "bottom");
        btn.setAttribute("title", "Delete history");
        const icon = document.createElement("i");
        icon.className = "fas fa-trash-alt";
        btn.appendChild(icon);
        btn.addEventListener("click",()=>{
            deleteDialogInStorage(userNickname);
            displayDialog(userNickname);
        });
        row.appendChild(btn);
        return row;
    }

     // -----------SEARCH USERS-----------
     const searchInput = document.querySelector("#search-bar");
     searchInput.addEventListener('keyup', function (e) {
         const term = e.target.value.toLowerCase();
         const inboxChat = document.querySelector(".inbox_chat");
         const users = inboxChat.getElementsByClassName('chat_ib')
         Array.from(users).forEach(function (user) {
             const username = user.firstElementChild.textContent;
             if (username.toLowerCase().indexOf(term) != -1) {
                 user.parentNode.parentNode.style.display = 'block';
             } else {
                 user.parentNode.parentNode.style.display = 'none';
             }
         })
     })

     // -----------CLEAR CONTENTS-----------
     const clearContents=(element)=> {
         element.value = '';
     }



</script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</body>
</html>
