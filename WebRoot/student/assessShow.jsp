<%@ page import="com.entity.Student" %>
<%@ page import="com.entity.Scorde" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


        <form  id="form" action="<%=path %>/assess_updateAssess.action" method="post" >
            <h4>  <span><font size="3" face="楷体" color="rgb(30, 130, 232);">考核时间:</font>
                <fmt:formatDate value="${scorde.testtime}" pattern="yyyy年MM月" var="date"></fmt:formatDate>${date}</span>
        &nbsp; &nbsp; &nbsp;
                被考核人: ${studentname} &nbsp; &nbsp; &nbsp;<a href="javascript:void(0)" class="btn btn-success" onclick="fun()" >点击修改考核</a></h4>
        <div class="maincontent">


                <h4 class="widgettitle">员工表</h4>
            <div class="table-responsive">
                <table id="dyntable" class="table table-bordered text-nowrap">

                    <thead>
                        <tr  >
                            <td  rowspan="2" style="text-align:center;vertical-align:middle; "><h4>考核指标</h4></td>
                            <td  rowspan="2" style="text-align:center;vertical-align:middle;"><h3>考核内容</h3></td>
                            <td  colspan="6" width="50px" style="text-align:center;vertical-align:middle;"><h3>分值</h3></td>
                            <td  rowspan="2" style="text-align:center;vertical-align:middle;"><h3>分数</h3></td>
                        </tr>
                        <tr >
                            <td >5</td>

                        </tr>

                    </thead>
                    <tbody>
                    <c:set var="num" value="0"></c:set>
                  <input type="hidden" name="scorde1.scordeId" value="${scorde.scordeId}">
                    <s:iterator value="#request.targets" var="target" status="var" >
                        <tr>
                            <td style="text-align:center;vertical-align:middle; " rowspan="${target.assess.size()+1}" >${target.name}</td>
                        </tr>
                        <c:forEach  items="${target.assess}" var="assess" varStatus="v">
                            <input type="hidden" name="assesslist[${num}].id" value="${assess.id}">
                            <input type="hidden" name="assesslist[${num}].target.id" value="${target.id}">
                            <tr ><input type="hidden" name="assesslist[${num}].content" value="${assess.content}"/>
                                <td>${assess.content}</td>

                                <td ><span class="rowcount">${assess.test1==null?'0':assess.test1}</span>分</td>
                                <c:set var="num" value="${num+1}"></c:set>
                            </tr>
                        </c:forEach>
                    </s:iterator>
                  <tr style="text-align:center;vertical-align:middle; ">
                        <td colspan="2" style="text-align:center;vertical-align:middle;">部门领导评分</td>
                        <td colspan="3" style="text-align:center;vertical-align:middle;">分值</td>
                        <td colspan="4" style="text-align:center;vertical-align:middle;"><input type="text" value="${scorde.shorttime}" readonly="readonly" style="width: 20px" />分</td>
                    </tr>

                    <tr >
                        <td colspan="2" style="text-align:center;vertical-align:middle;">总经理评分</td>
                        <td colspan="3" style="text-align:center;vertical-align:middle;">分值</td>
                        <td colspan="4" style="text-align:center;vertical-align:middle;"><input type="text" value="${scorde.timescore}"  readonly="readonly" name="scorde1.timescore"  style="width: 20px"  id="count"/>分</td>
                    </tr>

                    </tbody>
                </table>

            </div><!--maincontentinner-->
                <br/><br/>

                <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>

                </div><!--footer-->



        </div><!--maincontent-->

        </form>

<script type="text/javascript">

    function rowscord(redio) {

        $(redio).parent().siblings().last().children().html($(redio).val());
        count=0;
        $(".rowcount").each(function () {
            count+= parseInt($(this).html());
        })
            $("#count").val(count);
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
        if($("#month").val()!=""){
            $("#form").submit();
        }else{
            alert("请选择时间")
        }

    };
   /* $(function () {
        $("#date").selectDate();
    })*/

</script>

</body>
</html>