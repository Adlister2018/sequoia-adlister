<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All My The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbaruser.jsp" />

<div class="container">
    <h1>Here Are all My ads!</h1>

    <c:forEach var="ads" items="${ads}">
        <div class="col-md-6">
            <h2>${ads.user_id}</h2>
            <p>${ads.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
