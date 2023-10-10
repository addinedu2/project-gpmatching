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
				<div class="inputsubtitle">댓글 db넘기기</div>
				<form id="comment" action="comment" method="post">
					<table>
						<tr>
							<th>commentContent</th>
							<td><input type="text" name="commentContent" style="width: 280px" /></td>
						</tr>
						<!-- <tr>
							<th>userNo</th>
							<td><input type="text" name="userNo" style="width: 280px" /></td>
						</tr>
						<tr>
							<th>groupNo</th>
							<td><input type="text" name="groupNo" style="width: 280px" /></td>
						</tr>
						<tr>
							<th>step</th>
							<td><input type="text" name="step" style="width: 280px" /></td>
						</tr>
						<tr>
							<th>depth</th>
							<td><input type="text" name="depth" style="width: 280px" /></td>
						</tr> -->

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