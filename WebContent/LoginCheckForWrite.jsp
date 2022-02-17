<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String id = (String) session.getAttribute("id");

	if(id == null) {
%>
	<script>
		alert("로그인 후 이용 가능한 서비스 입니다.");
		location.href="Index.jsp?center=LoginForm.jsp";
	</script>
<%
	} else {
		response.sendRedirect("Index.jsp?center=BoardWriteForm.jsp");
	}
%>
</head>
<body>

</body>
</html>