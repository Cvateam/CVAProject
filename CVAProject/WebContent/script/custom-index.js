/*function maybeInsertTemplate1(current_source) {
	if(!current_source) {
		insertTemplateOrSample1('template');
	}
	if(current_source == $("#file_template1").val()) {
		insertTemplateOrSample1('template');
	}
}

function maybeInsertTemplate2(current_source) {
	if(!current_source) {
		insertTemplateOrSample2('template');
	}
	if(current_source == $("#file_template2").val()) {
		insertTemplateOrSample2('template');
	}
}*/


/*function insertTemplateOrSample1(what) {
	
	var langId = $('#_lang1').val();
	var solId = 0;
	
	if(what == 'template') {
		solId = langs_properties[langId]['template_sol_id'];
	}
	else if(what == 'sample') {
		solId = langs_properties[langId]['sample_sol_id'];
	}
	else if(what == 'userstemplate') {
		solId = langs_properties[langId]['users_template_sol_id'];
	}
	
	if(solId == 0) {
		return;
	}
	
	$('#insert-loader1').show();
	queueApplManager.add({
            type: 'POST',
            url: '/insert/' + what + '/' + solId + '/',
            dataType: 'json',
            success: function(data){;
					var isEditorOn = $('#syntax1').attr('checked');

					if(isEditorOn) {
						var editor = ace.edit("file_div1");
					    editor.getSession().setValue(data.source);
					} else {
						$('#file1').val(data.source);
					}
					$('#file_template1').val(data.source);
					
					if(what == 'sample' || what == 'userstemplate') {
						var isInputVisible = $('#ex-input1').is(':visible');
						if(!isInputVisible) {
							$('#button-input1').click();
						}
						$('#input1').val(data.input);
					} else {
						$('#input1').val(''); 
					}
					$('#insert-loader1').hide();
            },
            error: function(err,a,b){
            		alert("Error occured");
            }
    });
}

function insertTemplateOrSample2(what) {
	
	var langId = $('#_lang2').val();
	var solId = 0;
	
	if(what == 'template') {
		solId = langs_properties[langId]['template_sol_id'];
	}
	else if(what == 'sample') {
		solId = langs_properties[langId]['sample_sol_id'];
	}
	else if(what == 'userstemplate') {
		solId = langs_properties[langId]['users_template_sol_id'];
	}
	
	if(solId == 0) {
		return;
	}
	
	$('#insert-loader2').show();
	queueApplManager.add({
            type: 'POST',
            url: '/insert/' + what + '/' + solId + '/',
            dataType: 'json',
            success: function(data){;
					var isEditorOn = $('#syntax2').attr('checked');

					if(isEditorOn) {
						var editor = ace.edit("file_div2");
					    editor.getSession().setValue(data.source);
					} else {
						$('#file2').val(data.source);
					}
					$('#file_template2').val(data.source);
					
					if(what == 'sample' || what == 'userstemplate') {
						var isInputVisible = $('#ex-input2').is(':visible');
						if(!isInputVisible) {
							$('#button-input2').click();
						}
						$('#input2').val(data.input);
					} else {
						$('#input2').val(''); 
					}
					$('#insert-loader2').hide();
            },
            error: function(err,a,b){
            		alert("Error occured");
            }
    });
}*/

/**
 * Przeskakuje do edytora :)
 */


/*function languageChanged1($this) {
	var lang_id = 0;
	var $lang_select = $("#lang_select1");
	if($lang_select.is(':visible')) {
		lang_id = $lang_select.val();
		$menu_lang = $("#menu-lang-1" + lang_id);
	} else {
		$menu_lang = $this;
		lang_id = $this.attr('data-id');
	}
	$("a.lang").parent().removeClass('active');
	$menu_lang.parent().addClass('active');
	$("#_lang1").val(lang_id);
	$("#lang_advselect1>a>span").html($menu_lang.html());
	$lang_select.val(lang_id);
	
	// do ciacha
	cookie_helper_set('run_lang', lang_id);
	
	// do analyticsa
	//_gaq.push(['_trackEvent', 'language', 'change']);
	ga('send', 'event', 'language', 'change');
	
	// edytor
	if($("#syntax1").is(':checked')){
		// obsługa edytora
		var syn = 'text';
		if (typeof lang_map[lang_id] != "undefined") {
			syn = lang_map[lang_id]
		}
		
		var editor = ace.edit("file_div1");
	    editor.getSession().modeName = '/gfx/ace/src/'+syn;
	    editor.getSession().setMode("ace/mode/"+syn);
	    
	    // moze ladujemy szablon domyslny
	    maybeInsertTemplate(editor.getValue());
	} else {
		
		// moze ladujemy szablon domyslny
		maybeInsertTemplate($("#file1").val());
	}
	
	focusEditor1();
	
	// 2013-02-11 by wiele: to juz chyba nie potrzebne?
	// włączanie / wyłączanie przycisku	"run code"
	// if(langs_properties[lang_id]["runnable"] == 1) {
	// 	$("#run_div").show();
	// }
	// else {
	// 	$("#run_div").hide();
	// }
	
	// włączanie / wyłączanie wstawiania przykładów / wzorców
	var template_sol_id = langs_properties[lang_id]["template_sol_id"];
	var sample_sol_id = langs_properties[lang_id]["sample_sol_id"];
	var users_template_sol_id = langs_properties[lang_id]["users_template_sol_id"];
	
	if(template_sol_id > 0 || sample_sol_id > 0 || users_template_sol_id > 0) {
		$("#insert-part-or").css('display', 'inline');
		$("#insert-part-insert").css('display', 'inline');
		if(template_sol_id > 0)
			$("#insert-part-template").css('display', 'inline');
		else
			$("#insert-part-template").css('display', 'none');
		
		if(template_sol_id > 0 && sample_sol_id > 0)
			$("#insert-part-or2").css('display', 'inline');
		else
			$("#insert-part-or2").css('display', 'none');
		
		if(sample_sol_id > 0)
			$("#insert-part-sample").css('display', 'inline');
		else
			$("#insert-part-sample").css('display', 'none');
		
		if(users_template_sol_id > 0) {
			if(template_sol_id > 0 || sample_sol_id > 0)
				$("#insert-part-or3").css('display', 'inline');
			else
				$("#insert-part-or3").css('display', 'none');
			
			$("#insert-part-users-template").css('display', 'inline');
		}
		else {
			$("#insert-part-or3").css('display', 'none');
			$("#insert-part-users-template").css('display', 'none');
		}
	}
	else {
		$("#insert-part-or").css('display', 'none');
		$("#insert-part-insert").css('display', 'none');
		$("#insert-part-template").css('display', 'none');
		$("#insert-part-or2").css('display', 'none');
		$("#insert-part-sample").css('display', 'none');
		$("#insert-part-or3").css('display', 'none');
		$("#insert-part-users-template").css('display', 'none');
	}
	
	return false;
}

function languageChanged2($this) {
	var lang_id = 0;
	var $lang_select = $("#lang_select2");
	if($lang_select.is(':visible')) {
		lang_id = $lang_select.val();
		$menu_lang = $("#menu-lang-2" + lang_id);
	} else {
		$menu_lang = $this;
		lang_id = $this.attr('data-id');
	}
	$("a.lang").parent().removeClass('active');
	$menu_lang.parent().addClass('active');
	$("#_lang2").val(lang_id);
	$("#lang_advselect2>a>span").html($menu_lang.html());
	$lang_select.val(lang_id);
	
	// do ciacha
	cookie_helper_set('run_lang', lang_id);
	
	// do analyticsa
	//_gaq.push(['_trackEvent', 'language', 'change']);
	ga('send', 'event', 'language', 'change');
	
	// edytor
	if($("#syntax2").is(':checked')){
		// obsługa edytora
		var syn = 'text';
		if (typeof lang_map[lang_id] != "undefined") {
			syn = lang_map[lang_id]
		}
		
		var editor = ace.edit("file_div1");
	    editor.getSession().modeName = '/gfx/ace/src/'+syn;
	    editor.getSession().setMode("ace/mode/"+syn);
	    
	    // moze ladujemy szablon domyslny
	    maybeInsertTemplate(editor.getValue());
	} else {
		
		// moze ladujemy szablon domyslny
		maybeInsertTemplate($("#file1").val());
	}
	
	focusEditor2();
	
	// 2013-02-11 by wiele: to juz chyba nie potrzebne?
	// włączanie / wyłączanie przycisku	"run code"
	// if(langs_properties[lang_id]["runnable"] == 1) {
	// 	$("#run_div").show();
	// }
	// else {
	// 	$("#run_div").hide();
	// }
	
	// włączanie / wyłączanie wstawiania przykładów / wzorców
	var template_sol_id = langs_properties[lang_id]["template_sol_id"];
	var sample_sol_id = langs_properties[lang_id]["sample_sol_id"];
	var users_template_sol_id = langs_properties[lang_id]["users_template_sol_id"];
	
	if(template_sol_id > 0 || sample_sol_id > 0 || users_template_sol_id > 0) {
		$("#insert-part-or").css('display', 'inline');
		$("#insert-part-insert").css('display', 'inline');
		if(template_sol_id > 0)
			$("#insert-part-template").css('display', 'inline');
		else
			$("#insert-part-template").css('display', 'none');
		
		if(template_sol_id > 0 && sample_sol_id > 0)
			$("#insert-part-or2").css('display', 'inline');
		else
			$("#insert-part-or2").css('display', 'none');
		
		if(sample_sol_id > 0)
			$("#insert-part-sample").css('display', 'inline');
		else
			$("#insert-part-sample").css('display', 'none');
		
		if(users_template_sol_id > 0) {
			if(template_sol_id > 0 || sample_sol_id > 0)
				$("#insert-part-or3").css('display', 'inline');
			else
				$("#insert-part-or3").css('display', 'none');
			
			$("#insert-part-users-template").css('display', 'inline');
		}
		else {
			$("#insert-part-or3").css('display', 'none');
			$("#insert-part-users-template").css('display', 'none');
		}
	}
	else {
		$("#insert-part-or").css('display', 'none');
		$("#insert-part-insert").css('display', 'none');
		$("#insert-part-template").css('display', 'none');
		$("#insert-part-or2").css('display', 'none');
		$("#insert-part-sample").css('display', 'none');
		$("#insert-part-or3").css('display', 'none');
		$("#insert-part-users-template").css('display', 'none');
	}
	
	return false;
}
*/
