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


    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/responsive-tables.css">
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>

    <link rel="stylesheet" href="<%=path %>/css/BeatPicker.min.css"/>
    <script src="<%=path %>/js/jquery-2.1.4.min.js"></script>
    <script src="<%=path %>/js/BeatPicker.min.js"></script>
    <script src="<%=path %>/js/select.js"></script>
    <style type="text/css">

        select {
            padding: 5px;
            border-radius: 5px;
            outline: none;
        }
    </style>
    <title>企明星考核系统</title>
</head>
<body>

<div class="mainwrapper">
    <s:include value="header.jsp"/>


    <div class="rightpanel">

        <ul class="breadcrumbs">
            <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span class="separator"></span>
            </li>
            <li>员工管理 <span class="separator"></span></li>
            <li>添加员工</li>

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
                    <div class="widgetcontent">
                         <span> <font size="3" face="楷体"
                                                                color="rgb(30, 130, 232);">选择部门:  </font> </span>
                                <span class="field" id="span">
                                    <select class="form-control"  id="selectone" onchange="fun1(1)" style="width:110px"></select>
                                    <select class="form-control"  name="scalss" id="selecttwo" onchange="fun2()" style="width:110px">
                                    </select>
                                </span>
                        <br/>
                        <span> <font size="3" face="楷体" color="rgb(30, 130, 232);">选择日期:</font> </span>
                        <span class="field" id="date">
								<select id="year" style="width:110px">
									<option value="">选择年份</option>
								</select>
								<select id="month" style="width:105px">
									<option value="">选择月份</option>
								</select>
						</span>
                        <br/>
                        <span> <font size="3" face="楷体" color="rgb(30, 130, 232);">选择类型:</font> </span>
                        <span class="field" >
                            <select class="form-control"  id="assess"  style="width:110px">
                                <option value="1"> 考核成绩</option>
                                <option value="0"> 考试成绩</option>
                            </select>
                        </span>
                        <p class="stdformbutton">
                            <button onclick="fun()" class="btn btn-success " style="width: 100px;height: 40px;color: blue;">查询</button>
                        </p>
                        <div style="width: 80%;height: 80% ;margin: auto;" id="img">
                        </div>
                    </div><!--widgetcontent-->
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

</body>
<script type="text/javascript">
    function fun() {
        var year = $("#year option:selected").html();
        var month = $("#month option:selected").html();
        year = year.substring(2, 4);
        month = month.substring(0, 2);
        term = year + month;
        if (year == "年份") {
            term = "";
        }
        if (month == "选择") {
            term = "";
        }
        sclass = document.getElementById("selecttwo").value;
        if (term != "" && sclass != "") {
            img = document.getElementById("img");
            $.ajax({
                type: "get",
                url: "${pageContext.request.contextPath}/studentJfree",
                data: {"sclass": sclass, "term": term,"assess":$("#assess").val()},
                success: function (data) {
                    if (data == "error") {
                        alert("暂无考试分数!");
                    } else {
                        img.innerHTML = "<img  src='" + data + "'>";
                    }
                }
            });
        } else {
            alert("请选择部门或日期!");
        }
    }

    function fun1() {
        img = document.getElementById("img");
        img.innerHTML = "";
    }
    $(function () {
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
                $(JSON.parse(data)).each(function(i,n){
                    $("#selecttwo").append("<option url='"+n.centreId+"' value='"+n.centreName+"'>"+n.centreName+"</option>");

                });
                fun2(data[0].centreId);
            }
        })

    }
    function  fun2(centreId){

        id= $("#selecttwo").find("option:selected").attr("url");

        if(id==null||id==""){
            id=centreId;
        }
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
</script>

</html>