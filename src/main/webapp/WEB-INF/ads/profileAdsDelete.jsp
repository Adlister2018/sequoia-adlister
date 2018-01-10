<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile ads Delete" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <h1>Create a new Ad ${sessionScope.user.username}</h1>


    <form action="/ads/delete" method="post">

            <c:forEach var="ad" items="${userAds}">


            <div class="col-md-6">
                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                        <input type="hidden" name="id" value="${ad.id}"
                    <div class="custom-control custom-checkbox">
                        <label class="custom-control-label" for="customCheck1"><h2>${ad.title}</h2></label>
                        <p>${ad.description}</p>
                    </div>
            </div>
            </c:forEach>
                        <button type="submit" class="btn btn-primary">Submit</button>

        </form>


    <%--</div>--%>
    <%--<div class="container">--%>
        <%--<h1 ><a href="/ads/create"> Create an Ad </a></h1>--%>
    <%--</div>--%>
    <%--<div class="container">--%>
        <%--<h1><a href="ads/indexUser">My Ads</a></h1>--%>
    <%--</div>--%>

</body>
</html>
