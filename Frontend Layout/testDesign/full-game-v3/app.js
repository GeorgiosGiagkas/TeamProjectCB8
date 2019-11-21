//global variables
let time = 20;
let isTimePaused = true;
let totalRounds = 10;
let currentRound = 1;
let pointsMultiplayer = 0;


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

const setTimeoutForAnimationIn = (elem, animationIn, ms) => {
    setTimeout(function () {
        displayAnimationIn(elem, animationIn);
    }, ms);
}

const setTimeoutForAnimationOut = (elem, animationOut, ms) => {
    setTimeout(function () {
        displayAnimationOut(elem, animationOut);
    }, ms);
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
        console.log(time);
           
        if(time < 0 || isTimePaused){            
            clearInterval(interval);
            time=20;            
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
    updateRound();
    if (toggle === true) {
        gameInfoContainer.style.display = "block";

        gameInfoContainer.classList.add('animated', "bounceInDown");
        beginCountDown();
        
    }
    else {
        gameInfoContainer.classList.add('animated', "bounceOutUp");
        gameInfoContainer.addEventListener('animationend', function () {
            gameInfoContainer.style.display = "none";

        });
    }
}
const updatePoints = (wheelPoints) => {
    const points = document.getElementById("points");
    points.textContent = wheelPoints;
}


//scoreboard
const currentscore = document.getElementById("currentscore");
const displayNewHighscore = () => {
    const newHighscore = document.getElementById("new-highscore-label");
    newHighscore.style.display = "block";
    newHighscore.classList.add("animated", "tada");
}


consoleText([currentscore.textContent], "currentscore", "console-currentscore");
displayNewHighscore();


function consoleText(words, id, consoleId, colors) {
    if (colors === undefined) colors = ["white"];
    var visible = true;
    var con = document.getElementById(consoleId);
    var letterCount = 1;
    var x = 1;
    var waiting = false;
    var target = document.getElementById(id)
    target.setAttribute("style", "color:" + colors[0])
    window.setInterval(function () {

        if (letterCount === 0 && waiting === false) {
            waiting = true;
            target.innerHTML = words[0].substring(0, letterCount)
            window.setTimeout(function () {
                var usedColor = colors.shift();
                colors.push(usedColor);
                var usedWord = words.shift();
                words.push(usedWord);
                x = 1;
                target.setAttribute("style", "color:" + colors[0]);
                letterCount += x;
                waiting = false;
            }, 1000)
        }
        else if (waiting === false) {
            target.innerHTML = words[0].substring(0, letterCount)
            letterCount += x;
        }
    }, 500)

}






//Answer Buttons 
const a3 = document.getElementById("a3");


const animateAnswersQuestion = (correctAnswerBtn, userAnswer) => {

    if (correctAnswerBtn === userAnswer) {
        displayBotBubble("Good Job! Your answer was correct!");
    }
    else {
        displayBotBubble("Hm...That was't the right answer :(");
    }

    const allAnswers = document.querySelectorAll(".answer-btn");
    const question = document.getElementById("quiz-container");

    allAnswers.forEach(function (answer) {

        if (answer === correctAnswerBtn && answer === userAnswer) {
            addTaDa(answer);
            setTimeoutForFadeOut(answer);
        }

        else if (answer !== correctAnswerBtn && answer !== userAnswer) {
            addBounceOut(answer);
        }
        else if (answer === correctAnswerBtn && answer !== userAnswer) {
            addTaDa(answer);
            setTimeoutForFadeOut(answer);
        }
        else {
            addShake(answer);
            setTimeoutForFadeOut(answer);
        }
        answer.className += " un-clickable ";

    });

    //question zoom out

    setTimeoutForZoomOut(question);

    setTimeout(function () {
        displayGameInfoContainer(false);
        question.style.display = "none";
        displayEndBubble(true);

    }, 4000);

}

const addBounceOut = (answerBtn) => {
    if (answerBtn.getAttribute("data-answer-position") === "top-left") {
        answerBtn.className += "animated bounceOutUp";
    }
    else if (answerBtn.getAttribute("data-answer-position") === "top-right") {
        answerBtn.className += "animated bounceOutUp";
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-left") {
        answerBtn.className += "animated bounceOutLeft";
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-right") {
        answerBtn.className += "animated bounceOutRight";
    };
}

const addTaDa = (answerBtn) => {

    answerBtn.className += "animated tada ";
}


const addShake = (answerBtn) => {
    answerBtn.className += "animated shake";
}

const addSlideIn = (answerBtn) => {
    if (answerBtn.getAttribute("data-answer-position") === "top-left") {
        answerBtn.className += "animated slideInDown";
    }
    else if (answerBtn.getAttribute("data-answer-position") === "top-right") {
        answerBtn.className += "animated slideInDown";
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-left") {
        answerBtn.className += "animated slideInLeft";
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-right") {
        answerBtn.className += "animated slideInRight";
    };
}

const addFadeOut = (answerBtn) => {
    if (answerBtn.getAttribute("data-answer-position") === "top-left") {
        answerBtn.className += "animated fadeOutLeft";
    }
    if (answerBtn.getAttribute("data-answer-position") === "top-right") {
        answerBtn.className += "animated fadeOutRight";
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-left") {
        answerBtn.className += "animated fadeOutLeft";
    }
    else if (answerBtn.getAttribute("data-answer-position") === "bottom-right") {
        answerBtn.className += "animated fadeOutRight";
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
        if (answer === correctAnswer) {
            addTaDa(answer);
            setTimeoutForFadeOut(answer);
        }
        else {
            addShake(answer);
            setTimeoutForFadeOut(answer);
        }
        answer.className += " un-clickable ";
    });
}


const displayAnswers = (toggle) => {
    const buttonContainer = document.getElementById("button-container");
    displayElements(buttonContainer, toggle);
}


// setTimeout(function(){
//     noAnswerGiven(a1);
// },3000);


//question
const addZoomIn = (question) => {
    question.className += " animated zoomIn ";
}
const addZoomOut = (question) => {
    question.className += " animated zoomOut ";
}

const setTimeoutForZoomOut = (question) => {
    setTimeout(function () {
        addZoomOut(question);
    }, 3000)
}


const displayQuestion = (toggle) => {
    const quizContainer = document.getElementById("quiz-container");
    displayElements(quizContainer, toggle);
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
        //Run
        const allAnswers = document.querySelectorAll(".answer-btn");
        const question = document.getElementById("quiz-container");
        addZoomIn(question);
        allAnswers.forEach(function (answer) {
            addSlideIn(answer);
            answer.addEventListener("click", function () {
                animateAnswersQuestion(a3, answer);
                isTimePaused = true;
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
    if (toggle) {
        displayElements(wheel, toggle);
        addZoomIn(wheel);

        indicator.style.display = "block";
        setTimeoutForFadeInIndicatorAndPoints(1000);
    }
    else {
        displayPointsInfo(toggle);
        displayIndicatorArrow(toggle);
        addZoomOut(wheel);
        setTimeout(function(){
            displayElements(wheel,toggle);
        },1000);
       
    }
}

const displayIndicatorArrow = (toggle) => {
    const indicatorArrow = document.getElementById("indicator-arrow");
    if (toggle === true) {
        indicatorArrow.style.display = "block";
        indicatorArrow.classList.add("animated", "bounceInDown");
    }
    else {
        indicatorArrow.classList.add("animated", "bounceOutUp");
        indicatorArrow.addEventListener('animationend', function () {
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
        pointsInfo.classList.add("animated", "bounceInUp");
    }
    else {
        pointsInfo.classList.add("animated", "bounceOutDown");
        pointsInfo.addEventListener('animationend', function () {
            pointsInfo.style.display = "none";
        });
    }
}


const setTimeoutForFadeInIndicatorAndPoints = (secs) => {
    setTimeout(function () {
        displayIndicatorArrow(true);
        displayPointsInfo(true);
    }, secs);
}

const setTimeoutForFadeOutIndicatorAndPoints = (secs) => {
    setTimeout(function () {
        displayIndicatorArrow(false);
        displayPointsInfo(false);
    }, secs);
}


//End bubble
const displayEndBubble = (toggle) => {
    const bubble = document.getElementById("end-bubble");
    if (toggle === true) {
        bubble.style.display = "block";
        console.log(bubble);
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
    // pointsFromWheel = Number(prize);
    // resetWheel(); 
    updatePoints(Number(prize));
    setTimeout(function () {
        displayWheel(false);
    }, 2000);

    setTimeoutForQuestionAnswerDisplay();
    // Do basic alert of the segment text. You would probably want to do something more interesting with this information.

}





displayWheel(true);
resetWheel();
startSpin();

// displayBubble(true,"Hello World!");







//Volume

const volumeIcon = document.getElementById("volume");
volumeIcon.addEventListener("click", function () {
    if (this.classList.contains("fa-volume-up")) {
        this.classList.remove("fa-volume-up");
        this.classList.add("fa-volume-mute");
    }
    else if (this.classList.contains("fa-volume-mute")) {
        this.classList.remove("fa-volume-mute");
        this.classList.add("fa-volume-up");
    }
});

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