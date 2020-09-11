<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表页面</title>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.7.2.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<!--标题页  -->
		<div class="row col-md-12">
			<h1>SSH_CRUD</h1>
		</div>
		<!--按钮  -->
		<div class="row col-md-4 col-md-offset-8">
			<button class="btn btn-primary" >新增</button>
			<button class="btn btn-danger" >删除</button>
		</div>
		<!-- 表格 -->
		<div class="row">
			<table class="table table-hover table-bordered">
				<tr>
					<th>#</th>
					<th>empName</th>
					<th>Gender</th>
					<th>Email</th>
					<th>deptName</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list }" var="emps">
					<tr>
					<th>${emps.empId }</th>
					<th>${emps.empName }</th>
					<th>${emps.gender=="M"?"女":"男" }</th>
					<th>${emps.email }</th>
					<th>${emps.department.deptName }</th>
					<th>
						<button class="btn btn-primary">
						 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
						</button>
						<button class="btn btn-danger">
						 <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							 删除
						 </button>
					</th>
				</tr>
				</c:forEach>
				
			</table>
		</div>
		<!--分页  -->
		<div class="row">
			<div class="col-md-6">
				当前第${pageInfo.pageNum }页,总 ${pageInfo.pages }页，总${pageInfo.total }条记录
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					  <ul class="pagination">
					  <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
					  	<c:if test="${pageInfo.hasPreviousPage }">
					  		<li>
					      		<a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
					      		  <span aria-hidden="true">&laquo;</span>
					      		</a>
					    	</li>
					  	</c:if>
					    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
					    	<li><a href="${APP_PATH }/emps?pn=${page_num}">${page_num }</a></li>
					    </c:forEach>
					    <c:if test="${pageInfo.hasNextPage }">
					    	 <li>
							      <a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
					    	</li>
					    </c:if>
					   
					     <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages }">末页</a></li>
					  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>