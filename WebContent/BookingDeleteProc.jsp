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
	
	//데이터베이스 연결
	DAO dao = new DAO();
	
	//예약을 삭제하는 메소드 호출
	dao.deleteBooking(bookingNo);
	
%>
	<script>
		alert("예약이 취소되었습니다.");
		location.href='Index.jsp';
	</script>
</body>
</html>