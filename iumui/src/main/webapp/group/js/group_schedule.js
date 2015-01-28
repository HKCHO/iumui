/**
 *  나의 그룹 달력화면에 들어갈 달력 화면 스크립트 
 */

/** 화면출력 start */
$(function(){
	$('.header').load('/iumui/common/header.html');
	$('.footer').load('/iumui/common/footer.html');
	
	$('#sidebar_table1_content').load('sidebar/mygroup_menu.html');

	loadMyGroups4ThisPage(1);
	
});
/** 화면출력 end */

function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}

function loadMyGroups4ThisPage(pageNo) {
	$('#sidebar_contents2 a').attr('href','group_list.html').html("나의 모임");
	
	$.getJSON('../group/mygroups.do?pageNo=' + pageNo,
			function(data) {
		var myGroups = data.groups
		
		if((data.status) == "success"){

			if(myGroups.length > 0){
					for (var i in myGroups){
						$('#sidebar_table2_content').append("<tr><td id='groupNo"+ i +"' class=\"sidebar_title\"><a style=\"color:"+ data.groups[i].formColor +"\" href=\"group_board.html?gno="+ gno+"\">"+ data.groups[i].gname+"</td></tr>");
					}
					console.log("사이드바 2번 테이블 데이터 : " + $('#sidebar_table2_content').find('tr').length);

					var mgtRow = $('#sidebar_table2_content').find('tr').length;

					if(mgtRow < 6) {

						for ( var i=0; i < ( 6 - mgtRow ); i++ ) {
							$('#sidebar_table2_content').append("<tr><td class=\"sidebar_title\"></td></tr>");
						}

					}
			} else {
				$('#sidebar_table2_content').append("다른 그룹이 없습니다");
			}
		}	
	});	
}

