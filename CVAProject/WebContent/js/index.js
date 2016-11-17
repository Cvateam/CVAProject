$(document).ready(function() {
  $('.input').on('focus', function() {
    $('.login').addClass('clicked');
  });
 
  $('.login').on('submit', function(e) {
	  
    e.preventDefault();
    //$('.login').removeClass('clicked').addClass('loading');
	var action = $("#form").attr('action');
	alert(action);
	var form_data = {
		"custid": $("#Username").val(),
		"password" : $("#Password").val()
	};
	$.ajax({
		type: "POST",
		url: action,
		data: form_data,
		success: function(response) {
				location.href = "../converterMain.action";
		}
		,error : function(resp){
			alert(resp.message);
			location.href = "loginForm.action";
		}
	});
	
});
    
});
/*  $('.resetbtn').on('click', function(e){
      e.preventDefault();
    $('.login').removeClass('loading');
  });*/