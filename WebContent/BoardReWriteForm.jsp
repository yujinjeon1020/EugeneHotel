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

	//�Խñ� �б⿡�� �亯 �۾��⸦ Ŭ���ϸ� �Ѱ��ִ� �Ķ���͵��� �޾���
	int num = Integer.parseInt(request.getParameter("num"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));	
%>
	<center>
		<form action="BoardReWriteProc.jsp" method="post">
			<table style="margin: 70px; font-family: ���ְ��; color: #3c3c3c">
				<tr>
					<td width="100" align="center" style="font-style: italic;">�ۼ���</td>
					<td><%=id %></td>
				</tr>
				<tr height="10">
				</tr>		
				<tr>
					<td width="100" align="center" style="font-style: italic;">Title</td>
					<td><input style="border: none" type="text" name="title" size="88"
						value="[�亯] ���� �ȳ��ϼ���. ����ȣ�� ������ �Դϴ�."/></td>
				</tr>
				<tr height="10">
				</tr>
				<tr>
					<td width="100" align="center" style="font-style: italic;">Content</td>
					<td><textarea style="border: none; font-family: ���ְ��" name="content" cols="90" rows="30"></textarea></td>
				</tr>
				<tr height="10">
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="hidden" name="<%=bean.getNum() %>" />
					<input type="hidden" name="ref" value="<%=ref%>"/>
					<input type="hidden" name="re_step" value="<%=re_step%>"/>
					<input type="hidden" name="re_level" value="<%=re_level%>"/>
					<input id="button" type="submit" value="���" /> &nbsp;&nbsp;&nbsp;
					<input id="button" type="button" value="���" onclick="location.href='Index.jsp?center=BoardList.jsp'"/>
					
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>