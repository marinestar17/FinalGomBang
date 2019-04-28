<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>GomBang - Administrator</title>
    <!-- Favicon -->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet"/>

    <!-- Bootstrap Core Css -->
    <link href="resources/adminBoot/assets/plugins/bootstrap/dist/css/bootstrap.css" rel="stylesheet"/>

    <!-- Font Awesome Css -->
    <link href="resources/adminBoot/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>

    <!-- iCheck Css -->
    <link href="resources/adminBoot/assets/plugins/iCheck/skins/square/_all.css" rel="stylesheet"/>

    <!-- Custom Css -->
    <link href="resources/adminBoot/assets/css/style.css" rel="stylesheet"/>
    
    <!-- Google Icon -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    
</head>
<body class="sign-in-page">
    <div class="signin-form-area">
        <h1><b>GomBang</b> - Administrator</h1>
        <div class="signin-top-info">Check Account</div>
        <div class="row padding-15">
            <div class="col-sm-2 col-md-2 col-lg-4"></div>
            <div class="col-sm-8 col-md-8 col-lg-4">
                <form id="frmSignin" method="post" action="adminLogin">
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" placeholder="ID" name="admin_ID" id="Email" required/>
                       <!--  <span class="glyphicon glyphicon-envelope form-control-feedback"></span> -->
                     		 <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div> 
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Password" name="admin_PW" id="Password"
                               required/>
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck m-l--20">
                                <label><input type="checkbox">Remember</label><br>
                                <font color="red">${ok}</font>
                                <font color="red">${error}</font>
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-success btn-block btn-flat">Log In</button>
                            
                        </div>
                    </div>
                </form>
                <div class="social-media-area">
                   <!--  <span>OR</span>
                    <ul>
                        <li>
                            <a href="javascript:void(0);" class="facebook" data-toggle="tooltip" data-title="Facebook">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" class="twitter" data-toggle="tooltip" data-title="Twitter">
                                <i class="fa fa-twitter"></i>
                            </a>     
                        </li>
                        <li>
                            <a href="javascript:void(0);" class="google-plus" data-toggle="tooltip"
                               data-title="Google Plus">
                                <i class="fa fa-google-plus"></i>
                            </a>
                        </li>
                    </ul> -->
                </div>
            </div>
            <div class="col-sm-2 col-md-2 col-lg-4"></div>
        </div>
    </div>
   <!--  <div class="signin-right-image">
        <div class="background-layer"></div> 
        <div class="copyright-info">
            This photo taken from <b>Unsplash.com</b>
            <p><b>&copy; 2016-2017 AdminBSB - Sensitive</b>. All rights reserved.</p>
        </div>
    </div> -->
    <div class="signin-bottom-info">
        <a href="addAdmin">
            <i class="fa fa-user-circle-o m-r-5"></i>Additon Account
        </a>
        <a href="adminPassword" class="pull-right">Forget Password
            <i class="fa fa-unlock m-l-5 font-14"></i>
        </a>
    </div> 

    <!-- Jquery Core Js -->
    <script src="resources/adminBoot/assets/plugins/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="resources/adminBoot/assets/plugins/bootstrap/dist/js/bootstrap.js"></script>

    <!-- iCheck Js -->
    <script src="resources/adminBoot/assets/plugins/iCheck/icheck.js"></script>

    <!-- Jquery Validation Js -->
    <script src="resources/adminBoot/assets/plugins/jquery-validation/dist/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="resources/adminBoot/assets/js/pages/examples/signin.js"></script>
</body>
</html>
