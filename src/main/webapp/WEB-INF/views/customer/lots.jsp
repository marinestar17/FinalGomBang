<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <!-- 시작 -->
                <!-- Property start -->
                <c:forEach var="searchItemList" items="${searchItemList }" varStatus="status">
                
                <div class="property clearfix wow fadeInUp delay-03s">
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 col-pad">
                        <!-- Property img -->
                        <div class="property-img">
                            <div class="property-tag button alt featured">${searchItemList.forSale_HouseType }</div>
                            <c:if test="${searchItemList.forSale_Status=='For Sale' }">
                            <div class="property-tag button sale">For Sale</div>
                            </c:if>
                            <c:if test="${searchItemList.forSale_Status=='For Rent' }">
                            <div class="property-tag button sale">For Rent</div>
                            </c:if>
                            <div class="property-price">${searchItemList.forSale_Rent }</div>
                            <img src="/GomBang/img/${searchImgList[status.count-1].saveName }" alt="fp-list" class="img-responsive hp-1">
                            <div class="property-overlay">
                                <a href="customerItemDetail?forSale_Seq=${searchItemList.forSale_Seq }" class="overlay-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <!-- <a class="overlay-link property-video" title="Lexus GS F">
                                    <i class="fa fa-video-camera"></i>
                                </a> -->
                                <div class="property-magnify-gallery">
                                	<!-- 이미지 파일 없을시 오류나는거 해결해야 한다. -->
                                    <a href="/GomBang/img/${searchImgList[status.count-1].saveName }" class="overlay-link" data-seq="${searchItemList.forSale_Seq }">
                                        <i class="fa fa-expand"></i>
                                    </a>
                                    <a href="/GomBang/img/${searchImgList[status.count-2].saveName }" class="hidden"></a>
                                    <a href="/GomBang/img/${searchImgList[status.count-3].saveName }" class="hidden"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 property-content ">
                        <!-- title -->
                        <h1 class="title">
                            <a href="customerItemDetail?forSale_Seq=${searchItemList.forSale_Seq }">${searchItemList.forSale_Title}</a>
                        </h1>
                        <!-- Property address -->
                        <h3 class="property-address">
                            <a href="customerItemDetail?forSale_Seq=${searchItemList.forSale_Seq }">
                                <i class="fa fa-map-marker"></i>${searchItemList.geoapi_prefectures} ${searchItemList.geoapi_cities} ${searchItemList.geoapi_towns} ${searchItemList.geoapi_remain}
                            	<br>
                            	<i class="fa fa-train"></i>${searchItemList.forSale_SubwayDistance2 }
                            </a>
                        </h3>
                        <!-- Facilities List -->
                        <ul class="facilities-list clearfix">
                            <c:forEach var="optionList" items="${optionList[status.count-1]}" varStatus="num">
                            
                            <li>
                                <i class="fa fa-check-square"></i>
                                <span>${optionList }</span>
                            </li>
                            </c:forEach>
                            <!-- <li>
                                <i class="flaticon-bed"></i>
                                <span>3 Beds</span>
                            </li>
                            <li>
                                <i class="flaticon-monitor"></i>
                                <span>TV </span>
                            </li>
                            <li>
                                <i class="flaticon-holidays"></i>
                                <span> 2 Baths</span>
                            </li>
                            <li>
                                <i class="flaticon-vehicle"></i>
                                <span>1 Garage</span>
                            </li>
                            <li>
                                <i class="flaticon-building"></i>
                                <span> 3 Balcony</span>
                            </li> -->
                        </ul>
                        <!-- Property footer -->
                        <div class="property-footer">
                            <span class="left">
                                <a href="#"><i class="fa fa-user"></i>${searchItemList.enterprise_ID}</a>
                            </span>
                            <span class="right">
                                <i class="fa fa-calendar"></i>${searchItemList.forSale_Indate } Days ago
                            </span>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- Property end -->
                