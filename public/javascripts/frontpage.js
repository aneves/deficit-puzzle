$("input:checkbox").live("click", function(){
	updateTotal();
});

$(document).ready(function(){
	updateTotal();
});

function updateTotal() {
	var total = 0;
	$("input:checkbox:checked").each(function(){
		var val = parseFloat($(this).val());
		if( val != NaN ) {
			total += val;
		}
	});
	total = truncate(total, 2);
	$("#status .amount").text(total);

	var target = parseFloat($('#status .target').text());
	var percent = Math.floor(100.0 * total / target);
	percent = limit(percent, 0, 100);
	$("#status .percent").text(percent+'%');
	$("#status .graph .bar").css('width',percent+'%');

	var green = Math.floor(2.55 * percent);
	var red = 255 - green;
	$("#status .graph .bar").css('background-color','rgb('+red+','+green+',0)');
}