const highscore = document.getElementById("highscore");
consoleText([highscore.textContent],"highscore","console-highscore");

const currentscore = document.getElementById("currentscore");
consoleText([currentscore.textContent],"currentscore","console-currentscore");

const round = document.getElementById("round");
consoleText([round.textContent],"round","console-round");


function consoleText(words, id,consoleId, colors) {
  if (colors === undefined) colors = ["blueviolet"];
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