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
		font-family: ���ְ��; 
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
<br><br><br><br>
	<form action="LoginProc.jsp" method="post">
	<table style="font-family: ���ְ��">
		<tr height="50">
			<td colspan="2" align="center">
			<p style="text-align: center; color:#3c3c3c; font-size:40px; font-style:italic" >
			Membership Login
			</td>
		</tr>
		<tr>
			<td align="center" style="color:#3c3c3c; font-size: 18px;" height="50">���̵�</td>
			<td align="center"><input id="input" type="text" name="id" size="30" placeholder="���̵�� ��ҹ��ڸ� �����մϴ�."/></td>
		</tr>
		<tr>
			<td align="center" style="color:#3c3c3c; font-size: 18px;" height="50">��й�ȣ</td>
			<td align="center"><input id="input" type="password" name="password1" size="30"/></td>
	
		</tr>
		<tr height="50">
			<td colspan="2" align="center">
			<input id="button" type="submit" value="�α���" />
			</td>
		</tr>
		<tr height="50">
			<td colspan="2" align="center">			
			<input onclick="location.href='Index.jsp?center=JoinForm.jsp'" id="button" type="button" value="ȸ������" />
			</td>
		</tr>
	</table>
	</form>
<br><br><br><br><br><br>
</center>
</body>
</html>