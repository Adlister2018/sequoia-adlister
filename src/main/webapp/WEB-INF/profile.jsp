<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
    <%--<div class="container">--%>
        <%--&lt;%&ndash;<h1 ><a href="/ads/create"> Create an Ad </a></h1>&ndash;%&gt;--%>
    <%--</div>--%>
    <%--<div class="container">--%>
        <%--<h1><a href="/ads/profileAds?id=${sessionScope.user.id}">My Ads</a></h1>--%>
    <%--</div>--%>

</body>
</html>
