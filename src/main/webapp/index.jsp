<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to the lister site" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <!-- Modal Login -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Login</h4>
                </div>
                <div class="modal-body">
                    <form action="/login" method="POST">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input id="username" name="username" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input id="password" name="password" class="form-control" type="password">
                        </div>
                        <input type="submit" class="btn btn-primary btn-block btn-width" value="Log In">
                    </form>
                </div>
            </div>
        </div>
    </div>



    <%--Adlister Main Page--%>

    <%--Search--%>

    <h1 class="hero-maintext">Welcome to Adlister</h1>
    <p class="hero-maintext hero-subtext">Start searching for ads right now</p>
        <form class="navbar-form hero-maintext hero-subtext hero-form" action="/search">
            <input type="text" name="term" class="form-control" placeholder="Search...">
        </form>
<%--Banner--%>
    <div class="jumbotron img-wrapper">
        <div class="video-container landing-img">
            <video autoplay loop class="fillWidth">
                    <source src="image/Cinema_Paradiso/Cinema_Paradiso.mp4" type="video/mp4" />Your browser does not support the video tag. I suggest you upgrade your browser.
                    <source src="image/Cinema_Paradiso/Cinema_Paradiso.webm" type="video/webm" />Your browser does not support the video tag. I suggest you upgrade your browser.
            </video>
                <div class="poster hidden">
                    <img src="image/Cinema_Paradiso/Cinema_Paradiso.jpg" alt="">
                </div>
        </div>
    </div>
    <%--Must Resean--%>

    <div class="container">
        <div class="container marketing">
            <!-- Three columns of text below the carousel -->
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h1>Most Recent Ads</h1>
                    <p>Discover more Ads by clicking on all ads</p>
                </div>

                <c:forEach var="ad" items="${ads}">

                    <div class="col-lg-4">
                        <%--<img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">--%>
                        <h2>${ad.title}</h2>
                        <p>${ad.description}.</p>
                        <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
                    </div><!-- /.col-lg-4 -->
                </c:forEach>

            </div><!-- /.row -->

            <!-- START THE FEATURETTES -->

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
                    <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                </div>
                <div class="col-md-5">
                    <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                </div>
            </div>

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->

            <!-- FOOTER -->
            <footer>
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </footer>

        </div>
    </div><!-- /.container -->
    <script type="text/javascript" src="js/adlister.js"></script>

</body>
</html>
