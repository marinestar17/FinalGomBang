<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>GomBang - Administrator</title>
    <!-- Favicon -->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon">
 
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" />

    <!-- Bootstrap Core Css -->
    <link href="resources/adminBoot/assets/plugins/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />

    <!-- Font Awesome Css -->
    <link href="resources/adminBoot/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="resources/adminBoot/assets/css/style.css" rel="stylesheet" />
    
     <!-- Google Icon -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    
</head>
<body class="fp-page"> 
    <div class="fp-form-area">
        <h1><b>GomBang</b> - 관리자</h1> 
        <div class="fp-top-info">관리자 ID를 입력하세요.</div>
        <div class="row padding-15">
            <div class="col-sm-2 col-md-2 col-lg-4"></div>
            <div class="col-sm-8 col-md-8 col-lg-4">
                <form id="frmForgotPassword" method="post">
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" placeholder="ID" name="admin_ID" id="admin_ID" required />
                        <!-- <span class="glyphicon glyphicon-envelope form-control-feedback"></span> -->
                      		 <span class="glyphicon glyphicon-user form-control-feedback"></span>
                     </div>
                     <div class="form-group has-feedback">
                      	<input type = "text" class = "form-control" placeholder="Email" name="admin_Email" id="admin_Email" required />
                      		 <span class="glyphicon glyphicon-envelope form-control-feedback"></span> 
                    </div>
                    <button type="button" id = "findButton" class="btn btn-success btn-block btn-flat">확인</button>
                </form>
            </div>
            <div class="col-sm-2 col-md-2 col-lg-4"></div>
        </div> 
    </div>
   <!--  <div class="fp-right-image">
        <div class="background-layer"></div>
        <div class="copyright-info">
            This photo taken from <b>Unsplash.com</b>
            <p><b>&copy; 2016-2017 AdminBSB - Sensitive</b>. All rights reserved.</p>
        </div>
    </div> -->
    <div class="fp-bottom-info">
        <a href="addAdmin"><i class="fa fa-user-circle-o m-r-5"></i>관리자 추가</a>
        <a href="goAdminPage" class="pull-right">로그인 화면<i class="fa fa-user-circle-o m-l-5"></i></a>
    </div>

    <!-- Jquery Core Js -->
    <script src="resources/adminBoot/assets/plugins/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="resources/adminBoot/assets/plugins/bootstrap/dist/js/bootstrap.js"></script>

    <!-- Jquery Validation Js -->
    <script src="resources/adminBoot/assets/plugins/jquery-validation/dist/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="resources/adminBoot/assets/js/pages/examples/forgot-password.js"></script>
</body>
</html>
