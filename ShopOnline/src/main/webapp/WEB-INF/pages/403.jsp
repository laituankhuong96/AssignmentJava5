<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Từ chối truy cập này</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
 
   <jsp:include page="_header.jsp" />
   <jsp:include page="_menu.jsp" />
 
   <div class="page-title">Không truy cập được</div>
  
   <h3 style="color:red;">Xin lỗi, bạn không thể vào truy cập này!</h3>
  
  
   <jsp:include page="_footer.jsp" />
 
</body>
</html>