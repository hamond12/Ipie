function check(){
	if(frm.artist_id.value === ""){
		alert("참가번호가 입력되지 않았습니다.");
		artist_id.focus();
		return false;
	}
	else if(frm.artist_name.value === ""){
		alert("참가자명이 입력되지 않았습니다.");
		artist_name.focus();
		return false;
	}
	else if(frm.date1.value === "" || frm.date2.value === "" || frm.date3.value === ""){
		alert("생년월일이 입력되지 않았습니다.");
		date1.focus();
		return false;
	}
	else if(frm.gender.value === ""){
		alert("성별이 입력되지 않았습니다.");
		gender.focus();
		return false;
	}
	else if(frm.talent.value === ""){
		alert("특기가 입력되지 않았습니다.");
		talent.focus();
		return false;
	}
	else if(frm.agency.value === ""){
		alert("소속사가 입력되지 않았습니다.");
		agency.focus();
		return false;
	}
	
	alert("참가신청이 정상적으로 등록되었습니다.");
	frm.submit();
	return true;
}

function res(){
	alert("정보를 지우고 다시 입력합니다.");
	frm.reset();
}