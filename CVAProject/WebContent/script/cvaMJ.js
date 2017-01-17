$(document).ready(function() {
	$('#Submit').on('click', function() {
		alert("확인중");
		var item = {
				"javaCode"  :  $('#file').val()
				,"scannerInput"  : $('#input').val()
		};
		$.ajax({
			type : 'get',
			url : 'compile1',
			data : item,
			dataType : 'json',
			success : function(response) {
				$('#note').val(response.javaCompileCode);
			},
			error : function(resp) {
				alert(resp.javaCompileCode);
			}
		});
	});
});