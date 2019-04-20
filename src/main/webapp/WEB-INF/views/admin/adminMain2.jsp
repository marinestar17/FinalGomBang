<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GomBang - Administrator</title>
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
    
    <!-- Morris.js Chart Css -->
    <link href="resources/adminBoot/assets/plugins/morris.js/morris.css" rel="stylesheet" />
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
                                <a href="#">거래완료 리스트</a>
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
        <section class="content dashboard">
            <div class="page-heading">
                <h1>메인화면</h1>
            </div>

            <div class="page-body">
                <!-- Infobox -->
                <div class="row clearfix">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box infobox-type-5 hover-expand-effect"> 
                            <div class="icon">
                                <i class="material-icons">account_box</i>
                            </div>
                            <div class="content">
                                <div class="text">회원수 현황</div>
                                <div class="number"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box infobox-type-5 hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">view_list</i>
                            </div>
                            <div class="content">
                                <div class="text">예약 현황 (성립/대기중)</div>
                                <div class="number2"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box infobox-type-5 hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">shopping_cart</i>
                            </div>
                            <div class="content">
                                <div class="text">매물 수 현황</div>
                                <div class="number3"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box infobox-type-5 hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">assignment</i>
                            </div>
                            <div class="content">
                                <div class="text">기업문의/가입대기 현황</div>
                                <div class="number4"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Infobox -->
                <!-- Main Graph -->
                <div class="main-graph">
                    <div class="row clearfix">
                        <div class="col-xs-12 col-sm-6 col-md-8 col-lg-10 padding-0 overflow-hidden">
                            <div class="graph-area">
                                <div id="line_chart"></div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="stats-area overflow-hidden">
                                <div class="total">
                                    <span class="col-success"></span>
                                    <small>각 데이터 추이</small>
                                </div>

                                <div class="stats">${allEnterprise} 사</div>
                                <span data-type="bar" data-sparkline="true">3,4,3,7,12,9,9,5,8,8,8,12,14,20,16,14,20,12,10,14,8,4,4,5</span>
                                <p><font color="#f6b225">기업 수</font></p>

                                <div class="stats">${allCustomer}명</div>
                                <span data-type="bar" data-sparkline="true">3,4,3,7,12,9,9,5,8,8,8,12,14,20,16,14,20,12,10,14,8,4,4,5</span>
                                <p><font color="#DA4453">고객 수</font></p>

                                <div class="stats">${allForSale}건</div>
                                <span data-type="bar" data-sparkline="true">3,4,3,7,12,9,9,5,8,8,8,12,14,20,16,14,20,12,10,14,8,4,4,5</span>
                               <p><font color="#16a085">매물 수</font></p>
                               
                               <div class="stats">${allReservation}건</div>
                                <span data-type="bar" data-sparkline="true">3,4,3,7,12,9,9,5,8,8,8,12,14,20,16,14,20,12,10,14,8,4,4,5</span>
                               <p><font color="#050099">예약 수</font></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Main Graph -->
                <div class="row clearfix">
                    <!-- Last 5 Comments -->
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">Administrator's Message </div>
                            <div class="panel-body">
                                <div class="comment-box print">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- #END# Last 5 Comments -->
                    <!-- To-Do List -->
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">TODO LIST</div>
                            <div class="panel-body">    
                                <div class="input-group m-b-15">
                                    <input type="text" placeholder="할 일 넣기" class="input input-sm form-control js-input" id = "adminTodo_Content" name = "adminTodo_Content">
                                    <input type = "hidden" value = "${sessionScope.admin.admin_ID}" class = "admin_ID" name = "admin_ID">
                                    <input type = "hidden" value = 0 id = "insert_update">
                                   <!--  input input-sm form-control js-input -->
                                    <span class="input-group-btn">
                                        <input type="button" class="btn btn-sm btn-default js-btn-add-item" value = "넣기"> <i class="fa fa-plus m-r-5" ></i>
                                    </span>
                                </div>
                                <ul class="todo-list">
                                  <!--   <li class="closed">
                                        <a href="javascript:void(0);" title="Move"><i class="fa fa-arrows move-handle"></i></a>
                                        <input type="checkbox" checked="checked" />
                                        <span>Lorem ipsum dolor sit amet, mel id minimum maluisset.</span>
                                        <span class="controls pull-right">
                                            <a href="javascript:void(0);" title="Edit"><i class="fa fa-pencil"></i></a>
                                            <a href="javascript:void(0);" title="Delete"><i class="fa fa-trash js-delete-todo"></i></a>
                                        </span>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Move"><i class="fa fa-arrows move-handle"></i></a>
                                        <input type="checkbox" />
                                        <span>Nec graeci essent luptatum cu, te mei sale essent impedit.</span>
                                        <span class="controls pull-right">
                                            <a href="javascript:void(0);" title="Edit"><i class="fa fa-pencil"></i></a>
                                            <a href="javascript:void(0);" title="Delete"><i class="fa fa-trash js-delete-todo"></i></a>
                                        </span>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Move"><i class="fa fa-arrows move-handle"></i></a>
                                        <input type="checkbox" />
                                        <span>Mel ex graecis accusam atomorum. In vitae decore maiorum est.</span>
                                        <span class="controls pull-right">
                                            <a href="javascript:void(0);" title="Edit"><i class="fa fa-pencil"></i></a>
                                            <a href="javascript:void(0);" title="Delete"><i class="fa fa-trash js-delete-todo"></i></a>
                                        </span>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Move"><i class="fa fa-arrows move-handle"></i></a>
                                        <input type="checkbox" />
                                        <span>Duo an suscipit scriptorem, ne nec melius periculis definiebas.</span>
                                        <span class="controls pull-right">
                                            <a href="javascript:void(0);" title="Edit"><i class="fa fa-pencil"></i></a>
                                            <a href="javascript:void(0);" title="Delete"><i class="fa fa-trash js-delete-todo"></i></a>
                                        </span>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Move"><i class="fa fa-arrows move-handle"></i></a>
                                        <input type="checkbox" />
                                        <span>Has dictas constituto disputando an.</span>
                                        <span class="controls pull-right">
                                            <a href="javascript:void(0);" title="Edit"><i class="fa fa-pencil"></i></a>
                                            <a href="javascript:void(0);" title="Delete"><i class="fa fa-trash js-delete-todo"></i></a>
                                        </span>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" title="Move"><i class="fa fa-arrows move-handle"></i></a>
                                        <input type="checkbox" />
                                        <span>At errem altera assueverit sed, qui laoreet delectus incorrupte cu.</span>
                                        <span class="controls pull-right">
                                            <a href="javascript:void(0);" title="Edit"><i class="fa fa-pencil"></i></a>
                                            <a href="javascript:void(0);" title="Delete"><i class="fa fa-trash js-delete-todo"></i></a>
                                        </span>
                                    </li> -->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- #END# To-Do List -->
                </div>

                <!-- Task List -->
                <div class="panel panel-default">
                    <div class="panel-heading">TASK LIST</div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table js-exportable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Task</th>
                                        <th>Assigned To</th>
                                        <th>Priority</th>
                                        <th>Status</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>% Complete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Lorem ipsum dolor sit amet, in vis possit oportere</td>
                                        <td>Larry Kitkat</td>
                                        <td><i class="fa fa-circle m-r-5 col-success"></i>Normal</td>
                                        <td>In Progress...</td>
                                        <td>2016-12-04</td>
                                        <td>2016-12-21</td>
                                        <td><span class="pie">72/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Elitr veniam pro ei, et mea natum aliquando</td>
                                        <td>Larry Otto</td>
                                        <td><i class="fa fa-circle m-r-5 col-danger"></i>High</td>
                                        <td><label class="label label-success">Completed</label></td>
                                        <td>2016-11-01</td>
                                        <td>2016-11-10</td>
                                        <td><span class="pie">100/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Pro et graeco mentitum, vis ea congue suavitate laboramus</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-danger"></i>High</td>
                                        <td>
                                            <label class="label label-warning">Not Started</label>
                                        </td>
                                        <td>2016-12-05</td>
                                        <td>2016-12-20</td>
                                        <td><span class="pie">0/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Ad pri vide mucius salutatus</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-danger"></i>High</td>
                                        <td>
                                            <label class="label label-danger">Canceled</label>
                                        </td>
                                        <td>2016-12-01</td>
                                        <td>2016-12-03</td>
                                        <td><span class="pie">76/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Sea nemore ancillae accommodare ut</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-danger"></i>High</td>
                                        <td>In Progress...</td>
                                        <td>2016-12-01</td>
                                        <td>2016-12-03</td>
                                        <td><span class="pie">65/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>Salutatus concludaturque ea quo</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-danger"></i>High</td>
                                        <td>In Progress...</td>
                                        <td>2016-12-01</td>
                                        <td>2016-12-03</td>
                                        <td><span class="pie">60/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>Vel nusquam tibique assentior in</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-danger"></i>High</td>
                                        <td>In Progress...</td>
                                        <td>2016-12-01</td>
                                        <td>2016-12-03</td>
                                        <td><span class="pie">52/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>8</td>
                                        <td>Ad legimus civibus invenire per</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-success"></i>Normal</td>
                                        <td><label class="label label-success">Completed</label></td>
                                        <td>2016-12-01</td>
                                        <td>2016-12-03</td>
                                        <td><span class="pie">100/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>9</td>
                                        <td>Soleat dolorum splendide mei ut</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-success"></i>Normal</td>
                                        <td><label class="label label-success">Completed</label></td>
                                        <td>2016-12-01</td>
                                        <td>2016-12-03</td>
                                        <td><span class="pie">100/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>Duo natum prima atqui cu</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-success"></i>Normal</td>
                                        <td><label class="label label-success">Completed</label></td>
                                        <td>2016-12-01</td>
                                        <td>2016-12-03</td>
                                        <td><span class="pie">100/100</span></td>
                                    </tr>
                                    <tr>
                                        <td>11</td>
                                        <td>Ei usu augue epicuri delicata</td>
                                        <td>John Doe</td>
                                        <td><i class="fa fa-circle m-r-5 col-success"></i>Normal</td>
                                        <td><label class="label label-success">Completed</label></td>
                                        <td>2016-12-01</td>
                                        <td>2016-12-03</td>
                                        <td><span class="pie">100/100</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- #END# Task List -->
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

    <!-- JQuery UI Js -->
    <script src="resources/adminBoot/assets/plugins/jquery-ui/jquery-ui.js"></script>

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

    <!-- iCheck Js -->
    <script src="resources/adminBoot/assets/plugins/iCheck/icheck.js"></script>

    <!-- Jquery Sparkline Js -->
    <script src="resources/adminBoot/assets/plugins/jquery-sparkline/dist/jquery.sparkline.js"></script>

    <!-- Flot Chart Js -->
    <script src="resources/adminBoot/assets/plugins/flot/jquery.flot.js"></script>
    <script src="resources/adminBoot/assets/plugins/flot-spline/js/jquery.flot.spline.js"></script>
    <script src="resources/adminBoot/assets/plugins/flot/jquery.flot.pie.js"></script>
    <script src="resources/adminBoot/assets/plugins/flot/jquery.flot.categories.js"></script>
    <script src="resources/adminBoot/assets/plugins/flot/jquery.flot.time.js"></script>

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

    <!-- Piety Js -->
    <script src="resources/adminBoot/assets/plugins/peity/jquery.peity.js"></script>

    <!-- Custom Js -->
    <script src="resources/adminBoot/assets/js/admin.js"></script>
    <script src="resources/adminBoot/assets/js/pages/dashboard/dashboard_v2.js"></script>

    <!-- Google Analytics Code -->
    <script src="resources/adminBoot/assets/js/google-analytics.js"></script>

    <!-- Demo Purpose Only -->
    <script src="resources/adminBoot/assets/js/demo.js"></script>
    
    <!-- Morris.js Chart Js -->
    <script src="resources/adminBoot/assets/plugins/raphael/raphael.js"></script>
    <script src="resources/adminBoot/assets/plugins/morris.js/morris.js"></script>
    
    <!-- 통계용 등등  -->
    <script src="resources/adminBoot/assets/js/etc.js"></script>
    <!-- <script src="resources/adminBoot/assets/js/pages/miscellaneous/todo-list.js"></script> -->
    
</body>
</html>
