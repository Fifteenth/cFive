$(document).ready(function() { 
    var options = { 
        beforeSubmit:  showRequest // pre-submit callback 
 
    }; 
    $('#baseSickwardForm').submit(function() { 
        $(this).ajaxSubmit(options); 
        alert("Ìí¼Ó³É¹¦");
        $('#baseSickwardForm').resetForm();
        return false; 
    }); 
}); 

function showRequest(formData, jqForm, options) { 
    return true; 
} 


function showClear()
{
	$('#baseSickwardForm').resetForm();
}