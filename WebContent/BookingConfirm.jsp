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
		font-family: 제주고딕; 
		color:#3c3c3c; 
		height: 30px"
	}
	#button:hover {
		text-decoration: underline;
	}
</style>
</head>
<body style="font-family: 제주고딕; color: #3c3c3c">
<%
	String id = (String) session.getAttribute("id");

	if(id == null) {
%>
	<script>
		alert("로그인 후 이용 가능한 서비스 입니다.");
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
				<b style="font-size: 20px">전체 예약 내역</b></td>
				</tr>
				<tr height="30" bgcolor="B29F93">
					<td width="80" align="center">Booking No.</td>
					<td width="100" align="center">고객 ID</td>
					<td width="250" align="center">룸 타입</td>
					<td width="80" align="center">투숙 인원</td>
					<td width="100" align="center">체크인 날짜</td>
					<td width="80" align="center">투숙 기간</td>
					<td width="150" align="center">총 금액</td>
					<td width="80" align="center">예약 취소</td>
				</tr>
				<%
					for (int i = 0; i < vec.size(); i++) {
						BookingBean bean = vec.get(i); //벡터에 저장되어 있는 빈 클래스를 하나씩 추출
						
				%>
				<tr height="30">
					<td width="80" align="center"><%=bean.getBookingNo()%></td>
					<td width="100" align="center"><%=bean.getId() %></td>
					<td width="250" align="center"><%=bean.getRoomtype()%> Room</td>
					<td width="80" align="center"><%=bean.getPeople()%>인</td>
					<td width="100" align="center"><%=bean.getDay()%></td>
					<td width="80" align="center"><%=bean.getDuration()%>박</td>
					<td width="150" align="center">KRW <%=bean.getPrice()%></td>
					<td width="80" align="center">
					<input id="button" type="submit" value="취소" />
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
				<b style="font-size: 20px">고객님의 예약 내역을 안내드립니다.</b></td>
				</tr>
				<tr height="30" bgcolor="B29F93">
					<td width="80" align="center">Booking No.</td>
					<td width="250" align="center">룸 타입</td>
					<td width="80" align="center">투숙 인원</td>
					<td width="100" align="center">체크인 날짜</td>
					<td width="80" align="center">투숙 기간</td>
					<td width="150" align="center">총 금액</td>
					<td width="80" align="center">예약 취소</td>
				</tr>
				<%
					if(vec.size() == 0) {
				%>
				<tr height="30">
				<td colspan="7" align="center">
				예약 내역이 존재하지 않습니다.
				</td>
				</tr>				
				<%
					} else if(vec.size() != 0) {
					
					for (int i = 0; i < vec.size(); i++) {
						BookingBean bean = vec.get(i); //벡터에 저장되어 있는 빈 클래스를 하나씩 추출
				%>
				<tr height="30">
					<td width="80" align="center"><%=bean.getBookingNo()%></td>
					<td width="250" align="center"><%=bean.getRoomtype()%> Room</td>
					<td width="80" align="center"><%=bean.getPeople()%>인</td>
					<td width="100" align="center"><%=bean.getDay()%></td>
					<td width="80" align="center"><%=bean.getDuration()%>박</td>
					<td width="150" align="center">KRW <%=bean.getPrice()%></td>
					<td width="80" align="center">
					<input id="button" type="submit" value="취소" />
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