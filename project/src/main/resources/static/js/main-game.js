//document ready!
window.addEventListener("load",function(){


//global variables
let time = 20;
let isTimePaused = true;
let totalRounds = 0;
let currentRound = 0;
let pointsMultiplayer = 0;
let totalScore=0;
let highscore = 0;

//update game status


//Rest
const fetchUpdatedScoreStatus =()=>{
    fetch("/get-updated-score-status").then(res=>res.json()).then(data=>{
        totalRounds=data.totalRounds;
        totalScore= data.currentScore;
        currentRound=data.currentRound;
        highscore= data.highscore;
        displayScore(totalScore);
        if(totalScore>highscore){
            displayNewHighscore();
        }

        fetchNextQuestion();

    }).catch(err=>console.error(err));
}

const fetchNextQuestion=()=>{
    if(currentRound<=totalRounds){
        fetch("/get-next-question").then(res=>res.json()).then(data=>{

            createQuestionContent(data.questionContent);
            createAnswersButtons(data.answersDto);
            displayWheel(true);
            resetWheel();
            startSpin();

        }).catch(err=>console.error(err));
    }
    else{
        //end game
        fetch("/get-wallet-update").then(res=>res.text()).then(data=>{
            totalScore=data;
            displayEndBubble(true);
        }).catch(err=>console.error(err));;

    }
}


const fetchCorrectAnswerNoUserAnswer=()=>{
    isTimePaused = true;
    fetch("/answer-verification?answer-id="+0+"&timer="+time+"&points="+pointsMultiplayer).then(res=>res.json()).then(data=>{

        noAnswerGiven(data.correctAnswer);
        totalRounds=data.totalRounds;
        totalScore= data.currentScore;
        currentRound=data.currentRound;

        //reset timer
        time=20;

        setTimeout(function(){
            fetchNextQuestion();
        },4000);

    }).catch(err=>console.error(err));
}


const fetchCorrectAnswer=(answer)=>{
    const userAnswerId = answer.getAttribute("data-answer-id");
    isTimePaused = true;
    fetch("/answer-verification?answer-id="+userAnswerId+"&timer="+time+"&points="+pointsMultiplayer).then(res=>res.json()).then(data=>{

        animateAnswersQuestion(data.correctAnswer, answer);

        totalRounds=data.totalRounds;
        totalScore= data.currentScore;
        currentRound=data.currentRound;

        displayScore(totalScore);
        if(totalScore>highscore){
            displayNewHighscore();
        }
        highscore= data.highscore;
        setTimeout(function(){
            fetchNextQuestion();
        },4000);


    }).catch(err=>console.error(err));
}

//UI
const displayAnimationIn = (elem, animationIn) => {
    elem.style.display = "block";
    elem.classList.add('animated', animationIn);
}

const displayAnimationOut = (elem, animationOut) => {
    elem.classList.add('animated', animationOut);
    elem.addEventListener('animationend', function () {
        elem.style.display = "none";
    });
}



//timer
const displayTime = (time) => {
    const timer = document.getElementById("timer");

    let secs = time;
    if (time < 10) {
        secs = `0${time}`;
    }
    timer.textContent = secs;
}
const beginCountDown = () => {
    isTimePaused = false;
    let interval = window.setInterval(function () {
        displayTime(time);
        time -= 1;
        if(isTimePaused){
            clearInterval(interval);
            time=20;
        }
        else if (time < 0){
            //fetch here
            setAnswerButtonsColorForNoAnswer();
            setAnswerButtonsUnClickable();
            displayBotBubble("Sorry... Time run out!!");
            fetchCorrectAnswerNoUserAnswer();
            clearInterval(interval);

        }

        else if (time === 5) {
            displayBotBubble("Hurry Up! You are running out of time!");
        }
    }, 1000);

}

//round
const updateRound = () => {
    const roundInfo = document.getElementById("round");
    roundInfo.textContent = "Round " + currentRound + "/" + totalRounds;
}

const displayGameInfoContainer = (toggle) => {
    const gameInfoContainer = document.getElementById("game-info-container");

    if (toggle === true) {
        updateRound();
        displayTime(time);
        gameInfoContainer.style.display = "block";
        animateCSS(gameInfoContainer,"bounceInDown",()=>{
            gameInfoContainer.classList.remove('animated', "bounceInDown");
            beginCountDown();
        });
    }
    else {
        animateCSS(gameInfoContainer,"bounceOutUp",()=>{
            gameInfoContainer.classList.remove('animated', "bounceOutUp");
            gameInfoContainer.style.display = "none";
        });
    }
}
const updatePoints = (wheelPoints) => {
    const points = document.getElementById("points");
    points.textContent = wheelPoints;
}


//scoreboard
const displayScore = (score)=>{
    consoleDisplayText((score+""), "currentscore");
}

const displayNewHighscore = () => {
    const newHighscore = document.getElementById("new-highscore-label");
    newHighscore.style.display = "block";
    newHighscore.classList.add("animated", "tada");
}


const consoleDisplayText=(word,id)=>{
    let letterCount =1;
    const target = document.getElementById(id);
    target.setAttribute("style", "color:white;");
    let interval = window.setInterval(function(){
        if(letterCount>word.length){
            clearInterval(interval);
            return;
        }
        else{
            target.textContent = word.substring(0, letterCount);
            letterCount+=1;
        }
    },500);
}



//Answer Buttons


const createAnswersButtons=(answerList)=>{
    const answerContainer = document.getElementById("answers-container");
    answerContainer.innerHTML="";
    const position = ["top-left","top-right","bottom-left","bottom-right"];
    let positionIndex=0;
    for(let a in answerList){
        const div = document.createElement("div");
        div.classList.add("answer-btn","button_slide","slide_left");

        div.textContent=answerList[a].answerContent;
        div.setAttribute("data-answer-id",answerList[a].answerId);
        div.setAttribute("data-answer-position",position[positionIndex]);

        positionIndex++;
        answerContainer.appendChild(div);
    }
}


const animateAnswersQuestion = (correctAnswerId, userAnswer) => {
    const userAnswerId = Number(userAnswer.getAttribute("data-answer-id"));
    const correctAnswer = document.querySelector("[data-answer-id='"+correctAnswerId+"']");
    correctAnswer.classList.add("correct-answer-color");

    if (correctAnswerId === userAnswerId) {
        displayBotBubble("Good Job! Your answer was correct!");
        handleSuccessSound();
    }
    else {
        displayBotBubble("Hm...That was't the right answer :(");
        handleFailSound();
    }

    const allAnswers = document.querySelectorAll(".answer-btn");
    const question = document.getElementById("quiz-container");

    allAnswers.forEach(function (answer) {
        const answerId = Number(answer.getAttribute("data-answer-id"));
        if (answerId === correctAnswerId && answerId === userAnswerId) {
            addTaDa(answer);
            setTimeoutForFadeOut(answer);
        }

        else if (answerId !== correctAnswerId && answerId !== userAnswerId) {
            addBounceOut(answer);
        }
        else if (answerId === correctAnswerId && answerId !== userAnswerId) {
            addTaDa(answer);
            setTimeoutForFadeOut(answer);
        }
        else {
            addShake(answer);
            setTimeoutForFadeOut(answer);
        }
        // answer.classList.add("un-clickable");

    });

    //question zoom out

    setTimeoutForZoomOut();
    // displayQuestion(false);
    setTimeout(function () {
        displayGameInfoContainer(false);

        displayAnswers(false);
    }, 4000);

}
const setAnswerButtonsUnClickable = ()=>{
    const allAnswers = document.querySelectorAll(".answer-btn");
    allAnswers.forEach((a)=>{
        a.classList.add("un-clickable");
    });
}

const setAnswerButtonsColorForNoAnswer = ()=>{
    const allAnswers = document.querySelectorAll(".answer-btn");
    allAnswers.forEach((a)=>{
            a.classList.add("no-answer-color-time-out");
    });
}

const addClassToEachButton=(classToAdd)=>{
    const allAnswers = document.querySelectorAll(".answer-btn");
    allAnswers.forEach((a)=>{
        a.classList.add(classToAdd);
    });
}


const addBounceOut = (answerBtn) => {
    answerBtn.classList.remove("animated","slideInDown","slideInLeft","slideInRight");
    if (answerBtn.getAttribute("data-answer-position") === "top-left") {
        answerBtn.classList.add("animated","bounceOutUp");
    }
    else if (answerBtn.getAttribute("data-answer-position") === "top-right") {
        answerBtn.classList.add("animated","bounceOutUp");
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-left") {
        answerBtn.classList.add("animated","bounceOutLeft");
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-right") {
        answerBtn.classList.add("animated","bounceOutRight");
    };
}

const addTaDa = (answerBtn) => {
    answerBtn.classList.remove("animated","slideInDown","slideInLeft","slideInRight");
    answerBtn.classList.add("animated","tada");
}


const addShake = (answerBtn) => {
    answerBtn.classList.remove("animated","slideInDown","slideInLeft","slideInRight");
    answerBtn.classList.add("animated","shake");
}

const addSlideIn = (answerBtn) => {
    if (answerBtn.getAttribute("data-answer-position") === "top-left") {
        answerBtn.classList.add("animated","slideInDown");
    }
    else if (answerBtn.getAttribute("data-answer-position") === "top-right") {
        answerBtn.classList.add("animated","slideInDown");
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-left") {
        answerBtn.classList.add("animated","slideInLeft");
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-right") {
        answerBtn.classList.add("animated","slideInRight");
    };
}

const addFadeOut = (answerBtn) => {
    answerBtn.classList.remove("animated","bounceOutUp","bounceOutLeft","bounceOutRight","shake");
    if (answerBtn.getAttribute("data-answer-position") === "top-left") {
        answerBtn.classList.add("animated","fadeOutLeft");
    }
    if (answerBtn.getAttribute("data-answer-position") === "top-right") {
        answerBtn.classList.add("animated","fadeOutRight");
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-left") {
        answerBtn.classList.add("animated","fadeOutLeft");
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-right") {
        answerBtn.classList.add("animated","fadeOutRight");
    };
}


const setTimeoutForFadeOut = (answer) => {
    setTimeout(function () {
        addFadeOut(answer);
    }, 3000)
}



const noAnswerGiven = (correctAnswer) => {
    const allAnswers = document.querySelectorAll(".answer-btn");

    allAnswers.forEach(function (answer) {
        const answerId =Number(answer.getAttribute("data-answer-id"));
        if (answerId === Number(correctAnswer)) {
            answer.classList.add("correct-answer-color");
            addTaDa(answer);
            setTimeoutForFadeOut(answer);
        }
        else {
            addShake(answer);
            setTimeoutForFadeOut(answer);
        }

        setTimeoutForZoomOut();

        setTimeout(function () {
            displayGameInfoContainer(false);

            displayAnswers(false);
        }, 4000);

    });
}


const displayAnswers = (toggle) => {
    const buttonContainer = document.getElementById("button-container");
    displayElements(buttonContainer, toggle);
}



//question
const addZoomIn = (question) => {
    question.className += " animated zoomIn ";
}
const addZoomOut = (question) => {
    question.className += " animated zoomOut ";
}

const setTimeoutForZoomOut = () => {
    setTimeout(function () {
        displayQuestion(false);
    }, 3000)
}


const displayQuestion = (toggle) => {
    const quizContainer = document.getElementById("quiz-container");
    if(toggle){
        quizContainer.style.display="flex";
        animateCSS(quizContainer,"zoomIn",()=>{
            quizContainer.classList.remove("animated","zoomIn");
        });
    }
    else{
        animateCSS(quizContainer,"zoomOut",function(){
            quizContainer.classList.remove("animated","zoomOut");
            quizContainer.style.display="none";
        });
    }

}

const createQuestionContent =(content)=>{
    const questionContent = document.getElementById("question-content");
    questionContent.textContent=content
}


//Display/hide elements

const displayElements = (element, toggle) => {
    if (toggle === true) {
        element.style.display = "block";
    }
    else {
        element.style.display = "none";
    }
}

const setTimeoutForQuestionAnswerDisplay = () => {

    setTimeout(function () {

        displayAnswers(true);
        displayQuestion(true);
        displayGameInfoContainer(true);

        const allAnswers = document.querySelectorAll(".answer-btn");
        const question = document.getElementById("quiz-container");
        // addZoomIn(question);
        allAnswers.forEach(function (answer) {
            addSlideIn(answer);
            answer.addEventListener("click", function () {
                handleButtonClickSound();
                answer.classList.add("selected-answer-color");
                setAnswerButtonsUnClickable();
                //FETCH-HERE!!
                fetchCorrectAnswer(answer);

            });
        });
    }, 3500)
}

const writeBubbleText = (text) => {
    const bubbleText = document.getElementById("bubble-text");
    bubbleText.textContent = text;
}

const displayBotBubble = (text) => {
    const bubble = document.getElementById("bubble");
    writeBubbleText(text);
    bubble.style.display = "block";

    bubble.classList.add("animated", "zoomIn");
    setTimeout(function () {
        animateCSS(bubble, "zoomOut", function () {
            bubble.style.display = "none";
        });
    }, 2000);
};






const displayWheel = (toggle) => {
    const wheel = document.getElementById("wheel");
    const indicator = document.getElementById("indicator");
    if (toggle===true) {
        wheel.style.display="block";
        indicator.style.display = "block";
        addZoomIn(wheel);
        animateCSS(wheel,"zoomIn",()=>{
           wheel.classList.remove("animated","zoomIn");
        });

        setTimeout(()=>{
            displayPointsInfo(true);
            displayIndicatorArrow(true);
        },1000);

    }
    else {

        displayPointsInfo(toggle);
        displayIndicatorArrow(toggle);
        animateCSS(wheel,"zoomOut",()=>{
            wheel.classList.remove("animated","zoomOut");
            wheel.style.display="none";

        });
    }
}

const displayIndicatorArrow = (toggle) => {
    const indicatorArrow = document.getElementById("indicator-arrow");
    if (toggle === true) {
        indicatorArrow.style.display = "block";
        animateCSS(indicatorArrow,"bounceInDown",()=>{
            indicatorArrow.classList.remove("animated", "bounceInDown");
        });
    }
    else {
        animateCSS(indicatorArrow,"bounceOutUp",()=>{
            indicatorArrow.classList.remove("animated", "bounceOutUp");
            indicatorArrow.style.display = "none";
            const indicator = document.getElementById("indicator");
            indicator.style.display = "none";
        });
    }
}

const displayPointsInfo = (toggle) => {
    const pointsInfo = document.getElementById("points-info-container");
    if (toggle === true) {
        pointsInfo.style.display = "block";
        animateCSS(pointsInfo,"bounceInUp",()=>{
            pointsInfo.classList.remove("animated", "bounceInUp");
        });

    }
    else {
        animateCSS(pointsInfo,"bounceOutDown",()=>{
            pointsInfo.classList.remove("animated", "bounceOutDown");
            pointsInfo.style.display = "none";
        });
    }
}



//End bubble
const displayEndBubble = (toggle) => {
    const bubble = document.getElementById("end-bubble");
    if (toggle === true) {
        const bubbleText =document.getElementById("end-bubble-text");
        bubbleText.textContent="Congratulations!!!You won "+totalScore+" Gold! What do you want to do next?";
        bubble.style.display = "block";
        bubble.classList.add('animated', 'zoomIn');
    }
    else {
        bubble.classList.add('animated', 'zoomOut')

        bubble.addEventListener('animationend', function () {
            bubble.style.display = "none";
        });
    }
}



//Wheel Functionality
// Create new wheel object specifying the parameters at creation time.
var theWheel = new Winwheel({
    'numSegments': 8,     // Specify number of segments.
    'outerRadius': 212,   // Set outer radius so wheel fits inside the background.
    'textFontSize': 28,    // Set font size as desired.
    'segments':        // Define segments including colour and text.
        [
            { 'fillStyle': '#eae56f', 'text': '10  Pts' },
            { 'fillStyle': '#89f26e', 'text': '20  Pts' },
            { 'fillStyle': '#7de6ef', 'text': '30  Pts' },
            { 'fillStyle': '#e7706f', 'text': '40  Pts' },
            { 'fillStyle': '#eae56f', 'text': '50  Pts' },
            { 'fillStyle': '#89f26e', 'text': '60  Pts' },
            { 'fillStyle': '#7de6ef', 'text': '70  Pts' },
            { 'fillStyle': '#e7706f', 'text': '80  Pts' }
        ],
    'animation':           // Specify the animation to use.
        {
            'type': 'spinToStop',
            'duration': 2,     // Duration in seconds.
            'spins': 8,     // Number of complete spins.
            'callbackFinished': alertPrize
        }
});

// Vars used by the code in this page to do power controls.
var wheelPower = 0;
var wheelSpinning = false;
var pointsFromWheel = 0;
// -------------------------------------------------------
// Function to handle the onClick on the power buttons.
// -------------------------------------------------------
function powerSelected(powerLevel) {

    // Ensure that power can't be changed while wheel is spinning.
    if (wheelSpinning == false) {


        // Set wheelPower var used when spin button is clicked.
        wheelPower = powerLevel;

        // Light up the spin button by changing it's source image and adding a clickable class to it.

    }
}

// -------------------------------------------------------
// Click handler for spin button.
// -------------------------------------------------------
function startSpin() {
    //power level 1
    powerSelected(3);


    // Ensure that spinning can't be clicked again while already running.
    if (wheelSpinning == false) {

        // Based on the power level selected adjust the number of spins for the wheel, the more times is has
        // to rotate with the duration of the animation the quicker the wheel spins.
        if (wheelPower == 1) {
            theWheel.animation.spins = 3;

        }
        else if (wheelPower == 2) {
            theWheel.animation.spins = 8;
        }
        else if (wheelPower == 3) {
            theWheel.animation.spins = 15;
        }

        // Begin the spin animation by calling startAnimation on the wheel object.
        theWheel.startAnimation();


        // Set to true so that power can't be changed and spin button re-enabled during
        // the current animation. The user will have to reset before spinning again.
        wheelSpinning = true;
    }
}

// -------------------------------------------------------
// Function for reset button.
// -------------------------------------------------------
function resetWheel() {
    theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
    theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
    theWheel.draw();                // Call draw to render changes to the wheel.

    wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
}

// -------------------------------------------------------
// Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
// note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
// -------------------------------------------------------
function alertPrize(indicatedSegment) {
    // wheelDiv.style.display="none";
    let prize = indicatedSegment.text;
    prize = prize.split(" ")[0];
    pointsMultiplayer=Number(prize);

    updatePoints(Number(prize));
    setTimeout(function () {
        displayWheel(false);
    }, 2000);

    setTimeoutForQuestionAnswerDisplay();
    // Do basic alert of the segment text. You would probably want to do something more interesting with this information.

}



//avatar click to logout/main menu


const handleAvatarClick=()=>{
    const dropMenu = document.getElementById("drop-menu");
    if(dropMenu.style.display==="block"){
        dropMenu.style.display="none";
    }else{
        dropMenu.style.display="block";
    }

}
const userAvatar = document.getElementById("user-footer") ;
userAvatar.addEventListener("click",handleAvatarClick);



//animate CSS
function animateCSS(node, animationName, callback) {

    node.classList.add('animated', animationName);

    function handleAnimationEnd() {
        node.classList.remove('animated', animationName);
        node.removeEventListener('animationend', handleAnimationEnd);

        if (typeof callback === 'function') callback();
    }

    node.addEventListener('animationend', handleAnimationEnd);
}



//Audio-sounds

    const backgroundMusic = document.getElementById("background-music");
    backgroundMusic.play();

    //Event Handlers
    function handleSuccessSound(){
        const sound = document.querySelector("#success-sound");
        sound.play();
    }

    function handleFailSound(){
        const sound = document.querySelector("#fail-sound");
        sound.play();
    }

    function handleButtonClickSound(){
        const sound = document.querySelector("#button-sound");
        sound.play();
    }


    //ADD BACKGROUND MUSIC

    const backMusic = document.querySelector("#background-music");
    let isPlaying = true;

    const volumeIcon = document.getElementById("volume");
    volumeIcon.addEventListener("click", function () {
        if (isPlaying) {
            this.classList.remove("fa-volume-up");
            this.classList.add("fa-volume-mute");
            backMusic.pause();
            isPlaying = false;
        }
        else{
            this.classList.remove("fa-volume-mute");
            this.classList.add("fa-volume-up");
            backMusic.play();
            isPlaying = true;
        }
    });


    //RUN!!!
    fetchUpdatedScoreStatus();

});