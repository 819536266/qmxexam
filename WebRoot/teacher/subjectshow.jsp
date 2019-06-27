<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-migrate-1.1.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap-fileupload.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.autogrow-textarea.js"></script>
    <script type="text/javascript" src="<%=path %>/js/charCount.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colorpicker.js"></script>
    <script type="text/javascript" src="<%=path %>/js/ui.spinner.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=path %>/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/custom.js"></script>

    <title>企明星考核系统</title>
</head>


<body>
        <div class="maincontent" style="">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle">试题详情</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="queryStudentByClass.action" method="post">
                            <p>
                                <label style="padding: 0px 20px 0 0;">试题编号:</label>
                                <span class="field">${subject.stID}</span>
                            </p>
                            <p>
                                <label style="padding: 0px 20px 0 0;">部门:</label>
                                <span class="field">${subject.sclass}</span>
                            </p>
                            <p>
                                <label style="padding: 0px 20px 0 0;">试题题目:</label>
                                <span class="field">${subject.stTitle}</span>
                            </p>
                            <p>
                                <label style="padding: 0px 20px 0 0;">选项A:</label>
                                <span class="field"> ${subject.stOptionA}</span>
                            </p>
                            <p>
                                <label style="padding: 0px 20px 0 0;">选项B:</label>
                                <span class="field"> ${subject.stOptionB}</span>
                            </p>
                            <p>
                                <c:if test="${subject.stOptionC != null&&subject.stOptionC !=''}">
                                <label style="padding: 0px 20px 0 0;">选项C:</label>
                                <span class="field"> ${subject.stOptionC}</span>
                            </p>
                            </c:if><p>
                            <c:if test="${subject.stOptionD != null&&subject.stOptionD !=''}">
                            <label style="padding: 0px 20px 0 0;">选项D:</label>
                            <span class="field"> ${subject.stOptionD}</span>
                        </p>
                            </c:if>

                            <c:if test="${subject.stOptionE != null&&subject.stOptionE !=''}">
                                <p>
                                    <label style="padding: 0px 20px 0 0;">选项E:</label>
                                    <span class="field"> ${subject.stOptionE}</span>
                                </p>
                            </c:if>
                            <c:if test="${subject.stOptionF != null&&subject.stOptionF !=''}">
                                <p>
                                    <label style="padding: 0px 20px 0 0;">选项F:</label>
                                    <span class="field"> ${subject.stOptionF}</span>
                                </p>
                            </c:if>
                            <c:if test="${subject.stOptionG != null&&subject.stOptionG !=''}">
                                <p>
                                    <label style="padding: 0px 20px 0 0;">选项G:</label>
                                    <span class="field"> ${subject.stOptionG}</span>
                                </p>
                            </c:if>
                            <c:if test="${subject.stOptionH != null&&subject.stOptionH !=''}">
                                <p>
                                    <label style="padding: 0px 20px 0 0;">选项H:</label>
                                    <span class="field"> ${subject.stOptionH}</span>
                                </p>
                            </c:if>
                            <c:if test="${subject.stOptionI != null&&subject.stOptionI !=''}">
                                <p>
                                    <label style="padding: 0px 20px 0 0;">选项I:</label>
                                    <span class="field"> ${subject.stOptionI}</span>
                                </p>
                            </c:if>

                            <p>
                                <label style="padding: 0px 20px 0 0;">答案:</label>
                                <c:if test="${subject.stAnswer=='1'}">
                                    <span class="field">对</span>
                                </c:if>
                                <c:if test="${subject.stAnswer=='2'}">
                                    <span class="field">错</span>
                                </c:if>
                                <c:if test="${subject.stAnswer!='2'&&subject.stAnswer!='1'}">
                                    <span class="field"> ${subject.stAnswer}</span>
                                </c:if>
                            </p>
                            <p>
                                <label style="padding: 0px 20px 0 0;">答案解析:</label>
                                <span class="field"> ${subject.stParse}</span>
                            </p>


                        </form>
                    </div><!--widgetcontent-->
                </div><!--widget-->

                <br/><br/>


            </div><!--maincontentinner-->
        </div><!--maincontent-->
</body>
</html>