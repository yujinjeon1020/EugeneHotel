<%@page import="model.BoardBean"%>
<%@page import="model.DAO"%>
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
	request.setCharacterEncoding("euc-kr");
	
	int num = Integer.parseInt(request.getParameter("num"));	//���� ���� �� ���������� �ٲ�

	String id = (String) session.getAttribute("id");
	
	if(id == null) {
		id = "GUEST";
	}
	//������ ���̽� ����
	DAO dao = new DAO();
	
	//BoardBean Ÿ������ �ϳ��� �Խñ��� ���Ϲ���
	BoardBean bean = dao.getOneBoard(num);
	
	String beanid = bean.getId();
%>

	<center>
		<form action="BoardUpdateProc.jsp" method="post">	
		<table width="50%"
			style="margin: 100px; font-family: ���ְ��; color: #3c3c3c">
			<tr height="30">
				<td align="center" width="120" style="font-style: italic;">Title</td>
				<td align="left" colspan="3">
				<input style="border: none" type="text" value="<%=bean.getTitle()%>" name="title" size="88"/></td>
			</tr>
			<tr height="30">
				<td align="center" width="120" style="font-style: italic;">ID</td>
				<td align="left" width="180"><%=bean.getId() %></td>
			</tr>
			<tr>
				<td colspan="4"><hr color="B29F93"></td>
			</tr>
			<tr height="100">
				<td align="center" width="120" style="font-style: italic;">Content</td>
				<td align="left" colspan="3">
				<textarea style="border: none; font-family: ���ְ��" name="content" cols="90" rows="30">
				<%=bean.getContent()%></textarea>				
				</td>
			</tr>
			<tr height="100">
			</tr>
				<tr height="80">
				<td align="center" colspan="4">
					<input id="button" type="submit" value="�����ϱ�"/> &nbsp;&nbsp;
					<input id="button" type="button" value="���" onclick="location.href='Index.jsp?center=BoardList.jsp'" />
					<input type="hidden" name="num" value="<%=bean.getNum() %>" />
				</td>
			</tr>
		</table>
		</form>	
	</center>
</body>
</html>