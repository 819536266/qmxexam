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
    <title>企明星考核系统</title>

    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap/bootstrap.min.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-migrate-1.1.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap-fileupload.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap-timepicker.min.js"></script>
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


        <div class="maincontent form-inline">
            <br>
            &nbsp; &nbsp; &nbsp;&nbsp; <span> <font size="6" face="楷体"
                                                    color="rgb(30, 130, 232);">选择部门查询:  </font> </span><span class="field" id="span">
                                    <select class="form-control"  id="selectone" onchange="fun1()" style="width:110px"></select>
                                    <select class="form-control"  name="scalss" id="selecttwo" onchange="fun2()" style="width:110px">
                                    </select>
                                </span>
            <select name="panduan" class="form-control" id="panduan" style="width:105px">
                <option value="" selected="selected">选择</option>
                <option value="判断">判断</option>
            </select>
            <button class="btn" style="background-color: rgb(30, 130, 232); " onclick="fun()">查询</button>
            </a>



                <h4 class="widgettitle">试题库</h4>
            <div class="table-responsive">
                <table id="dyntable" class="table table-hover table-bordered text-nowrap">

                    <thead>
                    <tr>
                        <th >全选&nbsp;<input  type="checkbox" id="checkbox">&nbsp;<a href="javascript:void(0);" onclick="deletecheck()">删除</a></th>
                        <th >试题编号</th>
                        <th >部门</th>
                        <th >试题标题</th>
                        <th >正确答案</th>
                        <th >查看试题</th>
                        <th >更新试题</th>
                        <th >删除试题</th>
                    </tr>

                    </thead>
                    <tbody>

                    <s:iterator value="#request.subjects" var="subject">
                        <tr align="center">
                            <td align="left">
                                <input class="check" type="checkbox" value="${subject.stID}">
                            </td>
                            <td>
                                    ${subject.stID}
                            </td>

                            <td align="left">
                                    ${subject.sclass}
                            </td>
                            <td align="left">
                                    ${subject.stTitle}
                            </td>
                            <td>
                                <c:if test="${subject.stAnswer=='1'}">
                                    对
                                </c:if>
                                <c:if test="${subject.stAnswer=='2'}">
                                    错
                                </c:if>
                                <c:if test="${subject.stAnswer!='2'&&subject.stAnswer!='1'}">
                                    ${subject.stAnswer}
                                </c:if>
                            </td>
                            <td>
                                <a href="subjectPaticular.action?stId=${subject.stID}">查看</a>
                            </td>
                            <td>
                                <a href="subjectUpadateBefore.action?stId=${subject.stID}">更新</a>
                            </td>
                            <td>
                                <a  onclick="deleteJobDetail(${subject.stID})">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                    <tr>
                        <td colspan="6" align="center">
                            共${page.totalCount}条纪录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条纪录
                            <s:if test="#request.page.hasPrePage">
                                <a href="querySubjectLike.action?currentPage=1&subjectTitle=${request.subjectTitle}&sclass=${request.sclass}&panduan=${request.panduan}">首页</a> |
                                <a href="querySubjectLike.action?currentPage=${page.currentPage - 1}&subjectTitle=${request.subjectTitle}&sclass=${request.sclass}&panduan=${request.panduan}">上一页</a> |
                            </s:if>
                            <s:else>
                                首页 | 上一页 |
                            </s:else>
                            <s:if test="#request.page.hasNextPage==true">
                                <a href="querySubjectLike.action?currentPage=${page.currentPage + 1}&subjectTitle=${request.subjectTitle}&sclass=${request.sclass}&panduan=${request.panduan}">下一页</a> |
                                <a href="querySubjectLike.action?currentPage=${page.totalPage}&subjectTitle=${request.subjectTitle}&sclass=${request.sclass}&panduan=${request.panduan}">尾页</a>
                            </s:if>
                            <s:else>
                                下一页 | 尾页
                            </s:else>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div><!--maincontentinner-->
                <br/><br/>



        </div><!--maincontent-->



</body>
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
                url:"${pageContext.request.contextPath}/subjectDeletecheck.action",
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
            $(":checkbox").prop("checked",true);
        }else{
            $(":checkbox").prop("checked",false);
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
    function deleteJobDetail(id) {
        if (window.confirm("你确定要删除吗")) {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/subjectDelete",
                data:{"stId":id},
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
    function deleteJobDetail(id) {
        if (window.confirm("你确定要删除吗")) {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/subjectDelete?",
                data:{"stId":id},
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
    function fun(){

        three= $("#span #selectthree").val();
        two=$("#selecttwo").val();
        val=two;
        if(three==null||three==""){

        }else{
            val=three;
        }
        window.document.location.href = "${pageContext.request.contextPath}/querySubjectLike.action?currentPage=1&subjectTitle=${request.subjectTitle}&sclass=" + val + "&panduan=" + $("#panduan").val();
    }

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
                    $("#selecttwo").append("<option  url='"+n.centreId+"' value='"+n.centreName+"'>"+n.centreName+"</option>");
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
    Array.prototype.contains = function (needle) {
        for (i in this) {
            if (this[i] == needle) return true;
        }
        return false;
    };

</script>
</html>
	