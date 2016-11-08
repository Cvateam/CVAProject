$(document).ready(function() {
	$('#class1-button').on('click', function() {
		$('#class1').css('display','block');
		$('#class2').css('display','none');
	});
	
	$('#class2-button').on('click', function() {
		$('#class1').css('display','none');
		$('#class2').css('display','block');
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
				$('#output2').val(response.compileOutput2);
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
		javaUnloadEditor3();
		var item = {
			"javaCode"  :  $('#file1').val()
			,"javaCode1"  :  $('#file3').val()
			,"scannerInput"  : $('#input1').val()
		};        
		javaLoadEditor();
		javaLoadEditor3();
		$.ajax({
			type : 'get',
			url : 'compile1',
			data : item,
			dataType : 'json',
			success : function(response) {
				$('#output1').val(response.javaCompileCode);
			},
			error : function(resp) {
				alert(resp.javaCompileCode);
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
	
	/////////////////기록한 자바소스 저장 /////////////////////
	
	$("#downloadBtn").on("click" , function(){ //downloadBtn --- 자바쪽 다운로드 아이디
		javaUnloadEditor();
		var title = prompt("Please enter a title ", "practice1");
		javaLoadEditor();

		var item = {
			"board.javaCode" : $('#file1').val()
			,"board.javaScannerInput" : $('#input1').val()
			,"board.boardTitle1" : title
		};
		$.ajax({
			type : 'get',
			url : 'save1',
			data : item,
			dataType : 'json',
			success : function(response) {
				alert(response.message);
				// board로 가시겠습니까 만들지 말지 
			},
			error : function(resp) {
				alert(resp.message);
			}
		});
		
	})
});//ready