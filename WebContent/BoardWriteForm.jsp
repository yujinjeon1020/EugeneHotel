<%@page import="model.BoardBean"%>
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
<body>
<%
	String id = (String) session.getAttribute("id");

	BoardBean bean = new BoardBean();
	int num = bean.getNum();
%>
	<center>
		<form action="BoardWriteProc.jsp" method="post">
			<table style="margin: 70px; font-family: 제주고딕; color: #3c3c3c">
				<tr>
					<td colspan="2" align="center">
					<p>
					<b style="font-size: 20px">유진호텔은 고객님의 의견을 기다립니다.</b>
					<br><br>
					문의 및 건의 사항을 남겨주시면 빠른 시일내에 답변 드리겠습니다.
					<br><br>
					</td>
				</tr>	
				<tr>
					<td width="100" align="center" style="font-style: italic;">작성자</td>
					<td><%=id %></td>
				</tr>
				<tr height="10">
				</tr>		
				<tr>
					<td width="100" align="center" style="font-style: italic;">Title</td>
					<td><input style="border: none" type="text" name="title" size="88"/></td>
				</tr>
				<tr height="10">
				</tr>
				<tr>
					<td width="100" align="center" style="font-style: italic;">Content</td>
					<td><textarea style="border: none" name="content" cols="90" rows="30"></textarea></td>
				</tr>
				<tr height="10">
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input id="button" type="submit" value="등록" /> &nbsp;&nbsp;&nbsp;
					<input id="button" type="button" value="취소" onclick="location.href='Index.jsp?center=BoardList.jsp'"/>
					<input type="hidden" name="<%=num %>" />
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>