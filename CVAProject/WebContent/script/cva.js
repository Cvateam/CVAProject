$(document).ready(function() {
	//이것과 같이하지 않는다면 실행이 힘듬.
	//csharp은 submit2 java는 submit1
	
	$('#Submit2').on('click', function() {
		//다른 js파일에 javaUnloadEditor(); 있습니당.
		csharpUnloadEditor();
		var item = {
			"file2" : $('#file2').val(),
			
			//이거 어떻게 해봐야댐. ㅅㅂ 존나 어려움
			//C#에 ReadLine이 있을경우 어떻게 할것인가?
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
				$('#output2').html('<h3 class=output>' + response.compileOutput2 + '</h3>');
			},
			error : function(resp, code) {
				alert(resp + " " + code);
			}
		});
	}); // C# 코드 부분에서 compile을 눌렀을때 액션.
	
	$('#Translate2').on('click', function() {
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
			url : 'translate2',
			data : item,
			dataType : 'json',
			success : function(response) {
				// 언로드 시킨다.
				javaUnloadEditor();
				//값을 java꺼에 붙인다.
				$('#file1').val(response.translateOutput2);
				$('#input1').val(response.input2);
				javaLoadEditor();
			},
			error : function(resp, code) {
				alert(resp + " " + code);
			}
		});
	}) // C# 코드 부분에서 translate를 눌렀을때 액션.
});//ready