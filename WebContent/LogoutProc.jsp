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
		alert("정상적으로 로그아웃 되었습니다. 이용해주셔서 감사합니다.");
		location.href="Index.jsp";
	</script>
<%
	}
%>
</body>
</html>