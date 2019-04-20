<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
							<div class="panel panel-default">
					 <div class="panel-heading">옵션</div>
	                    <div class="panel-body as">
	                        <button type="button" class="m-w-150 btn btn-rounded btn-default" id = "acceptButton" value = "accept">승인</button>
	                        <button type="button" class="m-w-150 btn btn-rounded btn-default" id = "denyButton" value = "deny">거부</button>
	                        <button type="button" class="m-w-150 btn btn-rounded btn-default" id = "waitingButton" value = "waiting">대기</button>
	                         <button type="button" class="m-w-150 btn btn-rounded btn-default" id = "allButton" value = "all">전체</button>
	                    </div>
	              </div>
                <div class="panel panel-default">
                    <div class="panel-heading title">대기중인 기업리스트</div>
                    <div class="panel-body">
                        <table id="dataList" class="table table-striped" data-paging="true" data-paging-position="right" data-sorting="true" data-filtering="true" data-filter-dropdown-title="Search in:">
                            <thead>
                                <tr>
                                    <th >기업이름</th>
                                    <th>소재지 주소</th>
                                    <th>담당자 이름</th>
                                    <th>담당자 번호</th>
                                    <th>담당자 이메일</th>
                                    <th>기업분류코드</th>
                                    <th>가입일자</th>
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