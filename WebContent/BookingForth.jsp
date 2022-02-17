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
					<b style="font-size: 30px">���� ���� Ȯ��</b> <br> <br>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="6">
					<p style="font-size: 20px;"><b><%=id %>��, ���� ������ Ȯ���Ͻ� �� ������ �Ϸ��� �ֽʽÿ�. </b>
					</td>
				</tr>
				<tr height="30" bgcolor="B29F93">
					<td width="250" align="center">�� Ÿ��</td>
					<td width="150" align="center">1�� ���</td>
					<td width="80" align="center">���� �ο�</td>
					<td width="100" align="center">üũ�� ��¥</td>
					<td width="80" align="center">���� �Ⱓ</td>
					<td width="150" align="center"><b>�� �ݾ�</b></td>
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
					<td width="80" align="center"><%=people %>��</td>
					<td width="100" align="center"><%=day %></td>
					<td width="80" align="center"><%=duration %>��</td>
					<td width="150" align="center"><b>KRW <%=price %></b></td></tr>
				<tr height="20">
				</tr>
				<tr>
				<td style="font-size: 15px" colspan="6" align="center">	
				�� �ڷγ� ���̷��� ���� ������ ���� ���� ����� �������� �ʴ� �� ���� ��Ź�帳�ϴ�.
			 	</td>
				</tr>
				<tr height="50">
				</tr>
				<tr>
					<td colspan="6" align="center">
					<input id="button" type="button" onclick="history.go(-1)" value="����" /> &nbsp;&nbsp;
					<input style="font-weight: bold" id="button" type="submit" value="����"/> &nbsp;&nbsp;
					<input id="button" type="button" onclick="location.href='Index.jsp'"value="���"/>
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