function check(){
	if(frm.custname.value===""){
		alert("회원성명이 입력되지 않았습니다.");
		frm.custname.focus();
		return false;
	}
	if(frm.phone.value===""){
		alert("회원전화이 입력되지 않았습니다.");
		frm.phone.focus();
		return false;
	}
	if(frm.address.value===""){
		alert("주소가 입력되지 않았습니다.");
		frm.address.focus();
		return false;
	}
	if(frm.joindate.value===""){
		alert("가입일자가 입력되지 않았습니다.");
		frm.joindate.focus();
		return false;
	}
	if(frm.grade.value===""){
		alert("고객등급이 입력되지 않았습니다.");
		frm.grade.focus();
		return false;
	}
	if(frm.city.value===""){
		alert("회원성명이 입력되지 않았습니다.");
		frm.city.focus();
		return false;
	}
	alert("회원등록이 완료 되었습니다.");
	return true;
}

function search(){
	window.location ="list.jsp";
}

function modify(){
	alert("회원정보수정이 완료되었습니다.");
	frm2.submit();
}
