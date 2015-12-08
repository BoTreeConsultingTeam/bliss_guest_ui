var Availability= (function() {
    function isWeekend(){
        var date = $('#dtp_input2').val();
        var dsplit = date.split("-");
        var day = new Date(dsplit[0],dsplit[1]-1,dsplit[2]);
        var isWeekend = (day == 6) || (day == 0);
        return isWeekend
    }

    function isHoliday(){
        var date = new Date($('#dtp_input2').val());
        window.result = false;
        a = $.ajax({
            url: 'availability/check_holiday',
            method: 'POST',
            async:   false,
            data: { date: date },
            success: function(data) {
                result = data.holiday;
            }

        });
        return result;
    }

    function lessNightCount(){
        nightCount = parseInt($('#total_nights').val());
        if ( nightCount < 2 ){
            return true;
        }
    }

    function isEarlyThenSevenDays(){
        var date = $('#dtp_input2').val();
        var dsplit = date.split("-");
        var selectedDate = new Date(dsplit[0],dsplit[1]-1,dsplit[2]);
        var currentDate = new Date();
        var futureDate = currentDate.setDate(currentDate.getDate()+7);
        if (selectedDate > futureDate){
            return true
        }

    }

    function isWarnable(weekend, holiday){
        if((isEarlyThenSevenDays() && lessNightCount() && (isWeekend() ||isHoliday()))){
            $('#myModal').modal('show');
        }

    }
    return {
        isWeekend: isWeekend,
        isHoliday: isHoliday,
        isWarnable: isWarnable,
        isEarlyThenSevenDays: isEarlyThenSevenDays
    };
})();
