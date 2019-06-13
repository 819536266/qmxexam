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
    <title></title>
    <link rel="stylesheet" href="<%=path %>/css/student.css" type="text/css"/>
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico"/>
    <title>员工登陆成功</title>
    <script src="<%=path %>/js/jquery-1.9.1.min.js"></script>
    <script src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div id="move" style="width:19%;margin-top:200px; position:fixed;text-align:center;border:1px solid #888">
        <div class="floatDiv">
            <div id="timer"></div>
            <div class="warp_ans">
                <font size="4" face="楷体">题号</font>
                <table>
                    <s:iterator value="#request.subjects" status="s1">
                        <c:if test="${(s1.index) % 10==0}">
                            <tr height="5%">
                                <c:forEach var="s" begin="0" end="${subjects.size()-s1.index-1}">
                                    <c:if test="${(s+1)<=10}">
                                        <td width="3%" id="k${s+s1.index}">
                                            <a href="#xmd${s+s1.index}">
                                                <div style="background-color: rgba(144, 238, 144,0.5);height:25px;border:1px solid #888">${s+1+s1.index}</div>
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
                        <button style="background-color: rgba(144, 238, 144,0.5); height: 45px;width: 20%">重做</button>
                    </a>
                    <a href="<%=path %>/getRandomSubject.action">
                        <button style="background-color: rgba(144, 238, 144,0.5); height: 45px;width: 30%">换题重做</button>
                    </a>
                    考生分数:${session.score!=null?score:0 }分
                </div>
            </div>
        </div>

    </div>

    <div style="margin:auto;width: 50%">

        <div class="header">
            <div class="logo">
                <a href="dashboard.html"><h2 style="margin-top: 10px;" ><font color="#f0f8ff" face="楷体">企明星考核系统</font></h2></a>
            </div>
            <div class="headerinner">
                <ul class="headmenu">

                    <li class="right">
                        <div class="userloggedinfo">
                            <img src="<%=path %>/images/photos/thumb5.png" alt=""/>
                            <div class="userinfo">
                                <h5>${studentInfo.studentName}
                                    <small>you are welcome</small>
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
            <h3 style="text-align: center;">企明星考核系统参考答案</h3>
            <br>
            <div>
                <font size="3" face="加粗"> <span>考试时间：2 小时</span> &nbsp; &nbsp; &nbsp; &nbsp;总分 ：100 分 </font>
            </div>
            <div class="questionCell" id="D_Title_P">
                <div class="titleBar">
                    <span><b id="D_Title">总分(100分)</b></span>
                    <div class="clear"></div>
                </div>

                <s:iterator value="#request.subjects" var="subject" status="sta">
                    <div id="xmd${sta.index }" name="xmd${sta.index+1 }" class="question">
                        <input type="hidden" name="stID" value="${subject.stID}"/>
                        <p>第${sta.index + 1}题&nbsp;${subject.stTitle}</p>
                        <ul>
                            <li>
                                <c:if test="${subject.stOptionB != null&&subject.stOptionB !=''}">
                                    <font size="3" face="加粗"><strong>A．</strong>${subject.stOptionA}</font>
                                </c:if>
                            </li>

                            <li>
                                <c:if test="${subject.stOptionB != null&&subject.stOptionB !=''}">
                                    <font size="3" face="加粗"><strong>B．</strong>${subject.stOptionB}</font>
                                </c:if>
                            </li>

                            <li>
                                <c:if test="${subject.stOptionC != null&&subject.stOptionC !=''}">
                                    <font size="3" face="加粗"><strong>C．</strong>${subject.stOptionC}</font>
                                </c:if>
                            </li>

                            <li>
                                <c:if test="${subject.stOptionD != null&&subject.stOptionD !=''&&subject.stOptionD !='判断'}">
                                    <font size="3" face="加粗"><strong>D．</strong>${subject.stOptionD}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionE != null&&subject.stOptionE !=''}">
                                    <font size="3" face="加粗"><strong>E．</strong>${subject.stOptionE}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionF != null&&subject.stOptionF !=''}">
                                    <font size="3" face="加粗"><strong>F．</strong>${subject.stOptionF}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionG != null&&subject.stOptionG !=''}">
                                    <font size="3" face="加粗"><strong>G．</strong>${subject.stOptionG}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionH != null&&subject.stOptionH !=''}">
                                    <font size="3" face="加粗"><strong>H．</strong>${subject.stOptionH}</font>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${subject.stOptionI != null&&subject.stOptionI !=''}">
                                    <font size="3" face="加粗"><strong>I．</strong>${subject.stOptionI}</font>
                                </c:if>
                            </li>
                            <c:if test="${studentAnswers[sta.index]==subject.stAnswer}">
                                <font size="3" face="加粗" id="font">【考生答案】:</font>
                                <font size="3" id="student${sta.index }" face="加粗"
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
                                <font size="3" face="加粗" id="font">【考生答案】:</font>
                                <font size="3" id="student${sta.index }" face="加粗" style="color: rgba(255, 100,100)">
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
                                <font size="3" face="加粗" id="font">【考生答案】:</font>
                                <font size="3" id="student${sta.index }" face="加粗"
                                      style="color:rgba(255, 100,100)">无</font>
                            </c:if>
                            <br>
                            <font size="3" face="加粗" id="font"><strong>【正确答案】：
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
                            <font size="3" face="加粗"> <strong>【参考解析】：${subject.stParse}</strong></font>
                        </ul>
                    </div>
                </s:iterator><br>


            </div>

        </div>
        <p style="height:300px">

        </p>

    </div>
</body>
</html>
<script type="text/javascript">
    $(function fun() {
        for (var i = 0; i <${subjects.size()}; i++) {
            color = document.getElementById("student" + i + "").style.color;
            document.getElementById("k" + i + "").style.background = color;
        }

    });
</script>
