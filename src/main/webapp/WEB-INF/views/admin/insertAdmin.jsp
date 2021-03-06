<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <c:if test="${sessionScope.admin == null}">
    <title>관리자 추가 | GomBangAdministrator</title>
    </c:if>
    <c:if test="${sessionScope.admin != null}">
   <title>GomBang - Administrator</title>
    </c:if>
    
    <!-- Favicon -->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" />

    <!-- Bootstrap Core Css -->
    <link href="resources/adminBoot/assets/plugins/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />

    <!-- Font Awesome Css -->
    <link href="resources/adminBoot/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <!-- iCheck Css -->
    <link href="resources/adminBoot/assets/plugins/iCheck/skins/square/_all.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="resources/adminBoot/assets/css/style.css" rel="stylesheet" />
</head>
<body class="sign-up-page">
    <div class="signup-form-area">
    	<c:if test="${sessionScope.admin == null }">
        <h1><b>GomBang</b> - Addition Account</h1>
        <div class="signup-top-info">Register a new Administrator</div>
        </c:if>
        <c:if test="${sessionScope.admin != null }">
        <h1><b>GomBang</b> - Information Modify</h1>
        <div class="signup-top-info">Update the Administrator Information</div>
        </c:if>
        <div class="row padding-15">
            <div class="col-sm-2 col-md-2 col-lg-4"></div>
            <div class="col-sm-8 col-md-8 col-lg-4">
            	<c:if test="${sessionScope.admin == null }">
                <form id="frmSignup" method="post" action = "insertAdmin">
                </c:if>
                <c:if test="${sessionScope.admin != null }">
                <form id="frmSignup" method="post" action = "updateAdmin">
                </c:if>
                    <div class="form-group has-feedback">
                    	<c:if test="${sessionScope.admin == null }">
                        <input type="text" class="form-control" minlength="3" placeholder="ID" name="admin_ID" id="admin_ID" required />
                        </c:if>
                        <c:if test="${sessionScope.admin != null }">
                        <input type="text" class="form-control" value = "${sessionScope.admin.admin_ID }" name="admin_ID" id="admin_ID" required readonly/>
                        </c:if>
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" placeholder="Name" name="admin_Name" value = "${sessionScope.admin.admin_Name }" id="admin_Name" required />
                        <span class="glyphicon glyphicon-bookmark form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" placeholder="Phone" name="admin_Phone" value = "${sessionScope.admin.admin_Phone }" id="admin_Phone" required />
                        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                    </div>
                     <div class="form-group has-feedback">
                        <input type="text" class="form-control" placeholder="Department" name="admin_Department" value = "${sessionScope.admin.admin_Department}"id="admin_Department" required />
                        <span class="glyphicon glyphicon-tag form-control-feedback"></span>
                    </div>
                     <div class="form-group has-feedback">
                        <input type="text" class="form-control" placeholder="Title" name="admin_Title" value = "${sessionScope.admin.admin_Title }" id="admin_Title" required />
                        <span class="glyphicon glyphicon-tag form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="email" class="form-control" placeholder="Email" name="admin_Email" value = "${sessionScope.admin.admin_Email }" id="admin_Email" required />
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Password" minlength="3" name="admin_PW" id="Password" required />
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback"> 
                        <input type="password" class="form-control" placeholder="Confirm Password" minlength="3" name="ConfirmPassword" id="ConfirmPassword" required />
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="form-group">
                        <div class="checkbox icheck m-l--20">
                        	<c:if test="${sessionScope.admin == null }">
                            <label><input type="checkbox" name="Terms" class="Terms" required> I READ THIS <a href="javascript:void(0);" data-toggle="modal" data-target="#termsModal">CONTENT.</a></label>
                            </c:if>
                        </div>
                    </div>
                    <div>
                    	<c:if test="${sessionScope.admin == null }">
                        <button type="submit" class="btn btn-success btn-block btn-flat">Additon Account</button>
                        </c:if>
                        <c:if test="${sessionScope.admin != null }">
                        <button type="submit" class="btn btn-success btn-block btn-flat">Information Modify</button>
                        </c:if>
                    </div>
                </form>
                <div class="social-media-area">
                    <!-- <span>OR</span>
                    <ul>
                        <li>
                            <a href="javascript:void(0);" class="facebook" data-toggle="tooltip" data-title="Facebook"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" class="twitter" data-toggle="tooltip" data-title="Twitter"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" class="google-plus" data-toggle="tooltip" data-title="Google Plus"><i class="fa fa-google-plus"></i></a>
                        </li>
                    </ul> -->
                </div>
            </div>
            <div class="col-sm-2 col-md-2 col-lg-4"></div>
        </div>
    </div>
    <!-- <div class="signup-right-image">
        <div class="background-layer"></div>
        <div class="copyright-info">  
            This photo taken from <b>Unsplash.com</b>
            <p><b>&copy; 2016-2017 AdminBSB - Sensitive</b>. All rights reserved.</p>
        </div>  
    </div> -->
    <div class="signup-bottom-info">
        <a href="goAdminPage"><i class="fa fa-user-circle-o m-r-5"></i>Log In Page</a>
    </div>

    <!-- Terms of Usage Modal -->
    <div class="modal fade" id="termsModal" tabindex="-1" role="dialog" aria-labelledby="termsModal-label">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="termsModal-label">Read This</h4>
                </div>
                <div class="modal-body">
                    <p>
                       1. You must Insert true Information.
                    </p>
                    <p>
                       2. Do not abuse Administrator Account.
                    </p>
                    <p>
                       3. Do not spill the Information what about this site.
                    </p>
                    <p>
                       4. You must this account for only task.
                    </p>
                    <p>
                       5. If you not observe 1-4, you will be charged from Enterprise.
                    </p>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
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
    <script src="resources/adminBoot/assets/js/pages/examples/signup.js"></script>
</body>
</html>
