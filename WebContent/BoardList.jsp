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
		font-family: 제주고딕; 
		color:#3c3c3c; 
		height: 30px"
	}
	#button:hover {
		text-decoration: underline;
	}
</style>
</head>
<body style="font-family: 제주고딕; color: #3c3c3c">
	<center>
		<form action="LoginCheckForWrite.jsp" method="post">
			<!-- 게시글 보기에 카운터링을 설정하기 위한 변수들을 선언 -->
			<%
				//화면에 보여질 게시글의 개수를 지정
				int pageSize = 10;

				//현재 카운터를 클릭한 번호값을 읽어옴
				String pageNum = request.getParameter("pageNum");
				//만약 처음 BoardList.jsp를 클릭하거나 수정, 삭제 등 다른 게시글에서 이 페이지로 넘어오면 
				//pageNum값이 없기에 (카운터링을 눌러서 넘어온것이 아니다) null 처리 해줌
				//즉, 처음 페이지(최근 페이지)를 열어줌
				if (pageNum == null) {
					pageNum = "1";
				}
				int count = 0; //전체 글의 갯수를 저장
				int number = 0; //페이지 넘버링

				//현재 보고자 하는 페이지 넘버를 int타입 변수에 저장
				int currentPage = Integer.parseInt(pageNum);
				//전체 게시글의 내용을 jsp쪽으로 가져와야함
				DAO dao = new DAO();
				//전체 게시글의 갯수를 읽어들인 메소드 호출
				count = dao.getAllCount();
				//현재 페이지에 보여줄 시작번호를 설정 = 데이터 베이스에서 불러올 시작 번호
				int startRow = (currentPage - 1) * pageSize + 1;
				int endRow = currentPage * pageSize;
				//최신글 10개를 기준으로 게시글을 리턴 받아주는 메소드 호출
				Vector<BoardBean> vec = dao.getAllBoard(startRow, endRow);
				//테이블에 표시할 번호 지정
				number = count - (currentPage - 1) * pageSize;
			%>
			<table width="60%" style="margin-top: 100px; margin-bottom: 100px">
			<tr>
			<td colspan="5" align="center">
			<p>
				<b style="font-size: 20px">유진호텔은 고객님의 의견을 기다립니다.</b><br> <br>
				문의 및 건의 사항을 남겨주시면 빠른 시일내에 답변 드리겠습니다. <br> <br>
			</td>
			</tr>
				<tr height="30" bgcolor="B29F93">
					<td width="50" align="center">No.</td>
					<td width="320" align="center">제목</td>
					<td width="100" align="center">작성자</td>
					<td width="150" align="center">작성일</td>
					<td width="80" align="center">조회수</td>
				</tr>
				<%
					for (int i = 0; i < vec.size(); i++) {
						BoardBean bean = vec.get(i); //벡터에 저장되어 있는 빈 클래스를 하나씩 추출
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
					<input id="button" type="submit" value="게시글 작성" /></td>
				</tr>
			</table>

			<p>
				<!-- 페이지 카운터링 소스 -->
				<%
					if (count > 0) {
						//count(총 게시글 수)를 한 페이지당 게시글 수로 나눴을 때 0으로 떨어지면(나머지가 없으면) 그냥 그 몫 만큼의 페이지만 있으면 되지만,
						//나눴을 때 0으로 안떨어지면 나머지가 있기 때문에 몫+1 하여 한 페이지 나머지를 추가해 줘야 게시글이 페이지에 다 들어감! 
						//예) pageSize = 10으로 정해져있고 만약 총 게시글 수가 80개라면 페이지 카운터링은 총 8((80/10) +0)페이지.
						//pageSize = 10으로 정해져있고 만약 총 게시글 수가 88개라면 페이지 카운터링은 9((80/10) +1) 가 될것임. 
						//8페이지까지는 게시글이 10개씩, 마지막 9번째 페이지에는 8개의 게시글
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); //카운터링 숫자를 얼마까지 보여줄건지 결정

						//시작 페이지 숫자를 설정
						int startPage = 1;

						if (currentPage % 10 != 0) {
							startPage = (int) (currentPage / 10) * 10 + 1;
						} else {
							startPage = ((int) (currentPage / 10 - 1)) * 10 + 1;
						}

						int pageBlock = 10; //카운터링 처리숫자
						int endPage = startPage + pageBlock - 1; //화면에 보여질 페이지의 마지막 숫자

						if (endPage > pageCount) {
							endPage = pageCount;
						}
						//[이전]이라는 링크를 만들건지 파악
						if (startPage > 10) {
				%>
				<a style="text-decoration: none; color: #3c3c3c"
					href="Index.jsp?center=BoardList.jsp?pageNum=<%=startPage - 10%>">[이전]</a>
				<%
					}
						//페이징 처리
						for (int i = startPage; i <= endPage; i++) {
				%>
				<a style="text-decoration: none; color: #3c3c3c"
					href="Index.jsp?center=BoardList.jsp?pageNum=<%=i%>">[<%=i%>]
				</a>
				<%
					}
						//[다음]이라는 링크를 만들건지 파악
						if (endPage < pageCount) {
				%>
				<a style="text-decoration: none; color: #3c3c3c"
					href="Index.jsp?center=BoardList.jsp?pageNum=<%=startPage + 10%>">[다음]</a>
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