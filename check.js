function check(){
	if(frm.id.value===""){
		alert("과목 코드가 입력되지 않았습니다.");
		frm.id.foucs();
		return false;
	}
	else if(frm.name.value===""){
		alert("과목명이 입력되지 않았습니다.");
		frm.name.foucs();
		return false;
	}
	else if(frm.credit.value===""){
		alert("학점이 입력되지 않았습니다.");
		frm.credit.foucs();
		return false;
	}
	else if(frm.lecturer.value===""){
		alert("담당강사가 입력되지 않았습니다.");
		frm.lecturer.foucs();
		return false;
	}
	else if(frm.week.value===""){
		alert("요일이 입력되지 않았습니다.");
		frm.week.foucs();
		return false;
	}
	else if(frm.start_hour.value===""){
		alert("시작시간이 입력되지 않았습니다.");
		frm.start_hour.foucs();
		return false;
	}
	else if(frm.end_hour.value===""){
		alert("종료시간이 입력되지 않았습니다.");
		frm.end_horu.foucs();
		return false;
	}
	
	alert("교과목 등록이 완료되었습니다.");
	frm.submit();
	return true;
}

function search(){
	window.location="list.jsp";
}

function modify(){
	alert("교과목 수정이 완료되었습니다.");
	frm2.submit();
}

function reset(){
	alert("교과목 수정이 취소되었습니다.");
	frm2.reset();
}