/**
 * 그룹 게시판에 들어갈 JS
 */

$(function(){
	$('.header').load('/iumui/common/header.html');
	$('.footer').load('/iumui/common/footer.html');
	$('.side_bar').load('../common/sidebar.html');
	$('.gboard_reply').load('/iumui/group/group_board_reply.html');
});

$("#show_reply").click(function(){
	if ($('#reply').css('display') == 'none'){
		$('#reply').css('display','');
	} else {
		$('#reply').css('display','none');
	}
});
