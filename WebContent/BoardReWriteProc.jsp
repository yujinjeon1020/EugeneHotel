<%@page import="model.BoardBean"%>
<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = (String) session.getAttribute("id");
	
	BoardBean bean = new BoardBean();
	
	bean.setId(id);
%>

	<!-- 데이터를 한번에 받아 오는 빈 클래스를 사용  -->
	<jsp:useBean id="boardbean" class="model.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>
	
<% 
	//데이터베이스 객체 생성
	DAO dao = new DAO();
	dao.reWriteBoard(boardbean, id); 
	
	//답변 데이터를 모두 저장 후 전체 게시글 보기를 설정
	response.sendRedirect("Index.jsp?center=BoardList.jsp");
%>

</body>
</html>