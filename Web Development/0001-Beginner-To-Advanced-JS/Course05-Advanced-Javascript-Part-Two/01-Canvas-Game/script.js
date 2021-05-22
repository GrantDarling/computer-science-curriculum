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

document.addEventListener("keydown", score);

let shapes = {
  whiteSquare: {
    draw: function () {
      drawSquare("white", [0, 50], 50, 50);
    },
    keyInput: "ArrowRight"
  },
  redSquare: {
    draw: function () {
      drawSquare("red", [0, 600], 50, 50);
    },
    keyInput: "ArrowDown"
  },
  redTriangle: {
    draw: function () {
      drawTriangle("red", [300, 300], [300, 400], [400, 400]);
    },
    keyInput: "ArrowLeft"
  },
  whiteTriangle: {
    draw: function () {
      drawTriangle("white", [400, 400], [400, 500], [500, 500]);
    },
    keyInput: "ArrowUp"
  }
}

function draw(obj) {
  var keys = Object.keys(obj)
  var randomKey = keys[keys.length * Math.random() << 0];

  ctx.clearRect(0, 0, canvas.width, canvas.height);
  obj[randomKey].draw();
  currentShape = obj[randomKey].keyInput;
}

function score(e) {
  if (e.code === currentShape) {
    currentScore++;
    gameOver()
  } else {
    currentScore--;
  }
  scoreSpan.innerHTML = currentScore
}

function gameOver() {
  if (currentScore >= 10) {
    alert("You win!!!")
    clearInterval(asyncDraw)
  }
}

var asyncDraw = setInterval(function () { draw(shapes) }, miliseconds);