<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-fixed-top nav-color">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <%--<a class="navbar-brand" href="/ads">Adlister</a>--%>
            <a class="navbar-brand" href="/index.jsp ">Adlister</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <li>
                        <button class="btn btn-link" data-toggle="modal" data-target="#myModal">Login</button>
                    </li>
                    <li>
                        <button class="btn btn-link" data-toggle="modal" data-target="#myModalRegister">Register</button>
                    </li>
                    <li><a href="/ads">All Ads</a></li>
                </c:when>
                <c:when test="${sessionScope.user != null}">
                    <form class="navbar-form navbar-right" action="/search">
                        <input type="text" name="term" class="form-control" placeholder="Search...">
                    </form>

                    <li><a href="/profile?id=${sessionScope.user.id}">My Ads</a></li>

                    <li><a href="/ads">All Ads</a></li>
                    <li><a href="/search ">Search</a></li>


                    <li><a href="/ads/create">Create</a></li>
                    <li><a href="/logout">Logout</a></li>

                </c:when>

            </c:choose>
        </ul>


    </div><!-- /.navbar-collapse -->
</nav>

    <!-- Modal Register-->
    <div class="modal fade" id="myModalRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelReg">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form action="/register" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input id="username" name="username" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input id="email" name="email" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input id="password" name="password" class="form-control" type="password">
                        </div>
                        <div class="form-group">
                            <label for="confirm_password">Confirm Password</label>
                            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
                        </div>
                        <input type="submit" class="btn btn-primary btn-block btn-width">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>