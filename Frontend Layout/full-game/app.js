const highscore = document.getElementById("highscore");
consoleText([highscore.textContent],"highscore","console-highscore");

const currentscore = document.getElementById("currentscore");
consoleText([currentscore.textContent],"currentscore","console-currentscore");

const round = document.getElementById("round");
consoleText([round.textContent],"round","console-round");


function consoleText(words, id,consoleId, colors) {
  if (colors === undefined) colors = ["gold"];
  var visible = true;
  var con = document.getElementById(consoleId);
  var letterCount = 1;
  var x = 1;
  var waiting = false;
  var target = document.getElementById(id)  
  target.setAttribute("style", "color:" + colors[0])
  window.setInterval(function() {

    if (letterCount === 0 && waiting === false) {
      waiting = true;
      target.innerHTML = words[0].substring(0, letterCount)
      window.setTimeout(function() {
        var usedColor = colors.shift();
        colors.push(usedColor);
        var usedWord = words.shift();
        words.push(usedWord);
        x = 1;        
        target.setAttribute("style", "color:"+ colors[0]);
        letterCount += x;
        waiting = false;
      }, 1000)
    } 
    else if (waiting === false) {
      target.innerHTML = words[0].substring(0, letterCount)
      letterCount += x;
    }
  }, 120)
  window.setInterval(function() {
    if (visible === true) {
      con.className = 'console-underscore hidden'
      visible = false;

    } else {
      con.className = 'console-underscore'

      visible = true;
    }
  }, 400)
}







const a1 = document.getElementById("a1");


const animateAnswers = (correctAnswerBtn, userAnswer) => {

    const allAnswers = document.querySelectorAll(".answer-btn");

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


const allAnswers = document.querySelectorAll(".answer-btn");
allAnswers.forEach(function (answer) {
    addSlideIn(answer);
    answer.addEventListener("click", function () {
        animateAnswers(a1, answer);
    });
});


const noAnswerGiven=(correctAnswer)=>{
    const allAnswers = document.querySelectorAll(".answer-btn");
    allAnswers.forEach(function(answer){
        if(answer===correctAnswer){
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

// setTimeout(function(){
//     noAnswerGiven(a1);
// },3000);

