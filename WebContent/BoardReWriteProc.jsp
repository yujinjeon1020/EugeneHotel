<%@page import="model.BoardBean"%>
<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = (String) session.getAttribute("id");
	
	BoardBean bean = new BoardBean();
	
	bean.setId(id);
%>

	<!-- �����͸� �ѹ��� �޾� ���� �� Ŭ������ ���  -->
	<jsp:useBean id="boardbean" class="model.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>
	
<% 
	//�����ͺ��̽� ��ü ����
	DAO dao = new DAO();
	dao.reWriteBoard(boardbean, id); 
	
	//�亯 �����͸� ��� ���� �� ��ü �Խñ� ���⸦ ����
	response.sendRedirect("Index.jsp?center=BoardList.jsp");
%>

</body>
</html>