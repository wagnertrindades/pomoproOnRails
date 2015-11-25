///////////////////////////////////////////
//  Pomos, Breaks and Long Breaks lengths
//////////////////////////////////////////

$(document).ready(function(){
    // Lists
    var pomosList = document.querySelector(".list-pomos");
    var breaksList = document.querySelector(".list-breaks");
    var longBreaksList = document.querySelector(".list-long-breaks");
    // Containers for timers length 
    var pomosContainer = document.getElementById("pomos-length");
    var breaksContainer = document.getElementById("breaks-length");
    var longBreaksContainer = document.getElementById("long-breaks-length"); 
    // Executed functions
    itensLength(pomosList, pomosContainer);
    itensLength(breaksList, breaksContainer);
    itensLength(longBreaksList,longBreaksContainer);

    function itensLength(list, container){
        var lengthList = list.querySelectorAll(".li-timers").length;
        container.innerText = lengthList;
    };
});