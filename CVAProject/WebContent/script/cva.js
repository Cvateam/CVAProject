$(document).ready(function() {
	//이것과 같이하지 않는다면 실행이 힘듬.
	//csharp은 submit2 java는 submit1
	$('#Submit2').on('click', function() {
		//다른 js파일에 javaUnloadEditor(); 있습니당.
		csharpUnloadEditor();
		var item = {
			"file2" : $('#file2').val(),
			"input2" : $('#input2').val()
		};
		//다른 js파일에 javaLoadEditor(); 있습니당. 그냥 다 쓰시면 댐
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