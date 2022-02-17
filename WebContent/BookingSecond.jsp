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
	String id = request.getParameter("id");	
	
	request.setCharacterEncoding("euc-kr");
	
	int duration = Integer.parseInt(request.getParameter("duration"));
	
	String day = request.getParameter("day");
	
	//체크인 날짜 선택하지 않았을 때 null 처리
	if(day == null) {
		day = "";
	}
	
	//체크인 날짜가 선택되지 않았을 경우
	if(day == "") {
%>
	<script>
		alert("숙박을 원하시는 날짜 및 투숙 기간을 정확히 입력해주세요.");
		history.go(-1);
	</script>
<%
	//올바르게 선택되었을 때
	} else if((day != "")) {
			
	//오늘보다 전, 당일 예약은 불가하도록 함 
	Date d1 = new Date();
	Date d2 = new Date();
	//날짜를 String 타입으로 변환해주는 클래스 선언
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	
	d1 = sdf.parse(day);//예약하려는 날짜
	d2 = sdf.parse(sdf.format(d2));	//현재날짜
	//날짜 비교 메소드 사용
	int compare = d1.compareTo(d2);
	//예약하려는 날짜보다 현재 날짜가 크다면 -1 (이미 지난 날짜)
	//예약하려는 날짜와 현재 날짜가 같다면 0
	//예약하려는 날짜보다 현재 날짜가 작다면 +1
	
	if(compare < 1) { //-1 (이미 지난 날짜), 0 (당일) 예약 불가
%>
	<script>
		alert("현재 날짜 이전은 선택 불가하며, 당일 예약 또한 불가하오니 양해 부탁드립니다.");
		history.go(-1);
	</script>	
<%
	} else {
%>
		<center>
		<form action="Index.jsp?center=BookingThird.jsp" method="post">
			<table width="70%" style="margin: 150px" >
				<tr>
					<td align="center" colspan="2">
					<p>
					<b style="font-size: 30px">객실 예약</b> <br> <br>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<p style="font-size: 20px;"><b>2. 투숙을 원하시는 룸 타입을 선택해주세요.</b>
					</td>
				</tr>
				<tr height="20">
				</tr>
				<tr>
					<td align="right" width="400">
					<img src="img/room_deluxe1.jpg" width="400" height="200" />
					</td>
					<td align="left" width="400">
					<input type="radio" name="roomrate" value="350000"/>디럭스 룸 (KRW 350,000) | 최대 2인<br>
					</td>
				<tr height="50">
				<td colspan="2">
				<hr>
				</td>
				</tr>
				<tr>
					<td align="right" width="400">
					<img src="img/room_premier1.jpg" width="400" height="200" />
					</td>
					<td align="left" width="400">
					<input type="radio" name="roomrate" value="400000"/>프리미어 룸 (KRW 400,000) | 최대 2인<br>
					</td>
				<tr height="50">
				<td colspan="2">
				<hr>
				</td>
				</tr>				
				<tr>
					<td align="right" width="400">
					<img src="img/room_kitty1.jpg" width="400" height="200" />
					</td>
					<td align="left" width="400">
					<input type="radio" name="roomrate" value="450000"/>헬로키티 룸 (KRW 450,000) | 최대 3인<br>
					</td>
				<tr height="50">
				<td colspan="2">
				<hr>
				</td>
				</tr>				
				<tr>
					<td align="right" width="400">
					<img src="img/room_suite1.jpg" width="400" height="200" />
					</td>
					<td align="left" width="400">
					<input type="radio" name="roomrate" value="1500000"/>로얄 스위트 룸 (KRW 1,500,000) | 최대 4인<br>
					</td>
				<tr height="50">
				</tr>
				<tr>
					<td>
					<input type="hidden" name="id" value="<%=id %>"/>
					<input type="hidden" name="duration" value="<%=duration %>" />
					<input type="hidden" name="day" value="<%=day %>" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
					<input id="button" type="button" onclick="history.go(-1)" value="이전"/> &nbsp;&nbsp;
					<input id="button" type="submit" value="다음"/>
					<input type="hidden" name="id" value="<%=id %>"/></td>
				</tr>
			
			</table>
		</form>
	</center>
<%
	}
}
%>

</body>
</html>