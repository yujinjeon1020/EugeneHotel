<%@page import="java.util.Vector"%>
<%@page import="model.DAO"%>
<%@page import="model.BookingBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	#button {
		border: none; 
		background-image: url(img/button.jpg);
		font-size: 17px; 
		font-family: ���ְ��; 
		color:#3c3c3c; 
		height: 30px"
	}
	#button:hover {
		text-decoration: underline;
	}
</style>
</head>
<body style="font-family: ���ְ��; color: #3c3c3c">
<%
	String id = (String) session.getAttribute("id");

	if(id == null) {
%>
	<script>
		alert("�α��� �� �̿� ������ ���� �Դϴ�.");
		location.href='Index.jsp?center=LoginForm.jsp';
	</script>
<%
	} else if(id.equals("Customer Service"))  {
		DAO dao = new DAO();
		
		Vector<BookingBean> vec = dao.getAllBooking();
		
%>
	<center>
			<form action="BookingDeleteProc.jsp" method="post">
			<table width="70%" style="margin-top: 100px; margin-bottom: 300px">
				<tr>
					<td colspan="8" align="center"><p>
				<b style="font-size: 20px">��ü ���� ����</b></td>
				</tr>
				<tr height="30" bgcolor="B29F93">
					<td width="80" align="center">Booking No.</td>
					<td width="100" align="center">�� ID</td>
					<td width="250" align="center">�� Ÿ��</td>
					<td width="80" align="center">���� �ο�</td>
					<td width="100" align="center">üũ�� ��¥</td>
					<td width="80" align="center">���� �Ⱓ</td>
					<td width="150" align="center">�� �ݾ�</td>
					<td width="80" align="center">���� ���</td>
				</tr>
				<%
					for (int i = 0; i < vec.size(); i++) {
						BookingBean bean = vec.get(i); //���Ϳ� ����Ǿ� �ִ� �� Ŭ������ �ϳ��� ����
						
				%>
				<tr height="30">
					<td width="80" align="center"><%=bean.getBookingNo()%></td>
					<td width="100" align="center"><%=bean.getId() %></td>
					<td width="250" align="center"><%=bean.getRoomtype()%> Room</td>
					<td width="80" align="center"><%=bean.getPeople()%>��</td>
					<td width="100" align="center"><%=bean.getDay()%></td>
					<td width="80" align="center"><%=bean.getDuration()%>��</td>
					<td width="150" align="center">KRW <%=bean.getPrice()%></td>
					<td width="80" align="center">
					<input id="button" type="submit" value="���" />
					<input type="hidden" name="bookingNo" value="<%=bean.getBookingNo()%>" />
					</td>
				</tr>
				<%
					}
				%>
				
			</table>
			</form>
	</center>
<%
	} else {
		
		DAO dao = new DAO();
		
		Vector<BookingBean> vec = dao.getAllBookingByCustomer(id);
%>
<center>
			<form action="BookingDeleteProc.jsp" method="post">
			<table width="60%" style="margin-top: 100px; margin-bottom: 300px">
				<tr>
					<td colspan="7" align="center"><p>
				<b style="font-size: 20px">������ ���� ������ �ȳ��帳�ϴ�.</b></td>
				</tr>
				<tr height="30" bgcolor="B29F93">
					<td width="80" align="center">Booking No.</td>
					<td width="250" align="center">�� Ÿ��</td>
					<td width="80" align="center">���� �ο�</td>
					<td width="100" align="center">üũ�� ��¥</td>
					<td width="80" align="center">���� �Ⱓ</td>
					<td width="150" align="center">�� �ݾ�</td>
					<td width="80" align="center">���� ���</td>
				</tr>
				<%
					if(vec.size() == 0) {
				%>
				<tr height="30">
				<td colspan="7" align="center">
				���� ������ �������� �ʽ��ϴ�.
				</td>
				</tr>				
				<%
					} else if(vec.size() != 0) {
					
					for (int i = 0; i < vec.size(); i++) {
						BookingBean bean = vec.get(i); //���Ϳ� ����Ǿ� �ִ� �� Ŭ������ �ϳ��� ����
				%>
				<tr height="30">
					<td width="80" align="center"><%=bean.getBookingNo()%></td>
					<td width="250" align="center"><%=bean.getRoomtype()%> Room</td>
					<td width="80" align="center"><%=bean.getPeople()%>��</td>
					<td width="100" align="center"><%=bean.getDay()%></td>
					<td width="80" align="center"><%=bean.getDuration()%>��</td>
					<td width="150" align="center">KRW <%=bean.getPrice()%></td>
					<td width="80" align="center">
					<input id="button" type="submit" value="���" />
					<input type="hidden" name="bookingNo" value="<%=bean.getBookingNo()%>" /></td>
				</tr>
				<%
						}
					}					
				%>				
			</table>
			</form>
	</center>
<%
	}
%>

</body>
</body>
</html>