$(document).ready(function() {
	
	$('#class1-button').on('click', function() {
		$('#class1').css('display','block');
		$('#class2').css('display','none');
		alert("hello?");
	});
	
	$('#class2-button').on('click', function() {
		$('#class1').css('display','none');
		$('#class2').css('display','block');
		alert("hello?");
	});
	
	
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
				$('#output2').html("<h3  class='output'>" + response.compileOutput2 + '</h3>');
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
				$('#input1').val($('#input2').val());
				javaLoadEditor();
			},
			error : function(resp, code) {
				alert(resp + " " + code);
			}
		});
	});
	
	//////////////// java compile connect  //////////////////////////
	
	$('#Submit1').on('click', function() {
		javaUnloadEditor();
		var item = {
			"javaCode"  :  $('#file1').val()
			,"scannerInput"  : $('#input1').val()
		};                   
		javaLoadEditor();
		$.ajax({
			type : 'get',
			url : 'compile1',
			data : item,
			dataType : 'json',
			success : function(response) {
				$('#output1').html("<h3  class='output'>" + response.javaCompileCode + '</h3>');
			},
			error : function(resp, code) {
				alert(resp + " " + code);
			}
		});
	});
	/////////////// java translate ///////////////////////////
	$('#Translate1').on('click', function() {
		javaUnloadEditor();
		var item = {
			"javaCode" : $('#file1').val()
			,"scannerInput" : $('#input1').val() 
		};
		javaLoadEditor();
		$.ajax({
			type : 'get',
			url : 'translate1',
			data : item,
			dataType : 'json',
			success : function(response) {
				// 언로드 시킨다.
				csharpUnloadEditor();
				//값을 씨샵에 붙인다.
				$('#file2').val(response.javatranslatedCode);
				$('#input2').val($('#input1').val());
				csharpLoadEditor();
			},
			error : function(resp, code) {
				alert(resp + " " + code);
			}
		});
	});
});//ready