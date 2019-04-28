<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
							<div class="panel panel-default">
					 <div class="panel-heading">Option</div>
	                    <div class="panel-body as">
	                        <button type="button" class="m-w-150 btn btn-rounded btn-default" id = "acceptButton" value = "accept">Accept</button>
	                        <button type="button" class="m-w-150 btn btn-rounded btn-default" id = "denyButton" value = "deny">Deny</button>
	                        <button type="button" class="m-w-150 btn btn-rounded btn-default" id = "waitingButton" value = "waiting">Waiting</button>
	                         <button type="button" class="m-w-150 btn btn-rounded btn-default" id = "allButton" value = "all">All</button>
	                    </div>
	              </div>
                <div class="panel panel-default">
                    <div class="panel-heading title">Waiting Enterprise List</div>
                    <div class="panel-body">
                        <table id="dataList" class="table table-striped" data-paging="true" data-paging-position="right" data-sorting="true" data-filtering="true" data-filter-dropdown-title="Search in:">
                            <thead>
                                <tr>
                                    <th >Name</th>
                                    <th>Address</th>
                                    <th>Manager Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Code</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                               <c:forEach items = "${waitList}" var = "list">
                               	<tr>
                                   <td><a href="enterpriseDetail?enterprise_ID=${list.enterprise_ID }">${list.enterprise_ID}</a></td>
                                   <td>${list.enterprise_Address}</td>
                                   <td>${list.enterprise_ManagerName}</td>
                                   <td>${list.enterprise_ManagerPhone}</td>
                                   <td>${list.enterprise_ManagerEmail}</td>
                                   <td>${list.enterprise_Code}</td>
                                   <td>${list.enterprise_Indate}</td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                
                 <!-- 내꺼 -->
       <script src="resources/adminBoot/assets/js/etc.js"></script>