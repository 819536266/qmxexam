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

    <link rel="stylesheet" href="<%=path %>/css/style.default.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/responsive-tables.css">
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-fileupload.min.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap-timepicker.min.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-migrate-1.1.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.uniform.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="<%=path %>/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/responsive-tables.js"></script>
    <script type="text/javascript" src="<%=path %>/js/custom.js"></script>
    <%--<script type="text/javascript">
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
    </script>--%>
    <title>企明星考核系统</title>
</head>


<body>
                <div class="widget">
                    <h4 class="widgettitle">试题编辑</h4>
                    <div class="widgetcontent">
                        <form class="stdform" action="subjectUpadate.action" id="parent" method="post">
                            <p>
                                <label>选择部门</label>
                                <span class="field" id="span">
                                    <select class="form-control"  id="selectone" onchange="fun1()" style="width:110px"></select>
                                    <select class="form-control"  name="scalss" id="selecttwo" onchange="fun2()" style="width:110px">
                                    </select>
                                </span>
                            </p>
                            <p>
                                <label>试题题目</label>
                                <span class="field">
						 <input name="stID" type="hidden" value="${subject.stID}">
						 <textarea name="stTitle" cols="80" rows="5" class="span5">${subject.stTitle}</textarea>
						 </span>
                            </p>
                            <p name="stOption">
                                <label>选项A:</label>
                                <span class="field"><input type="text" name="stOptionA" class="input-large"
                                                           placeholder="选项A" value="${subject.stOptionA}"><font
                                        style="color:red">判断题无需输入</font></span>
                            </p>
                            <p name="stOption">
                                <label>选项B:</label>
                                <span class="field"><input type="text" name="stOptionB" class="input-large"
                                                           placeholder="选项B" value="${subject.stOptionB}"><font
                                        style="color:red">判断题无需输入</font></span>
                            </p>
                            <p name="stOption">
                                <label>选项C:</label>
                                <span class="field"><input type="text" name="stOptionC" class="input-large"
                                                           placeholder="选项C" value="${subject.stOptionC}"><font
                                        style="color:red">判断题无需输入</font></span>
                            </p>
                            <p name="stOption">
                                <label>选项D:</label>
                                <span class="field"><input type="text" name="stOptionD" class="input-large"
                                                           placeholder="选项D" value="${subject.stOptionD}"><font
                                        style="color:red">判断题请输入'判断'两字</font></span>
                            </p>
                            <c:if test="${subject.stOptionE != null&&subject.stOptionE !=''}">
                                <p name="stOption">
                                    <label>选项E:</label>
                                    <span class="field"><input type="text" name="stOptionE" class="input-large"
                                                               placeholder="选项E" value="${subject.stOptionE}"><font
                                            style="color:red">判断题请输入'判断'两字</font></span>
                                </p>
                            </c:if>
                            <c:if test="${subject.stOptionF != null&&subject.stOptionF !=''}">
                                <p name="stOption">
                                    <label>选项F:</label>
                                    <span class="field"><input type="text" name="stOptionF" class="input-large"
                                                               placeholder="选项F" value="${subject.stOptionF}"><font
                                            style="color:red">判断题请输入'判断'两字</font></span>
                                </p>
                            </c:if>
                            <c:if test="${subject.stOptionG != null&&subject.stOptionG !=''}">
                                <p name="stOption">
                                    <label>选项G:</label>
                                    <span class="field"><input type="text" name="stOptionG" class="input-large"
                                                               placeholder="选项G" value="${subject.stOptionG}"><font
                                            style="color:red">判断题请输入'判断'两字</font></span>
                                </p>
                            </c:if>
                            <c:if test="${subject.stOptionH != null&&subject.stOptionH !=''}">
                                <p name="stOption">
                                    <label>选项H:</label>
                                    <span class="field"><input type="text" name="stOptionH" class="input-large"
                                                               placeholder="选项H" value="${subject.stOptionH}"><font
                                            style="color:red">判断题请输入'判断'两字</font></span>
                                </p>
                            </c:if>
                            <c:if test="${subject.stOptionI != null&&subject.stOptionI !=''}">
                                <p name="stOption">
                                    <label>选项I:</label>
                                    <span class="field"><input type="text" name="stOptionI" class="input-large"
                                                               placeholder="选项I" value="${subject.stOptionI}"><font
                                            style="color:red">判断题请输入'判断'两字</font></span>
                                </p>
                            </c:if>
                            <p>
                                <label>判断题答案</label>
                                <input name="stAnswer" type="radio" value="1"
                                       onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1"
                                ${subject.stAnswer == "1" ? "checked" : ""} />正确
                                <input name="stAnswer" type="radio" value="2"
                                       onclick="if(this.c==1){this.c=0;this.checked=0}else this.c=1"
                                ${subject.stAnswer == "2" ? "checked" : ""}/>错误


                            </p>
                            <p>
                                <label>选择题答案</label>

                                <input name="stAnswer" type="checkbox" value="A"
                                ${subject.stAnswer.indexOf("A") != -1||subject.stAnswer=="A"  ? "checked" : ""}>A
                                <input name="stAnswer" type="checkbox" value="B"
                                ${subject.stAnswer.indexOf("B") != -1||subject.stAnswer=="B"? "checked" : ""}>B
                                <input name="stAnswer" type="checkbox" value="C"
                                ${subject.stAnswer.indexOf("C")!= -1 ||subject.stAnswer=="C"? "checked" : ""}>C
                                <input name="stAnswer" type="checkbox" value="D"
                                ${subject.stAnswer.indexOf("D")!= -1||subject.stAnswer=="D" ? "checked" : ""}>D
                                <input name="stAnswer" type="checkbox" value="E"
                                ${subject.stAnswer.indexOf("E")!= -1||subject.stAnswer=="E" ? "checked" : ""}>E
                                <input name="stAnswer" type="checkbox" value="F"
                                ${subject.stAnswer.indexOf("F")!= -1||subject.stAnswer=="F" ? "checked" : ""}>F
                                <input name="stAnswer" type="checkbox" value="G"
                                ${subject.stAnswer.indexOf("G")!= -1||subject.stAnswer=="G" ? "checked" : ""}>G
                                <input name="stAnswer" type="checkbox" value="H"
                                ${subject.stAnswer.indexOf("H")!= -1||subject.stAnswer=="H" ? "checked" : ""}>H
                                <input name="stAnswer" type="checkbox" value="I"
                                ${subject.stAnswer.indexOf("I")!= -1||subject.stAnswer=="I" ? "checked" : ""}>I
                            </p>
                            <p>
                                <label>试题解析</label>
                                <span class="field"><textarea cols="80" name="stParse" rows="5"
                                                              class="span5">${subject.stParse}</textarea><font
                                        style="color:red">若无解析,请输入'解析'两字</font></span>
                            </p>


                            <p class="stdformbutton">
                                <input type="submit" value="录入">
                                <input type="reset" value="重置">
                                <input type="button" value="添加答案" onclick="add()">
                            </p>

                        </form>
                    </div><!--widgetcontent-->
                </div><!--widget-->
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
    //添加选项
    var s = ["E", "F", "G", "H", "I"];

    function add() {
        i = $("p[name='stOption']").length;
        if (i >= 9) {
            alert("不可添加!");
        } else {
            $("p[name='stOption']").eq(i - 1).after("<p name='stOption'><label>选项" + s[i - 4] + ":</label><span class='field'><input type='text' name='stOption" + s[i - 4] + "'" +
                "class='input-large' placeholder='答案" + s[i - 4] + ",判断题无需输入'><font style='color:red'>判断题无需输入 &nbsp;</font></span></p>");
        }
    }

    /* <a  onclick='deletep(this)'>删除</a> */
    //删除选项
    function deletep(i) {
        $(i).parent().parent().remove();
    }


</script>
</html>