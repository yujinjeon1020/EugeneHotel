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
		<form action="JoinProc.jsp" method="post">
		<br><br><br><br>
		<table> 
			<tr height="50">
			<td align="right"><font size="4" style="font-family: ���ְ��; color: #323232">���̵�<font color=red>*</font>&nbsp;&nbsp;</font></td> 
			<td align="center"><input id="input" type="text" name="id" size="30" placeholder="���̵� �Է����ּ���."/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: ���ְ��; color: #323232">��й�ȣ<font color=red>*</font>&nbsp;&nbsp;</font></td>
			<td align="center"><input id="input" type="password" name="password1" size="30" placeholder="��й�ȣ�� �Է����ּ���."/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: ���ְ��; color: #323232">��й�ȣ Ȯ��<font color=red>*</font>&nbsp;&nbsp;</font></td>
			<td align="center"><input id="input" type="password" name="password2" size="30" placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���."/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: ���ְ��; color: #323232">�̸�<font color=red>*</font>&nbsp;&nbsp;</font></td> 
			<td align="center"><input id="input" type="text" name="name" size="30" placeholder="�̸��� �Է����ּ���."/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: ���ְ��; color: #323232">�޴���ȭ<font color=red>*</font>&nbsp;&nbsp;</font></td>
			<td align="center"><input id="input" type="tel" name="phone" size="30" placeholder="010-1234-5678"/></td>
			</tr>
			<tr height="50">
			<td align="right"><font size="4" style="font-family: ���ְ��; color: #323232">�̸���<font color=red>*</font>&nbsp;&nbsp;</font></td>
			<td align="center"><input id="input" type="email" name="email" size="30" placeholder="abcdef@abc.def"/></td>
			</tr>
			<tr>
			<td align="right" colspan="2">
			<input id="button" type="submit" value="ȸ������"/></td>
			</tr>			
		</table>
		<br><br><br><br><br><br>
		</form>	
	</center>
</body>
</html>