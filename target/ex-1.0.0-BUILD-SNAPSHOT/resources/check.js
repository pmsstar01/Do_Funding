/**
 * 
 */

function check(){
		//alert(1);
		if($('input[name="b_writer"]').val()==""){
			alert("이름이 누락되었습니다.");
			$('input[name="b_writer"]').focus();
			return false;
		}
		if($('input[name="b_subject"]').val()==""){
			alert("제목이 누락되었습니다.");
			$('input[name="b_subject"]').focus();
			return false;
		}

		if($('textarea[name="b_content"]').val()==""){
			alert("내용을 입력하세요.");
			$('textarea[name="b_content"]').focus();
			return false;
		}
		if($('input[name="b_passwd"]').val()==""){
			alert("비밀번호를 입력하세요.");
			$('input[name="b_passwd"]').focus();
			return false;
		}	
	}//check

