<%@page import="model.BookingBean"%>
<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<script>
		alert("������ �Ϸ�Ǿ����ϴ�.");
		location.href='Index.jsp?center=BookingConfirm.jsp';
	</script>

<%-- �����͸� ������ ��Ŭ���� ȣ���Ͽ� ���� ������ ��ü�� �� Ŭ������ �ֱ�(setter) --%>
<jsp:useBean id="bbean" class="model.BookingBean">
	<jsp:setProperty name="bbean" property="*"/>
</jsp:useBean>

	<%
		request.setCharacterEncoding("euc-kr");
		
		//���� ���� �Ķ���� ������ �� Ŭ������ ����
		String id = (String) session.getAttribute("id");
		
		String roomtype = request.getParameter("roomtype");
		
		int roomrate = Integer.parseInt(request.getParameter("roomrate"));
		
		int people = Integer.parseInt(request.getParameter("people"));
		
		String day = request.getParameter("day");
		
		int duration = Integer.parseInt(request.getParameter("duration"));

		int price = Integer.parseInt(request.getParameter("price"));
		
		//�����ͺ��̽� ����
		DAO dao = new DAO();
	
		//�����ͺ��̽��� �����ϴ� �޼ҵ� ȣ��
		bbean = dao.makeBooking(bbean);
	%>
</body>
</html>