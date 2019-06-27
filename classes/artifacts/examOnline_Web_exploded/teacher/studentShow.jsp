<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


    <title>企明星考核系统</title>
</head>
<body>



        <div class="maincontent" style="">
            <div class="maincontentinner">

                <div class="widget">
                    <h4 class="widgettitle">查看员工</h4>
                    <div class="widgetcontent">
                        <div style="width:400px;margin: auto;" id="id">
                            <p>
                                <font size="4" face="楷体">员工姓名:
                                    <span class="field">${students.studentName}</span></font>
                            </p>

                            <p>
                                <font size="4" face="楷体">员工编号:
                                    <span class="field">${students.studentID }</span></font>
                            </p>
                            <p>
                                <font size="4" face="楷体">员工部门:
                                    <span class="field">${students.sclass} </span></font>
                            </p>
                            <%--<p>
                                <font size="4" face="楷体">日期:
                                    <span class="field"> ${students.term}</span></font>
                            </p>--%>
                            </p>

                            <font size="4" face="楷体">分数:</font><br>
                            <c:if test="${students.sr.size()>0}">
                                <c:forEach items="${students.sr}" var="scorde">
                                    <font size="3" face="楷体">提交时间:<fmt:formatDate value="${scorde.testtime}" var="testtime" pattern="yyyy年MM月dd日"></fmt:formatDate>
                                        <span class="field"> ${testtime}</span></font>
                                    &nbsp;&nbsp;&nbsp;
                                    <font size="3" face="楷体">分数:
                                        <span class="score"> ${scorde.timescore}</span>分</font>
                                    <c:if test="${students.sr.size()>1}">
                                        <a class="btn btn-primary btn-xs" onclick="deleteScorde(${scorde.scordeId})" href="#">删除</a>
                                    </c:if>

                                    <br>
                                    <br>
                                </c:forEach>
                                <font size="3" face="楷体" id="">该员工平均分:
                                    <span class="field" id="span"></span></font>
                                <br>
                                <font size="3" face="楷体">该员工最高分:
                                    <span class="field" id="max"></span></font>
                                <br>
                                <span id="min"></span>

                            </c:if>
                            <c:if test="${students.sr.size()<=0}">
                                <font size="3" face="楷体" color="red">该员工暂无考试成绩</font>
                            </c:if>
                            </p>
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

</body>
<script type="text/javascript">
    function deleteScorde(scordeid){
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/deleteScorde.action?",
            data:{"scorde.scordeId":scordeid},
            success:function (data) {
                if(data!="error"){
                    window.location.reload();
                    return;
                }
                alert("删除失败")
            }
        })
    }
    jQuery(document).ready(function () {
        var j = 0;
        var maxx = [$("#id .score").length];
        $("#id .score").each(function (i) {
            maxx[i] = parseInt($(this).html());
            j += parseInt($(this).html());

        })
        var max = Math.max.apply(Math, maxx);
        var min = Math.min.apply(Math, maxx);
        if (min != 0 && $("#id .score").length > 1) {
            $("#min").html("<font size='3' face='楷体' >该员工最低分:" + min + "</font>");
        }
        $("#max").html(max);
        j = j / ($("#id .score").length);
        j = Math.round(j * 100) / 100;
        $("#span").html(j);


        // dropdown in leftmenu
        jQuery('.leftmenu .dropdown > a').click(function () {
            if (!jQuery(this).next().is(':visible'))
                jQuery(this).next().slideDown('fast');
            else
                jQuery(this).next().slideUp('fast');
            return false;
        });

        if (jQuery.uniform)
            jQuery('input:checkbox, input:radio, .uniform-file').uniform();

        if (jQuery('.widgettitle .close').length > 0) {
            jQuery('.widgettitle .close').click(function () {
                jQuery(this).parents('.widgetbox').fadeOut(function () {
                    jQuery(this).remove();
                });
            });
        }


        // add menu bar for phones and tablet
        jQuery('<div class="topbar"><a class="barmenu">' +
            '</a></div>').insertBefore('.mainwrapper');

        jQuery('.topbar .barmenu').click(function () {

            var lwidth = '260px';
            if (jQuery(window).width() < 340) {
                lwidth = '240px';
            }

            if (!jQuery(this).hasClass('open')) {
                jQuery('.rightpanel, .headerinner, .topbar').css({marginLeft: lwidth}, 'fast');
                jQuery('.logo, .leftpanel').css({marginLeft: 0}, 'fast');
                jQuery(this).addClass('open');
            } else {
                jQuery('.rightpanel, .headerinner, .topbar').css({marginLeft: 0}, 'fast');
                jQuery('.logo, .leftpanel').css({marginLeft: '-' + lwidth}, 'fast');
                jQuery(this).removeClass('open');
            }
        });

        // show/hide left menu
        jQuery(window).resize(function () {
            if (!jQuery('.topbar').is(':visible')) {
                jQuery('.rightpanel, .headerinner').css({marginLeft: '260px'});
                jQuery('.logo, .leftpanel').css({marginLeft: 0});
            } else {
                jQuery('.rightpanel, .headerinner').css({marginLeft: 0});
                jQuery('.logo, .leftpanel').css({marginLeft: '-260px'});
            }
        });

        // dropdown menu for profile image
        jQuery('.userloggedinfo img').click(function () {
            if (jQuery(window).width() < 480) {
                var dm = jQuery('.userloggedinfo .userinfo');
                if (dm.is(':visible')) {
                    dm.hide();
                } else {
                    dm.show();
                }
            }
        });

        // change skin color
        jQuery('.skin-color a').click(function () {
            return false;
        });
        jQuery('.skin-color a').hover(function () {
            var s = jQuery(this).attr('href');
            if (jQuery('#skinstyle').length > 0) {
                if (s != 'default') {
                    jQuery('#skinstyle').attr('href', 'css/style.' + s + '.css');
                    jQuery.cookie('skin-color', s, {path: '/'});
                } else {
                    jQuery('#skinstyle').remove();
                    jQuery.cookie("skin-color", '', {path: '/'});
                }
            } else {
                if (s != 'default') {
                    jQuery('head').append('<link id="skinstyle" rel="stylesheet" href="css/style.' + s + '.css" type="text/css" />');
                    jQuery.cookie("skin-color", s, {path: '/'});
                }
            }
            return false;
        });

        // load selected skin color from cookie


        // expand/collapse boxes
        if (jQuery('.minimize').length > 0) {

            jQuery('.minimize').click(function () {
                if (!jQuery(this).hasClass('collapsed')) {
                    jQuery(this).addClass('collapsed');
                    jQuery(this).html("&#43;");
                    jQuery(this).parents('.widgetbox')
                        .css({marginBottom: '20px'})
                        .find('.widgetcontent')
                        .hide();
                } else {
                    jQuery(this).removeClass('collapsed');
                    jQuery(this).html("&#8211;");
                    jQuery(this).parents('.widgetbox')
                        .css({marginBottom: '0'})
                        .find('.widgetcontent')
                        .show();
                }
                return false;
            });

        }

    });
</script>
</html>