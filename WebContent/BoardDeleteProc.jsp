<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<script>
	alert("게시글이 삭제되었습니다.");
	location.href='Index.jsp?center=BoardList.jsp';
</script>
	<%
		int num = Integer.parseInt(request.getParameter("num").trim());

		//데이터베이스 객체 생성
		DAO dao = new DAO();

		dao.deleteBoard(num);
	%>
</body>
</html>