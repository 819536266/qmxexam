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

<div class="mainwrapper">

  <c:include value="../header.jsp"/>

    <div class="rightpanel">

        <ul class="breadcrumbs">
            <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span class="separator"></span>
            </li>
            <li><a href="">分类管理</a> <span class="separator"></span></li>
            <li>分类管理</li>

            <li class="right">
                <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
                <ul class="dropdown-menu pull-right skin-color">
                    <li><a href="default">Default</a></li>
                    <li><a href="navyblue">Navy Blue</a></li>
                    <li><a href="palegreen">Pale Green</a></li>
                    <li><a href="red">Red</a></li>
                    <li><a href="green">Green</a></li>
                    <li><a href="brown">Brown</a></li>
                </ul>
            </li>
        </ul>

        <div class="maincontent" style="">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle">一级分类</h4>
                    <a href="${pageContext.request.contextPath}/teacher/bigtype/bigtypeadd.jsp"><button class="btn"  style="background-color: rgb(30, 130, 232); ">添加</button></a>
                    <table id="dyntable" class="table table-bordered responsive">
                        <colgroup>
                            <col class="con0" style="align: center; width: 15%"/>

                            <col class="con0" style="align: center; width: 15%"/>
                            <col class="con1" style="align: center; width: 15%"/>
                            <col class="con0" style="align: center; width: 15%"/>
                            <col class="con1"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="head0">一级分类编号</th>
                            <th class="head0">一级分类名称</th>
                            <th class="head1">一级分类简写</th>
                            <input type="hidden" id="type" value="${ type}">
                            <th class="head1">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <s:iterator value="#request.bigtypes" var="big">

                        <tr align="center">
                            <td>${big.bigId}</td>
                            <td>${big.bigName}</td>
                            <td>${big.bigNano}</td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                               <%-- <a href="bigtype_echo?sysid=${big.bigId}">修改</a>&nbsp;&nbsp;&nbsp;--%>
                                <a id="bigtype_delete" onclick="deleteJobDetail(${big.bigId})">删除</a>
                            </td>
                        </tr>
                        </s:iterator>
                        <tr>
                            <td colspan="6" align="center">
                                共${page.totalCount}条纪录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条纪录
                                <s:if test="#request.page.hasPrePage">
                                    <a href="bigtype_query.action?currentPage=1&term=${term}">首页</a> |
                                    <a href="bigtype_query.action?currentPage=${page.currentPage - 1}">上一页</a> |
                                </s:if>
                                <s:else>
                                    首页 | 上一页 |
                                </s:else>
                                <s:if test="#request.page.hasNextPage==true">
                                    <a href="bigtype_query.action?currentPage=${page.currentPage + 1}">下一页</a> |
                                    <a href="bigtype_query.action?currentPage=${page.totalPage}">尾页</a>
                                </s:if>
                                <s:else>
                                    下一页 | 尾页
                                </s:else>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div><!--widget-->

                <br/><br/>

                <div class="footer" >
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>

                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->

    </div><!--rightpanel-->

</div><!--mainwrapper-->
<script>
    function deleteJobDetail(id) {
        if (window.confirm("你确定要删除吗")) {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/bigtype_delete.action",
                data:{'bigtype.bigId':id},
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
	