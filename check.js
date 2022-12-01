function check(){
	if(frm.v_jumin.value===""){
		alert("주민번호가 입력되지 않았습니다!");
		v_jumin.focus();
		return false;	
	}
	if(frm.v_name.value===""){
		alert("성명이 입력되지 않았습니다!");
		v_name.focus();
		return false;	
	}
	if(frm.m_no.value===""){
		alert("후보번호가 선택되지 않았습니다!");
		m_no.focus();
		return false;	
	}
	if(frm.v_time.value===""){
		alert("투표시간가 입력되지 않았습니다!");
		v_time.focus();
		return false;	
	}
	if(frm.v_area.value===""){
		alert("투표장소가 입력되지 않았습니다!");
		v_area.focus();
		return false;	
	}
	if(frm.v_confirm.value===""){
		alert("유권자확인가 선택되지 않았습니다!");
		v_confirm.focus();
		return false;	
	}
	alert("투표하기 정보가 정상적으로 등록 되었습니다!");
	frm.submit();
	return true;
}

function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	frm.reset();
}