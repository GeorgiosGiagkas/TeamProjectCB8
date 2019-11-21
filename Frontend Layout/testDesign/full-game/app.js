//timer
const displayTime =(time)=>{
    const timer = document.getElementById("timer");
    let secs = time;
    if(time<10){
        secs = `0${time}`;
    }
    timer.textContent=secs;
}
const beginCountDown=()=>{
    let time =15;
    const interval=setInterval(function(){        
        displayTime(time);
        time=time-1;

        if(time<0){
            clearInterval(interval);
        }
    },1000);
}

beginCountDown();

//scoreboard

const highscore = document.getElementById("highscore");
consoleText([highscore.textContent], "highscore", "console-highscore");

const currentscore = document.getElementById("currentscore");
consoleText([currentscore.textContent], "currentscore", "console-currentscore");

const round = document.getElementById("round");
consoleText([round.textContent], "round", "console-round");


function consoleText(words, id, consoleId, colors) {
    if (colors === undefined) colors = ["#D9514EFF"];
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
    }, 120)
    window.setInterval(function () {
        if (visible === true) {
            con.className = 'console-underscore hidden'
            visible = false;

        } else {
            con.className = 'console-underscore'

            visible = true;
        }
    }, 400)
}






//Buttons
const a1 = document.getElementById("a1");


const animateAnswersQuestion = (correctAnswerBtn, userAnswer) => {

    const allAnswers = document.querySelectorAll(".answer-btn");
    const question = document.getElementById("quiz-container");
    console.log("out");
    allAnswers.forEach(function (answer) {
        console.log(answer);
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
        //Run
        const allAnswers = document.querySelectorAll(".answer-btn");
        const question = document.getElementById("quiz-container");
        addZoomIn(question);
        allAnswers.forEach(function (answer) {
            addSlideIn(answer);
            answer.addEventListener("click", function () {
                animateAnswersQuestion(a1, answer);
            });
        });
    }, 3500)
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
    // let prize =indicatedSegment.text;
    // prize = prize.split(" ")[0];
    // pointsFromWheel = Number(prize);
    // resetWheel(); 
    setTimeout(function(){
        displayWheel(false); 
    },2000);  
    
    setTimeoutForQuestionAnswerDisplay();
    // Do basic alert of the segment text. You would probably want to do something more interesting with this information.

}




const displayWheel = (toggle) => {
    const wheel = document.getElementById("wheel");
    
    if(toggle){
        displayElements(wheel, toggle);
        addZoomIn(wheel);
    }
    else{
        addZoomOut(wheel);
        setTimeout(function(){
            displayElements(wheel, toggle);
        },1000);
        
    }
}

displayWheel(true);
resetWheel();
startSpin();

