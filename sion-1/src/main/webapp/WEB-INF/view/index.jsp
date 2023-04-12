<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>下水道処理システム</title>
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<style type="text/css">
.auto-style1 {
	width: 146px;
	white-space: nowrap;
}

.auto-style3 {
	width: 366px;
	margin-left: 196px;
	height: 136px;
}

.auto-style6 {
	margin-left: 4px;
	margin-top: 4px;
}

.auto-style7 {
	width: 294px;
}

.auto-style9 {
	width: 236px;
	height: 71px;
}

.auto-style10 {
	width: 72px;
}

.auto-style11 {
	height: 18px;
}

.auto-style12 {
	width: 98px;
}

.auto-style13 {
	margin-left: 140px;
}
</style>
</head>
<body>
<div style="height: 621px">
		<div style="height: 150px">

			<div
				style="height: 33px; width: 231px; margin-left: 47px; margin-top: 58px">

				下水道処理システム
				<hr />

			</div>

		</div>
		<div style="height: 436px">
		<form action="/login" method="post" id="login">
			<table cellpadding="1" cellspacing="0"
				style="border-collapse: collapse;" class="auto-style9">
				<tr>
					<td class="auto-style7">
						<table cellpadding="0" class="auto-style3">
							<tr>
								<td align="center" colspan="2" class="auto-style11">ログイン</td>
							</tr>
							<tr>
								<td align="right" class="auto-style10">USER :&nbsp;</td>
								<td class="auto-style1">
								<input Width="101px" Height="19px"
									ID="userId" name="userId" value="${userId }"></input>
							</tr>
							<tr>
								<td align="right" class="auto-style12">PW :</td>
								<td class="auto-style1">
								<input ID="userPw" type="Password" name="userPw" Width="101px" value="${userPw }"></input>
									  
									  <input type="submit" onclick="login" value="ログイン">
									  <script type="text/javascript">
									
									  </script>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									  <span id="valid" style="color: red;">${valid_userId}</span> <br/>
									 <span id="valid" style="color: red;">${valid_userPw}</span> 
									<span id="valid" style="color: red;">${loginFail}</span> 
								</td>
							</tr>
							
							
						</table>

					</td>
				</tr>
			</table>
</form>

		</div>
	</div>
</body>
</html>