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
    <title>企明星考核系统</title>

    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap/bootstrap.min.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
    <script src="<%=path %>/js/jquery-2.1.4.min.js"></script>
    <script src="<%=path %>/js/select.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/utf8-jsp/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=path %>/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
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

        <form  id="form" action="<%=path %>/scorde_add.action" method="post" class="form-inline">
           <h4 >
        <span> <font size="3" face="楷体" color="rgb(30, 130, 232);">选择日期:</font> </span>
        <span class="field" id="date">
								<input type="month" id="month" name="term" value="">
						</span>
        &nbsp; &nbsp; &nbsp; 被考核人: ${studentname} &nbsp; &nbsp; &nbsp;<a href="javascript:void(0)" class="btn btn-success" onclick="fun()" >提交考核</a></h4>
        <div class="maincontent">
                <h4 class="widgettitle">员工表</h4>
            <div class="table-responsive" >

                <script id="editor" name="scorde.content" type="text/plain" style="width:1024px;height:500px;margin: auto"></script>
             <%--   <table id="dyntable" class="table table-bordered text-nowrap table-condensed">

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

                    </thead>
                    <tbody>
                    <c:set var="num" value="0"></c:set>
                  <input type="hidden" name="scorde1.assess" value="1">
                    <input type="hidden" name="scorde1.stuSysid.sysid" value="${studentid}">
                    <s:iterator value="#request.targets" var="target" status="var" >
                        <tr>
                            <td style="text-align:center;vertical-align:middle; " rowspan="${target.assess.size()+1}" >${target.name}</td>
                        </tr>
                        <c:forEach  items="${target.assess}" var="assess" varStatus="v">
                            <input type="hidden" name="assesslist[${num}].type" value="1">
                            <input type="hidden" name="assesslist[${num}].target.id" value="${target.id}">
                            <tr ><input type="hidden" name="assesslist[${num}].content" value="${assess.content}"/>
                                <td>${assess.content}</td>
                                <td><input type="radio" name="assesslist[${num}].test1" value="5" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="assesslist[${num}].test1" value="4" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="assesslist[${num}].test1" value="3" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="assesslist[${num}].test1" value="2" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="assesslist[${num}].test1" value="1" onclick="rowscord(this)"/></td>
                                <td><input type="radio" name="assesslist[${num}].test1" checked="checked" value="0" onclick="rowscord(this)"/></td>
                                <td ><span class="rowcount">0</span>分</td>
                                <c:set var="num" value="${num+1}"></c:set>
                            </tr>
                        </c:forEach>
                    </s:iterator>
                  <tr style="text-align:center;vertical-align:middle; ">
                        <td colspan="2" style="text-align:center;vertical-align:middle;">部门领导评分</td>
                        <td colspan="3" style="text-align:center;vertical-align:middle;">分值</td>
                        <td colspan="4" style="text-align:center;vertical-align:middle;"><input type="text" value="0" readonly="readonly" name="scorde1.shorttime" style="width: 30px;height: 20px" class="count"/>分</td>
                    </tr>
                    <tr >
                        <td colspan="2" style="text-align:center;vertical-align:middle;">总经理评分</td>
                        <td colspan="3" style="text-align:center;vertical-align:middle;">分值</td>
                        <td colspan="4" style="text-align:center;vertical-align:middle;"><input type="text" value="0"  readonly="readonly" name="scorde1.timescore"  style="width: 30px;height: 20px" class="count"/>分</td>
                    </tr>

                    </tbody>
                </table>
--%>
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
    var ue = UE.getEditor('editor',{
        toolbars: [
            ['fullscreen', 'source', 'undo', 'redo', 'bold','print','preview',
                'horizontal','removeformat', 'time','date','mergeright',
                'mergedown', 'deleterow', 'deletecol', 'splittorows', 'splittocols', 'splittocells',
                'deletecaption', 'mergecells', 'deletetable', 'cleardoc','inserttable',
                'drafts','charts', ]
        ],
        autoHeightEnabled: true,
        autoFloatEnabled: true
    });

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

    function fun(type) {
        if($("#month").val()!=""){
            $("#form").submit();
        }else{
            alert("请选择时间")
        }

    };

</script>

</body>
</html>