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
		alert("�α��� �� �̿� ������ ���� �Դϴ�.");
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