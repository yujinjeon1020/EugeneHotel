<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<script>
	alert("�Խñ��� �����Ǿ����ϴ�.");
	location.href='Index.jsp?center=BoardList.jsp';
</script>
	<%
		int num = Integer.parseInt(request.getParameter("num").trim());

		//�����ͺ��̽� ��ü ����
		DAO dao = new DAO();

		dao.deleteBoard(num);
	%>
</body>
</html>