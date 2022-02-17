<%@page import="model.BoardBean"%>
<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	
		String id = (String) session.getAttribute("id");
		
		BoardBean bean = new BoardBean();
		
		bean.setId(id);
	%>
	<!-- 작성한 게시글의 데이터 한번에 읽어들임  -->
	<jsp:useBean id="boardbean" class="model.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>

	<%
		//데이터 베이스 쪽으로 빈 클래스를 넘겨줌
		DAO dao = new DAO();

		//게시글 데이터 저장 메소드 호출
		dao.writeBoard(boardbean, id);

		//게시글 저장 후 전체 게시글 보기
		response.sendRedirect("Index.jsp?center=BoardList.jsp");
	%>
</body>
</html>