var Availability = (function() {
    function arrivalDate(){
        var date = $('#dtp_input2').val();
        var dsplit = date.split("-");
        return new Date(dsplit[0],dsplit[1]-1,dsplit[2]);
    }

    function isWeekend(){
        var day = Availability.arrivalDate();
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
        var currentDate = new Date();
        var futureDate = currentDate.setDate(currentDate.getDate()+7);
        var selectedDate = Availability.arrivalDate()
        if (selectedDate > futureDate){
            return true
        }

    }

    function isWarnable(weekend, holiday){
        if((isEarlyThenSevenDays() && lessNightCount() && (isWeekend() ||isHoliday()))){
            $('#myModal').modal('show');
        }
    }

    function setDepartureDate(){
        var arrivalDate = Availability.arrivalDate();
        var night_count = parseInt($('#total_nights').val());
        var departureDate = arrivalDate.setDate(arrivalDate.getDate()+ night_count);
        var dep_date =  new Date(departureDate);
        var formated_date  =(dep_date.getMonth() + 1) + '/' + dep_date.getDate() + '/' +  dep_date.getFullYear();
        $('#dtp_input1').val(formated_date);
        $('#departure_date').val(formated_date);
    }

    return {
        isWeekend: isWeekend,
        isHoliday: isHoliday,
        isWarnable: isWarnable,
        isEarlyThenSevenDays: isEarlyThenSevenDays,
        arrivalDate: arrivalDate,
        setDepartureDate: setDepartureDate
    };
})();
