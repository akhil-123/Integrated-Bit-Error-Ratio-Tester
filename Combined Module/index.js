$(".submit").on('click',function(){
	var input1 = $('input[name=input1]:checked').val();
	var clock = $("#clock").val();
	var input2 = $('input[name=input2]:checked').val();
	var tap1 = $("#tap1").val();
	var tap2 = $("#tap2").val();
	var tap3 = $("#tap3").val();
	if(input1 != '' && clock != '' && input2 != '' && tap1 != '' && tap2 != '' && tap3 != '') {
		$("#loader").show();
		$("body").addClass('body-loader');
		$.post( "file.php", { input1: input1, input2: input2, tap1: tap1, tap2: tap2, tap3: tap3, clock: clock } , function(response){
			$("#loader").hide();
			$("body").removeClass('body-loader');
			$("#sol").val(response);
		} );
	}
});