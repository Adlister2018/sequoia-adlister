<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <h1>Here Are all the ads!</h1>
<%--full page--%>
        <div class="well">
            <%--container for the search--%>
            <div class="container">
                <div>Welcome to Adlister</h1>
                    <p >Start searching for ads right now</p>
                    <form action="/search">
                        <input type="text" name="term" class="form-control" placeholder="Search...">
                    </form>
                </div>
            </div>

            <%--Container for the Ads--%>
            <div class="container">
                <div class="row">
                    <%--<div class="col-lg-12 text-center">--%>
                <c:forEach var="ad" items="${ads}">
                    <div class="col-lg-4">
                        <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                        <h5 class="card-title">${ad.title}</h5>
                        <p class="card-text">${ad.description}.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
        </div>
</body>
</html>
