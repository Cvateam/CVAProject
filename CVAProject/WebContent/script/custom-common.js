var lang_map = {
		27: "csharp",
		114: "golang",
		121: "groovy",
		11: "c_cpp",
		1: "c_cpp",
		44: "c_cpp",
		34: "c_cpp",
		102: "c_cpp",
		43: "c_cpp",
		111: "clojure",
		10: "java",
		55: "java", // Java7
		35: "javascript",
		112: "javascript",
		26: "lua",
		8: "ocaml",
		3: "perl",
		54: "perl",
		29: "php",
		4: "python",
		116: "python",
		17: "ruby",
		39: "scala",
		28: "sh",
		40: "sql",
		62: "text"
};

function toggleAnimated($object) {
	if( !isMobile() ){
		$object.toggle('blind', {}, 250);
	} else {
		$object.toggle();
	}
}


function isMobile() {
	if( is_mobile ){
		return true;
	}
	return false;
}

var is_editor_active1 = false;
function javaLoadEditor(){
	var site = $("div#_container_java #site1").val();
	var lang_id = 1;
	var id = '';
	//site가 index에 들어가있으면 이거
	if(site == "index") {
		lang_id = $("div#_container_java #_lang1").val();
		id = 'file1';
	} else { // compile하고 나면 이건가봄
		lang_id = $("div#_container_java #compiler1").val();
		id = 'view_edit_file1';
	}
	var $elem = $("#" + id);
	var syn = "text";

	if( lang_map[lang_id] != undefined ){
		syn = lang_map[lang_id];
	}
	
	var editor = ace.edit("file_div1");
	var padding = 10;
	if(site == "index"){
		$("div#_container_java #file_div1").css({'height' : ($("div#_container_java #file_parent1").height() + 2*padding) + 'px'});
		$("div#_container_java #file_parent1").hide();
	} else {
		$("div#_container_java #view_edit_file1").hide();
	}
	$("div#_container_java #file_div1").show();
	editor.resize();
	editor.getSession().modeName = '/gfx/ace/src/'+syn;
    editor.getSession().setMode("ace/mode/"+syn);
    editor.getSession().setUseSoftTabs(false);
	editor.getSession().setValue( $elem.val() );
	editor.on('change',function(){
		$("div#_container_java #view_edit_save1").removeClass('disabled');
	});
	
	if(!is_editor_active1) {
		is_editor_active1 = true;
	    editor.renderer.setHScrollBarAlwaysVisible(false);
	}
	editor.focus();
}

function javaUnloadEditor(){
	var site = $("div#_container_java #site1").val();
	var id = "";
	if(site == "index"){
		id = "file1";
	} else { // view
		id = "view_edit_file1";
	}
	var $elem = $("#" + id);
	
	var editor = ace.edit("file_div1");
	$elem.val(editor.getSession().getValue());
	$("div#_container_java #file_div1").hide();
	//$elem.show();
	$("div#_container_java #file_parent1").show();
	$elem.show().focus();
}

var is_editor_active2 = false;
function csharpLoadEditor(){
	var site = $("div#_container_csharp #site2").val();
	var lang_id = 1;
	var id = '';
	if(site == "index") {
		lang_id = $("div#_container_csharp #_lang2").val();
		id = 'file2';
	} else { // view
		lang_id = $("div#_container_csharp #compiler2").val();
		id = 'view_edit_file2';
	}
	var $elem = $("#" + id);
	var syn = "text";

	if( lang_map[lang_id] != undefined ){
		syn = lang_map[lang_id];
	}
	
	var editor = ace.edit("file_div2");
	var padding = 10;
	if(site == "index"){
		$("div#_container_csharp #file_div2").css({'height' : ($("div#_container_csharp #file_parent2").height() + 2*padding) + 'px'});
		$("div#_container_csharp #file_parent2").hide();
	} else {
		$("div#_container_csharp #view_edit_file2").hide();
	}
	$("div#_container_csharp #file_div2").show();
	editor.resize();
	editor.getSession().modeName = '/gfx/ace/src/'+syn;
    editor.getSession().setMode("ace/mode/"+syn);
    editor.getSession().setUseSoftTabs(false);
	editor.getSession().setValue( $elem.val() );
	editor.on('change',function(){
		$("div#_container_csharp #view_edit_save2").removeClass('disabled');
	});
	
	if(!is_editor_active2) {
		is_editor_active2 = true;
	    editor.renderer.setHScrollBarAlwaysVisible(false);
	}
	editor.focus();
}

function csharpUnloadEditor(){
	var site = $("div#_container_csharp #site2").val();
	var id = "";
	if(site == "index"){
		id = "file2";
	} else { // view
		id = "view_edit_file2";
	}
	var $elem = $("#" + id);
	
	var editor = ace.edit("file_div2");
	$elem.val(editor.getSession().getValue());
	$("div#_container_csharp #file_div2").hide();
	//$elem.show();
	$("div#_container_csharp #file_parent2").show();
	$elem.show().focus();
}

/*function javaClearEditor() {
	var site = $("div#_container_java #site").val();
	var id = "";
	if(site == "index"){
		id = "file";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);
	
	var isEditorOn = $('div#_container_java #syntax').is(':checked');
	if(isEditorOn) {
		var editor = ace.edit("file_div");
	    editor.getSession().setValue('');
	} else {
		$elem.val('');
	}
}*/

$(document).ready(function(){
	javaLoadEditor();
	csharpLoadEditor();
	
	/*$("div#_container_java #syntax1").bind('click', function(){
		if( !$("div#_container_java #syntax1").attr('checked') ){
			cookie_helper_set('run_syntax', '0');
			javaUnloadEditor();
		} else {
			cookie_helper_set('run_syntax', '1');
			javaLoadEditor();
		}
		return true;
	});
	
	if( $("div#_container_java #syntax1").is(':checked') ) {
		javaLoadEditor();
	} else {
		// focus
		var site = $("div#_container_java #site1").val();
		if(site == 'index') {
			$("div#_container_java #file1").focus();
		}
	}
	
	$("div#_container_csharp #syntax2").bind('click', function(){
		if( !$("div#_container_csharp #syntax2").attr('checked') ){
			cookie_helper_set('run_syntax', '0');
			csharpUnloadEditor();
		} else {
			cookie_helper_set('run_syntax', '1');
			csharpLoadEditor();
		}
		return true;
	});
	
	if( $("div#_container_csharp #syntax2").is(':checked') ) {
		csharpLoadEditor();
	} else {
		// focus
		var site = $("div#_container_csharp #site2").val();
		if(site == 'index') {
			$("div#_container_csharp #file2").focus();
		}
	}*/
	
});
