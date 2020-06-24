<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Hoàn thiện thanh toán</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
   <jsp:include page="_header.jsp" />
 
   <jsp:include page="_menu.jsp" />
 
   <div class="page-title">Đã lưu lại xác nhận</div>
  
   <div class="container">
       <h3>cảm ơn quý khách đã đặt hàng</h3>
       Số mã đơn hàng của bạn là: ${lastOrderedCart.orderNum}
   </div>
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>