<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-fixed-top nav-color">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <%--<a class="navbar-brand" href="/ads">Adlister</a>--%>
            <a class="navbar-brand" href="/">Adlister</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <li><a href="/login">Login</a></li>
                    <%--<li><a href="/logout">Logout</a></li>--%>
                    <li><a href="/register">Register</a></li>
                    <li><a href="/ads">All Ads</a></li>
                </c:when>
                <c:when test="${sessionScope.user != null}">
                    <form class="navbar-form navbar-right" action="/search">
                        <input type="text" name="term" class="form-control" placeholder="Search...">
                    </form>

                    <li><a href="/profile?id=${sessionScope.user.id}">My Profile/Ads</a></li>

                    <li><a href="/ads">All Ads</a></li>
                    <%--<li><a href="/search ">Search</a></li>--%>


                    <li><a href="/ads/create">Create</a></li>
                    <li><a href="/logout">Logout</a></li>

                    <%--<li><a href="/adsUser">My Ads</a></li>--%>
                </c:when>

            </c:choose>
        </ul>


    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
