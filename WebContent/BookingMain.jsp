<%@page import="model.BookingBean"%>
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
</style>
</head>
<body style="font-family: ���ְ��; color: #3c3c3c" >
<%
	String id = (String) session.getAttribute("id");

	if(id == null) {
%>
	<script>
		alert("�α��� �� �̿� ������ ���� �Դϴ�.");
		location.href='Index.jsp?center=LoginForm.jsp';
	</script>
<%
	} else if(id != null) {
%>
		<center>
		<form action="Index.jsp?center=BookingSecond.jsp" method="post">
			<table width="60%" style="margin: 150px" >
				<tr>
					<td align="center">
					<p>
					<b style="font-size: 30px">���� ����</b> <br> <br>
					</td>
				</tr>
				<tr>
					<td align="center">
					<p style="font-size: 20px"><b>1. ������ ���Ͻô� ��¥�� ���� �Ⱓ�� �������ּ���.</b>
					</td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td align="center">
					üũ�� : <input style="font-family: ���ְ��; color: #3c3c3c" type="date" name="day" />
					</td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td align="center">
					���� �Ⱓ : <select name="duration">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select> �� <br>
					<p style="font-size: 14px">(ȣ�� ������ ���� �Ⱓ�� �ִ� 10�� ���� �����ϸ�, <br>11�� �̻� ������ ���Ͻô� ������ �����ͷ� ���� ��Ź�帳�ϴ�.)</p>
					</td>
				</tr>
				
				<tr>
					<td align="center">
					<input id="button" type="submit" value="����"/>
					<input type="hidden" name="id" value="<%=id %>"/></td>
				</tr>
			
			</table>
		</form>
	</center>
<%
	}
%>

</body>
</html>