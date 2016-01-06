$(document).ready(function() {
    $.validate({
        form: '#contactForm',
        scrollToTopOnError: false,
        onSuccess: function($form) {
            $($form).on("ajax:success",function(e, data, status, xhr){
                try{
                    var respone = JSON.parse(xhr.responseText);
                    $("#result").append(respone.html);
                    $($form).trigger("reset");
                } catch(e) {
                    console.log(e);
                }
            });
        },
    });
  });