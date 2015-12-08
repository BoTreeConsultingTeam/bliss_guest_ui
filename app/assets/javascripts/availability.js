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
        var night_count = parseInt($('#total_nights').val());
        window.result = false;
        $.ajax({
            url: 'availability/check_holiday',
            method: 'POST',
            async:   false,
            data: { date: date, night_count: night_count },
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
        var selectedDate = Availability.arrivalDate();
        if (selectedDate > futureDate){
            return true
        }

    }

    function overlapRestrictedPeriod(){
        var date = Availability.arrivalDate();
        var nightCount = parseInt($('#total_nights').val());
        window.result_hash = {};
        if(!isNaN(nightCount)){
            $.ajax({
                url: 'availability/check_restricted_period',
                method: 'POST',
                async:   false,
                data: { date: date, nightCount: nightCount },
                success: function(data) {
                    result_hash = data.restricted_period
                }

            });
        }
        console.log(result_hash);
        return result_hash;
    }

    function isWarnable(weekend, holiday){
        if((isEarlyThenSevenDays() && lessNightCount() && (isWeekend() || isHoliday()))){
            return true
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

    function ShowWarningPopup(){
        overlapRestrictedPeriodHash = overlapRestrictedPeriod();
        console.log($.isEmptyObject(overlapRestrictedPeriodHash) && ($('#total_nights').val().length > 0))
        alert('overlapRestrictedPeriodHash' + $.isEmptyObject(overlapRestrictedPeriodHash) );
        alert('($().val().length > 0' + $('#total_nights').val().length > 0)
        alert(isWarnable());
        restricted_period = $.isEmptyObject(overlapRestrictedPeriodHash) && ($('#total_nights').val().length > 0);
        alert("restricted_period " + restricted_period );
        console.log(isWarnable() || restricted_period );
        if(isWarnable() || restricted_period ){
            alert();
            console.log(">>" + overlapRestrictedPeriodHash.adult_only);
//            $('#myModal').find('p').html('');
            $('#myModal').modal('show');
        }
    }

    return {
        isWeekend: isWeekend,
        isHoliday: isHoliday,
        isWarnable: isWarnable,
        isEarlyThenSevenDays: isEarlyThenSevenDays,
        arrivalDate: arrivalDate,
        setDepartureDate: setDepartureDate,
        overlapRestrictedPeriod: overlapRestrictedPeriod,
        ShowWarningPopup: ShowWarningPopup
    };
})();
