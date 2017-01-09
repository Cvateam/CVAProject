$(document).ready(function() {
	$('#class1-button').on('click', function() {
		$('#class1').css('display','block');
		$('#class2').css('display','none');
		$('#class3').css('display','none')
	});
	
	$('#class2-button').on('click', function() {
		$('#class1').css('display','none');
		$('#class2').css('display','block');
		$('#class3').css('display','none')
	});
	$('#class3-button').on('click', function() {
		$('#class1').css('display','none');
		$('#class2').css('display','none');
		$('#class3').css('display','block')
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
		//javaUnloadEditor4();
		javaUnloadEditor3();
		javaUnloadEditor();
		var item = {
			"javaCode"  :  $('#file1').val()
			,"javaCode1"  :  $('#file3').val()
			//,"javaCode2" : $('#file4').val()
			,"scannerInput"  : $('#input1').val()
		};
		javaLoadEditor();
		javaLoadEditor3();
		//javaLoadEditor4();
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
	
	$("#downloadBtnJava").on("click" , function(){ //downloadBtn --- 자바쪽 다운로드 아이디
		javaUnloadEditor();
		var title = prompt("Please enter a title ", "practice1");
		var memo = prompt("leave a memo" ,  null);
		javaLoadEditor();

		var item = {
			"board.javaCode" : $('#file1').val()
			,"board.javaScannerInput" : $('#input1').val()
			,"board.boardTitlejava" : title
			,"board.boardMemo" : memo
			,"board.outputjava" : $('#output1').val()
		};
		$.ajax({
			type : 'get',
			url : 'save1',
			data : item,
			dataType : 'json',
			success : function(response) {
				alert(response.message);
				/* 테이블 띄우기  */
				$.ajax({
							method : "get",
							url : "list"//struts.xml
							,
							success : function(response) {
								var txt = "";
								$
										.each(
												response.boardList,
												function(index, item) {
													var javaFile = item.javaCode;
													var csharpFile = item.csharpCode;

													if (javaFile != null
															&& csharpFile != null) {
														txt = "<tr id='conTr'><td>"
																+ item.boardnum
																+ "</td><td>"
																+ item.boardTitlejava
																+ "</td><td>"
																+ item.boardMemo
																+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/Java.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/Csharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
													}
													if (javaFile != null
															&& csharpFile == null) {
														txt = "<tr id='conTr'><td>"
																+ item.boardnum
																+ "</td><td>"
																+ item.boardTitlejava
																+ "</td><td>"
																+ item.boardMemo
																+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/Java.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/noCsharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
													}
													if (javaFile == null
															&& csharpFile != null) {
														txt = "<tr id='conTr'><td>"
																+ item.boardnum
																+ "</td><td>"
																+ item.boardMemo
																+ "</td><td>"
																+ item.inputdate
																+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/noJava.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/Csharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
													}
													if (javaFile == null
															&& csharpFile == null) {
														txt = "<tr id='conTr'><td>"
																+ item.boardnum
																+ "</td><td>"
																+ item.boardTitlejava
																+ "</td><td>"
																+ item.boardMemo
																+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/noJava.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/noCsharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
													}
													$("div.contents table").append(txt);
												});
							}
						});
				// board로 가시겠습니까 만들지 말지 
			},
			error : function(resp) {
				alert(resp.message);
			}
		});
		
	});
	///////////////////////c# 코드 저장//////////////////////////////////
	$("#downloadBtnCsharp").on("click" , function(){ //downloadBtn --- 자바쪽 다운로드 아이디
		csharpUnloadEditor();
		var title = prompt("Please enter a title ", "practiceCsharp");
		var memo = prompt("leave a memo" ,  null);
		csharpLoadEditor();

		var item = {
			"board.csharpCode" : $('#file2').val()
			,"board.csharpScannerInput" : $('#input2').val()
			,"board.boardTitlecsharp" : title
			,"board.boardMemo" : memo
			,"board.outputcsharp" : $('#output2').val()
		};
		$.ajax({
			type : 'get',
			url : 'save2',    // 아직 만들지 않은 액션  //  위에 이렇게 하면 각자각자 만들어지는거임 하나의 제목으로 저장되는거 아님 
			// 일단 이렇게 해두고 나중에 처리할지 말지는 ... 
			data : item,
			dataType : 'json',
			success : function(response) {
				alert(response.message);
				/* 테이블 띄우기  */
				$.ajax({
							method : "get",
							url : "list"//struts.xml
							,
							success : function(response) {
								var txt = "";
								$
										.each(
												response.boardList,
												function(index, item) {
													var javaFile = item.javaCode;
													var csharpFile = item.csharpCode;

													if (javaFile != null
															&& csharpFile != null) {
														txt = "<tr id='conTr'><td>"
																+ item.boardnum
																+ "</td><td>"
																+ item.boardTitlejava
																+ "</td><td>"
																+ item.boardMemo
																+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/Java.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/Csharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
													}
													if (javaFile != null
															&& csharpFile == null) {
														txt = "<tr id='conTr'><td>"
																+ item.boardnum
																+ "</td><td>"
																+ item.boardTitlejava
																+ "</td><td>"
																+ item.boardMemo
																+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/Java.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/noCsharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
													}
													if (javaFile == null
															&& csharpFile != null) {
														txt = "<tr id='conTr'><td>"
																+ item.boardnum
																+ "</td><td>"
																+ item.boardMemo
																+ "</td><td>"
																+ item.inputdate
																+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/noJava.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/Csharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
													}
													if (javaFile == null
															&& csharpFile == null) {
														txt = "<tr id='conTr'><td>"
																+ item.boardnum
																+ "</td><td>"
																+ item.boardTitlejava
																+ "</td><td>"
																+ item.boardMemo
																+ "</td><td><a href='#openJ' id='javaPopUp'><img src='img/noJava.PNG' class='javaPop' border='0' width='30' height='30'></a></td><td><a href='#openC' id='csharpPopUp'><img src='img/noCsharp.PNG' class='csharpPop' border='0' width='30' height='30'></a></td></tr>";
													}
													$("div.contents table").append(txt);
												});
							}
						});
				// board로 가시겠습니까 만들지 말지 
			},
			error : function(resp) {
				alert(resp.message);
			}
		});
		
	});
});//ready