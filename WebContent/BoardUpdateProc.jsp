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

<!-- 사용자 데이터를 읽어들이는 빈 클래스 설정 -->
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	//데이터베이스에 연결
	DAO dao = new DAO();
	dao.updateBoard(boardbean, id); 
	
	//수정이 완료되면 전체 게시물 목록 보기
	response.sendRedirect("Index.jsp?center=BoardList.jsp");
%>
</body>
</html>