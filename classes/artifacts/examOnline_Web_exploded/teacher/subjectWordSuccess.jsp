<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>企明星考核系统</title>

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
    <script type="text/javascript" src="<%=path %>/js/jquery.tagsinput.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.autogrow-textarea.js"></script>
    <script type="text/javascript" src="<%=path %>/js/charCount.js"></script>
    <script type="text/javascript" src="<%=path %>/js/colorpicker.js"></script>
    <script type="text/javascript" src="<%=path %>/js/ui.spinner.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=path %>/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/custom.js"></script>
    <script type="text/javascript" src="<%=path %>/js/forms.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            // dynamic table
            jQuery('#dyntable').dataTable({
                "sPaginationType": "full_numbers",
                "aaSortingFixed": [[0, 'asc']],
                "fnDrawCallback": function (oSettings) {
                    jQuery.uniform.update();
                }
            });

            jQuery('#dyntable2').dataTable({
                "bScrollInfinite": true,
                "bScrollCollapse": true,
                "sScrollY": "300px"
            });

        });
    </script>
</head>
<title>老师登陆成功</title>
<body>

        <div class="maincontent">


                <h4 class="widgettitle">试题库</h4>
                <hr>
                <font size="5" color="red">查看是否解析正确,如过错误请按照格式修改文档!</font>
            <div class="table-responsive">
                <table id="dyntable" class="table-hover table-bordered text-nowrap">

                    <tbody>

                    <s:iterator value="#session.subjectslist" var="subjecterror" status="ls">
                        <div style="margin: auto;">
                            <font size="4">
                                <xmp white-space:normal;> ${ls.index+1},${subjecterror.stTitle}</xmp>
                            </font>
                        </div>
                        <div style="margin: auto;">
                            <font size="4">
                                  <c:if test="${subjecterror.stOptionA!=null&&subjecterror.stOptionA!=''}">
                                    选项A:${subjecterror.stOptionA}<BR>
                                </c:if>
                                <c:if test="${subjecterror.stOptionB!=null&&subjecterror.stOptionB!=''}">
                                    选项B:${subjecterror.stOptionB}<BR>
                                </c:if>
                                <c:if test="${subjecterror.stOptionC!=null&&subjecterror.stOptionC!=''}">
                                    选项C:${subjecterror.stOptionC}<BR>
                                </c:if>
                                <c:if test="${subjecterror.stOptionD!=null&&subjecterror.stOptionD!=''}">
                                    选项D:${subjecterror.stOptionD}<BR>
                                </c:if>
                                <c:if test="${subjecterror.stOptionE!=null&&subjecterror.stOptionE!=''}">
                                    选项E:${subjecterror.stOptionE}<BR>
                                </c:if>
                                    <c:if test="${subjecterror.stOptionF!=null&&subjecterror.stOptionF!=''}">
                                        选项F:${subjecterror.stOptionF}<BR>
                                    </c:if>
                                <c:if test="${subjecterror.stOptionG!=null&&subjecterror.stOptionG!=''}">
                                    选项G:${subjecterror.stOptionG}<BR>
                                </c:if>
                                <c:if test="${subjecterror.stOptionH!=null&&subjecterror.stOptionH!=''}">
                                    选项H:${subjecterror.stOptionH}<BR>
                                </c:if>

                            </font>
                        </div>
                        <div style="margin: auto;">
                            <font size="4">
                                <c:if test="${subjecterror.stAnswer!='1'&&subjecterror.stAnswer!='2'}">
                                答案:${subjecterror.stAnswer}
                                </c:if>
                                <c:if test="${subjecterror.stAnswer=='1'}">
                                    答案:正确
                                </c:if>
                                <c:if test="${subjecterror.stAnswer=='2'}">
                                    答案:错误
                                </c:if>
                            </font>
                        </div>
                        <div style="margin: auto;">
                            <font size="4">
                               解析:${subjecterror.stParse}
                            </font>
                        </div>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
                <div style="margin: auto; width: 300; height: 100">
                    <a href="<%=path %>/teacher/subjectWord.jsp">
                        <button> 返回添加页面</button>
                    </a>
                    <a href="<%=path %>/teacher/saveWord">
                        <button>确认添加</button>
                    </a>
                </div>
                <br/><br/>



        </div><!--maincontent-->


</body>
</html>
