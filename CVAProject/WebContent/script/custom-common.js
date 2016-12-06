var lang_map = {
	27 : "csharp",
	114 : "golang",
	121 : "groovy",
	11 : "c_cpp",
	1 : "c_cpp",
	44 : "c_cpp",
	34 : "c_cpp",
	102 : "c_cpp",
	43 : "c_cpp",
	111 : "clojure",
	10 : "java",
	55 : "java", // Java7
	35 : "javascript",
	112 : "javascript",
	26 : "lua",
	8 : "ocaml",
	3 : "perl",
	54 : "perl",
	29 : "php",
	4 : "python",
	116 : "python",
	17 : "ruby",
	39 : "scala",
	28 : "sh",
	40 : "sql",
	62 : "text"
};

/*
 * var queueApplManager = $.manageAjax.create('queueApplManager', { queue : true
 * }); var statusCodes = {}; var loader_img = '<img
 * src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQgAAAGJiYoKCgpKSkiH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCgAAACwAAAAAEAAQAAADMwi63P4wyklrE2MIOggZnAdOmGYJRbExwroUmcG2LmDEwnHQLVsYOd2mBzkYDAdKa+dIAAAh+QQJCgAAACwAAAAAEAAQAAADNAi63P5OjCEgG4QMu7DmikRxQlFUYDEZIGBMRVsaqHwctXXf7WEYB4Ag1xjihkMZsiUkKhIAIfkECQoAAAAsAAAAABAAEAAAAzYIujIjK8pByJDMlFYvBoVjHA70GU7xSUJhmKtwHPAKzLO9HMaoKwJZ7Rf8AYPDDzKpZBqfvwQAIfkECQoAAAAsAAAAABAAEAAAAzMIumIlK8oyhpHsnFZfhYumCYUhDAQxRIdhHBGqRoKw0R8DYlJd8z0fMDgsGo/IpHI5TAAAIfkECQoAAAAsAAAAABAAEAAAAzIIunInK0rnZBTwGPNMgQwmdsNgXGJUlIWEuR5oWUIpz8pAEAMe6TwfwyYsGo/IpFKSAAAh+QQJCgAAACwAAAAAEAAQAAADMwi6IMKQORfjdOe82p4wGccc4CEuQradylesojEMBgsUc2G7sDX3lQGBMLAJibufbSlKAAAh+QQJCgAAACwAAAAAEAAQAAADMgi63P7wCRHZnFVdmgHu2nFwlWCI3WGc3TSWhUFGxTAUkGCbtgENBMJAEJsxgMLWzpEAACH5BAkKAAAALAAAAAAQABAAAAMyCLrc/jDKSatlQtScKdceCAjDII7HcQ4EMTCpyrCuUBjCYRgHVtqlAiB1YhiCnlsRkAAAOwAAAAAAAAAAAA=="/>';
 * var ok_img = '<img src="/gfx2/img/ok.png" style="height: 10px;" />';
 */

/*
 * function alertIdeoneGeneratedError(data) { alert("Error occurred.\n" + "Error
 * code: " + data.error_code + "\n" + "Error description: " + data.description); }
 */

/*
 * function masstestGetStatus(id) { queueApplManager.add({ url :
 * "/masstest/status/" + id + "/", dataType : 'html', success : function(data) {
 * $('#solutions').html(data); bindHighLightRows(); bindClickableRows();
 * setTimeout("masstestGetStatus(" + id + ")", 4000); } }); }
 */

var is_editor_active = false;

function javaLoadEditor() {
	var site = $("#site").val();
	var lang_id = 1;
	var id = '';
	if (site == "index") {
		lang_id = $("#_lang1").val();
		id = 'file1';
	} else { // view
		lang_id = $("#compiler").val();
		id = 'view_edit_file';
	}
	var $elem = $("#" + id);
	var syn = "text";

	if (lang_map[lang_id] != undefined) {
		syn = lang_map[lang_id];
	}

	var editor = ace.edit("file_div1");
	// $elem.hide();
	// jesli ktos zmieni rozmiar pola (uchwyt ala chrome/ff) to edytor sie
	// dostosuje
	var padding = 10;
	if (site == "index") {
		$("#file_div1").css({
			'height' : ($("#file_parent1").height() + 2 * padding) + 'px'
		});
		$("#file_parent1").hide();
	} else {
		$("#view_edit_file").hide();
	}
	$("#file_div1").show();
	editor.resize();
	editor.getSession().modeName = '/gfx/ace/src/' + syn;
	editor.getSession().setMode("ace/mode/" + syn);
	editor.getSession().setUseSoftTabs(false);
	editor.getSession().setValue($elem.val());
	editor.on('change', function() {
		$("#view_edit_save").removeClass('disabled');
	});

	if (!is_editor_active) {
		is_editor_active = true;
		editor.renderer.setHScrollBarAlwaysVisible(false);
	}
	editor.focus();
}// javaLoadEditor

function javaLoadEditor3() {
	var site = $("#site").val();
	var lang_id = 1;
	var id = '';
	if (site == "index") {
		lang_id = $("#_lang1").val();
		id = 'file3';
	} else { // view
		lang_id = $("#compiler").val();
		id = 'view_edit_file';
	}
	var $elem = $("#" + id);
	var syn = "text";

	if (lang_map[lang_id] != undefined) {
		syn = lang_map[lang_id];
	}

	var editor = ace.edit("file_div3");
	// $elem.hide();
	// jesli ktos zmieni rozmiar pola (uchwyt ala chrome/ff) to edytor sie
	// dostosuje
	var padding = 10;
	if (site == "index") {
		$("#file_div3").css({
			'height' : ($("#file_parent1").height() + 2 * padding) + 'px'
		});
		$("#file_parent3").hide();
	} else {
		$("#view_edit_file").hide();
	}
	$("#file_div3").show();
	editor.resize();
	editor.getSession().modeName = '/gfx/ace/src/' + syn;
	editor.getSession().setMode("ace/mode/" + syn);
	editor.getSession().setUseSoftTabs(false);
	editor.getSession().setValue($elem.val());
	editor.on('change', function() {
		$("#view_edit_save").removeClass('disabled');
	});

	if (!is_editor_active) {
		is_editor_active = true;
		editor.renderer.setHScrollBarAlwaysVisible(false);
	}
	editor.focus();
}// javaLoadEditor

function javaLoadEditor4() {
	var site = $("#site").val();
	var lang_id = 1;
	var id = '';
	if (site == "index") {
		lang_id = $("#_lang1").val();
		id = 'file4';
	} else { // view
		lang_id = $("#compiler").val();
		id = 'view_edit_file';
	}
	var $elem = $("#" + id);
	var syn = "text";

	if (lang_map[lang_id] != undefined) {
		syn = lang_map[lang_id];
	}

	var editor = ace.edit("file_div4");
	// $elem.hide();
	// jesli ktos zmieni rozmiar pola (uchwyt ala chrome/ff) to edytor sie
	// dostosuje
	var padding = 10;
	if (site == "index") {
		$("#file_div4").css({
			'height' : ($("#file_parent1").height() + 2 * padding) + 'px'
		});
		$("#file_parent4").hide();
	} else {
		$("#view_edit_file").hide();
	}
	$("#file_div4").show();
	editor.resize();
	editor.getSession().modeName = '/gfx/ace/src/' + syn;
	editor.getSession().setMode("ace/mode/" + syn);
	editor.getSession().setUseSoftTabs(false);
	editor.getSession().setValue($elem.val());
	editor.on('change', function() {
		$("#view_edit_save").removeClass('disabled');
	});

	if (!is_editor_active) {
		is_editor_active = true;
		editor.renderer.setHScrollBarAlwaysVisible(false);
	}
	editor.focus();
}// javaLoadEditor

function csharpLoadEditor() {
	var site = $("#site").val();
	var lang_id = 1;
	var id = '';
	if (site == "index") {
		lang_id = $("#_lang2").val();
		id = 'file2';
	} else { // view
		lang_id = $("#compiler").val();
		id = 'view_edit_file';
	}
	var $elem = $("#" + id);
	var syn = "text";

	if (lang_map[lang_id] != undefined) {
		syn = lang_map[lang_id];
	}

	var editor = ace.edit("file_div2");
	// $elem.hide();
	// jesli ktos zmieni rozmiar pola (uchwyt ala chrome/ff) to edytor sie
	// dostosuje
	var padding = 10;
	if (site == "index") {
		$("#file_div2").css({
			'height' : ($("#file_parent2").height() + 2 * padding) + 'px'
		});
		$("#file_parent2").hide();
	} else {
		$("#view_edit_file").hide();
	}
	$("#file_div2").show();
	editor.resize();
	editor.getSession().modeName = '/gfx/ace/src/' + syn;
	editor.getSession().setMode("ace/mode/" + syn);
	editor.getSession().setUseSoftTabs(false);
	editor.getSession().setValue($elem.val());
	editor.on('change', function() {
		$("#view_edit_save").removeClass('disabled');
	});

	if (!is_editor_active) {
		is_editor_active = true;
		editor.renderer.setHScrollBarAlwaysVisible(false);
	}
	editor.focus();
}// csharpLoadEditor

function javaUnloadEditor() {
	var site = $("#site").val();
	var id = "";
	if (site == "index") {
		id = "file1";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);

	var editor = ace.edit("file_div1");
	$elem.val(editor.getSession().getValue());
	$("#file_div1").hide();
	// $elem.show();
	$("#file_parent1").show();
	$elem.show().focus();
}// javaUnloadEditor

function javaUnloadEditor3() {
	var site = $("#site").val();
	var id = "";
	if (site == "index") {
		id = "file3";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);

	var editor = ace.edit("file_div3");
	$elem.val(editor.getSession().getValue());
	$("#file_div3").hide();
	// $elem.show();
	$("#file_parent3").show();
	$elem.show().focus();
}// javaUnloadEditor

function javaUnloadEditor4() {
	var site = $("#site").val();
	var id = "";
	if (site == "index") {
		id = "file4";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);

	var editor = ace.edit("file_div4");
	$elem.val(editor.getSession().getValue());
	$("#file_div4").hide();
	// $elem.show();
	$("#file_parent4").show();
	$elem.show().focus();
}// javaUnloadEditor

function csharpUnloadEditor() {
	var site = $("#site").val();
	var id = "";
	if (site == "index") {
		id = "file2";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);

	var editor = ace.edit("file_div2");
	$elem.val(editor.getSession().getValue());
	$("#file_div2").hide();
	// $elem.show();
	$("#file_parent2").show();
	$elem.show().focus();
}// csharpUnloadEditor

function javaClearEditor() {
	var site = $("#site").val();
	var id = "";
	if (site == "index") {
		id = "file1";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);

	var isEditorOn = $('#syntax1').is(':checked');
	if (isEditorOn) {
		var editor = ace.edit("file_div1");
		editor.getSession().setValue('');
	} else {
		$elem.val('');
	}
}// javaClearEditor

function csharpClearEditor() {
	var site = $("#site").val();
	var id = "";
	if (site == "index") {
		id = "file2";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);

	var isEditorOn = $('#syntax2').is(':checked');
	if (isEditorOn) {
		var editor = ace.edit("file_div2");
		editor.getSession().setValue('');
	} else {
		$elem.val('');
	}
}

function focusEditor1(){
	if($("#syntax1").is(':checked')){
		var editor1 = ace.edit("file_div1");
		var editor2 = ace.edit("file_div3");
		var editor3 = ace.edit("file_div4");
		editor1.focus();
		editor2.focus();
		editor3.focus();
	} else {
		$("#file1").focus();
		$("#file3").focus();
		$("#file4").focus();
	}
}

function focusEditor2(){
	if($("#syntax2").is(':checked')){
		var editor = ace.edit("file_div2");
		editor.focus();
	} else {
		$("#file2").focus();
	}
}


function isMobile() {
	if (is_mobile) {
		return true;
	}
	return false;
}

$(document).ready(function() {

	if ($("#syntax1").is(':checked')) {
		javaLoadEditor();
		javaLoadEditor3();
		javaLoadEditor4();
	} else {
		// focus
		var site = $("#site").val();
		if (site == 'index') {
			$("#file1").focus();
			$("#file3").focus();
			$("#file4").focus();
		}
	}

	if ($("#syntax2").is(':checked')) {
		csharpLoadEditor();
	} else {
		// focus
		var site = $("#site").val();
		if (site == 'index') {
			$("#file2").focus();
		}
	}
});
