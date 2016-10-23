function javaFocusEditor(){
	if($("div#_container_java #syntax1").is(':checked')){
		var editor = ace.edit("file_div1");
		editor.focus();
	} else {
		$("div#_container_java #file1").focus();
	}
}

function csharpFocusEditor(){
	if($("div#_container_csharp #syntax2").is(':checked')){
		var editor = ace.edit("file_div2");
		editor.focus();
	} else {
		$("div#_container_csharp #file2").focus();
	}
}

$(document).ready(function() {
	$("div#_container_java #ex-input1").toggle(0);
	$("div#_container_csharp #ex-input2").toggle(0);
	/*$("div#_container_java #ex-more-options1").toggle(0);
	$("div#_container_csharp #ex-more-options2").toggle(0);*/
	
	$("div#_container_java #button-input1").click(function(){
		var $input_panel = $("div#_container_java #ex-input1");
		toggleAnimated( $input_panel );
		
		if( ! isMobile() ){
			setTimeout(function(){
				if($input_panel.is(':visible')){
					$input_panel.find('textarea').focus();
					cookie_helper_set('cp_show_input', 1);
				} else {
					javaFocusEditor();
					cookie_helper_set('cp_show_input', 0);
				}
			}, 300);
		}
		
		return false;
	});
	
	$("div#_container_csharp #button-input2").click(function(){
		var $input_panel = $("div#_container_csharp #ex-input2");
		toggleAnimated( $input_panel );
		
		if( ! isMobile() ){
			setTimeout(function(){
				if($input_panel.is(':visible')){
					$input_panel.find('textarea').focus();
					cookie_helper_set('cp_show_input', 1);
				} else {
					csharpFocusEditor();
					cookie_helper_set('cp_show_input', 0);
				}
			}, 300);
		}
		
		return false;
	});
	
	$("div#_container_java #button-more-options1").click(function(){
		var $more_options_panel = $("div#_container_java #ex-more-options1");
		toggleAnimated( $more_options_panel );
		
		if( ! isMobile() ){
			setTimeout(function(){
				if($more_options_panel.is(':visible')){
					$more_options_panel.find('textarea').focus();
					cookie_helper_set('cp_show_options', 1);
				} else {
					javaFocusEditor();
					cookie_helper_set('cp_show_options', 0);
				}
			}, 300);
		}
		
		if($(this).find('div#_container_java .more-options-less').is(':visible')) {
			$(this).find('div#_container_java .more-options-less').hide();
			$(this).find('div#_container_java .more-options-more').show();
		} else {
			$(this).find('div#_container_java .more-options-more').hide();
			$(this).find('div#_container_java .more-options-less').show();
		}
		
		return false;
	});
	
	$("div#_container_csharp #button-more-options2").click(function(){
		var $more_options_panel = $("div#_container_csharp #ex-more-options2");
		toggleAnimated( $more_options_panel );
		
		if( ! isMobile() ){
			setTimeout(function(){
				if($more_options_panel.is(':visible')){
					$more_options_panel.find('textarea').focus();
					cookie_helper_set('cp_show_options', 1);
				} else {
					csharpFocusEditor();
					cookie_helper_set('cp_show_options', 0);
				}
			}, 300);
		}
		
		if($(this).find('div#_container_csharp .more-options-less').is(':visible')) {
			$(this).find('div#_container_csharp .more-options-less').hide();
			$(this).find('div#_container_csharp .more-options-more').show();
		} else {
			$(this).find('div#_container_csharp .more-options-more').hide();
			$(this).find('div#_container_csharp .more-options-less').show();
		}
		return false;
	});
});