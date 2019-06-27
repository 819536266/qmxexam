<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>城建考试系统</title>
    <script src="<%=path %>/js/jquery-1.9.1.min.js"></script>
    <script src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
    <script src="<%=path %>/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/css/student.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap/bootstrap.min.css" type="text/css"/>
    <style>
        @media only screen and (max-width: 900px) {
            #id {

            }

            #table {
                margin-left: 20px;
            }
        }

        @media only screen and (min-width: 900px) {
            #id {
                width: 350px;
                margin-bottom: 200px;
            }

            #table {

            }
        }
    </style>

    <script>
        $(function () {
            $("input[type='checkbox']").each(function () {
                this.checked = false;
            })
            $("input[type='radio']").each(function () {
                this.checked = false;
            })
        })
        window.onload = function () {
            daojishi();
        }

        var counttime = 120 * 60;//总秒钟

        function daojishi() {
            if (counttime >= 0) {
                var ms = counttime % 60;//余数 89%60==29秒
                var mis = Math.floor(counttime / 60);//分钟
                if (mis >= 60) {
                    var hour = Math.floor(mis / 60);

                    mis = Math.floor((counttime - hour * 60 * 60) / 60);

                    document.getElementById("mss").innerHTML = hour + ":" + mis + ":" + ms;
                    document.getElementById("mss1").innerHTML = hour + ":" + mis + ":" + ms;
                } else if (mis >= 1) {
                    document.getElementById("mss").innerHTML = mis + ":" + ms;
                    document.getElementById("mss1").innerHTML = mis + ":" + ms;
                } else {
                    document.getElementById("mss").innerHTML = ms;
                    document.getElementById("mss1").innerHTML = ms;
                }


                counttime--;
                vartt = window.setTimeout("daojishi()", 1000);
            } else {
                window.clearTimeout(vartt);
                window.confirm("考试时间结束,请单击提交");
                tijiao();

            }


        }

        function tijiao() {
            document.forms[0].submit();
        }
    </script>
    <script type="text/javascript">
        function clickBut(r) {
            var num = 0;
            checked = false;
            $("input[name='" + r.name + "']").each(function () {
                if (this.checked) {
                    checked = true;
                    return false;
                }
            })
            num = r.name.substring(9, r.name.length - 1);
            if (checked) {
                num = parseInt(num) + 1;
                document.getElementById("k" + num).style.background = "#0088cc";
                document.getElementById("k" + num).style.opacity = "1";
            } else {
                num = parseInt(num) + 1;
                document.getElementById("k" + num).style.background = "rgba(255, 255, 255)";
                document.getElementById("k" + num).style.opacity = "1";
            }
        }

        function fun() {
            $("#from").submit();
        }
    </script>
    <title>学生登陆成功</title>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-bottom" id="id">
    <div class="navbar-header" style="width: 100%;">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-xs-4 col-xs-offset-4">
                <font size="4" face="楷体">考试题(每题一分)</font>
            </div>
            <div class="col-xs-2 col-xs-push-1">

                <a class="navbar-toggle collapsed" data-toggle="collapse" href="#sub">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div id="move" class="col-md-12 col-xs-12">
            <ul class="nav " style="width: 100%" id="sub">

                <div class="col-md-12 col-xs-11" id="table">
                    <div id="timer"></div>
                    <div class="warp_ans">
                        <table class="table  table-responsive">
                            <s:iterator value="#request.subjects" status="s1">
                                <c:if test="${(s1.index) % 10==0}">
                                    <tr>
                                        <c:forEach var="s" begin="0" end="${subjects.size()-s1.index-1}">
                                            <c:if test="${(s+1)<=10}">
                                                <td style="padding: 0;">
                                                    <a id="k${s+1+s1.index}" class="btn btn-default"
                                                       style="padding: 0;width: 100%;height: 100%"
                                                       href="#xmd${s+1+s1.index}">

                                                        <font color="black">${s+1+s1.index}</font>
                                                    </a>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                </c:if>
                            </s:iterator>
                            <%--<font size="4" face="楷体">判断题</font>--%>
                            <s:iterator value="#request.subjectsjud" status="s1">

                                <c:if test="${(s1.index) % 10==0}">
                                    <tr>
                                        <c:forEach var="s" begin="0" end="${subjectsjud.size()-s1.index-1}">
                                            <c:if test="${(s+1)<=10}">
                                                <td style="padding: 0;">
                                                    <a id="k${s+1+s1.index+subjects.size()}" class="btn btn-default"
                                                       style="padding: 0;width: 100%;height: 100%"
                                                       href="#pmd${s+1+s1.index+subjects.size()}">
                                                        <font color="black"> ${s+1+s1.index+subjects.size()}</font>
                                                    </a>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                </c:if>
                            </s:iterator>

                            <s:iterator value="#request.cases" status="s1">
                                <c:if test="${(s1.index) % 10==0}">
                                    <tr>
                                        <c:forEach var="s" begin="0" end="${cases.size()-s1.index-1}">
                                            <c:if test="${(s+1)<=10}">
                                                <td style="padding: 0;">
                                                    <a id="k${s+1+s1.index+subjects.size()+subjectsjud.size()}"
                                                       class="btn btn-default"
                                                       style="padding: 0;width: 100%;height: 100%"
                                                       href="#pmd${s+1+s1.index+subjects.size()+subjectsjud.size()}">
                                                        <font color="black"> ${s+1+s1.index+subjects.size()+subjectsjud.size()}</font>
                                                    </a>
                                                </td>
                                            </c:if>

                                        </c:forEach>
                                    </tr>
                                </c:if>
                            </s:iterator>
                        </table>
                        <div align="center">
                            <a class="btn btn-primary" href="<%=path %>/getRandomSubject.action">
                                重做
                            </a>
                            <button onclick="fun()" class="btn btn-primary">提交
                            </button>
                            <span>剩余时间为：<font id="mss"></font></span>
                        </div>
                    </div>
                </div>
            </ul>
        </div>

    </div>
    </div>

</nav>
<div class="container-fluid">

    <div class="row">


        <div class="col-md-6 col-md-offset-4 ">

            <div class="header">
                <div class="logo">
                    <a href="<%=path %>/getRandomSubject.action"><img src="<%=path %>/images/logo.png" alt=""/></a>
                </div>
                <div class="headerinner">
                    <ul class="headmenu">
                        <li class="right">
                            <div class="userloggedinfo">
                                <img src="<%=path %>/images/photos/thumb5.png" alt=""/>
                                <div class="userinfo">
                                    <h5>${studentInfo.studentName}
                                        <small></small>
                                    </h5>
                                    <ul>
                                        <li><a href="<%=path %>/login.jsp">退出登录</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <!--headmenu-->
                </div>
            </div>

            <div class="examed_uc maincontentinner">
                <h3 style="text-align: center;">洛阳城建学校考试</h3>
                <br>
                <div class="exam_time">
                    <span>剩余时间为：</span><label name="mss" id="mss1"></label>
                </div>
                <div class="questionCell" id="D_Title_P">
                    <div class="titleBar">
                        <span><b id="D_Title">考试题(每题一分)</b></span>
                        <div class="clear"></div>
                    </div>

                    <form id="from" action="submitExam.action" method="post">
                        <s:iterator value="#request.subjects" var="subject" status="sta">
                            <c:if test="${subject.stOptionD=='案例题目'}">
                                <div id="xmd${sta.index+1 }" name="xmd${sta.index+1 }" class="question">
                                    <p>${sta.index+1 }、<font color="red">案例题:(<span
                                            class="D_score">每题一</span>分)</font><br>${subject.stTitle}&nbsp;
                                    <input type="hidden" name="stID" value="${subject.stID}"/>
                                        <input type="hidden" name="stAnswer[${sta.index}]" value="z"
                                               />
                                </div>
                            </c:if>
                            <c:if test="${subject.stOptionD!='案例题目'}">
                            <div id="xmd${sta.index+1 }" name="xmd${sta.index+1 }" class="question">
                                <input type="hidden" name="stID" value="${subject.stID}"/>
                                <p>${sta.index + 1}、${subject.stTitle}&nbsp;(<span class="D_score">1.00</span>分)</p>
                                <c:if test="${subject.stOptionD != null&&subject.stOptionD !=''&&subject.stOptionD=='判断'}">
                                    <ul>
                                        <li>
                                            <input type="radio" name="stAnswer[${sta.index}]" value="1"
                                                   onclick="clickBut(this);"/> <font size="3" face="加粗">正确</font>
                                        </li>
                                        <li>
                                            <input type="radio" name="stAnswer[${sta.index}]" value="2"
                                                   onclick="clickBut(this);"/> <font size="3" face="加粗">错误</font>
                                        </li>
                                    </ul>
                                </c:if>
                                <c:if test="${subject.stOptionD!='判断'}">


                                <ul>
                                    <li>
                                        <c:if test="${subject.stOptionA != null&&subject.stOptionA !=''}">
                                            <input type="checkbox" name="stAnswer[${sta.index}]" value="A"
                                                   onclick="clickBut(this);"/><font size="3"
                                                                                    face="加粗">A．${subject.stOptionA}</font>
                                        </c:if>
                                    </li>

                                    <li>
                                        <c:if test="${subject.stOptionB != null&&subject.stOptionB !=''}">
                                            <input type="checkbox" name="stAnswer[${sta.index}]" value="B"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">B．${subject.stOptionB}</font>
                                        </c:if>
                                    </li>

                                    <li>
                                        <c:if test="${subject.stOptionC != null&&subject.stOptionC !=''}">
                                            <input type="checkbox" name="stAnswer[${sta.index}]" value="C"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">C．${subject.stOptionC}</font>
                                        </c:if>
                                    </li>

                                    <li>
                                        <c:if test="${subject.stOptionD != null&&subject.stOptionD !=''}">
                                            <input type="checkbox" name="stAnswer[${sta.index}]" value="D"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">D．${subject.stOptionD}</font>
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${subject.stOptionE!=null&&subject.stOptionE!=''}">
                                            <input type="checkbox" name="stAnswer[${sta.index}]" value="E"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">E．${subject.stOptionE}</font>
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${subject.stOptionF != null&&subject.stOptionF !=''}">
                                            <input type="checkbox" name="stAnswer[${sta.index}]" value="F"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">F．${subject.stOptionF}</font>
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${subject.stOptionG != null&&subject.stOptionG !=''}">
                                            <input type="checkbox" name="stAnswer[${sta.index}]" value="G"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">G．${subject.stOptionG}</font>
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${subject.stOptionH != null&&subject.stOptionH !=''}">
                                            <input type="checkbox" name="stAnswer[${sta.index}]" value="H"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">H．${subject.stOptionH}</font>
                                        </c:if>
                                    </li>

                                    </c:if>
                                </ul>
                            </div>
                            </c:if>
                        </s:iterator><br>
                        <%--<span><b id="D_Title">判断题(${subjectsjud.size()}分)</b></span>--%>

                        <s:iterator value="#request.subjectsjud" var="subjectjud" status="sta">
                            <div id="pmd${sta.index+1+subjects.size()}" name="pmd${sta.index+1+subjects.size() }"
                                 class="question">
                                <input type="hidden" name="stID" value="${subjectjud.stID}"/>
                                <p>${sta.index + subjects.size()+1}、${subjectjud.stTitle}&nbsp;(<span class="D_score">1.00</span>分)
                                </p>
                                <ul>
                                    <li>
                                        <input type="radio" name="stAnswer[${sta.index+subjects.size()}]" value="1"
                                               onclick="clickBut(this);"/> <font size="3" face="加粗">正确</font>
                                    </li>
                                    <li>
                                        <input type="radio" name="stAnswer[${sta.index+subjects.size()}]" value="2"
                                               onclick="clickBut(this);"/> <font size="3" face="加粗">错误</font>
                                    </li>
                                </ul>
                            </div>
                        </s:iterator>
                        <br>

                        <s:iterator value="#request.cases" var="subjectjud" status="sta">
                            <c:if test="${subjectjud.stOptionD=='案例题目'}">
                                <input type="hidden" name="stID" value="${subjectjud.stID}"/>
                                <div id="pmd${sta.index+1+subjects.size()+subjectsjud.size()}"
                                     name="pmd${sta.index+1+subjects.size()+subjectsjud.size() }"
                                     class="question">
                                    <p>${sta.index + subjects.size()+1+subjectsjud.size()}、<font color="red">案例题:(<span
                                            class="D_score">每题一</span>分)</font><br>${subjectjud.stTitle}&nbsp;
                                    </p>
                                    <input type="hidden"
                                           name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                           value="z"
                                           onclick="clickBut(this);"/>
                                </div>
                            </c:if>
                            <c:if test="${subjectjud.stOptionD!='案例题目'}">
                                <div id="pmd${sta.index+1+subjects.size()+subjectsjud.size()}" name="pmd${sta.index+1+subjects.size()+subjectsjud.size() }"
                                class="question">
                                <input type="hidden" name="stID" value="${subjectjud.stID}"/>
                                <p>${sta.index + subjects.size()+1+subjectsjud.size()}、${subjectjud.stTitle}&nbsp;(<span
                                        class="D_score">1.00</span>分)
                                </p>
                                <ul>
                                    <li>
                                        <c:if test="${subject.stOptionA != null&&subject.stOptionA !=''}">
                                            <input type="checkbox"
                                                   name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                                   value="A"
                                                   onclick="clickBut(this);"/><font size="3"
                                                                                    face="加粗">A．${subjectjud.stOptionA}</font>
                                        </c:if>
                                    </li>

                                    <li>
                                        <c:if test="${subject.stOptionB != null&&subject.stOptionB !=''}">
                                            <input type="checkbox"
                                                   name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                                   value="B"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">B．${subjectjud.stOptionB}</font>
                                        </c:if>
                                    </li>

                                    <li>
                                        <c:if test="${subject.stOptionC != null&&subject.stOptionC !=''}">
                                            <input type="checkbox"
                                                   name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                                   value="C"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">C．${subjectjud.stOptionC}</font>
                                        </c:if>
                                    </li>

                                    <li>
                                        <c:if test="${subject.stOptionD != null&&subject.stOptionD !=''}">
                                            <input type="checkbox"
                                                   name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                                   value="D"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">D．${subjectjud.stOptionD}</font>
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${subject.stOptionE != null&&subject.stOptionE !=''}">
                                            <input type="checkbox"
                                                   name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                                   value="E"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">E．${subjectjud.stOptionE}11</font>
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${subject.stOptionF != null&&subject.stOptionF !=''}">
                                            <input type="checkbox"
                                                   name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                                   value="F"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">F．${subjectjud.stOptionF}</font>
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${subject.stOptionG != null&&subject.stOptionG !=''}">
                                            <input type="checkbox"
                                                   name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                                   value="G"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">G．${subjectjud.stOptionG}</font>
                                        </c:if>
                                    </li>
                                    <li>
                                        <c:if test="${subject.stOptionH != null&&subject.stOptionH !=''}">
                                            <input type="checkbox"
                                                   name="stAnswer[${sta.index+subjectsjud.size()+subjects.size()}]"
                                                   value="H"
                                                   onclick="clickBut(this);"/> <font size="3"
                                                                                     face="加粗">H．${subject.stOptionH}</font>
                                        </c:if>
                                    </li>

                                </ul>

                            </div>
                            </c:if>
                        </s:iterator>
                    </form>

                </div>


            </div>

        </div>
    </div>


</div>
</body>
</html>