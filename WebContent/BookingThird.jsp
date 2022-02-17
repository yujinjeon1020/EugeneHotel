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

	String roomrate1 = request.getParameter("roomrate");	//널처리 위한 변수
	
	String day = request.getParameter("day");
	
	int duration = Integer.parseInt(request.getParameter("duration"));
	
	//룸 타입 선택하지 않았을 때 null 처리
	if(roomrate1 == null) {

%>
	<script>
		alert("원하시는 룸 타입을 선택해주세요.");
		history.go(-1);
	</script>
<%
	} else {

		int roomrate = Integer.parseInt(request.getParameter("roomrate"));	
%>

		<center>
		<form action="Index.jsp?center=BookingForth.jsp" method="post">
			<table width="70%" style="margin: 150px" >
				<tr>
					<td align="center" colspan="2">
					<p>
					<b style="font-size: 30px">객실 예약</b> <br> <br>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<p style="font-size: 20px;"><b>3. 투숙객 인원 수를 선택해주세요.</b>
					</td>
				</tr>
				<tr>
					
		<%
			if(roomrate == 350000 || roomrate == 400000) {
				
		%>
					<td align="center">
					<select name="people">
						<option value="1">1</option>
						<option value="2">2</option>
					</select> 인
					</td>
		<%				
			} else if(roomrate == 450000) {
		%>
					<td align="center">
					<select name="people">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select> 인
					</td>
		<%				
			} else if(roomrate == 1500000) {
		%>
					<td align="center">
					<select name="people">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select> 인
					</td>
		<%	
			}
		%>
				</tr>
				<tr height="50">
				</tr>
				<tr>
					<td align="center">
					<input id="button" type="button" onclick="history.go(-1)" value="이전" />  &nbsp;&nbsp;
					<input id="button" type="submit" value="다음"/>
					<input type="hidden" name="id" value="<%=id %>"/>					
					<input type="hidden" name="day" value="<%=day %>"/>
					<input type="hidden" name="duration" value="<%=duration %>"/>
					<input type="hidden" name="roomrate" value="<%=roomrate %>"/>
					</td>
					
				</tr>
			
			</table>
		</form>
	</center>
<%	
	}
%>

</body>
</html>