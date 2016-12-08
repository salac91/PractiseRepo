$(document).ready(function(){
    var selected = $("#actionSelect").val();
    if(selected == "DayOff" || selected == "Sick leave"){
        $("#hoursNf").attr('disabled','disabled');
    }
    else{
        $("#hoursNf").removeAttr('disabled');
     }

    $("#actionSelect").change(function(){
        if($(this).val() == "DayOff" || $(this).val() == "Sick leave"){
          $("#hoursNf").attr('disabled','disabled');
        }
        else{
          $("#hoursNf").removeAttr('disabled');
        }
    })
});