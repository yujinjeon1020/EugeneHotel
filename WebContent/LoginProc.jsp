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
	
	//회원 아이디와 패스워드가 일치하는지 비교
	DAO dao = new DAO();
	
	//해당 회원이 있는지 여부를 숫자로 표현
	int result = dao.getMember(id, password1);
	
	if(result == 0) {
%>
	<script>
		alert("회원 아이디 또는 패스워드가 올바르지 않습니다.");
		location.href='Index.jsp?center=LoginForm.jsp';
	</script>	
<%
	} else {
		//로그인 처리가 되었다면
		session.setAttribute("id", id);
		response.sendRedirect("Index.jsp");
	}
%>
</body>
</html>