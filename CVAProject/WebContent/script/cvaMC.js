$(document).ready(function() {
	$('#Submit').on('click', function() {
		var item = {
			"file2" : $('#file').val(),
			"input2" : $('#input').val()
		};
		// 다른 js파일에 javaLoadEditor(); 있습니당. 그냥 다 쓰시면 댐
		$.ajax({
			type : 'get',
			url : 'compile2',
			data : item,
			dataType : 'json',
			success : function(response) {
				$('#note').val(response.compileOutput2);
			},
			error : function(resp, code) {
				alert(resp + " " + code);
			}
		});
	}); // C# 코드 부분에서 compile을 눌렀을때 액션.
});