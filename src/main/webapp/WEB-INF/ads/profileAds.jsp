<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile ads" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <c:forEach var="ad" items="${userAds}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>

            <a href="/ads/edit?id=${ad.id}"><button type="submit" class="btn btn-primary">Edit</button></a>
            <form method="post" action="/ads/delete?id=${ad.id}">
                <button type="submit" class="btn btn-primary">delete</button>
            </form>
        </div>
    </c:forEach>
.
    <%--</div>--%>
    <%--<div class="container">--%>
        <%--<h1 ><a href="/ads/create"> Create an Ad </a></h1>--%>
    <%--</div>--%>
    <%--<div class="container">--%>
        <%--<h1><a href="ads/indexUser">My Ads</a></h1>--%>
    <%--</div>--%>

</body>
</html>
