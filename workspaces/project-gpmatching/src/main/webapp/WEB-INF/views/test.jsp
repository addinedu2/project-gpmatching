<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Register</title>
<link rel='Stylesheet' href='/spring-demoweb/resources/styles/default.css' />
<link rel='Stylesheet' href='/spring-demoweb/resources/styles/input.css' />
</head>
<body>

	<div id='pageContainer'>

		


		<div id="inputcontent">
			<br />
			<br />
			<div id="inputmain">
				<div class="inputsubtitle">회원기본정보</div>
				<form id="registerform" action="apply" method="post">
					<table>
						<tr>
							<th>아이디(ID)</th>
							<td><input type="text" name="mCommentContent" style="width: 280px" /></td>
						</tr>

					</table>
					<div class="buttons">
						<input id="register" type="submit" value="등록" style="height: 25px" />
						<input id="cancel" type="button" value="취소" style="height: 25px" />

					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>