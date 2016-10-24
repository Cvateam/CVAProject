$(document).ready(function() {
	
	$('#Submit2').on('click', function() {
		csharpUnloadEditor();
		var item = {
			"file2" : $('#file2').val()
			
		};
		csharpLoadEditor();
		$.ajax({
			type : 'get',
			url : 'compile2',
			data : item,
			dataType : 'json',
			success : function(response) {
				$('#output2').html('<h5>' + response.output2 + '</h5>');
			},
			error : function(resp, code) {
				alert(resp + " " + code);
			}

		});
	});
});