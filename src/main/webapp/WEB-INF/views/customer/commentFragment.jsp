<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="resources/user/js/jquery-2.2.0.min.js"></script>
<script src="resources/user/js/bootstrap.min.js"></script>
<script src="resources/user/js/bootstrap-submenu.js"></script>
<script src="resources/user/js/rangeslider.js"></script>
<script src="resources/user/js/jquery.mb.YTPlayer.js"></script>
<script src="resources/user/js/wow.min.js"></script>
<script src="resources/user/js/bootstrap-select.min.js"></script>
<script src="resources/user/js/jquery.easing.1.3.js"></script>
<script src="resources/user/js/jquery.scrollUp.js"></script>
<script src="resources/user/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="resources/user/js/leaflet.js"></script>
<script src="resources/user/js/leaflet-providers.js"></script>
<script src="resources/user/js/leaflet.markercluster.js"></script>
<script src="resources/user/js/dropzone.js"></script>
<script src="resources/user/js/jquery.filterizr.js"></script>
<script src="resources/user/js/jquery.magnific-popup.min.js"></script>
<script src="resources/user/js/maps.js"></script>
<script src="resources/user/js/app.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="resources/user/js/ie10-viewport-bug-workaround.js"></script>
<!-- Custom javascript -->
<script src="resources/user/js/ie10-viewport-bug-workaround.js"></script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0N5pbJN10Y1oYFRd0MJ_v2g8W2QT74JE"></script>
</head>
                    <!-- Properties comments start -->
                    <div class="properties-comments mb-40">
                        <!-- Comments section start -->
                        <div class="comments-section">
                            <!-- Main Title 2 -->
                            <div class="main-title-2">
                                <h1><span>Comments </span> Section!</h1>
                            </div>
							<!-- cf:foreach 쓰는 부분 -->
							<c:forEach var="customerCommentList" items="${customerCommentList2}">
							
                            <ul class="comments">
                                <li>
                                    <div class="comment">
                                        <!-- <div class="comment-author">
                                            <a href="#">
                                                <img src="http://placehold.it/60x60" alt="avatar-5">
                                            </a>
                                        </div> -->
                                        <div class="comment-content">
                                            <div class="comment-meta">
                                                <%-- <div class="comment-meta-author">
                                                    ${customerCommentList.customerComment_Title}
                                                </div> --%>
                                                <div class="comment-meta-reply">
                                                    <a href="#">Reply</a>
                                                </div>
                                                <div class="comment-meta-date">
                                                    <span class="hidden-xs">${customerCommentList.customerComment_Indate}</span>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="comment-body">
                                                ${customerCommentList.customerComment_Content}
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>    
                        </div>
                        
                        <!-- Comments section end -->
                    </div>
                    <!-- Properties comments end -->
                    