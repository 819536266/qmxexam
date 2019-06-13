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

    <script type="text/javascript">

        <%--    jQuery(document).ready(function(){

           $('#birthday').datepick({dateFormat: 'yy-mm-dd'});

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
           });--%>
        //ajax
        function showStatus(str) {
            //如果form表单中的字符串为空的话，就把显示的返回值清空，并且返回函数，不再往下执行
            if (str.length == 0) {
                document.getElementById("txt").innerHTML = "";
                return;
            }
            if (window.XMLHttpRequest) {
                //chrome Firefox opera Safari……
                var xmlhttp = new XMLHttpRequest();
            } else {
                //兼容老版本
                var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                //如果可以连接的通
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    // 并且返回值是HTTP200
                    document.getElementById("txt").innerHTML = xmlhttp.responseText;
                    // 获取ajax 从后台回传的数据
                }
            }
            //打开ajax
            xmlhttp.open("GET", "checkPassword.action?password=" + str, true);
            //发送请求
            xmlhttp.send();
        }

        /* function showpassword(str){
             //如果form表单中的字符串为空的话，就把显示的返回值清空，并且返回函数，不再往下执行
                if (str.length == 0) {
                    document.getElementById("txt1").innerHTML = "";
                    return;
                }
                if (window.XMLHttpRequest) {
                //chrome Firefox opera Safari……
                    var xmlhttp = new XMLHttpRequest();
                } else {
                //兼容老版本
                    var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function () {
                //如果可以连接的通
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                // 并且返回值是HTTP200
                        document.getElementById("txt1").innerHTML = xmlhttp.responseText;
                // 获取ajax 从后台回传的数据
                    }
                }
            //打开ajax
                xmlhttp.open("GET", "checkPassword.action?password=" + str, true);
            //发送请求
                xmlhttp.send(); */


    </script>
    <title>企明星考核系统</title>
</head>
<body>

<div class="mainwrapper">
    <c:include value="header.jsp"/>


    <div class="rightpanel">

        <ul class="breadcrumbs">
            <li><a href="<%=path %>/teacher/teacher.jsp"><i class="iconfa-home"></i></a> <span class="separator"></span>
            </li>
            <li>员工管理 <span class="separator"></span></li>
            <li>添加分数</li>

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
                    <h4 class="widgettitle">添加分数</h4>
                    <div class="widgetcontent">

                        <form class="stdform" action="${pageContext.request.contextPath}/scordeAdd.action" method="post" id="login">
                            <input type="hidden" value="<%=new String(request.getParameter("sysid").getBytes("iso-8859-1"),"utf-8")%>" name="scorde.stuSysid.sysid">
                            <label>考核时间:&nbsp;&nbsp;</label>
                            <span class="field">
							<div id="date">
								<select id="year" style="width:110px">
									<option value="">选择年份</option>
								</select>
								<select id="month" style="width:105px">
									<option value="">选择月份</option>
								</select>
							</div>
						</span>
                            <input type="hidden" name="term" id="semester">
                            <label>员工姓名：</label>
                            <span class="field" ><font size="4" face="加粗"><%=new String(request.getParameter("studentName").getBytes("iso-8859-1"),"utf-8")%></font></span>
                            <br/>
                            <label>分数：</label>
                            <span class="field"><input type="text" name="scorde.timescore" style="width:215px"
                                                       class="input-xlarge" placeholder="请输入..."
                                                       required="required"/></span>


                            <p class="stdformbutton">
                                <input class="btn btn-primary" type="submit" value="录入" style="width:100px">
                            </p>


                        </form>
                       <%-- <div style="width: 200px;margin-left: 220px">
                            <a href="<%=path %>/teacher/studentExcel.jsp">
                                <button class="btn btn-primary">Excel录入</button>
                            </a>
                        </div>--%>
                    </div><!--widgetcontent-->
                </div><!--widget-->

                <br/><br/>

                <div class="footer" style="position: fixed;bottom:0px;">
                    <div class="footer-left">
                        <span>&copy; 2019. 企明星考核系统.</span>
                    </div>

                </div><!--footer-->

            </div><!--maincontentinner-->
        </div><!--maincontent-->

    </div><!--rightpanel-->

</div><!--mainwrapper-->

<script type="text/javascript">

    //提交之前
    jQuery('#login').submit(function () {
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
        if (term == "年份选择") {
            term = "";
        }
        if (term==""||term==null) {
            alert("请选择考核时间！");
            return false;
        }else{
            $("#semester").val(term);
            return true;
        }
    });



    jQuery(document).ready(function () {
        $("#date").selectDate();


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
</body>
</html>