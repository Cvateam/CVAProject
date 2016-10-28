$(document).ready(function() {
  $('.input').on('focus', function() {
    $('.login').addClass('clicked');
  });
 
  $('.login').on('submit', function(e) {
	  
    e.preventDefault();
    //$('.login').removeClass('clicked').addClass('loading');
	var action = $("#form").attr('action');
	var form_data = {
		"custid": $("#Username").val(),
		"password" : $("#Password").val()
	};
	$.ajax({
		type: "POST",
		url: action,
		data: form_data,
		success: function(response) {
				location.href = "../index.action";
		}
		,error : function(resp){
			alert("error발생다시 시도해주세요.");
			location.href = "../index.action";
		}
	});
	
});
    
});
/*  $('.resetbtn').on('click', function(e){
      e.preventDefault();
    $('.login').removeClass('loading');
  });*/