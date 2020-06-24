<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>   
 
 
<div class="menu-container">
  
   <a href="${pageContext.request.contextPath}/">Trang chủ</a>
   |
   <a href="${pageContext.request.contextPath}/productList">
      Danh sách sản phẩm
   </a>
   |
   <a href="${pageContext.request.contextPath}/shoppingCart">
      Giỏ hàng
   </a>
   |
   <security:authorize  access="hasAnyRole('ROLE_MANAGER','ROLE_EMPLOYEE')">
     <a href="${pageContext.request.contextPath}/orderList">
         Dánh sách đặt hàng
     </a>
     |
   </security:authorize>
   
   <security:authorize  access="hasRole('ROLE_MANAGER')">
         <a href="${pageContext.request.contextPath}/product">
                        Tạo sản phẩm mới
         </a>
         |
   </security:authorize>
  
  <security:authorize  access="hasRole('ROLE_MANAGER')">
         <a href="${pageContext.request.contextPath}/newemployee">
                        Tạo nhân viên mới
         </a>
         |
   </security:authorize>
</div>