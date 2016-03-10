var a = $(".navbar-wagon").offset().top;

$(document).scroll(function(){
    if($(this).scrollTop() > a)
    {
       $('.navbar-wagon').css({"background":"white"});
    } else {
       $('.navbar-wagon').css({"background":"transparent"});
    }
});
