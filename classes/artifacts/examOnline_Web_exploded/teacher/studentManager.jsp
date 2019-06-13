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
    <script src="<%=path %>/js/jquery-2.1.4.min.js"></script>
    <script src="<%=path %>/js/select.js"></script>
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

    <c:include value="header.jsp"/>

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

        <div class="pageheader">
            &nbsp; &nbsp; &nbsp;&nbsp; <span> <font size="3" face="楷体" color="rgb(30, 130, 232);">选择部门:  </font> </span>
            <span class="field" id="span">
                                    <select class="form-control"  id="selectone" onchange="fun1()" style="width:110px"></select>
                                    <select class="form-control"  name="scalss" id="selecttwo" onchange="fun2()" style="width:110px">
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
            <font size="2" face="宋体"  color="red">${term==null?'':term }&nbsp;&nbsp;</font>
            <button class="btn" style="background-color: rgb(30, 130, 232); " onclick="fun()">查询</button>
            &nbsp; &nbsp; &nbsp;&nbsp;<button class="btn" style="background-color: rgb(30, 130, 232);" onclick="funexcel()">导出Excel</button>
            <form method="get" action="${pageContext.request.contextPath}/studentQuery">
                &nbsp; &nbsp; &nbsp;&nbsp;<span> <font size="3" face="楷体" color="rgb(30, 130, 232);">输入姓名查询:</font> </span>
                <input type="text" value="${name }" name="name" id="name">
                <input type="submit"  class="btn" style="background-color: rgb(30, 130, 232);" value="查询">
            </form>


            &nbsp;&nbsp;&nbsp;&nbsp;
            <!-- 到处excel -->




        </div>
        <div class="maincontent">
            <div class="maincontentinner">

                <h4 class="widgettitle">员工表</h4>
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
                        <th class="head0">全选&nbsp;<input  type="checkbox" id="checkbox">&nbsp;<a href="javascript:void(0);" onclick="deletecheck()">删除</a></th>
                        <th class="head0">员工编号</th>
                        <th class="head1">所属部门</th>
                        <th class="head0">员工姓名</th>
                        <th class="head1">成绩&nbsp;&nbsp;<button onclick="fun(2)" style="width: 25px;height: 25px">▲
                        </button>
                            <button onclick="fun(1)" style="width: 25px;height: 25px">▼</button>
                        </th>
                        <input type="hidden" id="type" value="${ type}">
                        <th class="head1">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <s:iterator value="#request.students" var="student">
                        <tr align="center">
                            <td><input class="check" type="checkbox" value="${student.stuSysid.sysid}"></td>
                            <td>${student.stuSysid.studentID}</td>
                            <td>${student.stuSysid.sclass}</td>
                            <td>${student.stuSysid.studentName}</td>
                            <td>${student.timescore} </td>
                            <td><a href="queryStudentByID?sysid=${student.stuSysid.sysid}&assess=0">查看</a>

                                <a href="studentupdate?sysid=${student.stuSysid.sysid}">修改</a>&nbsp;&nbsp;&nbsp;
                                <a id="deletestudent" onclick="deleteJobDetail(${student.stuSysid.sysid})">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    <tr>
                        <td colspan="6" align="center">
                            共${page.totalCount}条纪录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条纪录
                            <s:if test="#request.page.hasPrePage">
                                <a href="studentQuery.action?currentPage=1&term=${term}&sclass=${stusclass}&name=${name}&type=${type}">首页</a> |
                                <a href="studentQuery.action?currentPage=${page.currentPage - 1}&term=${term}&sclass=${stusclass}&name=${name}&type=${type}">上一页</a> |
                            </s:if>
                            <s:else>
                                首页 | 上一页 |
                            </s:else>
                            <s:if test="#request.page.hasNextPage==true">
                                <a href="studentQuery.action?currentPage=${page.currentPage + 1}&term=${term}&sclass=${stusclass}&name=${name}&type=${type}">下一页</a> |
                                <a href="studentQuery.action?currentPage=${page.totalPage}&term=${term}&sclass=${stusclass}&name=${name}&type=${type}">尾页</a>
                            </s:if>
                            <s:else>
                                下一页 | 尾页
                            </s:else>
                        </td>
                    </tr>

                    </tbody>
                </table>

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
<script type="text/javascript">
    function deletecheck(){
        var check=new Array();
        if (window.confirm("你确定要删除吗")) {
            arr1=0;
            $(".check").each(function () {
                if($(this).prop("checked")==true){
                    check[arr1]=$(this).val();
                    arr1=arr1+1;
                }
            })
            date=JSON.stringify(check);

            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/deletecheck.action",
                data:{'json':date},
                success:function (data) {
                    if(data=="success"){
                        alert("删除成功");
                        window.location.reload();
                    }else{
                        alert("删除失败");
                    }
                }
            })

            return true;
        } else {
            return false;
        }

    }
    $("#checkbox").on("click",function () {
        if($("#checkbox").prop("checked")){
            $("input").prop("checked",true);
        }else{
            $("input").prop("checked",false);
        }
    })
    $(".check").on("click",function (){
       var type=true;
        $(".check").each(function () {
            if($(this).prop("checked")==false){
                type=false;
            }
        })
        if(type){
            $("#checkbox").prop("checked",true);
        }else{
            $("#checkbox").prop("checked",false);
        }
    })
    $(function () {
       $("#checkbox").attr("checked",false);
        $("#date").selectDate();
        $.ajax({
            type:"post",
            url:"<%=path %>/bigtype_queryall.action",
            success: function (data) {
                $("#selectone").empty();
                data=JSON.parse(data);
                $(data).each(function(i,n){
                    $("#selectone").append("<option  url='"+n.bigId+"' value='"+n.bigName+"'>"+n.bigName+"</option>");

                });
                fun1(data[0].bigId);
            }
        })

    })

    function  fun1(bid){
        id= $("#selectone").find("option:selected").attr("url");
        if(id==null||id==""){
            id=bid;
        }
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/centre_queryByPid.action",
            data:{'centrePid.bigId':id},
            success: function (data) {
                $("#selecttwo").empty();
                $("#selecttwo").append("<option  value=''>"+"---请选择---"+"</option>");
                $(JSON.parse(data)).each(function(i,n){
                    $("#selecttwo").append("<option url='"+n.centreId+"' value='"+n.centreName+"'>"+n.centreName+"</option>");
                });
                a ="${request.sclass}";
                if(a!=null&&a!="") {

                    $("#selecttwo").append("<option val='${request.sclass}'  selected='selected'>${request.sclass}</option>");

                }
                fun2(data[0].centreId);
            }
        })

    }
    function  fun2(centreId){

        id= $("#selecttwo").find("option:selected").attr("url");

        if(id==null||id==""){
            id=centreId;
        }
        if(id!=undefined){
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/small_queryByPid.action",
            data:{'smallPid.centreId':id},
            success: function (data) {
                data=JSON.parse(data);
                if(data.length>0){
                    $("#span #selectthree").remove();
                    $("#selecttwo").attr("name","");

                    selectthree=$("<select class='form-control' name='sclass' id='selectthree' style='width:110px'></select>");
                    $("#span").append(selectthree);
                    $(selectthree).append("<option  value=''>"+"---请选择---"+"</option>");
                    $(data).each(function(i,n){
                        $(selectthree).append("<option  value='"+n.smallName+"'>"+n.smallName+"</option>");
                    });

                }else{
                    $("#selecttwo").attr("name","sclass");
                    $("#span #selectthree").remove();

                }
            }
        })
        }
    }
</script>
<script type="text/javascript">
    function funexcel() {
        window.location.href = "${pageContext.request.contextPath}/exportExcel?&term=${term}&sclass=${stusclass}&name=${name}";
    }

    function deleteJobDetail(id) {
        if (window.confirm("你确定要删除吗")) {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/delete.action",
                data:{"sysid":id},
                success:function (data) {
                    if(data=="success"){
                        alert("删除成功");
                        window.location.reload();
                    }else{
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
        three= $("#span #selectthree").val();
        two=$("#selecttwo").val();
        val=two;
        if(three==null||three==""){

        }else{
            val=three;
        }
        if (type != null && type != "") {
                window.document.location.href = "${pageContext.request.contextPath}/studentQuery?&term=${term}&sclass=${stusclass}&name=${name}&type=" + type;
        } else {

                window.document.location.href = "${pageContext.request.contextPath}/studentQuery?term=" + term + "&sclass=" + val+ "&name=" + $("#name").val();


        }
    };


</script>

</body>
</html>