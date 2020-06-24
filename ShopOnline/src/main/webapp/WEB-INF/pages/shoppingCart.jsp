<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Giỏ hàng</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
   <jsp:include page="_header.jsp" />
  
   <jsp:include page="_menu.jsp" />
  
   <fmt:setLocale value="en_US" scope="session"/>
 
   <div class="page-title">Giỏ hàng của tôi</div>
 
   <c:if test="${empty cartForm or empty cartForm.cartLines}">
       <h2>Không có mục nào trong giỏ hàng</h2>
       <a href="${pageContext.request.contextPath}/productList">Xem danh sách sản phẩm</a>
   </c:if>
 
   <c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
       <form:form method="POST" modelAttribute="cartForm"
           action="${pageContext.request.contextPath}/shoppingCart">
 
           <c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
               varStatus="varStatus">
               <div class="product-preview-container">
                   <ul>
                       <li><img class="product-image"
                           src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" />
                       </li>
                       <li>Mã sản phẩm: ${cartLineInfo.productInfo.code} <form:hidden
                               path="cartLines[${varStatus.index}].productInfo.code" />
 
                       </li>
                       <li>Tên sản phẩm: ${cartLineInfo.productInfo.name}</li>
                       <li>Giá bán: <span class="price">
                      
                         <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
                        
                       </span></li>
                       <li>Số lượng: <form:input
                               path="cartLines[${varStatus.index}].quantity" /></li>
                       <li>Tổng tiền:
                         <span class="subtotal">
                        
                            <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
                      
                         </span>
                       </li>
                       <li><a
                           href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
                               Xóa sản phẩm </a></li>
                   </ul>
               </div>
           </c:forEach>
           <div style="clear: both"></div>
           <input class="button-update-sc" type="submit" value="Cập nhật" />
           <a class="navi-item"
               href="${pageContext.request.contextPath}/shoppingCartCustomer">Tiếp tục điền thông tin</a>
           <a class="navi-item"
               href="${pageContext.request.contextPath}/productList">Tiếp tục mua hàng</a>
       </form:form>
 
 
   </c:if>
 
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>