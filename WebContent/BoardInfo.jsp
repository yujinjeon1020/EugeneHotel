<%@page import="model.DAO"%>
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
	int num = Integer.parseInt(request.getParameter("num"));	//공백 제거 후 정수형으로 바꿈

	String id = (String) session.getAttribute("id");
	
	if(id == null) {
		id = "GUEST";
	}
	//데이터 베이스 접근
	DAO dao = new DAO();
	
	//BoardBean 타입으로 하나의 게시글을 리턴받음
	BoardBean bean = dao.getOneBoard(num);
	
	String beanid = bean.getId();
%>

	<center>
		<table width="50%"
			style="margin: 100px; font-family: 제주고딕; color: #3c3c3c">
			<tr height="30">
				<td align="center" width="120" style="font-style: italic;">Title</td>
				<td align="left" colspan="3"><%=bean.getTitle()%></td>
			</tr>
			<tr height="30">
				<td align="center" width="120" style="font-style: italic;">ID</td>
				<td align="left" width="180"><%=bean.getId() %></td>
				<td align="center" width="120" style="font-style: italic;">Date</td>
				<td align="left" width="180"><%=bean.getReg_date() %></td>
			</tr>
			<tr>
				<td colspan="4"><hr color="B29F93"></td>
			</tr>
			<tr height="100">
				<td align="center" width="120" style="font-style: italic;">Content</td>
				<td align="left" colspan="3">
				<%=bean.getContent().replaceAll("\r\n", "<br>")%>
				</td>
			</tr>
			<tr height="100">
			</tr>
			<%
			if(id.equals(beanid)) {
				
			%>
				<tr height="80">
				<td align="center" colspan="4">
					<input id="button" type="button" value="수정하기"
					onclick="location.href='Index.jsp?center=BoardUpdateForm.jsp?num=<%=bean.getNum() %>'" />
					&nbsp;&nbsp;
					<input id="button" type="button" value="삭제하기"
					onclick="location.href='Index.jsp?center=BoardDeleteProc.jsp?num=<%=bean.getNum() %>'" />
				</td>
			</tr>
			
			<%
			} else if(id.equals("Customer Service")) {
			%>
			<tr height="80">
				<td align="center" colspan="4">
					<input id="button" type="button" value="답글쓰기"
					onclick="location.href='Index.jsp?center=BoardReWriteForm.jsp?num=<%=bean.getNum() %>&ref=<%=bean.getRef() %>&re_step=<%=bean.getRe_step() %>&re_level=<%=bean.getRe_level() %>'" />
					&nbsp;&nbsp;
					<input id="button" type="button" value="수정하기"
					onclick="location.href='Index.jsp?center=BoardUpdateForm.jsp?num=<%=bean.getNum() %>'" />
					&nbsp;&nbsp;
					<input id="button" type="button" value="삭제하기"
					onclick="location.href='Index.jsp?center=BoardDeleteProc.jsp?num=<%=bean.getNum() %>'" />
				</td>
			</tr>
			<%	
			}
		%>
			<tr>
				<td colspan="4" align="center"><input id="button" type="button"
					value="목록보기"
					onclick="location.href='Index.jsp?center=BoardList.jsp'" /></td>
			</tr>
		</table>
	</center>

</body>
</html>