<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8"/>
	    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	   <title>GomBang - Administrator</title>
	    <!-- Favicon -->
	    <link rel="icon" href="../../favicon.ico" type="image/x-icon">
	
	    <!-- Google Fonts -->
	    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet"/>
	
	    <!-- Bootstrap Core Css -->
	    <link href="resources/adminBoot/assets/plugins/bootstrap/dist/css/bootstrap.css" rel="stylesheet"/>
	
	    <!-- Font Awesome Css -->
	    <link href="resources/adminBoot/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
	
	    <!-- Custom Css -->
	    <link href="resources/adminBoot/assets/css/style.css" rel="stylesheet"/>
	</head>
<body class="locked-screen">
    <div class="watch"></div>
    <div class="date"></div>

    <div class="lockscreen-area clearfix">
        <div class="name">${sessionScope.admin.admin_Name}</div>
        <div class="form">
            <form action = "screenLockClear" method = "post">
                <div class="form-group has-feedback">
                	<input type = "hidden" value = "${sessionScope.admin.admin_ID}" name = "admin_ID">
                    <input type="password" name = "admin_PW" placeholder="Unlock Password" required/>
                    <span class="fa fa-arrow-right form-control-feedback"></span>
                </div>
                 <font color = "red">${lockWrong}</font>
            </form>
        </div>
    </div>
    <div class="profile-image">
        <img src="resources/adminBoot/assets/images/avatars/face2.jpg"/>
    </div>
    <div class="notification-area">
        <ul>
            <li><i class="fa fa-envelope-o"></i> ?</li>
            <li><i class="fa fa-comment-o"></i> ?</li>
        </ul>
    </div>

    <!-- Jquery Core Js -->
    <script src="resources/adminBoot/assets/plugins/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="resources/adminBoot/assets/plugins/bootstrap/dist/js/bootstrap.js"></script>

    <!-- Momentjs -->
    <script src="resources/adminBoot/assets/plugins/moment/moment.js"></script>

    <!-- Custom Js -->
    <script src="resources/adminBoot/assets/js/pages/examples/locked-screen.js"></script>
</body>
</html>
