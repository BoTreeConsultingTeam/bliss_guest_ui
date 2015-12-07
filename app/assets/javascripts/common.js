$(document).ready(function(){
    $( ".select2" ).select2();

    //bootstrap datetimepicker
    $('.form_date').datetimepicker({
        language:  'en',
        weekStart: 1,
        todayBtn:  0,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });


    //icheck master radio button and checkbox
    $(document).ready(function() {
        $('.icheck input').iCheck({
            checkboxClass: 'icheckbox_minimal-red',
            radioClass: 'iradio_minimal-red',
            increaseArea: '20%'
        });
    });

    //inline calender
    $('#datetimepicker12').datetimepicker({
        inline: true,
        language:  'en',
        weekStart: 1,
        todayBtn:  0,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    //Tooltip

    $('[data-toggle="tooltip"]').tooltip()

});
	//select dropdown

