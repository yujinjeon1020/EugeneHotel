<%@page import="model.BookingBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	request.setCharacterEncoding("euc-kr");

	String day = request.getParameter("day");

	String id = (String) session.getAttribute("id");
	
	String roomtype = "";
	
	int roomrate = Integer.parseInt(request.getParameter("roomrate"));
	
	int people = Integer.parseInt(request.getParameter("people"));
	
	int duration = Integer.parseInt(request.getParameter("duration"));

	int price = roomrate * duration;
%>
		<center>
			<form action="Index.jsp?center=BookingSuccess.jsp" method="post">
			<table width="60%" style="margin-top: 100px; margin-bottom: 300px">
				<tr>
					<td style="background-color: B29F93" colspan="6" align="center">
					<p>
					<b style="font-size: 30px">객실 예약 확인</b> <br> <br>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="6">
					<p style="font-size: 20px;"><b><%=id %>님, 예약 내용을 확인하신 후 예약을 완료해 주십시오. </b>
					</td>
				</tr>
				<tr height="30" bgcolor="B29F93">
					<td width="250" align="center">룸 타입</td>
					<td width="150" align="center">1박 요금</td>
					<td width="80" align="center">투숙 인원</td>
					<td width="100" align="center">체크인 날짜</td>
					<td width="80" align="center">투숙 기간</td>
					<td width="150" align="center"><b>총 금액</b></td>
				</tr>
				<tr height="30">
					<td width="70" align="center">
				<%
					if(roomrate == 350000) {
						roomtype = "Deluxe";
					} else if(roomrate == 400000) {
						roomtype = "Premier";
					} else if(roomrate == 450000) {
						roomtype = "Hello Kitty";
					} else {
						roomtype = "Royal Suite";
					}
				%>				
				<%=roomtype %> Room </td>
					<td width="150" align="center">KRW <%=roomrate %></td>			
					<td width="80" align="center"><%=people %>인</td>
					<td width="100" align="center"><%=day %></td>
					<td width="80" align="center"><%=duration %>박</td>
					<td width="150" align="center"><b>KRW <%=price %></b></td></tr>
				<tr height="20">
				</tr>
				<tr>
				<td style="font-size: 15px" colspan="6" align="center">	
				※ 코로나 바이러스 감염 예방을 위해 조식 뷔페는 제공되지 않는 점 양해 부탁드립니다.
			 	</td>
				</tr>
				<tr height="50">
				</tr>
				<tr>
					<td colspan="6" align="center">
					<input id="button" type="button" onclick="history.go(-1)" value="이전" /> &nbsp;&nbsp;
					<input style="font-weight: bold" id="button" type="submit" value="예약"/> &nbsp;&nbsp;
					<input id="button" type="button" onclick="location.href='Index.jsp'"value="취소"/>
					<input type="hidden" name="day" value="<%=day %>"/>
					<input type="hidden" name="duration" value="<%=duration %>"/>
					<input type="hidden" name="id" value="<%=id %>"/>
					<input type="hidden" name="roomtype" value="<%=roomtype %>"/>
					<input type="hidden" name="roomrate" value="<%=roomrate %>"/>
					<input type="hidden" name="people" value="<%=people %>"/>
					<input type="hidden" name="price" value="<%=price %>"/></td>
				</tr>
			
			</table>
		</form>
	</center>

</body>
</html>