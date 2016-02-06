$(document).ready(function() {
    $.validate({
        form: '#contactForm',
        scrollToTopOnError: false,
        onSuccess: function($form) {
            $($form).on("ajax:success",function(e, data, status, xhr){
                try{
                    var respone = JSON.parse(xhr.responseText);
                    if ($("#result").length > 0) {
                        $("div").remove(".alert, .alert-success");
                    }
                    $("#result").append(respone.html);
                    $($form).trigger("reset");
                } catch(e) {
                    console.log(e);
                }
            });
        },
    });
  });