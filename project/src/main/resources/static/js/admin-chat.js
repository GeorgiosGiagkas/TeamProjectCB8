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
        // chatList.scrollIntoView();
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

