<%@page import="model.DAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>

<%
	request.setCharacterEncoding("EUC-KR");	//�ѱ� ó��
%>
	<!-- useBean�� �̿��Ͽ� �Ѳ����� �����͸� �޾ƿ� -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />	<!-- �� Ŭ���� set -->
	</jsp:useBean>
<%
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	String id = request.getParameter("id");
	
	DAO dao = new DAO();
	
	int result = dao.checkId(id);
	
	if(password1.equals(password2) && result == 0) {
		dao.memberJoin(mbean);
		
		//ȸ�� ������ �Ǿ��ٸ� ��µ� ������
		response.sendRedirect("JoinSuccess.jsp");
	} else { 	//��й�ȣ Ȯ���� ��ġ���� �ʴ´ٸ�
		response.sendRedirect("JoinFail.jsp");	
	}		
%>
</body>
</html>