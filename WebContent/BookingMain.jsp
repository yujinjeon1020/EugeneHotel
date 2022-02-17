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
<body style="font-family: 제주고딕; color: #3c3c3c" >
<%
	String id = (String) session.getAttribute("id");

	if(id == null) {
%>
	<script>
		alert("로그인 후 이용 가능한 서비스 입니다.");
		location.href='Index.jsp?center=LoginForm.jsp';
	</script>
<%
	} else if(id != null) {
%>
		<center>
		<form action="Index.jsp?center=BookingSecond.jsp" method="post">
			<table width="60%" style="margin: 150px" >
				<tr>
					<td align="center">
					<p>
					<b style="font-size: 30px">객실 예약</b> <br> <br>
					</td>
				</tr>
				<tr>
					<td align="center">
					<p style="font-size: 20px"><b>1. 숙박을 원하시는 날짜와 투숙 기간을 선택해주세요.</b>
					</td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td align="center">
					체크인 : <input style="font-family: 제주고딕; color: #3c3c3c" type="date" name="day" />
					</td>
				</tr>
				<tr height="20"></tr>
				<tr>
					<td align="center">
					투숙 기간 : <select name="duration">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select> 박 <br>
					<p style="font-size: 14px">(호텔 규정상 투숙 기간은 최대 10일 예약 가능하며, <br>11일 이상 투숙을 원하시는 고객님은 고객센터로 문의 부탁드립니다.)</p>
					</td>
				</tr>
				
				<tr>
					<td align="center">
					<input id="button" type="submit" value="다음"/>
					<input type="hidden" name="id" value="<%=id %>"/></td>
				</tr>
			
			</table>
		</form>
	</center>
<%
	}
%>

</body>
</html>