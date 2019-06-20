<%@ page import="com.entity.Student" %>
<%@ page import="com.entity.Scorde" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="<%=path %>/js/jquery-2.1.4.min.js"></script>
    <style type="text/css">

        select {
            padding: 5px;
            border-radius: 5px;
            outline: none;
        }
    </style>
    <%-- <script type="text/javascript">
        jQuery(document).ready(function(){
            // dynamic table
            jQuery('#dyntable').dataTable({
                "sPaginationType": "full_numbers",
                "aaSortingFixed": [[0,'asc']],
                "fnDrawCallback": function(oSettings) {
                    jQuery.uniform.update();
                }
            });

            jQuery('#dyntable2').dataTable( {
                "bScrollInfinite": true,
                "bScrollCollapse": true,
                "sScrollY": "300px"
            });

        });

    </script> --%>
</head>
<title>企明星考核系统</title>
<body>

<div class="mainwrapper">
    <c:import url="../header.jsp"/>

    <div class="rightpanel">

        <ul class="breadcrumbs">
            <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span class="separator"></span>
            </li>
            <li><a href="">员工管理</a> <span class="separator"></span></li>
            <li>查询所有员工</li>

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

       <%-- <div class="pageheader">
          &lt;%&ndash;  &nbsp; &nbsp; &nbsp;&nbsp; <span> <font size="3" face="楷体" color="rgb(30, 130, 232);">选择部门:  </font> </span>
            <span class="field" id="span">
                                    <select class="form-control" id="selectone" onchange="fun1()"
                                            style="width:110px"></select>
                                    <select class="form-control" name="scalss" id="selecttwo" onchange="fun2()"
                                            style="width:110px">
                                    </select>
                                </span>
            </span>

            <!--  -->
            <font size="3" face="宋体"
                  color="rgb(30, 130, 232);">${stusclass==null||stusclass==''?'':"当前部门为:"}</font><font size="2"
                                                                                                       face="宋体"
                                                                                                       color="red">${stusclass==null||stusclass==''?'':stusclass }&nbsp;&nbsp;</font>
            <span> <font size="3" face="楷体" color="rgb(30, 130, 232);">选择日期:</font> </span>
            <span class="field" id="date">
								<select id="year" style="width:110px">
									<option value="">选择年份</option>
								</select>
								<select id="month" style="width:105px">
									<option value="">选择月份</option>
								</select>
						</span>
            <font size="3" face="宋体" color="rgb(30, 130, 232);">${term==null||term==""?'':"当前日期为:"}</font>
            <font size="2" face="宋体" color="red">${term==null?'':term }&nbsp;&nbsp;</font>
            <button class="btn" style="background-color: rgb(30, 130, 232); " onclick="fun()">查询</button>
            &nbsp; &nbsp; &nbsp;&nbsp;<button class="btn" style="background-color: rgb(30, 130, 232);"
                                              onclick="funexcel()">导出Excel
        </button>
            <form method="get" action="${pageContext.request.contextPath}/studentQuery">
                &nbsp; &nbsp; &nbsp;&nbsp;<span> <font size="3" face="楷体"
                                                       color="rgb(30, 130, 232);">输入姓名查询:</font> </span>
                <input type="text" value="${name }" name="name" id="name">
                <input type="submit" class="btn" style="background-color: rgb(30, 130, 232);" value="查询">
            </form>&ndash;%&gt;


            &nbsp;&nbsp;&nbsp;&nbsp;
            <!-- 到处excel -->


        </div>--%>
        <div class="maincontent">
            <div class="maincontentinner">

                <h4 class="widgettitle">员工表</h4>
                <table id="dyntable" class="table table-bordered responsive">
                    <colgroup>
                        <col class="con1" style="align: center; width: 10%"/>
                        <col class="con1" style="align: center; width:40%"/>
                        <col class="con1" style="align: center; width: 2%"/>
                        <col class="con1" style="align: center; width: 2%"/>
                        <col class="con1" style="align: center; width: 2%"/>
                        <col class="con1" style="align: center; width: 2%"/>
                        <col class="con1" style="align: center; width: 2%"/>
                        <col class="con1" style="align: center; width: 2%"/>
                        <col class="con1" style="align: center; width: 10%"/>
                    </colgroup>
                    <thead>
                        <tr  >
                            <td  rowspan="2" style="text-align:center;vertical-align:middle; "><h4>考核指标</h4></td>
                            <td  rowspan="2" style="text-align:center;vertical-align:middle;"><h3>考核内容</h3></td>
                            <td  colspan="6" width="50px" style="text-align:center;vertical-align:middle;"><h3>分值</h3></td>
                            <td  rowspan="2" style="text-align:center;vertical-align:middle;"><h3>分数</h3></td>
                        </tr>
                        <tr >
                            <td >5</td>
                            <td >4</td>
                            <td >3</td>
                            <td >2</td>
                            <td >1</td>
                            <td >0</td>
                        </tr>

                    <%--<tr>
                        <td></td>
                        <th class="head0">全选&nbsp;<input type="checkbox" id="checkbox">&nbsp;<a
                                href="javascript:void(0);" onclick="deletecheck()">删除</a></th>
                        <th class="head0">考核指标</th>
                        <th class="head1">所属部门</th>
                        <th class="head0">员工姓名</th>
                        <th class="head1">成绩&nbsp;&nbsp;<button onclick="fun(2)" style="width: 25px;height: 25px">▲
                        </button>
                            <button onclick="fun(1)" style="width: 25px;height: 25px">▼</button>
                        </th>
                        <input type="hidden" id="type" value="${ type}">
                        <th class="head1">操作</th>
                    </tr>--%>
                    </thead>
                    <tbody>
                    <c:set var="num" value="0"></c:set>
                    <s:iterator value="#request.targets" var="target" status="var" >
                        <input type="hidden" name="scorde.sysid" value="">
                        <tr>
                            <td style="text-align:center;vertical-align:middle; " rowspan="${target.assess.size()+1}" >${target.name}</td>
                        </tr>
                        <c:forEach  items="${target.assess}" var="assess" varStatus="v">
                            <tr >
                                <td>${assess.content}</td>
                                <td><input type="radio" name="redio${assess.id}" value="5" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="redio${assess.id}" value="4" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="redio${assess.id}" value="3" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="redio${assess.id}" value="2" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="redio${assess.id}" value="1" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="redio${assess.id}" value="0" onclick="rowscord(this)"/></td>
                                <td ><span class="rowcount">0</span>分</td>
                                <c:set var="num" value="${num+1}"></c:set>
                            </tr>
                        </c:forEach>
                    </s:iterator>
                    <tr style="text-align:center;vertical-align:middle; ">
                        <td colspan="2" style="text-align:center;vertical-align:middle;">部门领导评分</td>
                        <td colspan="3" style="text-align:center;vertical-align:middle;">分值</td>
                        <td colspan="4" style="text-align:center;vertical-align:middle;"><input type="text" value="0" readonly="readonly" style="width: 20px" class="count"/>分</td>
                    </tr>
                    <tr >
                        <td colspan="2" style="text-align:center;vertical-align:middle;">总经理评分</td>
                        <td colspan="3" style="text-align:center;vertical-align:middle;">分值</td>
                        <td colspan="4" style="text-align:center;vertical-align:middle;"><input type="text" value="0"  readonly="readonly"   style="width: 20px" class="count"/>分</td>
                    </tr>

                    </tbody>
                </table>

                <br/><br/>

                <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>

                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->


    </div><!--rightpanel-->

</div><!--mainwrapper-->
<script type="text/javascript">

    function rowscord(redio) {

        $(redio).parent().siblings().last().children().html($(redio).val());
        count=0;
        $(".rowcount").each(function () {
            count+= parseInt($(this).html());
        })
        $(".count").each(function () {
            $(this).val(count);
        })
    }
    function deletecheck() {
        var check = new Array();
        if (window.confirm("你确定要删除吗")) {
            arr1 = 0;
            $(".check").each(function () {
                if ($(this).prop("checked") == true) {
                    check[arr1] = $(this).val();
                    arr1 = arr1 + 1;
                }
            })
            date = JSON.stringify(check);

            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/deletecheck.action",
                data: {'json': date},
                success: function (data) {
                    if (data == "success") {
                        alert("删除成功");
                        window.location.reload();
                    } else {
                        alert("删除失败");
                    }
                }
            })

            return true;
        } else {
            return false;
        }

    }

    $("#checkbox").on("click", function () {
        if ($("#checkbox").prop("checked")) {
            $("input").prop("checked", true);
        } else {
            $("input").prop("checked", false);
        }
    })
    $(".check").on("click", function () {
        var type = true;
        $(".check").each(function () {
            if ($(this).prop("checked") == false) {
                type = false;
            }
        })
        if (type) {
            $("#checkbox").prop("checked", true);
        } else {
            $("#checkbox").prop("checked", false);
        }
    })

</script>
<script type="text/javascript">
    function funexcel() {
        window.location.href = "${pageContext.request.contextPath}/exportExcel?&term=${term}&sclass=${stusclass}&name=${name}";
    }

    function deleteJobDetail(id) {
        if (window.confirm("你确定要删除吗")) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/delete.action",
                data: {"sysid": id},
                success: function (data) {
                    if (data == "success") {
                        alert("删除成功");
                        window.location.reload();
                    } else {
                        alert("删除失败");
                    }
                }
            })

            return true;
        } else {
            return false;
        }
    };


    function fun(type) {

        var year = $("#year option:selected").html();
        var month = $("#month option:selected").html();
        year = year.substring(2, 4);
        month = month.substring(0, 2);
        term = year + month;
        if (term == "年份") {
            term = "";
        }
        if (term == "选择") {
            term = "";
        }
        if (term == "年份选择") {
            term = "";
        }
        three = $("#span #selectthree").val();
        two = $("#selecttwo").val();
        val = two;
        if (three == null || three == "") {

        } else {
            val = three;
        }
        if (type != null && type != "") {
            window.document.location.href = "${pageContext.request.contextPath}/studentAssessQuery?&term=${term}&sclass=${stusclass}&name=${name}&type=" + type;
        } else {

            window.document.location.href = "${pageContext.request.contextPath}/studentAssessQuery?term=" + term + "&sclass=" + val + "&name=" + $("#name").val();


        }
    };


</script>

</body>
</html>