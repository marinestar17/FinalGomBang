<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Morris | AdminBSB - Sensitive</title>
    <!-- Favicon -->
    <link rel="icon" href="resources/adminBoot/favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="resources/adminBoot/assets/plugins/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />

    <!-- Animate.css Css -->
    <link href="resources/adminBoot/assets/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Font Awesome Css -->
    <link href="resources/adminBoot/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <!-- iCheck Css -->
    <link href="resources/adminBoot/assets/plugins/iCheck/skins/flat/_all.css" rel="stylesheet" />

    <!-- Switchery Css -->
    <link href="resources/adminBoot/assets/plugins/switchery/dist/switchery.css" rel="stylesheet" />

    <!-- Metis Menu Css -->
    <link href="resources/adminBoot/assets/plugins/metisMenu/dist/metisMenu.css" rel="stylesheet" />

    <!-- Jquery Datatables Css -->
    <link href="resources/adminBoot/assets/plugins/DataTables/media/css/dataTables.bootstrap.css" rel="stylesheet" />

    <!-- Pace Loader Css -->
    <link href="resources/adminBoot/assets/plugins/pace/themes/white/pace-theme-flash.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="resources/adminBoot/assets/css/style.css" rel="stylesheet" />

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="resources/adminBoot/assets/css/themes/allthemes.css" rel="stylesheet" />

    <!-- Demo Purpose Only -->
    <link href="resources/adminBoot/assets/css/demo/setting-box.css" rel="stylesheet" />
</head>
<body>
    <div class="all-content-wrapper">
        <!-- Top Bar -->
        <header>
            <nav class="navbar navbar-default">
                <!-- Search Bar -->
                <div class="search-bar">
                    <div class="search-icon">
                        <i class="material-icons">search</i>
                    </div>
                    <input type="text" placeholder="Start typing...">
                    <div class="close-search js-close-search">
                        <i class="material-icons">close</i>
                    </div>
                </div>
                <!-- #END# Search Bar -->

                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                            <i class="material-icons">swap_vert</i>
                        </button>
                        <a href="javascript:void(0);" class="left-toggle-left-sidebar js-left-toggle-left-sidebar">
                            <i class="material-icons">menu</i>
                        </a>
                        <!-- Logo -->
                        <a class="navbar-brand" href="GomBangAdmin">
                            <span class="logo-minimized">G.B</span>
                            <span class="logo">GomBang-Administrator</span>
                        </a>
                        <!-- #END# Logo -->
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="javascript:void(0);" class="toggle-left-sidebar js-toggle-left-sidebar">
                                    <i class="material-icons">menu</i>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <!-- Call Search -->
                            <!-- #END# Fullscreen Request -->
                            <!-- Email -->
                            <!-- #END# Email -->
                            <!-- Notifications -->
                            <!-- #END# Notifications -->
                            <!-- Tasks -->
                            <!-- #END# Tasks -->
                            <!-- User Menu -->
                            <li class="dropdown user-menu">
                                <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="resources/adminBoot/assets/images/avatars/face2.jpg" alt="User Avatar" />
                                    <span class="hidden-xs">${sessionScope.admin.admin_Name }</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">
                                        <img src="resources/adminBoot/assets/images/avatars/face2.jpg" alt="User Avatar" />
                                        <div class="user">
                                            ${sessionScope.admin.admin_Name }
                                            <div class="title">Front-end Developer</div>
                                        </div>
                                    </li>
                                    <li class="body">
                                        <ul>
                                            <li>
                                                <a href="resources/adminBoot/pages/miscellaneous/profile.html">
                                                    <i class="material-icons">account_circle</i> 프로필
                                                </a>
                                            </li>
                                            <li>
                                                <a href="addAdmin">
                                                    <i class="material-icons">lock_open</i> 개인정보수정
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="footer">
                                        <div class="row clearfix">
                                            <div class="col-xs-5">
                                                <a href="lockScreen" class="btn btn-default btn-sm btn-block">로그오프</a>
                                            </div>
                                            <div class="col-xs-2"></div>
                                            <div class="col-xs-5">
                                                <a href="adminLogout" class="btn btn-default btn-sm btn-block">로그아웃</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- #END# User Menu -->
                            <li class="pull-right">
                                <a href="javascript:void(0);" class="js-right-sidebar" data-close="true">
                                    <i class="material-icons">more_vert</i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- #END# Top Bar -->
        <!-- Left Menu -->
       <aside class="sidebar">
            <nav class="sidebar-nav">
                <ul class="metismenu">
                    <li class="title">
                        MAIN NAVIGATION
                    </li>
                    <li class="active">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">dashboard</i>
                            <span class="nav-label">GomBang</span>
                        </a>
                        <ul>
                            <li>
                                <a href="GomBangAdmin">메인 페이지</a>
                            </li>
                            <li >
                                <a href="#">관리자</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">widgets</i>
                            <span class="nav-label">관리자 기본 메뉴</span>
                        </a>
                        <ul>
                          
                            <li>
                                <a href="adminMessage">관리자 메세지</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">assignment</i>
                            <span class="nav-label">문의/질의/게시판</span>
                        </a>
                        <ul>
                            <li>
                                <a href="adminEnterpriseBoardList">기업 문의</a>
                            </li>
                            <li>
                                <a href="adminCustomerBoardList">고객 게시판</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">view_list</i>
                            <span class="nav-label">각 항목 리스트</span>
                        </a>
                        <ul>
                             <li>
                                <a href="customerList">고객 리스트</a>
                            </li>
                            <li>
                                <a href="allEnterprisePrint">기업 리스트</a>
                            </li>
                            <li>
                                <a href="adminItemList">매물 리스트</a>
                            </li>
                            <li>
                                <a href="adminReservationList">예약 리스트</a>
                            </li>
                            <li>
                                <a href="adminTradeList">거래완료 리스트</a>
                            </li>
                        </ul>
                    </li>
                   
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">pie_chart</i>
                            <span class="nav-label">통계자료</span>
                        </a>
                         <ul>
                            <li>
                                <a href="javascript:void(0);" class="menu-toggle">기업 관련 통계 </a>
                                	<ul>
                                		<li>
                                			 <a href="staticEnterprisePage" >통계 지표 확인 </a>
                                		</li>
                                	</ul>
                            </li>
                            <li>
                               <a href="javascript:void(0);" class="menu-toggle"> 일반 고객 통계 </a>
                                	<ul>
                                		<li>
                                			 <a href="staticCustomerPage" > 통계 지표 확인</a>
                                		</li>
                                	</ul>
                            </li>
                           <li>
                               <a href="javascript:void(0);" class="menu-toggle"> 매물 통계 </a>
                                	<ul>
                                		<li>
                                			 <a href="staticForSalePage" >통계 지표 확인</a>
                                		</li>
                                	</ul>
                            </li>
                            <li>
                               <a href="javascript:void(0);" class="menu-toggle">게시물 통계</a>
                                	<ul>
                                		<li>
                                			 <a href="staticBoardPage" > 통계 지표 확인 </a>
                                		</li>
                                	</ul>
                            </li>
                            <li>
                               <a href="javascript:void(0);" class="menu-toggle">예약 거래 통계</a>
                                	<ul>
                                		<li>
                                			 <a href="staticReservationPage" >통계 지표 확인</a>
                                		</li>
                                	</ul>
                            </li>
                        </ul> 
                    </li>
                    
                </ul>
            </nav>
        </aside>
        <!-- #END# Left Menu -->
        <!-- Right Sidebar -->
        <aside class="right-sidebar">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#tab_overview" data-toggle="tab">OVERVIEW</a></li>
                <li role="presentation"><a href="#tab_settings" data-toggle="tab">SETTINGS</a></li>
            </ul>
            <div class="tab-content">
                <div class="right-sidebar-close">
                    <i class="fa fa-times"></i>
                </div>
                <div role="tabpanel" class="tab-pane fade in active" id="tab_overview">
                    <div class="tab-container">
                        <label>UPCOMING EVENTS</label>
                        <ul>
                            <li>
                                <b class="display-block">Business Meeting</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Dinner With John</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Deadline Project For E-Commerce</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Last Check For E-Comerce</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Ask For Vacation</b> Lorem ipsum dolor sit amet
                            </li>
                        </ul>

                        <label>TODO LIST</label>
                        <ul>
                            <li>
                                <b class="display-block">Get To Know More HTML5</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Get To Know More CSS3 - Transitions</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Learn AngularJS</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Learn AngularJS Routing</b> Lorem ipsum dolor sit amet
                            </li>
                            <li>
                                <b class="display-block">Get To Know More jQuery v3</b> Lorem ipsum dolor sit amet
                            </li>
                        </ul>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="tab_settings">
                    <div class="tab-container">
                        <label>GENERAL SETTINGS</label>
                        <ul>
                            <li>
                                <span>Report Panel Usage</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" checked />
                                </div>
                            </li>
                            <li>
                                <span>Email Redirect</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" />
                                </div>
                            </li>
                        </ul>

                        <label>SYSTEM SETTINGS</label>
                        <ul>
                            <li>
                                <span>Notifications</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" checked />
                                </div>
                            </li>
                            <li>
                                <span>Auto Updates</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" checked />
                                </div>
                            </li>
                        </ul>

                        <label>ACCOUNT SETTINGS</label>
                        <ul>
                            <li>
                                <span>Offline</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" />
                                </div>
                            </li>
                            <li>
                                <span>Location Permission</span>
                                <div class="switch">
                                    <input type="checkbox" class="js-switch" data-size="small" checked />
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </aside>
        <!-- #END# Right Sidebar -->
        <section class="content">
            <div class="page-heading">
                <h1>매물 통계</h1>  
                <ol class="breadcrumb">
                    <li><a href="GomBangAdmin">메인화면</a></li>
                    <li><a href="javascript:void(0);">통계자료</a></li>
                    <li class="active">매물</li>
                </ol>
            </div>
            <div class="page-body">
                <div class="row clearfix">
                    <!-- Line Chart -->
                    <!-- #END# Line Chart -->
                    <!-- Bar Chart -->
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                         <div class="panel panel-default">
                            <div class="panel-heading">매물 종류 통계 </div>
                            <div class="panel-body">
                                <div id="donut_chart2"></div>
                            </div> 
                        </div> 
                    </div>
                    
                     <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                         <div class="panel panel-default">
                            <div class="panel-heading">기업별 등록 매물 수 </div>
                            <div class="panel-body">
                                <div id="bar_chart"></div>
                            </div> 
                        </div> 
                    </div>
                    <!-- #END# Bar Chart -->
                    <!-- Area Chart -->
                    <!-- #END# Area Chart -->
                    <!-- Donut Chart -->
                      <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                       	 <div class="panel panel-default">
                            <div class="panel-heading">임대/판매 통계</div>
                            <div class="panel-body">
                                <div id="donut_chart"></div>
                            </div>
                        </div>
                   	  </div>
               			
                    <!-- #END# Donut Chart -->
                </div>
            </div>
        </section>
        <!-- Footer -->
        <footer>
            <div class="container-fluid">
                <div class="row clearfix">
                    <div class="col-sm-6">
                        Copyright &copy; 2017, <b>AdminBSB - Sensitive</b>
                    </div>
                    <div class="col-sm-6 align-right">
                        Hand-crafted & Made with love :)
                    </div>
                </div>
            </div>
        </footer>
        <!-- #END# Footer -->
    </div>

    <!-- Jquery Core Js -->
    <script src="resources/adminBoot/assets/plugins/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="resources/adminBoot/assets/plugins/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Pace Loader Js -->
    <script src="resources/adminBoot/assets/plugins/pace/pace.js"></script>

    <!-- Screenfull Js -->
    <script src="resources/adminBoot/assets/plugins/screenfull/src/screenfull.js"></script>

    <!-- Metis Menu Js -->
    <script src="resources/adminBoot/assets/plugins/metisMenu/dist/metisMenu.js"></script>

    <!-- Jquery Slimscroll Js -->
    <script src="resources/adminBoot/assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Switchery Js -->
    <script src="resources/adminBoot/assets/plugins/switchery/dist/switchery.js"></script>

    <!-- Morris.js Chart Js -->
    <script src="resources/adminBoot/assets/plugins/raphael/raphael.js"></script>
    <script src="resources/adminBoot/assets/plugins/morris.js/morris.js"></script>
	
	<!-- JQuery Datatables Js -->
    <script src="resources/adminBoot/assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/media/js/dataTables.bootstrap.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/dataTables.buttons.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/buttons.bootstrap.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/buttons.flash.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/jszip.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/pdfmake.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/vfs_fonts.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/buttons.html5.min.js"></script>
    <script src="resources/adminBoot/assets/plugins/DataTables/extensions/export/buttons.print.min.js"></script>
   
    <!-- Custom Js -->
    <script src="resources/adminBoot/assets/js/admin.js"></script>
    <script src="resources/adminBoot/assets/js/pages/charts/morris.js"></script>
    <script src="resources/adminBoot/assets/js/forSaleStats.js"></script>
	<script src="resources/adminBoot/assets/js/pages/tables/jquery-datatables.js"></script>
	
    <!-- Google Analytics Code -->
    <script src="resources/adminBoot/assets/js/google-analytics.js"></script>

    <!-- Demo Purpose Only -->
    <script src="resources/adminBoot/assets/js/demo.js"></script>
    
</body>
</html>
