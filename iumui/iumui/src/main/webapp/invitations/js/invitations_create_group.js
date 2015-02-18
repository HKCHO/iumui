/**
 * 모임만들기 폼
 */

var board;
var category_number;

$(function(){
	$('.header').load('/iumui/common/header.html');
	$('.footer').load('/iumui/common/footer.html');
	
	var address = unescape(location.href);
	var param = "";
	if(address.indexOf("no", 0) != -1) {
		param = address.substring(address.indexOf("no", 0) + 3);
	} else {
		param = "1";
	}
	//console.log("no = " + param);
	category_number = param;
	
	loadLocalList();
});

function loadLocalList() {
  $.getJSON('../board/local_big.do', 
    function(data){
  	
  		//console.log(data);
  	
	  	require(['text!templates/local-big.html'], function(html){
	      var template = Handlebars.compile(html);
	      $('#grp_state').html( template(data) );
	    });
    });
}

$('#grp_state').change(function(){
	console.log($(this).val());
	$.getJSON('../board/local_small.do?no=' + $(this).val(), 
			function(data){
		require(['text!templates/local-small.html'], function(html){
			var template = Handlebars.compile(html);
			$('#selectLocal').html( template(data) );
		});
	});
});

$('#radioC').click(function(event){
  $('#category_picker').css('display', 'none');
});

$('#radioP').click(function(event){
  $('#category_picker').css('display', '');
});

$('#btnCancel').click(function(){
	location.href = "invitations.html?no=" + category_number;
	board = null;
});

$('#btnAdd').click(function(){
  if (!validateForm()) return;
  $.post('../board/add.do'
      , { 
			  	categoryNo : category_number,
			  	title : $('#title').val(),
			  	content : $('#content').val(),
			  	targetNumber : $('#targetNumber').val(),
			  	startDate : $('#startDate').val(),
			  	endDate : $('#endDate').val(),
			  	
			  	selectLocal : $('#selectLocal').val()
      } 
      , function(result){
        if (result.status == "success") {
          $('#btnCancel').click();
        } else {
          alert("등록 실패!");
        }
      } 
      , 'json')
   .fail(function(jqXHR, textStatus, errorThrown){ 
     alert(textStatus + ":" + errorThrown);
   });
  
});

function checkOpenStatus() {
	if ($('#radioP').attr('checked') == 'checked') {
		return 1;
	} else return 2;
}

function validateForm() {
  if ( $('#title').val().length == 0) {
    alert('모임명은 필수 입력 항목입니다.');
    return false;
  }
  
  if ( $('#targetNumber').val().length == 0) {
    alert('참여 최소 인원을 적어주세요.');
    return false;
  }
  
  if ( $('#content').val().length == 0) {
    alert('모임 소개를 부탁드립니다.');
    return false;
  }
  
  if ( $('#startDate').val().length == 0) {
    alert('모집일자를 선택하세요.');
    return false;
  }
  
  if ( $('#endDate').val().length == 0) {
    alert('종료일자를 선택하세요.');
    return false;
  }
  
  if ( $('#selectLocal').val().length == 0) {
    alert('관심지역을 선택하세요.');
    return false;
  }
  return true;
}

function yyyyMMdd(date) {
  if (date) {
    var date = new Date(date);
    var str = date.getFullYear() + '-';
    
    if (date.getMonth() < 9) str += '0';
    str += (date.getMonth() + 1) + '-';
    
    if (date.getDate() < 10) str += '0';
    str += date.getDate();
    
    return str;
    
  } else {
    return '';
  }
}
