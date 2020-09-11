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
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!--员工编辑模态框  -->
	<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工编辑</h4>
	      </div>
	      <div class="modal-body">
	       
	       <form class="form-horizontal"  id="add_update_form">
			  <div class="form-group">
			    <label  class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="empName_update"></p>
			    </div>
			  </div>
			  
			  
			  
			   <div class="form-group">
			    <label  class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="email" id="email_update" placeholder="email@sina.com">
			      <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  
			   <div class="form-group">
			    <label  class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_update"  value="M" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_update" value="F"> 女
				  </label>
			    </div>
			  </div>
			   <div class="form-group">
			    <label  class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			     <select class="form-control" name="dId" id="dId_add">
				  
				</select>
			    </div>
			  </div>
			  
			</form> 
			
			</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="add_emp_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 员工添加 -->
	<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工新增</h4>
	      </div>
	      <div class="modal-body">
	       
	       <form class="form-horizontal"  id="add_emp_form">
			  <div class="form-group">
			    <label  class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empName" id="empName_add" placeholder="empName">
			       <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  
			  
			  
			   <div class="form-group">
			    <label  class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="email" id="email_add" placeholder="email@sina.com">
			      <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  
			   <div class="form-group">
			    <label  class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_add"  value="M" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_add" value="F"> 女
				  </label>
			    </div>
			  </div>
			   <div class="form-group">
			    <label  class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			     <select class="form-control" name="dId" id="dId_add">
				  
				</select>
			    </div>
			  </div>
			  
			</form> 
	        
	        
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="add_emp_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!--标题页  -->
	<div class="container">
		
		<div class="row col-md-12">
			<h1>SSH_CRUD</h1>
		</div>
		<!--按钮  -->
		<div class="row col-md-4 col-md-offset-8">
			<button class="btn btn-primary" id="emp_add_btn" >新增</button>
			<button class="btn btn-danger"  id="emp_del_btn">删除</button>
		</div>
		<!-- 表格 -->
		<div class="row">
			<table class="table table-hover table-bordered" id="emps_table">
				<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_id" />
							</th>
							<th>#</th>
							<th>empName</th>
							<th>Gender</th>
							<th>Email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
				</thead>
				<tbody>
				
				
				</tbody>
				
			</table>
		</div>
		<!--分页  -->
		<div class="row">
			<div class="col-md-6" id="page_info">
				
			</div>
			<div class="col-md-6" id="page_nav">
			
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		var total_data,current_page;
		$(function(){
			
			to_page(1);
		});
		
		//跳转页面
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					build_emps_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		
		//显示表格数据
		function build_emps_table(result){
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				var empCheck=$("<td></td>").append($("<input type='checkbox' class='check_item' />"));
				var empIdTd= $("<td></td>").append(item.empId);
				var empNameTd=$("<td></td>").append(item.empName);
				var genderTd=$("<td></td>").append(item.gender=='M'?"男":"女");
				var emailTd=$("<td></td>").append(item.email);
				var deptNameTd=$("<td></td>").append(item.department.deptName);
				var editBtn=$("<button></button>").addClass("btn btn-primary btn_edit")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//编辑按钮添加id属性
				editBtn.attr("update_id",item.empId);
				var delBtn=$("<button></button>").addClass("btn btn-danger btn_delete")
				.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//删除按钮添加id属性
				delBtn.attr("delete_id",item.empId);
				var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(empCheck)
				.append(empIdTd)
				.append(empNameTd)
				.append(genderTd)
				.append(emailTd)
				.append(deptNameTd)
				.append(btnTd)
				.appendTo("#emps_table tbody");
			});
		}
		
		//显示分页信息
		function build_page_info(result){
			$("#page_info").empty();
			$("#page_info").append("当前第"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages
					+" 页，总"+result.extend.pageInfo.total+"条记录");
			total_data=result.extend.pageInfo.total;
			current_page=result.extend.pageInfo.pageNum;
		}
		
		//显示分页导航
		function build_page_nav(result){
			$("#page_nav").empty();
			var ul=$("<ul></ul>").addClass("pagination");
			var firstPageLi =$("<li></li>").append($("<a></a>").append("首页").attr("href","#")); 
			var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;")); 
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum -1);
				});
			}
			
			var sufPageLi=$("<li></li>").append($("<a></a>").append("&raquo;")); 
			var lastPageLi =$("<li></li>").append($("<a></a>").append("末页").attr("href","#")); 
			if(result.extend.pageInfo.hasNextPage == false){
				sufPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				sufPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum +1);
				});
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi=$("<li></li>").append($("<a></a>").append(item)); 
				ul.append(numLi);
				
				numLi.click(function(){
					to_page(item);
				});
			});
			ul.append(sufPageLi).append(lastPageLi);
			
			var nav=$("<nav></nav>").append(ul);
			nav.appendTo("#page_nav");
		}
		
		//清除表单数据
		function reset_from(ele){
			
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		
		//点击新增按钮弹出模态框
		$("#emp_add_btn").click(function(){
			document.getElementById("add_emp_form").reset();
			reset_from("#empAddModel form");
			selectDepts("#empAddModel select");
			$("#empAddModel").modal({
				backdrop:"static"
			});
		});
		
		//查询部门信息
		function selectDepts(ele){
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"get",
				success:function(result){
					//$(".form-horizontal select")
					$.each(result.extend.depts,function(){
						var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		//校验表单信息是否正确
		function validate_add_form(){
			var empName = $("#empName_add").val();
			//var nameVal=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			var nameVal=/(^[a-z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!nameVal.test(empName)){
				validate_add_view("#empName_add","error","用户名错误");
				return false;
			}else {
				validate_add_view("#empName_add","success","");
			}
			var email=$("#email_add").val();
			var emailVal=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!emailVal.test(email)){
				validate_add_view("#email_add","error","邮箱错误");
				return false;
			}else{
				validate_add_view("#email_add","success","");
			}
			return true;
		}
		
		//表单信息校验状态信息
		function validate_add_view(ele,status,msg){
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success" == status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//姓名校验是否重复
		$("#empName_add").change(function(){
			var empName=this.value;
			$.ajax({
				url:"${APP_PATH}/checkEmpName",
				type:"post",
				data:"empName="+empName,
				success:function(result){
					if(result.code == 100){
						validate_add_view("#empName_add","success","用户名可用");
						$("#add_emp_btn").attr("ajax-va","success");
					}else{
						validate_add_view("#empName_add","error","用户名不可用");
						$("#add_emp_btn").attr("ajax-va","error");
					}
				}
			});
		});
		
		//新增保存按钮单击事件,保存员工
		$("#add_emp_btn").click(function(){
			//判断数据格式是否正确
		if(	!validate_add_form()){
			return false;
		}
			//判断他的姓名校验属性是否成功
		if($(this).attr("ajax-va")=="error"){
			return false;
		}	
		$.ajax({
				url:"${APP_PATH}/emp",
				type:"post",
				data:$("#empAddModel form").serialize(),
				success:function(result){
					$('#empAddModel').modal('hide');
					to_page(total_data);
				}
			});
		});
		
		//编辑按钮单击事件
		$(document).on("click",".btn_edit",function(){
			//查询部门信息
			selectDepts("#empUpdateModel select");
			
			getEmp($(this).attr("update_id"));
			$("#add_emp_btn").attr("update_id_update",$(this).attr("update_id"));
			//开启模态框
			$("#empUpdateModel").modal({
				backdrop:"static"
			});
		});
		
		//通过id查询员工信息
		 function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"get",
				success:function(result){
					var emp = result.extend.emp;
					$("#empName_update").text(emp.empName);
					$("#email_update").val(emp.email);
					$("#empUpdateModel input[name=gender]").val([emp.gender]);
					$("#empUpdateModel select").val([emp.dId]);
				}
			});
		}
		
		//更新按钮单击事件
		$("#add_emp_btn").click(function(){
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("update_id_update"),
				type:"PUT",
				data:$("#empUpdateModel form").serialize(),
				success:function(result){
					$("#empUpdateModel").modal("hide");
					to_page(current_page);
				}
				
				
			});
		});
		
		//单个删除
		$(document).on("click",".btn_delete",function(){
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var empId=$(this).attr("delete_id");
			if(confirm("你确定要删除"+empName+"吗？")){
				$.ajax({
					url:"${APP_PATH}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(current_page);
					}
				});
			}
		});
		
		
		//选择框
		$("#check_id").click(function(){
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		$(document).on("click",".check_item",function(){
			
			var flag=$(".check_item:checked").length==$(".check_item").length;
			$("#check_id").prop("checked",flag);
			
		});
		
		$("#emp_del_btn").click(function(){
			var empNames="";
			var empIds="";
			$.each($(".check_item:checked"),function(){
				empNames +=	$(this).parents("tr").find("td:eq(2)").text()+",";
				empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			empNames= empNames.substring(0,empNames.length-1);
			empIds = empIds.substring(0,empIds.length-1);
			if(confirm("你确定要删除【"+empNames+"】吗？")){
				$.ajax({
					
						url:"${APP_PATH}/emp/"+empIds,
						type:"DELETE",
						success:function(result){
							alert(result.msg);
							to_page(current_page);
						
					}
					
				});
			}
		}); 
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>