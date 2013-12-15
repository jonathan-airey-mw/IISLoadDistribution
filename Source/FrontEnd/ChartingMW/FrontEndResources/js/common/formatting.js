function formatHour(hour) {
    var suffix = "AM";
    var nonMilitaryHr = hour;
    if ( hour >= 12) {
        suffix = "PM";
        if(hour != 12) {
            nonMilitaryHr = nonMilitaryHr - 12;
        } 
    } else if (hour == 0) {
        nonMilitaryHr = 12;
    }
    var returnString = nonMilitaryHr + ":00 " + suffix;
    return returnString;
}