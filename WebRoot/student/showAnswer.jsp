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
    <title></title>
    <link rel="stylesheet" href="<%=path %>/css/student.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
    <title>员工登陆成功</title>
    <script src="<%=path %>/js/jquery-1.9.1.min.js"></script>
    <script src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
    <script src="<%=path %>/js/bootstrap.min.js"></script>
    <link href="<%=path %>/admin/css/font-awesome.css" rel="stylesheet">
    <link href="<%=path %>/admin/css/style.css?v=4.1.0" rel="stylesheet">
    <link rel="stylesheet" href="<%=path %>/css/student.css" type="text/css"/>
    <link rel="stylesheet" href="<%=path %>/css/bootstrap/bootstrap.min.css" type="text/css"/>

    <style>
        @media only screen and (max-width: 900px) {
            #id{

            }
            #table{
                margin-left: 20px;
            }
        }
        @media only screen and (min-width: 900px) {
            #id{
                width: 350px;
                margin-bottom: 200px;
            }
            #table{

            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-bottom" id="id">
    <div class="navbar-header" style="width: 100%;">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-xs-4 col-xs-offset-4" >
                <font size="4" face="楷体">考试题(每题一分)</font>
            </div>
            <div class="col-xs-2 col-xs-push-1">

                <a class="navbar-toggle collapsed" data-toggle="collapse" href="#sub"  >
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
            </div>
        </div>
    </div>
<div class="row">
    <div id="move" class="col-md-12 col-xs-12" >
        <ul class="nav " style="width: 100%" id="sub">

            <div class="col-md-12 col-xs-11"  id="table">
                <div id="timer"></div>
            <div class="warp_ans">
                <table>
                    <s:iterator value="#request.subjects" status="s1">
                        <c:if test="${(s1.index) % 10==0}">
                            <tr height="5%">
                                <c:forEach var="s" begin="0" end="${subjects.size()-s1.index-1}">
                                    <c:if test="${(s+1)<=10}">
                                        <td width="3%"  style="padding: 0;">
                                            <a id="k${s+s1.index}" href="#xmd${s+s1.index}" class="btn btn-default"
                                               style="padding: 0;width: 100%;height: 100%">
                                                <font color="black"> ${s+1+s1.index}</font>
                                            </a>
                                        </td>
                                    </c:if>
                                </c:forEach>
                            </tr>
                        </c:if>
                    </s:iterator>
                </table>
                <div align="center">
                    <a href="<%=path %>/Reform.action">
                        <button class="btn btn-primary">重做</button>
                    </a>
                    <a href="<%=path %>/getRandomSubject.action">
                        <button class="btn btn-primary">换题重做</button>
                    </a>
                    考生分数:${session.score!=null?score:0 }分
                </div>
            </div>
        </div>

        </ul>
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
            <h3 style="text-align: center;">企明星员工考试参考答案</h3>
            <br>
            <div>
                <font size="3"> <span>考试时间：2 小时</span> &nbsp; &nbsp; &nbsp; &nbsp; </font>
            </div>
            <div class="questionCell" id="D_Title_P">
                <div class="titleBar">
                    <span><b id="D_Title">答题卡 <font size="3"style="color: rgba(255, 100,100,1)">红色为错误</font> ,
                        <font size="3"style="color: rgba(144, 238, 144,0.9)">绿色正确</font>,
                        <font size="3" >白色为案例题</font></b></span>
                    <div class="clear"></div>
                </div>

                <s:iterator value="#request.subjects" var="subject" status="sta">
                    <c:if test="${subject.stOptionD=='案例题目'}">
                        <input type="hidden" name="stID" value="${subject.stID}"/>
                        <div id="xmd${sta.index }" name="xmd${sta.index+1 }" class="question">
                            <input type="hidden" name="stID" value="${subject.stID}"/>
                            <p>${sta.index + 1}、<font color="red">案例题:(<span
                                    class="D_score">每题一</span>分)</font><br><font color="red">${subject.stTitle}</font>&nbsp;
                            </p>
                            <font size="3" id="student${sta.index }"
                          style="color: rgba(255, 255, 255,0.9)"></font>
                        </div>
                    </c:if>
                    <c:if test="${subject.stOptionD!='案例题目'}">
                    <div id="xmd${sta.index }" name="xmd${sta.index+1 }" class="question">
                        <input type="hidden" name="stID" value="${subject.stID}"/>
                        <p>第${sta.index + 1}题&nbsp;${subject.stTitle}</p>
                        <ul>
                            <li>
                                <c:if test="${subject.stOptionB != null&&subject.stOptionB !=''}">
                                    <font size="3"><strong>A．</strong>${subject.stOptionA}</font>
                                </c:if>
                            </li>

                            <li>
                                <c:if test="${subject.stOptionB != null&&subject.stOptionB !=''}">
                                    <font size="3"><strong>B．</strong>${subject.stOptionB}</font>
                                </c:if>
                            </li>

                            <li>
                                <c:if test="${subject.stOptionC != null&&subject.stOptionC !=''}">
                                    <font size="3"><strong>C．</strong>${subject.stOptionC}</font>
                                </c:if>
                            </li>

                            <li>
                                <c:if test="${subject.stOptionD != null&&subject.stOptionD !=''&&subject.stOptionD !='判断'}">
                                    <font size="3"><strong>D．</strong>${subject.stOptionD}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionE != null&&subject.stOptionE !=''}">
                                    <font size="3"><strong>E．</strong>${subject.stOptionE}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionF != null&&subject.stOptionF !=''}">
                                    <font size="3"><strong>F．</strong>${subject.stOptionF}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionG != null&&subject.stOptionG !=''}">
                                    <font size="3"><strong>G．</strong>${subject.stOptionG}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionH != null&&subject.stOptionH !=''}">
                                    <font size="3"><strong>H．</strong>${subject.stOptionH}</font>
                                </c:if>
                            </li>

                            <c:if test="${studentAnswers[sta.index]==subject.stAnswer}">
                                <font size="3" id="font">【考生答案】:</font>
                                <font size="3" id="student${sta.index }"
                                      style="color: rgba(144, 238, 144,0.9)"><c:if test="${subject.stAnswer=='1'}">
                                    对
                                </c:if>
                                    <c:if test="${subject.stAnswer=='2'}">
                                        错
                                    </c:if>
                                    <c:if test="${subject.stAnswer!='2'&&subject.stAnswer!='1'}">
                                        ${ studentAnswers[sta.index]}
                                    </c:if></font>
                            </c:if>
                            <c:if test="${ studentAnswers[sta.index]!=subject.stAnswer&&studentAnswers[sta.index]!=null&&studentAnswers[sta.index]!=''}">
                                <font size="3" id="font">【考生答案】:</font>
                                <font size="3" id="student${sta.index }" style="color: rgba(255, 100,100)">
                                    <c:if test="${studentAnswers[sta.index]=='1'}">
                                        对
                                    </c:if>
                                    <c:if test="${studentAnswers[sta.index]=='2'}">
                                        错
                                    </c:if>
                                    <c:if test="${subject.stAnswer!='2'&&subject.stAnswer!='1'}">
                                        ${ studentAnswers[sta.index]}
                                    </c:if></font>
                            </c:if>
                            <c:if test="${ studentAnswers[sta.index]==''||studentAnswers[sta.index]==null}">
                                <font size="3" id="font">【考生答案】:</font>
                                <font size="3" id="student${sta.index }"
                                      style="color:rgba(255, 100,100)">无</font>
                            </c:if>
                            <br>
                            <font size="3" id="font"><strong>【正确答案】：
                                <c:if test="${subject.stAnswer=='1'}">
                                对
                                </c:if>
                                <c:if test="${subject.stAnswer=='2'}">
                                错
                                </c:if>
                                <c:if test="${subject.stAnswer!='2'&&subject.stAnswer!='1'}">
                                    ${subject.stAnswer}
                                </c:if>

                                <br/></font>
                            <font size="3"> <strong>【参考解析】：${subject.stParse}</strong></font>
                        </ul>
                    </div>
                    </c:if>
                </s:iterator><br>


            </div>

        </div>
        <p style="height:300px">

        </p>
        </div>
    </div>
    </div>
</body>
<script src="<%=path %>/admin/js/content.js?v=1.0.0"></script>
</html>
<script type="text/javascript">
    $(function fun() {
        for (var i = 0; i <${subjects.size()}; i++) {
            color = document.getElementById("student" + i + "").style.color;
            document.getElementById("k" + i + "").style.background = color;
        }

    });
</script>
