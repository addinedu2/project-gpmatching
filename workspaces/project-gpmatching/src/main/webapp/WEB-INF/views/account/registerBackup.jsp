<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
		//비밀번호, 비밀번호 확인 일치
		var passwordField = document.getElementById('userPwd');
		var passwordConfirmField = document.getElementById('confirmPassword');
		var registerButton = document.getElementById('registerComplete');
		
		function checkPassword(){
		   var userPwd = passwordField.value;
		   var confirmPassword = passwordConfirmField.value;
		   var passwordCheck = document.getElementById('passwordCheck')
		   
		/* var passwordOption = document.getElementById('passwordOption')
		   var SpecialChar = ["!","@","#","$","%"];
		   var checkSpecialChar = 0;
		   
		   if(password.length < 6 || password.length>16) {
		      passwordOption.innerHTML = '비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.';
		      passwordOption.style.color = 'red';          
		   }
		   
		   for(var i=0; i<SpecialChar.length; i++){
		      if(password.indexOf(SpecialChar[i]) != -1){
		         checkSpecialChar = 1;            
		      }          
		   }
		   if(checkSpecialChar == 0){
		      passwordOption.innerHTML = '!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.'  
		   }  */
		 
		   /* $('#register').on('click', function(event){
		    event.preventDefault();
		   
		    if (password != passwordConfirm){
		       alert("비밀번호가 일치하지 않습니다");
		       $('#password').focus();
		       return
		    }
		   }); */
		   
		   if(userPwd !== '' && confirmPassword !== ''){
		      if(userPwd === confirmPassword){
		    	 passwordCheck.innerHTML = '비밀번호가 일치합니다.'
		    	 passwordCheck.style.color = 'green';
		         //return true;
		         registerButton.disabled = false;
		      } else {
		    	 passwordCheck.innerHTML = '비밀번호가 일치하지 않습니다.';
		    	 passwordCheck.style.color = 'red';
		         //return false;
		         registerButton.disabled = true;
		        }
		   }
		}
</script>
</body>
</html>