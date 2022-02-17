<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAO"%>
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
	<center>
		<form action="LoginCheckForWrite.jsp" method="post">
			<!-- �Խñ� ���⿡ ī���͸��� �����ϱ� ���� �������� ���� -->
			<%
				//ȭ�鿡 ������ �Խñ��� ������ ����
				int pageSize = 10;

				//���� ī���͸� Ŭ���� ��ȣ���� �о��
				String pageNum = request.getParameter("pageNum");
				//���� ó�� BoardList.jsp�� Ŭ���ϰų� ����, ���� �� �ٸ� �Խñۿ��� �� �������� �Ѿ���� 
				//pageNum���� ���⿡ (ī���͸��� ������ �Ѿ�°��� �ƴϴ�) null ó�� ����
				//��, ó�� ������(�ֱ� ������)�� ������
				if (pageNum == null) {
					pageNum = "1";
				}
				int count = 0; //��ü ���� ������ ����
				int number = 0; //������ �ѹ���

				//���� ������ �ϴ� ������ �ѹ��� intŸ�� ������ ����
				int currentPage = Integer.parseInt(pageNum);
				//��ü �Խñ��� ������ jsp������ �����;���
				DAO dao = new DAO();
				//��ü �Խñ��� ������ �о���� �޼ҵ� ȣ��
				count = dao.getAllCount();
				//���� �������� ������ ���۹�ȣ�� ���� = ������ ���̽����� �ҷ��� ���� ��ȣ
				int startRow = (currentPage - 1) * pageSize + 1;
				int endRow = currentPage * pageSize;
				//�ֽű� 10���� �������� �Խñ��� ���� �޾��ִ� �޼ҵ� ȣ��
				Vector<BoardBean> vec = dao.getAllBoard(startRow, endRow);
				//���̺� ǥ���� ��ȣ ����
				number = count - (currentPage - 1) * pageSize;
			%>
			<table width="60%" style="margin-top: 100px; margin-bottom: 100px">
			<tr>
			<td colspan="5" align="center">
			<p>
				<b style="font-size: 20px">����ȣ���� ������ �ǰ��� ��ٸ��ϴ�.</b><br> <br>
				���� �� ���� ������ �����ֽø� ���� ���ϳ��� �亯 �帮�ڽ��ϴ�. <br> <br>
			</td>
			</tr>
				<tr height="30" bgcolor="B29F93">
					<td width="50" align="center">No.</td>
					<td width="320" align="center">����</td>
					<td width="100" align="center">�ۼ���</td>
					<td width="150" align="center">�ۼ���</td>
					<td width="80" align="center">��ȸ��</td>
				</tr>
				<%
					for (int i = 0; i < vec.size(); i++) {
						BoardBean bean = vec.get(i); //���Ϳ� ����Ǿ� �ִ� �� Ŭ������ �ϳ��� ����
				%>
				<tr height="30">
					<td width="50" align="center"><%=number--%></td>
					<td width="200" align="left">
					<a href="Index.jsp?center=BoardInfo.jsp?num=<%=bean.getNum()%>"
						style="text-decoration: none; color: #3c3c3c"> 
				<%
						if(bean.getRe_step() > 1) {
							for(int j=0; j<(bean.getRe_step()-1)*5; j++) {
				%> &nbsp;
				<%
							}		
						}
				%>	
					<%=bean.getTitle()%></a></td>
					<td width="100" align="center"><%=bean.getId()%></td>
					<td width="150" align="center"><%=bean.getReg_date()%></td>
					<td width="80" align="center"><%=bean.getReadcount()%></td>
				</tr>
				<%
					}
				%>
				<tr height="50">
				</tr>
				<tr height="40">
					<td colspan="5" align="right">
					<input id="button" type="submit" value="�Խñ� �ۼ�" /></td>
				</tr>
			</table>

			<p>
				<!-- ������ ī���͸� �ҽ� -->
				<%
					if (count > 0) {
						//count(�� �Խñ� ��)�� �� �������� �Խñ� ���� ������ �� 0���� ��������(�������� ������) �׳� �� �� ��ŭ�� �������� ������ ������,
						//������ �� 0���� �ȶ������� �������� �ֱ� ������ ��+1 �Ͽ� �� ������ �������� �߰��� ��� �Խñ��� �������� �� ��! 
						//��) pageSize = 10���� �������ְ� ���� �� �Խñ� ���� 80����� ������ ī���͸��� �� 8((80/10) +0)������.
						//pageSize = 10���� �������ְ� ���� �� �Խñ� ���� 88����� ������ ī���͸��� 9((80/10) +1) �� �ɰ���. 
						//8������������ �Խñ��� 10����, ������ 9��° ���������� 8���� �Խñ�
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); //ī���͸� ���ڸ� �󸶱��� �����ٰ��� ����

						//���� ������ ���ڸ� ����
						int startPage = 1;

						if (currentPage % 10 != 0) {
							startPage = (int) (currentPage / 10) * 10 + 1;
						} else {
							startPage = ((int) (currentPage / 10 - 1)) * 10 + 1;
						}

						int pageBlock = 10; //ī���͸� ó������
						int endPage = startPage + pageBlock - 1; //ȭ�鿡 ������ �������� ������ ����

						if (endPage > pageCount) {
							endPage = pageCount;
						}
						//[����]�̶�� ��ũ�� ������� �ľ�
						if (startPage > 10) {
				%>
				<a style="text-decoration: none; color: #3c3c3c"
					href="Index.jsp?center=BoardList.jsp?pageNum=<%=startPage - 10%>">[����]</a>
				<%
					}
						//����¡ ó��
						for (int i = startPage; i <= endPage; i++) {
				%>
				<a style="text-decoration: none; color: #3c3c3c"
					href="Index.jsp?center=BoardList.jsp?pageNum=<%=i%>">[<%=i%>]
				</a>
				<%
					}
						//[����]�̶�� ��ũ�� ������� �ľ�
						if (endPage < pageCount) {
				%>
				<a style="text-decoration: none; color: #3c3c3c"
					href="Index.jsp?center=BoardList.jsp?pageNum=<%=startPage + 10%>">[����]</a>
				<%
					}
					}
				%>
			</p>
		</form>
	</center>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>