<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="//cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<link
	href="//cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



<style type="text/css">
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}
</style>

</head>

<body>
				<h1>공지사항 게시판</h1>
	<table class="table table table-hover" id="bbsTable">
		<thead>
			<tr>

				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
		

				<th>조회수</th>
				<th>작성일</th>
				<th>상단고정</th>

			</tr>
		</thead>

		<c:forEach items="${list}" var="bbs">




			<c:choose>



				<c:when test="${bbs.notice > 0}">
					<tr class="table-danger">
				</c:when>

				<c:otherwise>
					<tr>
				</c:otherwise>


			</c:choose>








			<td><b><a
					href="${pageContext.request.contextPath}/board/boardview?n=${bbs.bbsno}&
										page=${scri.page}&
										perPageNum=${scri.perPageNum}&
										searchType=${scri.searchType}&
										keyword=${scri.keyword}">${bbs.bbsno}</a></b>
				</nobr></td>

			<td><c:forEach begin="1" end="${bbs.bbsDent}">&nbsp;&nbsp;</c:forEach>
				<c:if test="${bbs.bbsDent != 0}">
					<b style="color: blue">ㄴ</b>
				</c:if> <a
				href="${pageContext.request.contextPath}/board/boardview?n=${bbs.bbsno}&
										page=${scri.page}&
										perPageNum=${scri.perPageNum}&
										searchType=${scri.searchType}&
										keyword=${scri.keyword}">
					<c:if test="${bbs.notice > 0}">
						<img src="../resources/img/notice.png" />

					</c:if> ${bbs.title}
			</a></td>




			<td>${bbs.writer}</td>



			<td>${bbs.viewCnt}</td>
			<td>${bbs.regDate}</td>
			<td id="noti">${bbs.notice}</td>

			</tr>


		</c:forEach>

		</tbody>

	</table>
	<a class="btn btn-primary"
		href="${pageContext.request.contextPath}/board/boardinsert"> 글 쓰 기
	</a>
	<div class="search">
		<select name="searchType">
			<option value="n"
				<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
			<option value="t"
				<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="c"
				<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			<option value="w"
				<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			<option value="tc"
				<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${scri.keyword}" />

		<button id="searchBtn">검색</button>

		<script>
			$(function() {
				$('#searchBtn').click(
						function() {
							self.location = "listSearch"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val());
						});
			});
		</script>
	</div>
	<div>
	<nav aria-label="Page navigation example">

		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="page-item"><a aria-label="Previous" class="page-link"
					href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li class="page-item" ><a class="page-link" href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a class="page-link" aria-label="Next"
					href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
		</nav>
	</div>

	<!-- <script>
		
 $(document).ready(function() {
    $('#bbsTable').DataTable({
    	ordering: false
  
    	
    }
    		
    
    );
    
});
</script> -->


</body>
</html>