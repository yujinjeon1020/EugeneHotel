<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = request.getParameter("id");
	String password1 = request.getParameter("password1");
	
	//ȸ�� ���̵�� �н����尡 ��ġ�ϴ��� ��
	DAO dao = new DAO();
	
	//�ش� ȸ���� �ִ��� ���θ� ���ڷ� ǥ��
	int result = dao.getMember(id, password1);
	
	if(result == 0) {
%>
	<script>
		alert("ȸ�� ���̵� �Ǵ� �н����尡 �ùٸ��� �ʽ��ϴ�.");
		location.href='Index.jsp?center=LoginForm.jsp';
	</script>	
<%
	} else {
		//�α��� ó���� �Ǿ��ٸ�
		session.setAttribute("id", id);
		response.sendRedirect("Index.jsp");
	}
%>
</body>
</html>