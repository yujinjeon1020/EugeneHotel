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
	String id = request.getParameter("id");	
	
	request.setCharacterEncoding("euc-kr");
	
	int duration = Integer.parseInt(request.getParameter("duration"));
	
	String day = request.getParameter("day");
	
	//üũ�� ��¥ �������� �ʾ��� �� null ó��
	if(day == null) {
		day = "";
	}
	
	//üũ�� ��¥�� ���õ��� �ʾ��� ���
	if(day == "") {
%>
	<script>
		alert("������ ���Ͻô� ��¥ �� ���� �Ⱓ�� ��Ȯ�� �Է����ּ���.");
		history.go(-1);
	</script>
<%
	//�ùٸ��� ���õǾ��� ��
	} else if((day != "")) {
			
	//���ú��� ��, ���� ������ �Ұ��ϵ��� �� 
	Date d1 = new Date();
	Date d2 = new Date();
	//��¥�� String Ÿ������ ��ȯ���ִ� Ŭ���� ����
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	
	d1 = sdf.parse(day);//�����Ϸ��� ��¥
	d2 = sdf.parse(sdf.format(d2));	//���糯¥
	//��¥ �� �޼ҵ� ���
	int compare = d1.compareTo(d2);
	//�����Ϸ��� ��¥���� ���� ��¥�� ũ�ٸ� -1 (�̹� ���� ��¥)
	//�����Ϸ��� ��¥�� ���� ��¥�� ���ٸ� 0
	//�����Ϸ��� ��¥���� ���� ��¥�� �۴ٸ� +1
	
	if(compare < 1) { //-1 (�̹� ���� ��¥), 0 (����) ���� �Ұ�
%>
	<script>
		alert("���� ��¥ ������ ���� �Ұ��ϸ�, ���� ���� ���� �Ұ��Ͽ��� ���� ��Ź�帳�ϴ�.");
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
					<b style="font-size: 30px">���� ����</b> <br> <br>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<p style="font-size: 20px;"><b>2. ������ ���Ͻô� �� Ÿ���� �������ּ���.</b>
					</td>
				</tr>
				<tr height="20">
				</tr>
				<tr>
					<td align="right" width="400">
					<img src="img/room_deluxe1.jpg" width="400" height="200" />
					</td>
					<td align="left" width="400">
					<input type="radio" name="roomrate" value="350000"/>�𷰽� �� (KRW 350,000) | �ִ� 2��<br>
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
					<input type="radio" name="roomrate" value="400000"/>�����̾� �� (KRW 400,000) | �ִ� 2��<br>
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
					<input type="radio" name="roomrate" value="450000"/>���ŰƼ �� (KRW 450,000) | �ִ� 3��<br>
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
					<input type="radio" name="roomrate" value="1500000"/>�ξ� ����Ʈ �� (KRW 1,500,000) | �ִ� 4��<br>
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
					<input id="button" type="button" onclick="history.go(-1)" value="����"/> &nbsp;&nbsp;
					<input id="button" type="submit" value="����"/>
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