$(document).ready(function(){

    var counter = 2;

    $("#addButton").click(function () {

    if(counter>10){
    alert("Only 10 textboxes allow");
    return false;
    }

    var newTextBoxDiv = $(document.createElement('div'))
    .attr("id", 'TextBoxDiv' + counter);

    newTextBoxDiv.after().html('<label>Textbox #'+ counter + ' : </label>' +
    '<input type="text" name="textbox' + counter +
    '" id="textbox' + counter + '" value="" >');

    newTextBoxDiv.appendTo("#TextBoxesGroup");


    counter++;
    });

    $("#removeButton").click(function () {
    if(counter==1){
    alert("No more textbox to remove");
    return false;
    }

    counter--;

    $("#TextBoxDiv" + counter).remove();

    });

    $("#getButtonValue").click(function () {

    var msg = '';
    for(i=1; i<counter; i++){
    msg += "\n Textbox #" + i + " : " + $('#textbox' + i).val();
    }
    alert(msg);
    });
});

function initialize_flash(messages, name){
    if(name == "alert"){
        name = "notice";
    }
    $.each(messages, function(i){
        $.iGrowl({
            message: messages[i],
            type: name,
            delay: 5000,
            spacing: 5,
            animShow: 'fadeInUp',
            animHide: 'fadeOutDown'
        })
    })
    $.ajax({
        url: "/pocs/clear_flash",
        method: 'POST'
    })
}