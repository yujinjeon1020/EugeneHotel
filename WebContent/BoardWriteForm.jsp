<%@page import="model.BoardBean"%>
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
<body>
<%
	String id = (String) session.getAttribute("id");

	BoardBean bean = new BoardBean();
	int num = bean.getNum();
%>
	<center>
		<form action="BoardWriteProc.jsp" method="post">
			<table style="margin: 70px; font-family: ���ְ��; color: #3c3c3c">
				<tr>
					<td colspan="2" align="center">
					<p>
					<b style="font-size: 20px">����ȣ���� ������ �ǰ��� ��ٸ��ϴ�.</b>
					<br><br>
					���� �� ���� ������ �����ֽø� ���� ���ϳ��� �亯 �帮�ڽ��ϴ�.
					<br><br>
					</td>
				</tr>	
				<tr>
					<td width="100" align="center" style="font-style: italic;">�ۼ���</td>
					<td><%=id %></td>
				</tr>
				<tr height="10">
				</tr>		
				<tr>
					<td width="100" align="center" style="font-style: italic;">Title</td>
					<td><input style="border: none" type="text" name="title" size="88"/></td>
				</tr>
				<tr height="10">
				</tr>
				<tr>
					<td width="100" align="center" style="font-style: italic;">Content</td>
					<td><textarea style="border: none" name="content" cols="90" rows="30"></textarea></td>
				</tr>
				<tr height="10">
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input id="button" type="submit" value="���" /> &nbsp;&nbsp;&nbsp;
					<input id="button" type="button" value="���" onclick="location.href='Index.jsp?center=BoardList.jsp'"/>
					<input type="hidden" name="<%=num %>" />
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>