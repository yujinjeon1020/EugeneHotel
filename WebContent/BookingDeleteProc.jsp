<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");

	String id = (String) session.getAttribute("id");
	
	int bookingNo = Integer.parseInt(request.getParameter("bookingNo").trim());
	
	//�����ͺ��̽� ����
	DAO dao = new DAO();
	
	//������ �����ϴ� �޼ҵ� ȣ��
	dao.deleteBooking(bookingNo);
	
%>
	<script>
		alert("������ ��ҵǾ����ϴ�.");
		location.href='Index.jsp';
	</script>
</body>
</html>