/* ------------------------------------------------------------------------------
*
*  # Detailed task view
*
*  Specific JS code additions for task_manager_detailed.html page
*
*  Version: 1.0
*  Latest update: Aug 1, 2015
*
* ---------------------------------------------------------------------------- */

$(function() {

    // Datepicker
    $(".datepicker").datepicker({
        showOtherMonths: true,
        dateFormat: "d MM, y"
    });


    // Inline datepicker
    $(".datepicker-inline").datepicker({
        showOtherMonths: true,
        defaultDate: '07/26/2015'
    });

});
