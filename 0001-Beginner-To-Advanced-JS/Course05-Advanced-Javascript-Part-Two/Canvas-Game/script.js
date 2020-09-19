/* 
Simple Canvas Game 

This is a simple canvas game to understand the basics of HTML5 canvas. 

By checking the legend on the right hand side of the webpage, you can see that each shape is connected to a button. 
Press the correct button that corresponds to the shape to get a point. If you guess wrong, you lose a point. 
Get to 10 points to win.

 */

var canvas = document.getElementById("shapes-game"),
  height = canvas.scrollHeight,
  width = canvas.scrollWidth,
  expectedKey = undefined,
  ctx = canvas.getContext("2d"),
  expectedKeysMap = { white0: 38, red1: 40, red0: 37, white1: 39 },
  scoreSpan = document.getElementById("score-val"),
  miliseconds = 1000,
  currentScore = 0,
  currentShape = null;

canvas.width = width;
canvas.height = height;

var drawSquare = function (color, corner, width, height) {
  ctx.fillStyle = color;
  ctx.fillRect(corner[0], corner[1], width, height);
};

var drawTriangle = function (color, start, secondSide, thirdSide) {
  ctx.fillStyle = color;
  ctx.beginPath();
  ctx.moveTo(start[0], start[1]);
  ctx.lineTo(secondSide[0], secondSide[1]);
  ctx.lineTo(thirdSide[0], thirdSide[1]);
  ctx.fill();
};


var drawWhiteSquare = function () {
  currentShape = "ArrowRight";
  drawSquare("white", [0, 50], 50, 50);
};
var drawRedSquare = function () {
  currentShape = "ArrowDown";
  drawSquare("red", [0, 600], 50, 50);
};

var drawWhiteTriangle = function () {
  currentShape = "ArrowUp";
  drawTriangle("white", [400, 400], [400, 500], [500, 500]);
};

var drawRedTriangle = function () {
  currentShape = "ArrowLeft";
  drawTriangle("red", [300, 300], [300, 400], [400, 400]);
};

//Make this an bject and add the keys here
var drawShape = [
  drawWhiteSquare,
  drawRedSquare,
  drawWhiteTriangle,
  drawRedTriangle
]

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  var random = Math.floor(Math.random() * 4)
  drawShape[random]()

  //key = drawShape[random][0]
}

setInterval(draw, miliseconds);
//score function
//if key pressed then check if it matches the key function 
// if it matches the key just drawn then 

document.addEventListener("keydown", score);

function score(e) {
  if (e.code === currentShape) {
    console.log("correct!");
    currentScore++;
    gameOver()
  } else {
    console.log("Nope!")
    currentScore--;
  }
  scoreSpan.innerHTML = currentScore
}

function gameOver() {
  if (currentScore >= 10) {
    alert("You win!!!")
  }
}

function logKey(e) {
  var textContent = ` ${e.code}`;
  console.log(textContent);
}



//1. Finish the game
//2. Add a docstring at the top
//3. Make the top of the document a doc string
