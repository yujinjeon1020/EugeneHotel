<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	#button {
		border: none; 
		background-image: url(img/button.jpg);
		font-size: 17px; 
		font-family: 제주고딕; 
		color:#3c3c3c; 
		height: 30px"
	}
	#button:hover {
		text-decoration: underline;
	}
	#input {
		border: none;
	}
</style>
</head>
<body>
	<center>
		<form action="JoinProc.jsp" method="post">
		<br><br><br><br>
		<table> 
			<tr height="50">
			<td align="right"><font size="4" style="font-family: 제주고딕; color: #323232">아이디<font color=red>*</font>&nbsp;&nbsp;</font></td> 
			<td align="center"><input id="input" type="text" name="id" size="30" placeholder="아이디를 입력해주세요."/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: 제주고딕; color: #323232">비밀번호<font color=red>*</font>&nbsp;&nbsp;</font></td>
			<td align="center"><input id="input" type="password" name="password1" size="30" placeholder="비밀번호를 입력해주세요."/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: 제주고딕; color: #323232">비밀번호 확인<font color=red>*</font>&nbsp;&nbsp;</font></td>
			<td align="center"><input id="input" type="password" name="password2" size="30" placeholder="비밀번호를 한번 더 입력해주세요."/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: 제주고딕; color: #323232">이름<font color=red>*</font>&nbsp;&nbsp;</font></td> 
			<td align="center"><input id="input" type="text" name="name" size="30" placeholder="이름을 입력해주세요."/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: 제주고딕; color: #323232">휴대전화<font color=red>*</font>&nbsp;&nbsp;</font></td>
			<td align="center"><input id="input" type="tel" name="phone" size="30" placeholder="010-1234-5678"/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: 제주고딕; color: #323232">이메일<font color=red>*</font>&nbsp;&nbsp;</font></td>
			<td align="center"><input id="input" type="email" name="email" size="30" placeholder="abcdef@abc.def"/></td>
			</tr>
			<tr>
			<td align="right" colspan="2">
			<input id="button" type="submit" value="회원가입"/></td>
			</tr>			
		</table>
		<br><br><br><br><br><br>
		</form>	
	</center>
</body>
</html>