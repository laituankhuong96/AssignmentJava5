<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"  %>

<!DOCTYPE html>
<html>
<head>

 
<title>Thông tin tài khoản</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
 
</head>
<body>
 
 
   <jsp:include page="_header.jsp" />
   <jsp:include page="_menu.jsp" />
 
   <div class="page-title">Thông tin tài khoản</div>
 
   <div class="account-container">
 
 
       <ul>
           <li>Tài khoản: ${pageContext.request.userPrincipal.name}</li>
           <li>Cấp bậc:
               <ul>
                   <c:forEach items="${userDetails.authorities}" var="auth">
                       <li>${auth.authority }</li>
                   </c:forEach>
               </ul>
           </li>
       </ul>
   </div>
 
 
   <jsp:include page="_footer.jsp" />
 
</body>
</html>