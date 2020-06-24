<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Quản lý nhân viên	</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles.css">

</head>
<body>


	<jsp:include page="_header.jsp" />
	<jsp:include page="_menu.jsp" />

	<div class="page-title">Tạo nhân viên mới</div>


	<form:form modelAttribute="newemoloyeeFrom" method="POST"
		enctype="multipart/form-data">
		<table class="aaa" style="text-align: left;">
			<tr>
				<td>Tên Tài khoản *</td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name" class="error-message" /></td>
			</tr>
			<tr>
				<td>Mật khẩu *</td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name" class="error-message" /></td>
			</tr>

			<tr>
				<td>Quyền *</td>
				<td><form:input path="price" /></td>
				<td><form:errors path="price" class="error-message" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Lưu" /> <input type="reset"
					value="Làm mới" /></td>
			</tr>
		</table>
	</form:form>
	
	
	
	<div class="page-title">Danh sách nhân viên</div>
 
   <div>Tổng số tài khoản ${paginationResult.totalRecords}</div>

  <br>
  
   <table border="1" style="width:100%">
       <tr>
           <th>Tên tài khoản</th>
           <th>Hoạt động</th>
           <th>Mật khẩu</th>
           <th>Quyền</th>
           <th>Xóa</th>
       </tr>
       <c:forEach items="${paginationResult.list}" var="orderInfo">
           <tr>
               <td>${orderInfo.orderNum}</td>
               <td>
                  <fmt:formatDate value="${orderInfo.orderDate}" pattern="dd-MM-yyyy HH:mm"/>
               </td>
               <td>${orderInfo.customerName}</td>	
               <td style="color:red;">
                  <fmt:formatNumber value="${orderInfo.amount}" type="currency"/>
               </td>
               <td><a href="${pageContext.request.contextPath}/order?orderId=${orderInfo.id}">
                  Xóa</a></td>
           </tr>
       </c:forEach>
   </table>
   <c:if test="${paginationResult.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationResult.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="orderList?page=${page}" class="nav-item">${page}</a>
              </c:if>
              <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
              </c:if>
          </c:forEach>
          
       </div>
   </c:if>
 



	<jsp:include page="_footer.jsp" />

</body>
</html>