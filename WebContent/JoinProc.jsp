<%@page import="model.DAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>

<%
	request.setCharacterEncoding("EUC-KR");	//한글 처리
%>
	<!-- useBean을 이용하여 한꺼번에 데이터를 받아옴 -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />	<!-- 빈 클래스 set -->
	</jsp:useBean>
<%
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	String id = request.getParameter("id");
	
	DAO dao = new DAO();
	
	int result = dao.checkId(id);
	
	if(password1.equals(password2) && result == 0) {
		dao.memberJoin(mbean);
		
		//회원 가입이 되었다면 출력될 페이지
		response.sendRedirect("JoinSuccess.jsp");
	} else { 	//비밀번호 확인이 일치하지 않는다면
		response.sendRedirect("JoinFail.jsp");	
	}		
%>
</body>
</html>