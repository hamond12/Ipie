function check(){
	if(frm.Resvno.value===""){
		alert("예약번호가 입력되지 않았습니다!");
		Resvno.focus();
		return false;	
	}
	if(frm.Empno.value===""){
		alert("사원번호가 입력되지 않았습니다!");
		Empno.focus();
		return false;	
	}
	if(frm.Resvdate.value===""){
		alert("근무일자가 입력되지 않았습니다!");
		Resvdate.focus();
		return false;	
	}
	if(frm.Seatno.value===""){
		alert("좌석번호가 입력되지 않았습니다!");
		Seatno.focus();
		return false;	
	}
	alert("참가신청이 정상적으로 등록되었습니다!");
	frm.submit();
	return true;
}

function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	frm.reset();
}