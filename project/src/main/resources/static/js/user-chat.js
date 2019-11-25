// -----------User Chat Functionality-----------

let stompClient = null;
let adminAvailableId;
let adminAvailableAvatar;
let storageKeyId = "QuizbotService-" + document.getElementById('from').value;
let chatHeader = document.querySelector('.chat-header');
const userNickname = document.querySelector('#from');
const deleteHistoryBtn = document.querySelector('#delete-history-btn');
const userAvatarId = document.querySelector('#userAvatarId');
const dialogBox = document.getElementById('dialog-box');
const conversationDivPrivate = document.querySelector('#conversationDivPrivate');

// -----------SEND BUTTON-----------
const sendMessageBtn = document.getElementById("sendMessageBtn");

sendMessageBtn.addEventListener("click", function () {
    let data = getMessageTextData();
    sendPrivateMessage(adminAvailableId, data);
    saveDialog(storageKeyId, data);
    displayDialog(storageKeyId);
});

// clear message from textarea
sendMessageBtn.addEventListener("click", function () {
    const textarea = document.querySelector('textarea');
    textarea.value = "";
    textarea.placeholder = "Type a message...";
});

const scrollToBottom = () => {
    dialogBox.scrollTop = dialogBox.scrollHeight;
}

const getMessageTextData = () => {
    const from = document.getElementById('from').value;
    const text = document.getElementById('textPrivate').value;
    const dt = new Date();
    const utcDate = dt.toLocaleString();

    const data = {from: from, text: text, timestamp: utcDate};
    return data;
}

const sendPrivateMessage = (sendTo, data) => {
    stompClient.send("/user/" + sendTo + "/queue/private", {}, JSON.stringify(data));
    return (data);
}

//save dialog in json in local storage
const saveDialog = (storageKeyId, data) => {
    const dialog = fetchDialogFromStorage(storageKeyId);
    dialog.push(data);
    localStorage.setItem(storageKeyId, JSON.stringify(dialog));
}

//retrieve dialog in json from local storage  based on userNickname
const fetchDialogFromStorage = (storageKeyId) => {
    let dialog = [];
    if (localStorage.getItem(storageKeyId) === null) {
        dialog = [];
    }
    else {
        dialog = JSON.parse(localStorage.getItem(storageKeyId))
    }
    return dialog;
}

const displayDialog = (storageKeyId) => {
    dialogBox.innerHTML = "";
    const dialog = fetchDialogFromStorage(storageKeyId);
    // create displaying message
    dialog.forEach(function (data) {
        if (data.from !== userNickname.value) {
            addAdminChatMessage(data);
        } else {
            addUserChatMessage(data);
        }
    });
    return dialogBox;
}

const addUserChatMessage = (data) => {
    const div1 = document.createElement("div");
    div1.className = "message";
    const div2 = document.createElement("div");
    div2.className = "response";
    div1.appendChild(div2);
    const img = document.createElement("img");
    img.className = "photo";
    img.src = "/images/" + userAvatarId.value + ".jpg";
    img.alt = "user's avatar";
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
    scrollToBottom();
}

const addAdminChatMessage = (data) => {
    const div1 = document.createElement("div");
    div1.className = "message";
    const img = document.createElement("img");
    img.className = "photo";
    img.src = "/images/" + adminAvailableAvatar + ".jpg";
    img.alt = "admin's avatar";
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
    scrollToBottom();
}

// -----------DELETE HISTORY BUTTON-----------

const createDeleteHistoryListener = () => {
    deleteHistoryBtn.addEventListener("click", () => {
        deleteDialogInStorage(storageKeyId);
        displayDialog(storageKeyId);
    });
}


//delete dialog in json in local storage
const deleteDialogInStorage = (storageKeyId) => {
    localStorage.removeItem(storageKeyId);
}

// -----------CONNECT / DISCONNECT-----------

const connect = () => {
    let socket = new SockJS("/chat");
    stompClient = Stomp.over(socket);
    stompClient.connect(
        {}, function (frame) {
            console.log('Connected: ' + frame);
            stompClient.subscribe("/user/queue/errors", function (message) {
            });
            stompClient.subscribe("/user/queue/private", function (message) {
                console.log(message.body);
                const data = JSON.parse(message.body);
                saveDialog(storageKeyId, data);
                displayDialog(storageKeyId);
            });
        }
    );
}

const disconnect = () => {
    if (stompClient != null) {
        stompClient.disconnect();
    }
    console.log("Disconnected");
}

// -----------OPEN / CLOSE CHAT-----------

const openChat = () => {
    document.querySelector(".chat").style.display = "block";
}

const closeChat = () => {
    document.querySelector(".chat").style.display = "none";
}

// -----------CHECK FOR AVAILABLE ADMIN - GET ADMIN-----------

//fetch admin
const getAdmin = () => {
    fetch("/user-get-available-admin").then((data) => data.json()).then((res) => adminAvailable(res));
}

const adminAvailable = (admin) => {
    if (admin.sessionId !== "not available") {
        adminAvailableId = admin.sessionId;
        adminAvailableAvatar = admin.avatarId;
        conversationDivPrivate.style.display = "block";
        deleteHistoryBtn.style.display = "block";
        dialogBox.style.display = "block";
        createDeleteHistoryListener();
        displayDialog(storageKeyId);
        chatHeader.innerHTML = "Quizbot Chat";
    }
    else {
        chatHeader.innerHTML = "No chat agents currently available";
        conversationDivPrivate.style.display = "none";
        dialogBox.style.display = "none";
        deleteHistoryBtn.style.display = "none";
    }
}