<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%
	if(session != null) {
		session.invalidate();
%>
	<script>
		alert("���������� �α׾ƿ� �Ǿ����ϴ�. �̿����ּż� �����մϴ�.");
		location.href="Index.jsp";
	</script>
<%
	}
%>
</body>
</html>