<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
   <jsp:include page="_header.jsp" />
   <jsp:include page="_menu.jsp" />
 
   <fmt:setLocale value="en_US" scope="session"/>
  
   <div class="page-title">Danh sách đặt hàng</div>
 
   <div>Tổng số đơn đặt hàng: ${paginationResult.totalRecords}</div>

  <br>
  
   <table border="1" style="width:100%">
       <tr>
           <th>Số thứ tự</th>
           <th>Ngày đặt hàng</th>
           <th>Tên khách hàng</th>
           <th>Địa chỉ khách hàng</th>
           <th>Email khách hàng</th>
           <th>Số tiền</th>
           <th>Các sản phẩm mua</th>
       </tr>
       <c:forEach items="${paginationResult.list}" var="orderInfo">
           <tr>
               <td>${orderInfo.orderNum}</td>
               <td>
                  <fmt:formatDate value="${orderInfo.orderDate}" pattern="dd-MM-yyyy HH:mm"/>
               </td>
               <td>${orderInfo.customerName}</td>
               <td>${orderInfo.customerAddress}</td>
               <td>${orderInfo.customerEmail}</td>
               <td style="color:red;">
                  <fmt:formatNumber value="${orderInfo.amount}" type="currency"/>
               </td>


               <td><a href="${pageContext.request.contextPath}/order?orderId=${orderInfo.id}">
                  Xem chi tiết</a></td>
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