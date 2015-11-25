///////////////////////////////
//  Functionnality of Timer
//////////////////////////////

var htmlTimer = document.getElementById('timer');
var segTotal = 60, minTotal = 24;

// Progress Bar
var progressBar = document.querySelector("#progress-bar");
var children = document.querySelector("#progress-bar .determinate");
var movementBar = 0;

// Minute and Second
var second = 60;
var minute = 24;
 
// Real Buttons
var realPomo = document.getElementById("real-button-pomo");
var realBreak = document.getElementById("real-button-break");
var realLongBreak = document.getElementById("real-button-long-break");

// Buttons Play, Pause and Stop
var play = document.querySelector("#play-timer");
var pause = document.querySelector("#pause-timer");
var stop = document.querySelector("#stop-timer");
var firstClick = true;

// Buttons Fake Pomodoro, Break and Long Break
var pomoTimer = document.querySelector("#pomo-timer");
var shortBreak = document.querySelector("#short-break");
var longBreak = document.querySelector("#long-break");

// Play, Pause and Stop
if(play){
    play.addEventListener("click", function(){
        if(firstClick){
            var timer = setInterval('timer();', 1000);
            play.classList.add("disabled");
            pause.classList.remove("disabled");
        }
        firstClick = false;
        pause.addEventListener("click", function(){
            clearInterval(timer);
            firstClick = true;
            play.classList.remove("disabled");
            pause.classList.add("disabled");
        });
        stop.addEventListener("click", function(){
            clearInterval(timer);
            minute = minTotal;
            second = segTotal;
            movementBar = 0;
            htmlTimer.innerText = (minute + 1) + ":00";
            children.style.width = movementBar + "%";
            firstClick = true;
            play.classList.remove("disabled");
            pause.classList.remove("disabled");
        });
    });
};

// Activated functions in click of buttons fake
if(pomoTimer){
    pomoTimer.addEventListener("click", function(){
        redefineTimer(24, 60);
        redefineProgressBar("red");
    });
};

if(shortBreak){
    shortBreak.addEventListener("click", function(){
        redefineTimer(4, 60);
        redefineProgressBar("blue");
    });
};

if(longBreak){
    longBreak.addEventListener("click", function(){
        redefineTimer(29, 60);
        redefineProgressBar();
    });
};


function createTimerBackEnd(){
    if(minTotal == 24 && segTotal == 60){
        realPomo.click();
    }else if(minTotal == 4 && segTotal == 60){
        realBreak.click();
    }else{
        realLongBreak.click();
    }
}

function timer(){   
    if (second > 0){
        second--;
        if(second < 10){second = "0"+second}
        movementBar += barMovement();
    }else if(second == 0 && minute > 0){
        second = 59;
        minute--;
        if(minute < 10){minute = "0"+ minute}
    }
    htmlTimer.innerText = minute + ":" + second;
    if(minute == 0 && second == 0){
        movementBar=100;
        createTimerBackEnd();
        stop.click();
    }
    children.style.width = movementBar + "%";

}

function redefineTimer(min, seg){
    minTotal = min;
    segTotal = seg;
    minute = minTotal;
    second = segTotal;
    htmlTimer.innerText = (minute + 1) + ":00";
    stop.click();
};

function redefineProgressBar(color){
    progressBar.classList.remove("red");
    progressBar.classList.remove("blue");
    progressBar.classList.add(color);
    children.classList.remove("red");
    children.classList.remove("blue");
    children.classList.add(color);
};

function barMovement(){
    var onePercent = (((minTotal + 1) * 60) / 100);
    var movementPerSeg = 1 / onePercent;
    return movementPerSeg;
};