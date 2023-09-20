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
				<div class="inputsubtitle">게시글 db넘기기</div>
				<form id="write" action="write" method="post">
					<table>
						<tr>
							<th>commonTitle</th>
							<td><input type="text" name="commonTitle" style="width: 280px" /></td>
						</tr>
						<tr>
							<th>userNo</th>
							<td><input type="text" name="userNo" style="width: 280px" /></td>
						</tr>
						<tr>
							<th>commonContent</th>
							<td><input type="text" name="commonContent" style="width: 280px" /></td>
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