<%@page import="model.BookingBean"%>
<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<script>
		alert("예약이 완료되었습니다.");
		location.href='Index.jsp?center=BookingConfirm.jsp';
	</script>

<%-- 데이터를 저장할 빈클래스 호출하여 예약 데이터 전체를 빈 클래스에 넣기(setter) --%>
<jsp:useBean id="bbean" class="model.BookingBean">
	<jsp:setProperty name="bbean" property="*"/>
</jsp:useBean>

	<%
		request.setCharacterEncoding("euc-kr");
		
		//예약 정보 파라미터 가져와 빈 클래스에 저장
		String id = (String) session.getAttribute("id");
		
		String roomtype = request.getParameter("roomtype");
		
		int roomrate = Integer.parseInt(request.getParameter("roomrate"));
		
		int people = Integer.parseInt(request.getParameter("people"));
		
		String day = request.getParameter("day");
		
		int duration = Integer.parseInt(request.getParameter("duration"));

		int price = Integer.parseInt(request.getParameter("price"));
		
		//데이터베이스 연결
		DAO dao = new DAO();
	
		//데이터베이스에 저장하는 메소드 호출
		bbean = dao.makeBooking(bbean);
	%>
</body>
</html>