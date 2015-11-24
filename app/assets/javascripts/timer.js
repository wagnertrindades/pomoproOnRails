
var htmlTimer = document.getElementById('timer');
var segTotal = 60, minTotal = 24;
// Progress Bar
var progressBar = document.querySelector("#progress-bar");
var children = document.querySelector("#progress-bar .determinate");
var movimentBar = 0;

var segundo = 60;
var minuto = 24;
 
// Real Buttons
var realPomo = document.getElementById("real-button-pomo");
var realBreak = document.getElementById("real-button-break");
var realLongBreak = document.getElementById("real-button-long-break");

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
    if (segundo > 0){
        segundo--;
        if(segundo < 10){segundo = "0"+segundo}
        movimentBar += barMoviment();
    }else if(segundo == 0 && minuto > 0){
        segundo = 59;
        minuto--;
        if(minuto < 10){minuto = "0"+ minuto}
    }
    htmlTimer.innerText = minuto + ":" + segundo;
    if(minuto == 0 && segundo == 0){
        movimentBar=100;
        createTimerBackEnd();
        stop.click();
    }
    children.style.width = movimentBar + "%";

}


var play = document.querySelector("#play-timer");
var pause = document.querySelector("#pause-timer");
var stop = document.querySelector("#stop-timer");
var primeiroClick = true;

if(play){
    play.addEventListener("click", function(){
        if(primeiroClick){
            var timer = setInterval('timer();', 1000);
            play.classList.add("disabled");
            pause.classList.remove("disabled");
        }
        primeiroClick = false;
        pause.addEventListener("click", function(){
            clearInterval(timer);
            primeiroClick = true;
            play.classList.remove("disabled");
            pause.classList.add("disabled");
        });
        stop.addEventListener("click", function(){
            clearInterval(timer);
            minuto = minTotal;
            segundo = segTotal;
            movimentBar = 0;
            htmlTimer.innerText = (minuto + 1) + ":00";
            children.style.width = movimentBar + "%";
            primeiroClick = true;
            play.classList.remove("disabled");
            pause.classList.remove("disabled");
        });
    });
};

var pomoTimer = document.querySelector("#pomo-timer");
var shortBreak = document.querySelector("#short-break");
var longBreak = document.querySelector("#long-break");


function redefineTimer(min, seg){
    minTotal = min;
    segTotal = seg;
    minuto = minTotal;
    segundo = segTotal;
    htmlTimer.innerText = (minuto + 1) + ":00";
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

function barMoviment(){
    var umPercento = (((minTotal + 1) * 60) / 100);
    var movimentPorSeg = 1 / umPercento;
    return movimentPorSeg;
};




// $("#start").on("click", function(e){
//     e.preventDefault();
//     var $this = $(this);
//     var $p = $this.closest("p");
//     $.get($this.attr('href'), function(data){
//         if(data.success){
//             $p.find(".reply-correct-msg").addClass('hidden');
//             $this.addClass('hidden');
//             $p.find('.reply-correct-lnk').removeClass('hidden');
//         } else {
//             alert(data.message);
//         }
//     }, "json");
// });