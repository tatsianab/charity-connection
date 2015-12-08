
$(document).ready(function(){
    cartUpdateListener();
});

function cartUpdateListener(){
 $('.button_to').on('ajax:success', function(event, data, status, xhr){
 	debugger;
 	var shoppingCartValue = parseInt($('.fa-shopping-cart').text());
 	shoppingCartValue += 1;
 	$('.fa-shopping-cart').text(' ' + shoppingCartValue);
 })
};