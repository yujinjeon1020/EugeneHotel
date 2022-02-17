<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String) session.getAttribute("id");
	//�α����� ���� �ʾ��� ��
	if(id == null) {
		id = "GUEST";		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	#intro, #room, #book, #confirm, #voc, #login, #logout {
		font-family: ���ְ��;
		color: #3c3c3c;
		text-decoration: none;
		font-size: 17px;
	}
	#intro:hover {
		text-decoration: underline;
	}
	#room:hover {
		text-decoration: underline;
	}
	#book:hover {
		text-decoration: underline;
	}
	#confirm:hover {
		text-decoration: underline;
	}
	#voc:hover {
		text-decoration: underline;
	}
	#login:hover {
		text-decoration: underline;
	}
	#logout:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
<center>
	<table width="100%" bgcolor="B29F93">
		<tr height="70">
			<td width="100" align="center"><a href="Index.jsp?center=Intro.jsp" id="intro">ȣ�ڼҰ�</a></td>
			<td width="100" align="center"><a href="Index.jsp?center=RoomMain.jsp" id="room">��������</a></td>
			<td width="100" align="center"><a href="Index.jsp?center=BookingMain.jsp" id="book">����</a></td>
			<td width="100" align="center"><a href="Index.jsp"><img src="img/MainLogo.jpg" width="80" height="70" /></a></td>
			<td width="100" align="center"><a href="Index.jsp?center=BookingConfirm.jsp" id="confirm">���೻��</a></td>
			<td width="100" align="center"><a href="Index.jsp?center=BoardList.jsp" id="voc">���� �Ҹ�</a></td>
		<%
			if(id.equals("GUEST")) {
		%>
			<td width="100" align="center"><a href="Index.jsp?center=LoginForm.jsp" id="login">�α���</a></td>
		<%
			} else {
		%>
			<td width="100" align="center"><a href="LogoutProc.jsp" id="logout">�α׾ƿ�</a></td>	
		<%
			}
		%>		
		</tr>
	</table>
</center>
</body>
</html>