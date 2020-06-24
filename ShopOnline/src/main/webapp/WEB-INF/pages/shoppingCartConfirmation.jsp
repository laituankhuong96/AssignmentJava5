<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Xác nhận giỏ hàng</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
  <jsp:include page="_header.jsp" />
 
  <jsp:include page="_menu.jsp" />
 
  <fmt:setLocale value="en_US" scope="session"/>
 
  <div class="page-title">Xác nhận giỏ hàng</div>
 
 
 
  <div class="customer-info-container">
      <h3>Thông tin khách hàng:</h3>
      <ul>
          <li>Họ và tên: ${myCart.customerInfo.name}</li>
          <li>Email: ${myCart.customerInfo.email}</li>
          <li>Số điện thoại: ${myCart.customerInfo.phone}</li>
          <li>Địa chỉ: ${myCart.customerInfo.address}</li>
      </ul>
      <h3>Tóm tắt:</h3>
      <ul>
          <li>Số lượng: ${myCart.quantityTotal}</li>
          <li>Tổng tiền tất cả:
          <span class="total">
            <fmt:formatNumber value="${myCart.amountTotal}" type="currency"/>
          </span></li>
      </ul>
  </div>
 
  <form method="POST"
      action="${pageContext.request.contextPath}/shoppingCartConfirmation">
 
      <!-- Edit Cart -->
      <a class="navi-item"
          href="${pageContext.request.contextPath}/shoppingCart">Chỉnh sửa giỏ hàng</a>
 
      <!-- Edit Customer Info -->
      <a class="navi-item"
          href="${pageContext.request.contextPath}/shoppingCartCustomer">Chỉnh sửa thông tin</a>
 
      <!-- Send/Save -->
      <input type="submit" value="Gửi" class="button-send-sc" />
  </form>
 
  <div class="container">
 
      <c:forEach items="${myCart.cartLines}" var="cartLineInfo">
          <div class="product-preview-container">
              <ul>
                  <li><img class="product-image"
                      src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" /></li>
                  <li>Mã sản phẩm: ${cartLineInfo.productInfo.code} <input
                      type="hidden" name="code" value="${cartLineInfo.productInfo.code}" />
                  </li>
                  <li>Tên sản phẩm: ${cartLineInfo.productInfo.name}</li>
                  <li>Giá thành: <span class="price">
                     <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
                  </span>
                  </li>
                  <li>Số lượng: ${cartLineInfo.quantity}</li>
                  <li>Tổng tiền:
                    <span class="subtotal">
                       <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
                    </span>
                  </li>
              </ul>
          </div>
      </c:forEach>
 
  </div>
 
  <jsp:include page="_footer.jsp" />
 
</body>
</html>