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
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1,user-scalable=no"/>
    <title>企明星考核系统</title>
    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap/bootstrap.min.css" type="text/css"/>
    <link href="<%=path %>/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
    <script src="<%=path %>/js/jquery-2.1.4.min.js"></script>
    <script src="<%=path %>/js/bootstrap.min.js"></script>
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
<div class="form-inline">
                <div class="form-group" id="span">
                    <label for="selectone">选择部门:</label>
                    <select class="form-control" id="selectone" onchange="fun1()"></select>
                    <select class="form-control"  name="scalss" id="selecttwo" onchange="fun2()"></select>
                </div>
                <label>
                    <font size="3" face="宋体" color="rgb(30, 130, 232);">${stusclass==null||stusclass==''?'':"当前部门为:"}</font>
                    <font size="2" face="宋体"  color="red">${stusclass==null||stusclass==''?'':stusclass }&nbsp;&nbsp;</font>
                </label>
                    <div class="form-group">
                        <label for="year">选择日期:</label>
                        <select id="year" class="form-control" >
                            <option value="">选择年份</option>
                        </select>
                        <select id="month" class="form-control" >
                            <option value="">选择月份</option>
                        </select>
                        <label>
                            <font size="3" face="宋体" color="rgb(30, 130, 232);">${term==null||term==""?'':"当前日期为:"}</font>
                            <font size="2" face="宋体"  color="red">${term==null?'':term }&nbsp;&nbsp;</font>
                        </label>
                    </div>
                    <div class="form-group">
                        <a class="btn btn-md" onclick="fun()">查询</a>
                        <a class="btn btn-md" onclick="funexcel()">导出Excel</a>
                    </div>
                    <form method="get" action="${pageContext.request.contextPath}/studentQuery" class="form-inline">
                        <div class="form-group">
                            <label for="name">输入姓名查询:</label>
                            <input type="text"class="form-control" name="name" id="name"  value="${name}" />
                            <input type="submit"  class="btn" style="background-color: rgb(30, 130, 232);" value="查询"/>
                        </div>
                    </form>



                        <h4 class="widgettitle">员工表</h4>
                       <div class="table-responsive">
                        <table id="dyntable"  class="table  table-hover table-bordered text-nowrap ">

                            <thead>
                            <tr>
                                <th >全选&nbsp;<input  type="checkbox" id="checkbox">&nbsp;<a href="javascript:void(0);" onclick="deletecheck()">删除</a></th>
                                <th >员工编号</th>
                                <th >所属部门</th>
                                <th>员工姓名</th>
                                <th>成绩&nbsp;&nbsp;<button onclick="fun(2)" style="width: 25px;height: 25px">▲
                                </button>
                                    <button onclick="fun(1)" style="width: 25px;height: 25px">▼</button>
                                </th>
                                <input type="hidden" id="type" value="${ type}">
                                <th >操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <s:iterator value="#request.students" var="student">
                                <tr align="center">
                                    <td ><input class="check" type="checkbox" value="${student.stuSysid.sysid}"></td>
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
                        </div>
                        <br/><br/>

                        <div class="footer" >
                            <div class="footer-left">
                                <span>&copy; 2019. 企明星考核系统.</span>
                            </div>

                        </div><!--footer-->


                </div>
</div>
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
        window.location.href = "${pageContext.request.contextPath}/exportExcel?&term=${term}&sclass=${stusclass}&name=${name}&assess=0";
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