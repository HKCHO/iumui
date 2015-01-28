/**
 * 나의 그룹 화면에 들어갈 스크립트 
 */

/** 화면출력 start */
$(function(){
	$('.header').load('/iumui/common/header.html');
	$('.footer').load('/iumui/common/footer.html');
	$('.sidebar').load('/iumui/common/sidebar.html');
	
	loadMyGroups(1);
	
	loadMySchedule();
	
	console.log("loadMySchedule() 로딩 완료");  
	
});
/** 화면출력 end */

/** 가까운 일정 start*/
function loadMySchedule() {
	$.getJSON('../group/myschedules.do?dataSize=6' , 
			function(data){

		/** 확인용 로그*/
		console.log("나의 스케쥴 로딩" + data.status);
		/** 확인용 로그*/

		for (var i in data.schedules) {
			data.schedules[i].startday = yyyyMMdd(data.schedules[i].startday);
			data.schedules[i].endday = yyyyMMdd(data.schedules[i].endday);
		}
		
		
		/** 가까운 일정 출력*/
		var groupSchedules = data.schedules

		console.log(groupSchedules)
		
		$('#testschedule').html(groupSchedules);
	});
};

/** 가까운 일정 end */

/** 내가 가입한 모임 start*/
function loadMyGroups(pageNo) {
	
	$.getJSON('../group/mygroups.do?pageNo='+ pageNo, 
			function(data){

		/** 확인용 로그*/
		console.log("나의 모임 페이지 로드 : " + data.status);
		console.log(data.groups)
		/** 확인용 로그*/

		var myGroups = data.groups
		var today = new Date();
		var Dday = [];
		
		if((data.status) == "success"){
			if(myGroups.length > 0){
				
				for (var i in myGroups) {
					Dday[i] = myGroups[i].expireDay - today;
					Dday[i] = Math.floor(Dday[i] / (1000 * 60 * 60 * 24)) * -1;
					myGroups[i].expireDay = [yyyyMMdd(myGroups[i].expireDay) , "D"+ Dday[i]];
				}
				
				console.log(Dday);
				console.log(data.groups)
				require(['text!group_list/mygroup_table.html'], function(html){
					var template = Handlebars.compile(html);
					$('#my_group_list').append(template(data));
					
					$(".my_groups th").append("<span class=\"setting-btn\"></span>");
					
					$(".setting-btn").load("set_div.html");
					console.log("설정박스 생성 완료");
					
					});
				
			} else {
				$('#my_group_list').append("가입한 그룹이 없습니다");
				
			}
		}
	});
	
};
/** 내가 가입한 모임 start*/

/** 날짜 데이터 전환 start */
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
/** 날짜 데이터 전환 end */
