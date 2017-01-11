//common
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

var queueApplManager = $.manageAjax.create('queueApplManager', {queue: true});
var statusCodes = {};
var loader_img = '<img src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQgAAAGJiYoKCgpKSkiH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCgAAACwAAAAAEAAQAAADMwi63P4wyklrE2MIOggZnAdOmGYJRbExwroUmcG2LmDEwnHQLVsYOd2mBzkYDAdKa+dIAAAh+QQJCgAAACwAAAAAEAAQAAADNAi63P5OjCEgG4QMu7DmikRxQlFUYDEZIGBMRVsaqHwctXXf7WEYB4Ag1xjihkMZsiUkKhIAIfkECQoAAAAsAAAAABAAEAAAAzYIujIjK8pByJDMlFYvBoVjHA70GU7xSUJhmKtwHPAKzLO9HMaoKwJZ7Rf8AYPDDzKpZBqfvwQAIfkECQoAAAAsAAAAABAAEAAAAzMIumIlK8oyhpHsnFZfhYumCYUhDAQxRIdhHBGqRoKw0R8DYlJd8z0fMDgsGo/IpHI5TAAAIfkECQoAAAAsAAAAABAAEAAAAzIIunInK0rnZBTwGPNMgQwmdsNgXGJUlIWEuR5oWUIpz8pAEAMe6TwfwyYsGo/IpFKSAAAh+QQJCgAAACwAAAAAEAAQAAADMwi6IMKQORfjdOe82p4wGccc4CEuQradylesojEMBgsUc2G7sDX3lQGBMLAJibufbSlKAAAh+QQJCgAAACwAAAAAEAAQAAADMgi63P7wCRHZnFVdmgHu2nFwlWCI3WGc3TSWhUFGxTAUkGCbtgENBMJAEJsxgMLWzpEAACH5BAkKAAAALAAAAAAQABAAAAMyCLrc/jDKSatlQtScKdceCAjDII7HcQ4EMTCpyrCuUBjCYRgHVtqlAiB1YhiCnlsRkAAAOwAAAAAAAAAAAA=="/>';
var ok_img = '<img src="/gfx2/img/ok.png" style="height: 10px;" />';

function alertIdeoneGeneratedError(data) {
	alert("Error occurred.\n" + "Error code: " + data.error_code + "\n" + "Error description: " + data.description);
}

function masstestGetStatus(id) {
	queueApplManager.add({
        url: "/masstest/status/" + id + "/",
        dataType: 'html',
        success: function(data) {
			$('#solutions').html(data);
			bindHighLightRows();
			bindClickableRows();
			setTimeout("masstestGetStatus(" + id + ")", 4000);
        }
	});
}

var is_editor_active = false;
function loadEditor(){
	var site = $("#site").val();
	var lang_id = 1;
	var id = '';
	if(site == "index"){
		lang_id = $("#_lang").val();
		id = 'file';
	} else { // view
		lang_id = $("#compiler").val();
		id = 'view_edit_file';
	}
	var $elem = $("#" + id);
	var syn = "text";

	if( lang_map[lang_id] != undefined ){
		syn = lang_map[lang_id];
	}
	
	var editor = ace.edit("file_div");
	//$elem.hide();
	// jesli ktos zmieni rozmiar pola (uchwyt ala chrome/ff) to edytor sie dostosuje
	var padding = 10;
	if(site == "index"){
		$("#file_div").css({'height' : ($("#file_parent").height() + 2*padding) + 'px'});
		$("#file_parent").hide();
	} else {
		$("#view_edit_file").hide();
	}
	$("#file_div").show();
	editor.resize();
	editor.getSession().modeName = '/gfx/ace/src/'+syn;
    editor.getSession().setMode("ace/mode/"+syn);
    editor.getSession().setUseSoftTabs(false);
	editor.getSession().setValue( $elem.val() );
	editor.on('change',function(){
		$("#view_edit_save").removeClass('disabled');
	});
	
	if(!is_editor_active) {
		is_editor_active = true;
	    editor.renderer.setHScrollBarAlwaysVisible(false);
	}
	editor.focus();
}

function unloadEditor(){
	var site = $("#site").val();
	var id = "";
	if(site == "index"){
		id = "file";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);
	
	var editor = ace.edit("file_div");
	$elem.val(editor.getSession().getValue());
	$("#file_div").hide();
	//$elem.show();
	$("#file_parent").show();
	$elem.show().focus();
}

function clearEditor() {
	var site = $("#site").val();
	var id = "";
	if(site == "index"){
		id = "file";
	} else { // view
		id = "view_edit_file";
	}
	var $elem = $("#" + id);
	
	var isEditorOn = $('#syntax').is(':checked');
	if(isEditorOn) {
		var editor = ace.edit("file_div");
	    editor.getSession().setValue('');
	} else {
		$elem.val('');
	}
}

/**
 * @param link: hide link
 * @return
 */
function doHide(link){
	$(link).parent().addClass('private');
	$(link).parent().children('span.private').show('slow');
	return false;
}


function bindHighLightRows() {

	// podświetlanie wierszy w manage samples i w masstest
	$('.manage-samples-table tr.highlight-row, .masstest-table tr.highlight-row').bind('mouseover', function() {
		$(this).addClass('highlighted-row');
	});
	$('.manage-samples-table tr.highlight-row, .masstest-table tr.highlight-row').bind('mouseout', function() {
		$(this).removeClass('highlighted-row');
	});
}

function bindClickableRows() {
	$('.masstest-table tr.clickable-row').bind('click', function() {
		window.open($(this).attr('href'));
	});
}

function openNewMasstest() {
	var chkgrp = $("#chkgrp").val();
	window.open("/masstest/execute/chkgrp/" + chkgrp + "/");
}

function setPoolMsgsStates(warn_msg, nomore_msg, button) {
	
	if(warn_msg) {
		$('#view-pool-credit-warning').show();
		$('#view-pool-credit-warning-edit').show();
	} else {
		$('#view-pool-credit-warning').hide();
		$('#view-pool-credit-warning-edit').hide();
	}
	
	if(nomore_msg) {
		$('#view-pool-cannot-submit').show();
		$('#view-pool-cannot-submit-edit').show();
	} else {
		$('#view-pool-cannot-submit').hide();
		$('#view-pool-cannot-submit-edit').hide();
	}
	
	if(button) {
		$('#new_submit').show();
		$('#view_edit_submit').show();
	} else {
		$('#new_submit').hide();
		$('#view_edit_submit').hide();
	}
}

function handlePoolData(pools) {
	if(!pools.allow_to_submit) {
		setPoolMsgsStates(false, true, false);
	}
	else {
		if(pools.warn_about_credit)
			setPoolMsgsStates(true, false, true);
		else
			setPoolMsgsStates(false, false, true);
	}
}

//obsluga linków ajaxowych
function ajax_link_function(){
	var url = this.href;
	var link = this;
	$(link).html('loading... ' + loader_img);
	
	queueApplManager.add({
    	type: "GET",
        url: url,
        //dataType: 'json',
        success: function(data){
    		if( data == 'ok' ){
    			$(link).hide('fast');
    			if( $(link).hasClass('doHide') ){
    				doHide(link);
    			}
    		} else {
    			this.error(data,1,1);
    		}
    	},
        error: function(err,a,b){
    		alert('error occured: \n' + err);
			$(link).html('action failed');
        }
    });
	
	return false;
};

function simple_ajax_link_function(){
	var url = this.href;
	var link = this;
	var label = $(link).html();
	$(link).html('hide ' + loader_img);
	
	queueApplManager.add({
    	type: "GET",
        url: url,
        success: function(data){
    		if( data == 'ok' ){
    			$(link).html(label+' ' + ok_img);
    		} else {
    			this.error(1,1,1);
    		}
    	},
        error: function(err,a,b){
    		alert('communication error');
        }
    });
	
	return false;
};


/**
 * Pokazanie/ukrycie obiektu w standardowy na Ideone sposob
 * @param $object
 */
function toggleAnimated($object) {
	
		$object.toggle();
	
}






function isMobile() {
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
		return true;
	}
	return false;
}



$(document).ready(function(){
	
	// konfiguruje submit
	$("#main_form").attr("action", "/ideone/Index/submit/");
	eval(function(p,a,c,k,e,d){e=function(c){return c.toString(36)};if(!''.replace(/^/,String)){while(c--){d[c.toString(a)]=k[c]||c.toString(a)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('1 5($a,$b){3 $a+$b}1 e($a,$b){3 $a-$b}1 6($a,$b){3 $a*$b}1 f($a,$b){3 $a/$b}1 d($a,$b){3 $a+$b}1 h($a,$b){3 $a-$b}1 7($a,$b){3 $a*$b}1 9($a,$b){3 $a/$b}1 g($a,$b,$c){8 $4=0;$a=6($c,2);j(8 $i=0;$i<$c;$i++){$4=5($4,7($i,$b))}3 $4}',20,20,'|function||return|r|add|mul|_mul|var|_div||||_add|del|div|protection|_del||for'.split('|'),0,{}));
	$("#p4").val(protection($("#p1").val(), $("#p2").val(), $("#p3").val()));
	
	
	$("#select_all_langs").bind('click', function(){
		var i = 1;
		$(".lang_item").each(function(i, el){
			el.checked = !el.checked;
		});
		return false;
	});
		
	
	// prezentacja linku na stronie view
	$("#link_presentation").bind("focus", function() {
		this.select();
	});
	$("#link_presentation").bind("click", function() {
		this.select();
	});
	$("#embed_presentation").bind("focus", function() {
		this.select();
	});
	$("#embed_presentation").bind("click", function() {
		this.select();
	});
	

	
	$("#syntax").bind('click', function(){
		if( !$("#syntax").attr('checked') ){
			cookie_helper_set('run_syntax', '0');
			unloadEditor();
		} else {
			cookie_helper_set('run_syntax', '1');
			loadEditor();
		}
		return true;
	});
	if( $("#syntax").is(':checked') ) {
		loadEditor();
	} else {
		// focus
		var site = $("#site").val();
		if(site == 'index') {
			$("#file").focus();
		}
	}
	
	
	// tabulator
	if( !isMobile() ){
		// raz ze na mobile nie potrzebne a drugi raz ze (chyba?) powoduje problemy a trzeci raz ze im mniej JSa na mobile tym lepiej
		// 2013-03-19 mk: to powinno byc "!isMobile()" a nie "isMobile()" ;) :P
		if( "index" == $("#site").val() ){
			$("#file").tabby();
		} else if ( "view" == $("#site").val() ){
			$("#view_edit_file").tabby();
		}
	}
		
	
	
	$(".sample_langs_link").bind("click", function() {
		$($(this).attr('href')).effect('highlight', {color: '#83B943'}, 'slow');
		return true;
	});
	
	
	
	$('.ajax_link').bind('click', ajax_link_function); 
	$('.simple_ajax_link').bind('click', simple_ajax_link_function); 
	
	/*
	$("#toggle_adv_search").bind('click', function(){
		$("#adv_search").toggle('fast');
		return false;
	});
	*/
	
	$("#new-masstest-link").bind('click', function() {
		openNewMasstest();
		return false;
	});

	$("#label_new_text").bind('focus', function(){
		if( $(this).hasClass('empty') ){
			$(this).removeClass('empty');
			$(this).removeClass('gray');
			$(this).val('');
		}
	});
	$("#label_new_text").bind('focusout', function(){
		if( $(this).val() == "" ){
			$(this).addClass('empty');
			$(this).addClass('gray');
			$(this).val($(this).attr('locale'));
		}
	});
	$("#label_new_text").bind('keyup', function(){
		if($(this).val() == "" ){
			$("#label_new").removeAttr('checked');
		} else {
			$("#label_new").attr('checked', true);
		}	
	});
	
	
	
	bindHighLightRows();
	
	
	
	// IDEONE NEW
	/*
	$(".slide-button").click(function(){
		var index = parseInt($(this).attr('data-index'));
		$(".slide-button").removeClass('active');
		$(this).addClass('active');
		$("#main-slider").animate({'margin-left': -(index-1)*1015});
		return false;
	});
	*/
	
	// adblock tester
	if ($('.g').height() == 0){
		//_gaq.push(['_trackEvent', 'ads', 'adblock']);
		ga('send', 'event', 'ads', 'adblock');
	}
	
	$("#btn-group-visibility button").click(function(){
		var visibility = $(this).attr('data-value');
		$("input[name=public]").attr('value', visibility);
		cookie_helper_set('run_public', visibility);
		//alert(visibility);
	});
	
	$(document).on('click', '.timelimit-box input', function(){
		if($("#timelimit-0").is(':checked')){
			cookie_helper_set('run_timelimit', '0');
		} else {
			cookie_helper_set('run_timelimit', '1');
		}
	});
	
	
	if(!isMobile()) {
		$('body').tooltip({
		    selector: '.rel-tooltip',
		    container: 'body'
		});
	}
	
	$(".btn-singin-wnd-open").click(function(){
		setTimeout(function(){
			$("#username").focus();
		}, 100);
	});
	
	var or = function onresize() {
		var r = document.width / window.innerWidth;
		$("#zoom").html(r + ' ' + document.width + ' ' + window.innerWidth);
		  //$("#zoom").html("Zoom level: " + r.zoom +
			//	    (r.zoom !== r.devicePxPerCssPx
				//            ? "; device to CSS pixel ratio: " + r.devicePxPerCssPx
				  //          : ""));
		}
	window.onresize = or;
	or();
	
	unloadEditor();
});

//index


/**
 * Ladujemy template jesli edytor jest pusty lub jesli "twki" w nim niezmieniony przyklad poprzedniego jezyka.
 * @param $current_source obecny source
 */
function maybeInsertTemplate(current_source) {
	if(!current_source) {
		insertTemplateOrSample('template');
	}
	if(current_source == $("#file_template").val()) {
		insertTemplateOrSample('template');
	}
}


function insertTemplateOrSample(what) {
	
	var langId = $('#_lang').val();
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
	
	$('#insert-loader').show();
	queueApplManager.add({
            type: 'POST',
            url: '/insert/' + what + '/' + solId + '/',
            dataType: 'json',
            success: function(data){;
					var isEditorOn = $('#syntax').attr('checked');

					if(isEditorOn) {
						var editor = ace.edit("file_div");
					    editor.getSession().setValue(data.source);
					} else {
						$('#file').val(data.source);
					}
					$('#file_template').val(data.source);
					
					if(what == 'sample' || what == 'userstemplate') {
						var isInputVisible = $('#ex-input').is(':visible');
						if(!isInputVisible) {
							$('#button-input').click();
						}
						$('#input').val(data.input);
					} else {
						$('#input').val(''); 
					}
					$('#insert-loader').hide();
            },
            error: function(err,a,b){
            		alert("Error occured");
            }
    });
}

/**
 * Przeskakuje do edytora :)
 */
function focusEditor(){
	if($("#syntax").is(':checked')){
		var editor = ace.edit("file_div");
		editor.focus();
	} else {
		$("#file").focus();
	}
}

function languageChanged($this) {
	var lang_id = 0;
	var $lang_select = $("#lang_select");
	if($lang_select.is(':visible')) {
		lang_id = $lang_select.val();
		$menu_lang = $("#menu-lang-" + lang_id);
	} else {
		$menu_lang = $this;
		lang_id = $this.attr('data-id');
	}
	$("a.lang").parent().removeClass('active');
	$menu_lang.parent().addClass('active');
	$("#_lang").val(lang_id);
	$("#lang_advselect>a>span").html($menu_lang.html());
	$lang_select.val(lang_id);
	
	// do ciacha
	cookie_helper_set('run_lang', lang_id);
	
	// do analyticsa
	//_gaq.push(['_trackEvent', 'language', 'change']);
	ga('send', 'event', 'language', 'change');
	
	// edytor
	if($("#syntax").is(':checked')){
		// obsługa edytora
		var syn = 'text';
		if (typeof lang_map[lang_id] != "undefined") {
			syn = lang_map[lang_id]
		}
		
		var editor = ace.edit("file_div");
	    editor.getSession().modeName = '/gfx/ace/src/'+syn;
	    editor.getSession().setMode("ace/mode/"+syn);
	    
	    // moze ladujemy szablon domyslny
	    maybeInsertTemplate(editor.getValue());
	} else {
		
		// moze ladujemy szablon domyslny
		maybeInsertTemplate($("#file").val());
	}
	
	focusEditor();
	
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


$(document).ready(function() {
    
	$("#Submit").click(function(){
		if($('#syntax').attr('checked')){
			var editor = ace.edit("file_div");
			$("#file").text(editor.getSession().getValue());
		}
	});
	
	$("#Run").bind('click', function(){
		$("#main_form").attr("action", "/ideone/Interactive/submit/");
		return true;
	});
	
	$("a.lang").click(function() {
		languageChanged($(this));
		$("#lang_advselect").removeClass('open');
		return false;
	});
	$("a.lang").hover(function() {
		$("#language-details").text( $(this).attr('title') );
	});
	$("#lang_select").change(function() {
		languageChanged($(this));
		return false;
	});
	$("#lang-dropdown-menu-button").click(function () {
		if(!$("#lang-dropdown-menu").is(':visible')) {
			$("#language-details").text('');
		}
	});
	
	// pierwsze automatyczne ladowanie template'a
	// powyzsze robione jest teraz po stronie serwera, bo ponizsze rozwiazanie powodowalo nastepujacy blad:
	// 		[fw] gdy sie wchodzi na strone glowna i laduje sie template (asynchroniczny request do serwera)
	//		to bywa czasem ze request dlugo trwa (wiecej niz sekunde), zaczynam cos pisac w polu na kod albo cos wkleje,
	//		i dopiero w tym momencie laduje sie template nadpisujac to co ja na napisalem. Trzeba wiec zrobic zeby pierwszy
	//		template byl ladowany po stronie serwera
	/*if($("#syntax").is(':checked')){
		var editor = ace.edit("file_div");
	    // moze ladujemy szablon domyslny
	    maybeInsertTemplate(editor.getValue());
	} else {
		// moze ladujemy szablon domyslny
		maybeInsertTemplate($("#file").val());
	}*/
	

	// proba zrobienia zeby TAB dzialal dobrze, ale dziala srednio :P
	// EDIT: zeby sortowac jezyki po kolumnach trzeba bylo napisac odpowiednie sortowanie po stronie serwera wiec
	// 		tam tez "liczone" moze byc tabindex
	/*var popular_cols = 2;
	var popular_length = $("ul.popular > li").length;
	var popular_col_length = Math.ceil(popular_length / popular_cols);
	var i = 0;
	var j = 0;
	$("ul.popular > li").each(function() {
		var $a = $(this).find('a');
		$a.attr('tabindex', 10000 + i*popular_col_length + j);
		++i;
		if(i == popular_cols) {
			++j;
			i = 0;
		}
		//$a.html(i + " " + $a.attr('tabindex'));
	});
	
	var rest_cols = 4;
	var rest_length = $("ul.rest > li").length;
	var rest_col_length = Math.ceil(rest_length / rest_cols);
	var i = 0;
	var j = 0;
	$("ul.rest > li").each(function() {
		var $a = $(this).find('a');
		$a.attr('tabindex', 10000 + rest_length + i*rest_col_length + j);
		++i;
		if(i == rest_cols) {
			++j;
			i = 0;
		}
		//$a.html(i + " " + $a.attr('tabindex'));
	});*/
	
	
	/*
	 * 2013-02-11 by wiele: nieudolne proby zrobienia porzadku z TABem... 3h stracone :P
	$("a.lang").focus(function() {
		console.log($(this).attr('tabindex'));
	});
	
	$("#lang-dropdown-menu-button").focusin(function() {
		if( $("#lang-dropdown-menu").is(':visible') ){
			console.log('1!');
		}
		if( $("#lang-dropdown-menu").is(':visible') ){
			//$(this).attr('tabindex', 10000-1);
		}
		$("#menu-lang-" + $("#lang").val()).focus().css({'color': 'red'});
		//
			//$("#lang-dropdown-menu").focus();$("#lang-dropdown-menu").focusin();
			//$("#insert-part-insert").focus();
			
	});
	
	$("#lang-dropdown-menu-button").focus(function() {
		//if( $("#lang-dropdown-menu").is(':visible') ){
			console.log('2!');
			$a = $("#menu-lang-" + $("#lang").val());
			var t = $a.attr('tabindex');
			$a.focus();
			$a.attr('tabindex', -1);
			$a.focus();
			$a.attr('tabindex', t);
			$a.focus();
		//}
	});
	*/
	

	$("#insert-template-link").bind('click', function() {
		insertTemplateOrSample('template');
		return false;
	});
	
	$("#insert-sample-link").bind('click', function() {
		insertTemplateOrSample('sample');
		return false;
	});
	
	$("#insert-users-template-link").bind('click', function() {
		insertTemplateOrSample('userstemplate');
		return false;
	});
	
	var $input_panel = $("#ex-input");
	toggleAnimated( $input_panel );
	
	var $more_options_panel = $("#ex-more-options");
	toggleAnimated( $more_options_panel );
	
	/*$("#button-input").click(function(){
		var $input_panel = $("#ex-input");
		toggleAnimated( $input_panel );
		
		// po kliknieciu focus na input
		// ale nie na mobile, bo mobile ma za maly ekran i gdy sie ustawi focus, to ekran za bardzo "skacze" i user traci orientacje co sie dzieje
		if( ! isMobile() ){
			setTimeout(function(){
				if($input_panel.is(':visible')){
					$input_panel.find('textarea').focus();
					cookie_helper_set('cp_show_input', 1);
				} else {
					focusEditor();
					cookie_helper_set('cp_show_input', 0);
				}
			}, 300);
		}
		
		return false;
	});*/
	
	/*$("#button-more-options").click(function(){
		var $more_options_panel = $("#ex-more-options");
		toggleAnimated( $more_options_panel );
		
		// po kliknieciu focus na notatke
		// ale nie na mobile, bo mobile ma za maly ekran i gdy sie ustawi focus, to ekran za bardzo "skacze" i user traci orientacje co sie dzieje 
		if( ! isMobile() ){
			setTimeout(function(){
				if($more_options_panel.is(':visible')){
					$more_options_panel.find('textarea').focus();
					cookie_helper_set('cp_show_options', 1);
					//$("#syntax").focus();
				} else {
					focusEditor();
					cookie_helper_set('cp_show_options', 0);
				}
			}, 300);
		}
		
		if($(this).find('.more-options-less').is(':visible')) {
			$(this).find('.more-options-less').hide();
			$(this).find('.more-options-more').show();
		} else {
			$(this).find('.more-options-more').hide();
			$(this).find('.more-options-less').show();
		}
		
		return false;
	});*/
	
	/*
	function onIndexWindowResize() {
		var $file = $("#file");
		var $file_div = $("#file_div");
		var $parent = $file.parent();
		var padding = 2;
		// wysokosc przywracamy do pierwotnego stanu
		// EDIT: ale tylko szerokosc, wysokosc niech zostanie taka jaka sobie user ustawil
		$file.css({
			'width': ($parent.width() - 2*padding) + 'px'
			//'height': $parent.height() + 'px'
		});
		$file_div.css({
			'width': $parent.width() + 'px'
			//'height' : $parent.height() + 'px'
		});
		
		var $input = $("#input");
		//$parent = $input.parent();
		//console.log($parent);
		$input.css({
			'width': ($parent.width() - 2*padding) + 'px'
			//'height': $parent.height() + 'px'
		});
		// $("#file").val( $("#file").val() + 'y' );
	}
	// to jest zrobione bo:
	// 1. nie na kazdej przegladarce width:100% dla textarea dziala
	// 2. zeby przy zmianie rozmiaru okna, nawet jesli user manualnie zmieni rozmiar textarea, to zeby rozmiar wrocil do oryginalu (zarowno dla textarea jak i dla edytora)
	var doOnIndexWindowResizeTimeoutHandle = null;
	$(window).resize(function() {
		// jednak wiele to nie pomaga
		// clearTimeout(doOnIndexWindowResizeTimeoutHandle);
		// doOnIndexWindowResizeTimeoutHandle = setTimeout(function(){onIndexWindowResize();}, 100);
		
		// $("#file").val( $("#file").val() + 'x' );
		
		onIndexWindowResize();
	});
	onIndexWindowResize();
	*/
	
	// ctrl+enter (albo cmd+enter na mac os x) = submit
	$(document).keypress(function(event) {
		// 13 or 10
		// http://code.google.com/p/chromium/issues/detail?id=79407
		// http://stackoverflow.com/questions/3532313/jquery-ctrlenter-as-enter-in-text-area
		if( (event.keyCode == 13 || event.keyCode == 10) && (event.ctrlKey || event.metaKey)) {	
			$("#Submit").click();
		}
	});
	
	//////////////////
	// BEGIN OF LABELS
	//////////////////
	
	function isLabelNameValid(name) {
		// valid characters are A-Z, a-z, 0-9 and '_-#!@()[]/+'; hmm oraz spacja ;)
		return name.match(/^[ A-Za-z0-9_#!@\(\)\[\]\/\+\-]*$/);
	}
	
	function turnOnLabelError(error_type) {
		$("#new-label-control-group").addClass('error');
		$("#new-label-control-group span.help-inline").hide();
		if(error_type == 'characters') {
			$("#new-label-control-group span.invalid-characters").show();
		} else if(error_type == 'empty') {
			$("#new-label-control-group span.cannot-be-empty").show();
		}
	}
	function turnOffLabelError() {
		$("#new-label-control-group").removeClass('error');
		$("#new-label-control-group span.help-inline").hide();
	}
	
	var new_labels_counter = 0;
	$("#new-label-button").click(function(){
		var $new_label_input = $("#new-label-input");
		var name = $new_label_input.val();
		if(!name) {
			name = '';
		}
		name = name.trim().replace(/\s+/g, ' ');
		if( name != '' && isLabelNameValid(name) ){
			$("#new-label-control-group").removeClass('error');

			var label_exists = false;
			$("li.label-list-label").each(function() {
				if( $(this).find('span.label-name').text() == name ) {
					label_exists = true;
					$(this).find('input[type=checkbox]').prop('checked', true);
					$(this).find('span.label').effect('highlight', {}, 700);
				}
			});
			
			if(!label_exists) {
				var $new = $("#new-label-pattern").clone();
				$new.attr('id', '');
				$new.css('display', 'inline-block');
				$new.find('input[type=checkbox]').attr('name', 'data[labels][new][' + new_labels_counter + '][checked]');
				$new.find('input[type=hidden]').attr('name', 'data[labels][new][' + new_labels_counter + '][name]');
				$new.find('input[type=hidden]').val( name );
				$new.find('span.label > span.label-name').text( name );
				$("#new-label-li").before($new);
				$("#new-label-li").before(' ');
				$("#you-have-no-labels").hide();
				++new_labels_counter;
			}
			
			$new_label_input.focus();
		} else {
			if(name == '') {
				turnOnLabelError('empty');
			} else {
				turnOnLabelError('characters');
			}
		}
	});
	
	$("#new-label-input").focus(function() {
		$(this).select();
	});
	
	$("#new-label-input").keypress(function(event) {
		if(event.which == 13) {
			event.preventDefault();
			$("#new-label-button").click();
		}
	});
					
	// hack zeby wykryc kazda zmiane w inpucie (klawiszami, JSem, copy/paste/cut, autouzupelnianiem przegladarki, itp)
	// http://stackoverflow.com/questions/1948332/detect-all-changes-to-a-input-type-text-immediately-using-jquery
	$("#new-label-input").data('oldval', $("#new-label-input").val() );
	$("#new-label-input").bind('propertychange keyup input paste', function(){
		var $this = $(this);
		if($this.val() != $this.data('oldval')) {
			$this.data('oldval', $this.val());
			
			if( isLabelNameValid( $this.val() ) ){
				turnOffLabelError();
			} else {
				turnOnLabelError('characters');
			}
		}
	});
	
	////////////////
	// END OF LABELS
	////////////////
	
	
	// "responsive" fb widget
	$(window).bind("load resize", function(){
      var $container = $('#fb-like-box-root');
	  var container_width = $container.width();
	  var old_width = $container.attr('data-old-width');
	  if(container_width != old_width){
		var data_show_faces = (is_mobile)?"false":"true";
	    $('#fb-like-box-root').html('<div class="fb-like-box" ' + 
	    'data-href="https://www.facebook.com/ideone"' +
	    ' data-width="' + container_width + '" data-height="258" data-show-faces="' + data_show_faces + '" data-show-border="false" ' +
	    'data-stream="false" data-header="false"></div>');
	    FB.XFBML.parse( );
	    $container.attr('data-old-width', container_width);
	  }
	});
	
	
});
