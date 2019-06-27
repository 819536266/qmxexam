<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>企明星考核系统</title>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap/bootstrap.min.css" type="text/css"/>
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

</head>
<title>老师登陆成功</title>
<body>


        <div class="maincontent" style="">


                <div class="widget form-inline">
                    <h4 class="widgettitle">二级分类</h4>
                    <select class="form-control" name="centrePid.bigId" id="selectone" style="width:110px">

                    </select>
                    <button class="btn"  style="background-color: rgb(30, 130, 232); " onclick="fun()">查询</button></a>
                    <a href="${pageContext.request.contextPath}/teacher/centre/centreadd.jsp"><button class="btn"  style="background-color: rgb(30, 130, 232); ">添加</button></a>
                    <script type="text/javascript">
                        function fun(){
                            window.document.location.href="${pageContext.request.contextPath}/centre_query.action?centrePid.bigId="+$("#selectone").val();
                        }
                        $(function () {
                            $.ajax({
                                type:"post",
                                url:"<%=path %>/bigtype_queryall.action",
                                success: function (data) {
                                    $("#selectone").empty();
                                    $(JSON.parse(data)).each(function(i,n){
                                        $("#selectone").append("<option value='"+n.bigId+"'>"+n.bigName+"</option>");

                                    });

                                }
                            })

                        })
                    </script>
                    <div class="table-responsive">
                    <table id="dyntable" class="table  table-hover table-bordered text-nowrap">
                        <colgroup>
                            <col class="con0" style="align: center; width: 15%"/>

                            <col class="con0" style="align: center; width: 15%"/>
                            <col class="con1" style="align: center; width: 15%"/>
                            <col class="con0" style="align: center; width: 15%"/>
                            <col class="con1"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th >二级分类编号</th>
                            <th >二级分类名称</th>
                            <th >二级分类简写</th>
                            <th >所属分类</th>
                            <input type="hidden" id="type" value="${ type}">
                            <th >操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <s:iterator value="#request.centres" var="centre">
                        <tr align="center">
                            <td>${centre.centreId}</td>
                            <td>${centre.centreName}</td>
                            <td>${centre.centreNano}</td>
                            <td>${centre.centrePid.bigName}</td>
                            <td>
                                <%--<a href="${pageContext.request.contextPath}/teacher/centre/centreadd.jsp">添加</a>&nbsp;&nbsp;&nbsp;--%>
                               <%-- <a href="centre_echo?sysid=${centre.centreId}">修改</a>&nbsp;&nbsp;&nbsp;--%>
                                <a id="centre_delete" onclick="deleteJobDetail(${centre.centreId})">删除</a>
                            </td>
                        </tr>
                        </s:iterator>

                        </tbody>
                    </table>
                    </div><!--maincontentinner-->
                </div><!--widget-->

                <br/><br/>

                <div class="footer" >
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>

                </div><!--footer-->


        </div><!--maincontent-->

<script>
    function deleteJobDetail(id) {
        if (window.confirm("你确定要删除吗")) {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/centre_delete.action",
                data:{'centreId':id},
                success:function (data) {
                    alert(data)
                    window.location.reload();
                }
            })
            return true;
        } else {
            return false;
        }
    };
</script>
</body>
</html>
	