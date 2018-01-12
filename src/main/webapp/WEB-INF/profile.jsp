<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <%--The container starts--%>

    <div class="container">

<%-- The head shot of the Profile--%>

       <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main center profile--top">
        <h1 class="page-header">Welcome, ${sessionScope.user.username}!</h1>
        <%--the banner and face pic--%>
            <div class="card hovercard">
                <div class="card-background">
                <img class="card-bkimg" alt="" src="http://lorempixel.com/100/100/people/9/">
                <!-- http://lorempixel.com/850/280/people/9/ -->
            </div>
                <div class="useravatar">
                <img alt="" src="http://lorempixel.com/100/100/people/9/">
                </div>

            </div>
<%------------------------------%>


           <div class="well">
<%------------------Social Media tabs--%>
               <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
                   <div class="btn-group" role="group">
                       <button type="button" id="stars" class="btn btn-primary" href="https://www.facebook.com/TheEntWorld/" data-toggle="tab"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                           <div class="hidden-xs">Facebook</div>
                       </button>
                   </div>
                   <div class="btn-group" role="group">
                       <button type="button" id="favorites" class="btn btn-default" href="https://www.instagram.com/theentrepreneurialworld/" data-toggle="tab"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
                           <div class="hidden-xs">Instagram</div>
                       </button>
                   </div>
                   <div class="btn-group" role="group">
                       <button type="button" id="following" class="btn btn-default" href="https://twitter.com/TheEntWorld" data-toggle="tab"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                           <div class="hidden-xs">Twitter</div>
                       </button>
                   </div>
               </div>
<%------------------Social Media ends--%>
<%--The Ads section--%>
               <h3>My Ads</h3>
                    <div class="row">
                        <c:forEach var="ad" items="${ads}">
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <%--<img src="..." alt="...">--%>
                                    <div class="caption">
                                            <%--The information from the Dao--%>
                                        <h4>${ad.title}</h4>
                                        <p>${ad.description}</p>
                                        <p><a href="/ads/edit?id=${ad.id}" class="btn btn-primary" role="button">Edit</a>
                                            <form method="post" action="/ads/delete?id=${ad.id}">
                                            <button type="submit" class="btn btn-primary">delete</button>
                                            </form>
                                        </p>
                                    </div>
                                </div>
                            </div>
                       </c:forEach>
                    </div>
<%-- The ad section ends--%>
           </div>
       </div>
    </div>
</body>

</html>
