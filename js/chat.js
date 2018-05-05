var url = './instantchat.php';


$(function(){
    
    $("#chatform form").submit(function(){
        
        var message = $("#chatform form textarea").val();
        $.post(url, {action:"addMessage", message:message}, function(data){
            showLoader("#conteneur"); 
            if(data.erreur=="ajout"){
              alert("ok");
            }else{
                alert(data.erreur);
            }
            hideLoader();
        },"json");
    return false;
    });
});

function showLoader(div){
    /*$('.has-spinner').click(function () {
        var btn = $(this);
        $(btn).buttonLoader('start');
        setTimeout(function () {
            $(btn).buttonLoader('stop');
        }, 3000);
    });*/
    $(div).append('<div class="loader"></div>');
    $(".loader").fadeTo(500, 0.6);
}

function hideLoader(){
    $(".loader").fadeOut(500, function(){
        $(".loader").remove();
    });
    
}