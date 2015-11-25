///////////////////////////////////////////
//  Pomos, Breaks and Long Breaks lengths
//////////////////////////////////////////

$(document).ready(function(){

    var pomosList = document.querySelector(".list-pomos");
    var breaksList = document.querySelector(".list-breaks");
    var longBreaksList = document.querySelector(".list-long-breaks");

    var pomosContainer = document.getElementById("pomos-length");
    var breaksContainer = document.getElementById("breaks-length");
    var longBreaksContainer = document.getElementById("long-breaks-length"); 

    itensLength(pomosList, pomosContainer);
    itensLength(breaksList, breaksContainer);
    itensLength(longBreaksList,longBreaksContainer);


    function itensLength(list, container){
        var lengthList = list.querySelectorAll(".li-timers").length;
        container.innerText = lengthList;
    };
});