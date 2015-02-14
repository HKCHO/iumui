	/**
 * Header JS
 * 
 * /iumui/common/js/header.js
 * 헤더 자바스크립트 소스
 * 2015.2월 - 권영근, 김광철, 조현권
 */
//var logintester;
  // 쿠키 가져오기
$(function(){
  
  if((document.cookie) != null && (document.cookie) != ""){
    var cookieId = (document.cookie).split('"');

    $("#inputId").val(cookieId[1]);          // email textbox에 쿠키값 출력

    $("#save").attr("checked", true);    // 체크박스에 체크

      }else{
        var cookieId = document.cookie;
        $("#inputId").val(""); 
        $("#save").attr("checked", false);    // 체크박스에 체크
        
      }
  
  
});
  

	$('#my_loginBox').css('display', 'none');
	$('#msg1').css('display', 'none'); 

	
	$('#loginSubmit').click(function(event){
	  /*** 로그인버튼 클릭시 호출되는 함수부분, 쿠키값 저장, 삭제부분 ***/
	  if($('#save').is(':checked') == false){
	    $("#save").attr("checked", false)
	  }


	  

	  
    $.post('../json/auth/login.do'
        , {
          email : $('#inputId').val(),
          pwd : $('#inputPwd').val(),
          save : $('#save').is(':checked')
        }
        , function(data){
          if (data.status == 'success') {
            console.log("로그인 성공");
            
          	location.href = '../main/main.html';
          		
          } else {
            alert('로그인 아이디 또는 암호가 맞지 않습니다.');
            $('#inputPwd').val('');
          }
        }
        , 'json');
  });//로그인 버튼
	
	$('#logoutSubmit').click(function(event){
	  $.getJSON('../json/auth/logout.do', function(data){
	  	$('#login').css('display', '');
			$('#my_loginBox').css('display', 'none');
			
			location.href = "/iumui";
	  });
	});//로그아웃 버튼
	
	$.getJSON('../json/auth/loginUser.do', function(data){
		console.log("로그인 성공여부 : " + data.status);
		if (data.status == 'fail') {
			$('#login').css('display', '');
			$('#my_loginBox').css('display', 'none');
			
		} else {
			$('#login').css('display', 'none');
			$('#my_loginBox').css('display', '');
			console.log("로그인 유저 사진 경로 : " + data.photo);
			console.log("사진 파일 : " + data.loginUser.userPhoto);
			if (data.loginUser.userPhoto) {
	      $('#myphoto').attr('src', '/iumui/fileupload/' + data.loginUser.userPhoto);
	  }
			//console.log("로그인 유저 이름 (logintester): " + data.loginUser.userName);
			
		  $('.myName').html(data.loginUser.userName + " 님.");

			$.getJSON('../json/board/message_count.do', 
			    function(result){
				//console.log(result);
				$('.informCount').html('&nbsp; ' + result.messageCount);
			});
			
			$.getJSON('../json/board/message.do', 
			    function(mes){
			
				console.log(mes);
				
				
				$('#msg1').append($('<p>').html("<b>&raquo;게시판 바로 가기<b>"));
				
				for (var i in mes.messages) {
					
					$('#msg1').append($('<br>'))
											.append($('<p>').html("<a href='../invitations/invitations_detail.html?no=" 
													+ mes.messages[i].boardNo + "' class='alarm-title' data-no='" 
													+ mes.messages[i].boardNo + "'>" + (parseInt(i)+1) + ". " 
													+ mes.messages[i].message + "</a>"));
					/*
					if ( mes.messages[i].state == 3) {
						$('#msg1').append("<button type='button' " +
								"class='btn btn-default btn-xs btnRAccept' reqDel='bno=" + 
								mes.messages[i].boardNo + "&mno=" + mes.messages[i].memberNo +  
								">확인</button>");
						
					}
					*/
				}
			});
		}
	});//로그인 성공여부 검사
	
	$('.link_inform').click(function(){
		$('#msg1').css('display', ''); 
	});

	$('#btnMsgClose').click(function(event) {
	  $('#msg1').css('display', 'none'); 
	});
	
function authValidate(){
	$.getJSON('../json/auth/loginUser.do', function(data){
		if(data.status = "fail") {
			console.log("로그인 후 이용해 주세요!");
			location.href="/iumui";
		}
	});
}




