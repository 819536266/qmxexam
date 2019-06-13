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

<div class="mainwrapper">

    <div class="mainwrapper">
        <c:include value="header.jsp"/>

        <div class="rightpanel">

            <ul class="breadcrumbs">
                <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span
                        class="separator"></span></li>
                <li>试题管理<span class="separator"></span></li>
                <li>添加试题</li>

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


            <div class="maincontent">
                <div class="maincontentinner">

                    <div class="widget" id="parent">
                        <h4 class="widgettitle">添加试题</h4>
                        <div class="widgetcontent">
                            <div style="width: 400px;margin-left: 220px">
                            <a href="<%=path %>/teacher/subjectAddpd.jsp"><button class="btn" style="background-color: rgb(30, 130, 232); " >添加判断题</button></a>
                                <a href="<%=path %>/teacher/subjectWord.jsp">
                                    <button class="btn" style="background-color: rgb(30, 130, 232); ">Word文档录入</button>
                                </a>
                            </div>
                            <form class="stdform" action="subjectAdd.action" id="parent" method="post">
                                <label>选择部门:&nbsp;&nbsp;</label>
                                <span class="field" id="span">
                                    <select class="form-control"  id="selectone" onchange="fun1()" style="width:110px"></select>
                                    <select class="form-control"  name="scalss" id="selecttwo" onchange="fun2()" style="width:110px">
                                    </select>
                                </span>
                                <p>
                                    <label>试题题目</label>
                                    <span class="field"><textarea type="text" class="input-large" name="stTitle"
                                                                  size="80" required="required"></textarea></span>
                                </p>
                                <p name="stOption">
                                    <label>选项A:</label>
                                    <span class="field"><input type="text" name="stOptionA" class="input-large"
                                                               placeholder="选项A">
                                </p>
                                <p name="stOption">
                                    <label>选项B:</label>
                                    <span class="field"><input type="text" name="stOptionB" class="input-large"
                                                               placeholder="选项B">
                                </p>
                                <p name="stOption">
                                    <label>选项C:</label>
                                    <span class="field"><input type="text" name="stOptionC" class="input-large"
                                                               placeholder="选项C">
                                </p>
                                <p name="stOption">
                                    <label>选项D:</label>
                                    <span class="field"><input type="text" name="stOptionD" class="input-large"
                                                               placeholder="答案D"></span>
                                </p>

                                <p>
                                    <label>选择题答案</label>
                                    <input name="stAnswer" type="checkbox" value="A"/>A
                                    <input name="stAnswer" type="checkbox" value="B"/>B
                                    <input name="stAnswer" type="checkbox" value="C"/>C
                                    <input name="stAnswer" type="checkbox" value="D"/>D
                                    <input name="stAnswer" type="checkbox" value="E"/>E
                                    <input name="stAnswer" type="checkbox" value="F"/>F
                                    <input name="stAnswer" type="checkbox" value="G"/>G
                                    <input name="stAnswer" type="checkbox" value="H"/>H
                                    <input name="stAnswer" type="checkbox" value="I"/>I
                                </p>
                                <p>
                                    <label>试题解析</label>
                                    <span class="field"><textarea name="stParse" vocab="" cols="80" rows="5"
                                                                  class="span5">解析</textarea><font style="color:red">若无解析,请输入'解析'两字</font></span>
                                </p>


                                <p class="stdformbutton">
                                    <input type="submit" value="录入">
                                    <input type="reset" value="重置">
                                    <input type="button" value="添加答案" onclick="add()">
                                </p>
                            </form>

                        </div>
                        <!--widgetcontent-->
                    </div>
                    <!--widget-->

                    <div class="footer" >
                        <div class="footer-left">
                            <span>&copy; 2013.  All Rights Reserved.</span>
                        </div>

                    </div>
                    <!--footer-->

                </div>
                <!--maincontentinner-->
            </div>
            <!--maincontent-->

        </div>
        <!--rightpanel-->

    </div>
    <!--mainwrapper-->
</div>
</body>
<script type="text/javascript">

    $(function () {
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
<script type="text/javascript">

    $(function () {
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
<script type="text/javascript">
    //取消单选

    //添加选项
    var s = ["E", "F", "G", "H", "I"];

    function add() {
        i = $("p[name='stOption']").length;
        if (i >= 9) {
            alert("不可添加!");
        } else {
            $("p[name='stOption']").eq(i - 1).after("<p name='stOption'><label>选项" + s[i - 4] + ":</label><span class='field'><input type='text' name='stOption" + s[i - 4] + "'" +
                "class='input-large' placeholder='答案" + s[i - 4] + "'></span></p>");
        }
    }

    //删除选项
    function deletep(i) {
        $(i).parent().parent().remove();
    }


</script>

</html>


	