<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Trang chủ</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
 
   <jsp:include page="_header.jsp" />
   <jsp:include page="_menu.jsp" />
 
   <div class="page-title">Chào mừng bạn đã đến với cửa hàng</div>
  
   <div class="demo-container">
   
   <img src="img/logo.jpg" >
  
  
   </div>
  
  
   <jsp:include page="_footer.jsp" />
 
</body>
</html>