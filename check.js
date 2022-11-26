function change1(){ //회원명 누르면 회원번호 띄우는 거
	frm.tution.value=""; // 회원별 할인율 적용을 위해 수강료 초기화
	frm.c_no.value = frm.c_name.value; //회원번호 넣어주기
}

function change2(){ //회원번호가 20000이상이면 수강료 50%할인 후 자동계산
	var price = frm.class_name.value*1000; //수강료
	if(frm.c_no.value>=20000) price*=0.5; //회원번호 20000이상이면 50%할인
	frm.tution.value=price; //수강료 넣어주기
}

function check(){
	if(frm.regist_month.value===""){
		alert("수강월이 입력되지 않았습니다.");
		frm.regist_month.focus();
		return false;
	}
	else if(frm.c_name.value===""){
		alert("회원명이 입력되지 않았습니다.");
		frm.c_name.focus();
		return false;
	}
	else if(frm.class_area.value===""){
		alert("강의장소가 입력되지 않았습니다.");
		frm.class_area.focus();
		return false;
	}
	else if(frm.class_name.value===""){
		alert("강의명이 입력되지 않았습니다.");
		frm.class_name.focus();
		return false;
	}
	
	alert("수강신청이 정상적으로 완료되었습니다!");
	frm.submit();
	return true;
}

function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	frm.reset();
}
