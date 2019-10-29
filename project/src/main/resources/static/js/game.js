$(document).ready(function(){

    //get wheel
    let wheelDiv = document.querySelector("#wheel");
    let questionDiv = document.querySelector("#question");
    let pointsMessage = document.querySelector("#points-message");

    //set timer state
    let stopTimer = false;
    let timeleft =20;

    //set points modifier
    let pointsModifier = 0;


    //round
    let round =1;

    //NEXT QUESTION
    $("#start").click(handleSuccessSound);
    $("#start").click(startFirstRound);



    function startFirstRound(){
        const startBtn = document.querySelector("#start");
        startBtn.style.display="none";
        beginNextRound();
    }

    function beginNextRound(){
        questionDiv.style.display="none";
        wheelDiv.style.display="block";
        startSpin();

        setTimeout(displayPointsMessage,3000);
        setTimeout(restShowQuestion,4600);

    }


    function restShowQuestion(){
        pointsModifier=pointsFromWheel;
        pointsFromWheel=0;
        $.ajax({
            url:"/get-next-question"
        }).then(function(data){

            if(data.questionId===0){
                return;
            }


            questionDiv.style.display="block";
            const  answers = document.querySelector("#answers");
            const questionContent = document.querySelector("#question-content");

            answers.innerHTML="";
            questionContent.textContent=data.questionContent;


            for(let a in data.answersDto){

                const btn = document.createElement("button");
                btn.addEventListener("click",handleButtonClickSound);
                btn.className="answer-btn";
                btn.setAttribute("data-answer-id",data.answersDto[a].answerId);
                btn.textContent=data.answersDto[a].answerContent;

                const div = document.createElement("div");
                div.className="col-6";

                div.appendChild(btn);

                answers.appendChild(div);
            }

            //TIMER
            stopTimer=false;
            let  time = setInterval(function(){
                document.getElementById("countdown").innerHTML = timeleft + " seconds remaining";
                timeleft -= 1;
                if(stopTimer){
                    clearInterval(time);
                    document.getElementById("countdown").innerHTML = "Finished";

                }
                if(timeleft<=0){
                    clearInterval(time);
                    document.getElementById("countdown").innerHTML = "Finished";
                    timeleft=20;
                    disableAnswerButtons();
                    restGetCorrectAnswer(0,0,0);

                }
            }, 1000);

        });

    }

    //Get Correct Answer
    document.addEventListener("click",getCorrectAnswer);

    function getCorrectAnswer(e){

        if(e.target.hasAttribute("data-answer-id")){

            //stop timer
            stopTimer=true;
            let timeBonus = timeleft;
            let points = pointsModifier;
            timeleft=20;

            const answerId=e.target.getAttribute("data-answer-id");
            disableAnswerButtons();
            restGetCorrectAnswer(answerId,timeBonus,points);
        }
    }

    function restGetCorrectAnswer(answerId,timeBonus,points){
        $.ajax({
            url:"/answer-verification?answer-id="+answerId+"&timer="+timeBonus+"&points="+points
        }).then(function(data){
            const highscore = document.querySelector("#category-highscore");
            const currentScore = document.querySelector("#current-score");
            const currentRound = document.querySelector("#current-round");
            highscore.textContent = `Category HighScore: ${data.highscore}`;
            currentScore.textContent = `Current Score: ${data.currentScore}`;
            currentRound.textContent = `Current Round: ${data.currentRound}`;
            highlightCorrectAnswer(data.correctAnswer, answerId);

            if(data.currentRound===data.totalRounds){
                setTimeout(endGame,3000);
            }
            else{
                setTimeout(beginNextRound,3000);
            }
        });
    }


    function disableAnswerButtons(){
        const buttons = document.querySelectorAll("[data-answer-id]");
        buttons.forEach(function(b){
            b.disabled=true;
        });
    }



    function highlightCorrectAnswer(correctAnswer,userAnswer){

        if(userAnswer==correctAnswer){
            handleSuccessSound();
        }
        else{
            handleFailSound();
        }
        const buttons = document.querySelectorAll("[data-answer-id]");
        buttons.forEach(function(b){
            if(b.getAttribute("data-answer-id")==correctAnswer){
                b.className+=" bg-success";
            }
            else{
                b.className+=" bg-danger";
            }
        });


    }

    function displayPointsMessage() {
        pointsMessage.style="display: flex;"
        pointsMessage.innerHTML=`<p>Points multiplier X ${pointsFromWheel} !!!</p>`
        setTimeout(function () {
            pointsMessage.innerHTML="";
            pointsMessage.style="display: none;";
        },1500);
    }


    function endGame(){
        window.location.href = "/main-menu";
    }



    //Event Handlers

    //success
    function handleSuccessSound(){
        const sound = document.querySelector("#success-sound");
        sound.play();
    }


    //fail
    function handleFailSound(){
        const sound = document.querySelector("#fail-sound");
        sound.play();
    }

    //buttons
    function handleButtonClickSound(){
        const sound = document.querySelector("#button-sound");
        sound.play();
    }


    //ADD BACKGROUND MUSIC
    const musicSwitch = document.querySelector("#music-switch");
    const icon = document.querySelector("i#music-switch");
    const backMusic = document.querySelector("#background-music");
    let isPlaying = true;

    musicSwitch.addEventListener("click", function (e) {

        if (isPlaying === true) {
            backMusic.pause();
            icon.className = "fas fa-volume-up";
            isPlaying = false;
        }
        else {
            icon.className = "fas fa-volume-mute";
            backMusic.play();
            isPlaying = true;
        }});





    //Wheel Functionality
    // Create new wheel object specifying the parameters at creation time.
    var theWheel = new Winwheel({
        'numSegments'  : 8,     // Specify number of segments.
        'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
        'textFontSize' : 28,    // Set font size as desired.
        'segments'     :        // Define segments including colour and text.
            [
                {'fillStyle' : '#eae56f', 'text' : '10  Pts'},
                {'fillStyle' : '#89f26e', 'text' : '20  Pts'},
                {'fillStyle' : '#7de6ef', 'text' : '30  Pts'},
                {'fillStyle' : '#e7706f', 'text' : '40  Pts'},
                {'fillStyle' : '#eae56f', 'text' : '50  Pts'},
                {'fillStyle' : '#89f26e', 'text' : '60  Pts'},
                {'fillStyle' : '#7de6ef', 'text' : '70  Pts'},
                {'fillStyle' : '#e7706f', 'text' : '80  Pts'}
            ],
        'animation' :           // Specify the animation to use.
            {
                'type'     : 'spinToStop',
                'duration' : 2,     // Duration in seconds.
                'spins'    : 8,     // Number of complete spins.
                'callbackFinished' : alertPrize
            }
    });

// Vars used by the code in this page to do power controls.
    var wheelPower    = 0;
    var wheelSpinning = false;
    var pointsFromWheel=0;
// -------------------------------------------------------
// Function to handle the onClick on the power buttons.
// -------------------------------------------------------
    function powerSelected(powerLevel)
    {

        // Ensure that power can't be changed while wheel is spinning.
        if (wheelSpinning == false)
        {


            // Set wheelPower var used when spin button is clicked.
            wheelPower = powerLevel;

            // Light up the spin button by changing it's source image and adding a clickable class to it.

        }
    }

// -------------------------------------------------------
// Click handler for spin button.
// -------------------------------------------------------
    function startSpin()
    {
        //power level 1
        powerSelected(1);


        // Ensure that spinning can't be clicked again while already running.
        if (wheelSpinning == false)
        {
            // Based on the power level selected adjust the number of spins for the wheel, the more times is has
            // to rotate with the duration of the animation the quicker the wheel spins.
            if (wheelPower == 1)
            {
                theWheel.animation.spins = 3;

            }
            else if (wheelPower == 2)
            {
                theWheel.animation.spins = 8;
            }
            else if (wheelPower == 3)
            {
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
    function resetWheel()
    {
        theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
        theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
        theWheel.draw();                // Call draw to render changes to the wheel.

        wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
    }

// -------------------------------------------------------
// Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
// note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
// -------------------------------------------------------
    function alertPrize(indicatedSegment)
    {
        wheelDiv.style.display="none";
        let prize =indicatedSegment.text;
        prize = prize.split(" ")[0];
        pointsFromWheel = Number(prize);
        resetWheel();

        // Do basic alert of the segment text. You would probably want to do something more interesting with this information.

    }



});