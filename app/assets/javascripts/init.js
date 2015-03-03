$(document).ready(function(){
$( "#showPos, #hidePos" ).css('display', 'none');
$( "#geoPos" ).click(function() {
$( "#showPos, #hidePos, #geoPos" ).toggle();
});
});