<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String center = request.getParameter("center");
	
	if(center == null) {
		center = "Center.jsp";	//���� �������� �������� �ٸ� �׼��� ���� �Ǿ Top, Bottom�� �����ǰ� Center�� ����ǵ��� ��
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to Eugene Hotel Jeju</title>
</head>
<body bgcolor="#FDF5E6">
	<center>
		<table width="100%">
		<!-- Top  -->
			<jsp:include page="Top.jsp" />
		<!-- Center -->
			<jsp:include page="<%=center %>" />  
		<!-- Bottom -->
			<jsp:include page="Bottom.jsp" />
		</table>
	</center>
</body>
</html>
