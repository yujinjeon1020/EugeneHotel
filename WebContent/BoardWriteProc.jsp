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
	<!-- �ۼ��� �Խñ��� ������ �ѹ��� �о����  -->
	<jsp:useBean id="boardbean" class="model.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>

	<%
		//������ ���̽� ������ �� Ŭ������ �Ѱ���
		DAO dao = new DAO();

		//�Խñ� ������ ���� �޼ҵ� ȣ��
		dao.writeBoard(boardbean, id);

		//�Խñ� ���� �� ��ü �Խñ� ����
		response.sendRedirect("Index.jsp?center=BoardList.jsp");
	%>
</body>
</html>