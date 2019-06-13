﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>高处作业人员</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/exam.js" type="text/javascript"></script>
    <script src="js/JScript.js" type="text/javascript"></script>
   
   
    
    <script type="text/javascript">
    	/* alert(${request.subjectAnswers.get(1).index}); */
        var maxtime =60*60;
        function CountDown(){
            if(maxtime>=0){
                minutes = Math.floor(maxtime/60);
                seconds = Math.floor(maxtime%60);
                msg = "考试还有："+minutes+"分"+seconds+"秒";
                $("#timer").html(msg);
                if(maxtime == 5*60)
                    alert('注意，还有5分钟!');
                --maxtime;
            }
            else{
                clearInterval(timer);
                alert("时间到，结束!");
                $("input[name=submit]").click();
            }
        }
        timer = setInterval("CountDown()",1000);
	
    </script>
    <script type="text/javascript">
    function clickBut(r){
    	var num=0;
    	if(r.checked){
    		num=r.name.substring(1);
    	}
    	alert(num);
    	document.getElementById("k"+num).style.background="green";
    }
    
    function zz(){
    	var zz=$("zz");
    	if(zz=="0"){
    		//显示答题页
    	}else{
    		//显示成绩页
    		//1.禁用所有单选框
    		//2.
    		
    	}
    }
    
    
    </script>
</head>
<body>
${subjectAnswers.get(0)}
<form id="form1" runat="server">
    <div class="w1024 cl">
        <div class="w958 header cl">
            <p class="l top"><img src="images/logo.jpg" /></p><span class="home"><a href="http://www.ksstxx.com">返回首页</a></span>
        </div>
        <div class="w960 site cl">
            <div class="line"></div>
            <ul>
                您当前的位置：<a href="http://www.ksstxx.com">首页</a> >> <a href="index.asp">模拟考试系统</a> >>高处作业人员
            </ul>
        </div>
        <div class="w960 center cl">
            <dl class="i_left l cl">
                <dt><b>考试科目</b></dt>
                <dd><a href='detail.asp?ClassId=99' title="高处作业人员">高处作业人员</a></dd>
                <dd><a href='detail.asp?ClassId=98' title="机械式停车">机械式停车</a></dd>
                <dd><a href='detail.asp?ClassId=74' title="锅炉安全管理人员题库">锅炉安全管理人员题库</a></dd>
                <dd><a href='detail.asp?ClassId=70' title="锅炉作业人员题库">锅炉作业人员题库</a></dd>
                <dd><a href='detail.asp?ClassId=75' title="压力容器作业人员题库">压力容器作业人员题库</a></dd>
                <dd><a href='detail.asp?ClassId=66' title="低压电工中级技能等级证题库">低压电工中级技能等级证题库</a></dd>
                <dd><a href='detail.asp?ClassId=85' title="低压电工初级技能等级证题库">低压电工初级技能等级证题库</a></dd>
                <dd><a href='detail.asp?ClassId=69' title="焊工中级技能等级证题库">焊工中级技能等级证题库</a></dd>
                <dd><a href='detail.asp?ClassId=84' title="焊工初级技能等级证题库">焊工初级技能等级证题库</a></dd>
                <dd><a href='detail.asp?ClassId=86' title="电子设备装接工中级理论练习题">电子设备装接工中级理论练习题</a></dd>
                <dd><a href='detail.asp?ClassId=79' title="电梯作业人员练习题">电梯作业人员练习题</a></dd>
                <dd><a href='detail.asp?ClassId=87' title="锅炉水处理练习题">锅炉水处理练习题</a></dd>
                <dd><a href='detail.asp?ClassId=88' title="焊工上岗证（含复审）练习题">焊工上岗证（含复审）练习题</a></dd>
                <dd><a href='detail.asp?ClassId=90' title="电梯机械安装维修练习题">电梯机械安装维修练习题</a></dd>
                <dd><a href='detail.asp?ClassId=93' title="电梯管理人员练习题">电梯管理人员练习题</a></dd>
                <dd><a href='detail.asp?ClassId=92' title="压力容器管理员练习题">压力容器管理员练习题</a></dd>
                <dd><a href='detail.asp?ClassId=94' title="叉车安全管理人员练习题">叉车安全管理人员练习题</a></dd>
                <dd><a href='detail.asp?ClassId=95' title="起重机械安装维修作业人员练习题">起重机械安装维修作业人员练习题</a></dd>
                <dd><a href='detail.asp?ClassId=73' title="起重机械安全管理人员题库">起重机械安全管理人员题库</a></dd>
                <dd><a href='detail.asp?ClassId=96' title="电工上岗证题库">电工上岗证题库</a></dd>
                <dd><a href='detail.asp?ClassId=80' title="起重机械作业人员练习题">起重机械作业人员练习题</a></dd>
                <dd><a href='detail.asp?ClassId=97' title="叉车司机（含复审）练习题">叉车司机（含复审）练习题</a></dd>
                <dd><a href='detail.asp?ClassId=91' title="电梯电气安装维修练习题">电梯电气安装维修练习题</a></dd>
                <dd class="k"></dd>
            </dl>
            <div class="l_center l cl">
                <dl class="l_content cl" style="width: 60%;margin: auto;">
                    <dt><h1>高处作业人员</h1>
                        <span class="localtime">当前时间：<label id="localtime"></label>&nbsp; &nbsp;总分100分</span>
                    </dt>
                    <dd>

                        <div class="testInfo" >
                           <!-- <a name="maodian1"></a> --> 
                           
                        <s:iterator value="#request.studentAnswers" var="student" status="i">
							<div id="maodian${i.index + 1}" name="maodian1" class="question">
							
						</div>
					</s:iterator><br>
                            <div id="maodian1" name="maodian1" class="test">
                                <table class="panduan">
                                    <tr>
                                        <td valign="top"><h5>1、 电力变压器的功能是把一种等级的电压变成为另一种等级的电压。(　　　) </h5><font></font>
                                            <table cellpadding="0" cellspacing="0" class="choice_table">
                                                <tr>
                                                    <td><input type="radio" value="1" id="dui_1" name="k1" onclick="clickBut(this);"/>&nbsp;<label for="dui_1">对</label>
                                                    </td>
                                                    <td>
                                                        <input type="radio" value="2" id="cuo_1" name="k1" />&nbsp;<label for="cuo_1">错</label>
                                                        <input type="hidden" value="2" name="result" />
                                                        <input type="hidden" value="no_78236_panduan_6_1" name="ansResult" />
                                                        <input type="hidden" value="" name="result4" id="test4" />
                                                        <input type="hidden" value="2" name="result5" id="test5" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right"></td>
                                    </tr>
                                </table>
                            </div>
                            <a name="maodian2"></a>
                            <div class="test">
                                <table class="panduan">
                                    <tr>
                                        <td valign="top">
                                            <h5>2、 附着式升降脚手架和其他外挂式脚手架应按相关规定由其施工人员编制施工方案。 </h5>
                                            <table cellpadding="0" cellspacing="0" class="choice_table">
                                                <tr>
                                                    <td>
                                                        <input type="radio" value="1" id="dui_2" name="k2" />&nbsp;<label for="dui_2">对</label></td><td><input type="radio" value="2" id="cuo_2" name="k2" />&nbsp;<label for="cuo_2">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78846_panduan_6_2" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian3"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>3、 只要接触物体粗糙表面,就会产生静摩擦力。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_3" name="k3" />&nbsp;<label for="dui_3">对</label></td><td><input type="radio" value="2" id="cuo_3" name="k3" />&nbsp;<label for="cuo_3">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78108_panduan_6_3" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian4"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>4、 拆除工程项目负责人依法承担拆除工程安全生产、文明施工、环境防护等责任。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_4" name="k4" />&nbsp;<label for="dui_4">对</label></td><td><input type="radio" value="2" id="cuo_4" name="k4" />&nbsp;<label for="cuo_4">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78413_panduan_6_4" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian5"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>5、 高处作业施工中只要安全措施到位,作业区域下地面可以不设巡视人员。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_5" name="k5" />&nbsp;<label for="dui_5">对</label></td><td><input type="radio" value="2" id="cuo_5" name="k5" />&nbsp;<label for="cuo_5">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78718_panduan_6_5" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian6"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>6、 悬吊下降系统是通过手控下降器沿工作绳将坐板下移或固定在任意高度进行作业的工作系统。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_6" name="k6" />&nbsp;<label for="dui_6">对</label></td><td><input type="radio" value="2" id="cuo_6" name="k6" />&nbsp;<label for="cuo_6">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78285_panduan_6_6" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian7"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>7、 衬带是防止作业人员从座板后滑脱的带。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_7" name="k7" />&nbsp;<label for="dui_7">对</label></td><td><input type="radio" value="2" id="cuo_7" name="k7" />&nbsp;<label for="cuo_7">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78590_panduan_6_7" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian8"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>8、 施工暂设拆除时,操作人员站在构件上采用晃动、撬动或用大锤砸钢架的方法进行拆卸。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_8" name="k8" />&nbsp;<label for="dui_8">对</label></td><td><input type="radio" value="2" id="cuo_8" name="k8" />&nbsp;<label for="cuo_8">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_79200_panduan_6_8" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian9"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>9、 建筑物表面清洗作业人员不受环境和气候条件影响,没有太大的危险性。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_9" name="k9" />&nbsp;<label for="dui_9">对</label></td><td><input type="radio" value="2" id="cuo_9" name="k9" />&nbsp;<label for="cuo_9">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78462_panduan_6_9" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian10"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>10、 大型储罐可采用人工拆除的方法进行拆除。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_10" name="k10" />&nbsp;<label for="dui_10">对</label></td><td><input type="radio" value="2" id="cuo_10" name="k10" />&nbsp;<label for="cuo_10">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_79072_panduan_6_10" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian11"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>11、 力学中常见的这些力都有其自身不确定的变化规律。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_11" name="k11" />&nbsp;<label for="dui_11">对</label></td><td><input type="radio" value="2" id="cuo_11" name="k11" />&nbsp;<label for="cuo_11">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78029_panduan_6_11" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian12"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>12、 项目经理部应按有关规定设专职安全员,检查落实各项安全技术措施。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_12" name="k12" />&nbsp;<label for="dui_12">对</label></td><td><input type="radio" value="2" id="cuo_12" name="k12" />&nbsp;<label for="cuo_12">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78206_panduan_6_12" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian13"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>13、 外墙清洗工作完毕,要详细记录篮运转情况。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_13" name="k13" />&nbsp;<label for="dui_13">对</label></td><td><input type="radio" value="2" id="cuo_13" name="k13" />&nbsp;<label for="cuo_13">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78511_panduan_6_13" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian14"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>14、 按性质和规律分,力学中常见的力有引力(重力)、弹性力、摩擦力、介质的阻力、电场力、洛伦兹等。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_14" name="k14" />&nbsp;<label for="dui_14">对</label></td><td><input type="radio" value="2" id="cuo_14" name="k14" />&nbsp;<label for="cuo_14">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_79121_panduan_6_14" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian15"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>15、 下降器是安装在工作绳上,以通过工作载重量为动力、自动下降的装置。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_15" name="k15" />&nbsp;<label for="dui_15">对</label></td><td><input type="radio" value="2" id="cuo_15" name="k15" />&nbsp;<label for="cuo_15">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78078_panduan_6_15" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian16"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>16、 在生疏地区,对不熟悉的杆塔,上杆前必须了解杆塔和拉线情况,或先检查后上杆。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_16" name="k16" />&nbsp;<label for="dui_16">对</label></td><td><input type="radio" value="2" id="cuo_16" name="k16" />&nbsp;<label for="cuo_16">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78383_panduan_6_16" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian17"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>17、 脚扣是由木或者塑料材料制作的攀登电杆的工具。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_17" name="k17" />&nbsp;<label for="dui_17">对</label></td><td><input type="radio" value="2" id="cuo_17" name="k17" />&nbsp;<label for="cuo_17">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_77950_panduan_6_17" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian18"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>18、 施工项目部每周至少开展一次安全检查,检查由项目经理组织,项目安全主管、专职安全员、各班(组)长参加。每次检查后要认真填写好检查整改记录。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_18" name="k18" />&nbsp;<label for="dui_18">对</label></td><td><input type="radio" value="2" id="cuo_18" name="k18" />&nbsp;<label for="cuo_18">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78560_panduan_6_18" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian19"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>19、 室内、外机的高度差最好小于1.2m,尽量让室内机在上,室外机在下,这是为了压缩机回油好。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_19" name="k19" />&nbsp;<label for="dui_19">对</label></td><td><input type="radio" value="2" id="cuo_19" name="k19" />&nbsp;<label for="cuo_19">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78865_panduan_6_19" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian20"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>20、 人工拆除与机械拆除的区别是人工拆除应从上至下,机械拆除应从下至上,逐层分段进行。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_20" name="k20" />&nbsp;<label for="dui_20">对</label></td><td><input type="radio" value="2" id="cuo_20" name="k20" />&nbsp;<label for="cuo_20">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78127_panduan_6_20" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian21"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>21、 六级以上强风、大雾天气不得露天进行攀登与悬空高处作业。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_21" name="k21" />&nbsp;<label for="dui_21">对</label></td><td><input type="radio" value="2" id="cuo_21" name="k21" />&nbsp;<label for="cuo_21">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78737_panduan_6_21" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian22"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>22、 六级以上强风、大雾天气不得露天进行攀登与悬空高处作业。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_22" name="k22" />&nbsp;<label for="dui_22">对</label></td><td><input type="radio" value="2" id="cuo_22" name="k22" />&nbsp;<label for="cuo_22">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_77999_panduan_6_22" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian23"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>23、 登杆塔和在杆塔上作业时,每基杆塔都应设专人监护。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_23" name="k23" />&nbsp;<label for="dui_23">对</label></td><td><input type="radio" value="2" id="cuo_23" name="k23" />&nbsp;<label for="cuo_23">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78914_panduan_6_23" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian24"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>24、 安全帽遇水潮湿后,可以放在暖气片,炉火上烘烤至干。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_24" name="k24" />&nbsp;<label for="dui_24">对</label></td><td><input type="radio" value="2" id="cuo_24" name="k24" />&nbsp;<label for="cuo_24">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_79219_panduan_6_24" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian25"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>25、 研究对象静止于物体表面上,一定会产生静摩擦力。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_25" name="k25" />&nbsp;<label for="dui_25">对</label></td><td><input type="radio" value="2" id="cuo_25" name="k25" />&nbsp;<label for="cuo_25">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78176_panduan_6_25" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian26"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>26、 施工单位应为从事拆除作业的人员办理意外伤害保险。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_26" name="k26" />&nbsp;<label for="dui_26">对</label></td><td><input type="radio" value="2" id="cuo_26" name="k26" />&nbsp;<label for="cuo_26">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_79091_panduan_6_26" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian27"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>27、 作业人员应当遵守安全施工的强制标准、规章制度和操作规程,正确使用安全防护用具、机械设备等。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_27" name="k27" />&nbsp;<label for="dui_27">对</label></td><td><input type="radio" value="2" id="cuo_27" name="k27" />&nbsp;<label for="cuo_27">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_77920_panduan_6_27" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian28"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>28、 从业人员有了解其作业场所和工作岗位存在的危险因素、防范措施和事故应急措施的权利。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_28" name="k28" />&nbsp;<label for="dui_28">对</label></td><td><input type="radio" value="2" id="cuo_28" name="k28" />&nbsp;<label for="cuo_28">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78835_panduan_6_28" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian29"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>29、 长期从事高处作业的人群中,高血压发病率会随着工龄的增长而增加。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_29" name="k29" />&nbsp;<label for="dui_29">对</label></td><td><input type="radio" value="2" id="cuo_29" name="k29" />&nbsp;<label for="cuo_29">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78097_panduan_6_29" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian30"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>30、 高处临边、洞口的防护栏和防护盖板可以随意的挪动。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_30" name="k30" />&nbsp;<label for="dui_30">对</label></td><td><input type="radio" value="2" id="cuo_30" name="k30" />&nbsp;<label for="cuo_30">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_79012_panduan_6_30" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian31"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>31、 进入现场作业区必须戴安全帽。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_31" name="k31" />&nbsp;<label for="dui_31">对</label></td><td><input type="radio" value="2" id="cuo_31" name="k31" />&nbsp;<label for="cuo_31">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78274_panduan_6_31" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian32"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>32、 落地广基础混凝土总质量应大于广告设施总荷载1倍以上。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_32" name="k32" />&nbsp;<label for="dui_32">对</label></td><td><input type="radio" value="2" id="cuo_32" name="k32" />&nbsp;<label for="cuo_32">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78579_panduan_6_32" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian33"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>33、 在阳台板外侧可以直接安装空调室外机。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_33" name="k33" />&nbsp;<label for="dui_33">对</label></td><td><input type="radio" value="2" id="cuo_33" name="k33" />&nbsp;<label for="cuo_33">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_79189_panduan_6_33" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian34"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>34、 机械设备可造成碰撞、夹击、剪切、卷入等多种危害。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_34" name="k34" />&nbsp;<label for="dui_34">对</label></td><td><input type="radio" value="2" id="cuo_34" name="k34" />&nbsp;<label for="cuo_34">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78451_panduan_6_34" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian35"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>35、 安全带不得高挂低用,禁止系挂在移动或不牢固的物件上。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_35" name="k35" />&nbsp;<label for="dui_35">对</label></td><td><input type="radio" value="2" id="cuo_35" name="k35" />&nbsp;<label for="cuo_35">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78018_panduan_6_35" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian36"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>36、 高处作业现场安全隐患分为高处坠落、触电事故和物体打击三大类。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_36" name="k36" />&nbsp;<label for="dui_36">对</label></td><td><input type="radio" value="2" id="cuo_36" name="k36" />&nbsp;<label for="cuo_36">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78067_panduan_6_36" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian37"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>37、 具有良好导电性能的物体称为导体。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_37" name="k37" />&nbsp;<label for="dui_37">对</label></td><td><input type="radio" value="2" id="cuo_37" name="k37" />&nbsp;<label for="cuo_37">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78372_panduan_6_37" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian38"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>38、 使用超过“的长绳时,可以酌情加上缓冲器、自锁器或防坠器等。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_38" name="k38" />&nbsp;<label for="dui_38">对</label></td><td><input type="radio" value="2" id="cuo_38" name="k38" />&nbsp;<label for="cuo_38">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_78677_panduan_6_38" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian39"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>39、 空调机的连接铜管,在连接之前,应封闭两端的端口。 </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_39" name="k39" />&nbsp;<label for="dui_39">对</label></td><td><input type="radio" value="2" id="cuo_39" name="k39" />&nbsp;<label for="cuo_39">错</label><input type="hidden" value="1" name="result" /><input type="hidden" value="no_78982_panduan_6_39" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="1" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian40"></a><div class="test"><table class="panduan"><tr><td valign="top"><h5>40、 消防水泵房安装一台控制配电箱,其额定电流为200A。(　　　) </h5><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="1" id="dui_40" name="k40" />&nbsp;<label for="dui_40">对</label></td><td><input type="radio" value="2" id="cuo_40" name="k40" />&nbsp;<label for="cuo_40">错</label><input type="hidden" value="2" name="result" /><input type="hidden" value="no_77939_panduan_6_40" name="ansResult" /><input type="hidden" value="" name="result4" id="test4" /><input type="hidden" value="2" name="result5" id="test5" /></td></tr></table></td><td align="right"></td></tr></table></div><a name="maodian41"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>41、 窒息(呼吸道完全堵塞)或心脏吸骤停的伤员,必须进(    )或心脏复苏后再搬运。 </h5><p>A、抢救</p><p>B、安抚</p><p>C、人工呼吸</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_41" name="k41" />&nbsp;<label for="a_41">A</label><input type="radio" value="B" id="b_41" name="k41" />&nbsp;<label for="b_41">B</label><input type="radio" value="C" id="c_41" name="k41" />&nbsp;<label for="c_41">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_79054_danxuan_6_41" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian42"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>42、 提请劳动争议处理的(　　　),即当职工劳动安全卫生权益受到侵害,或者与用人单位因劳动安全卫生问题发生纠纷时,向有关部门提请劳动争议处理的权利。 </h5><p>A、义务</p><p>B、问题</p><p>C、权利</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_42" name="k42" />&nbsp;<label for="a_42">A</label><input type="radio" value="B" id="b_42" name="k42" />&nbsp;<label for="b_42">B</label><input type="radio" value="C" id="c_42" name="k42" />&nbsp;<label for="c_42">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_77883_danxuan_6_42" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian43"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>43、 防滑橡胶宜采用(    )橡胶。 </h5><p>A、成品</p><p>B、进口</p><p>C、天然</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_43" name="k43" />&nbsp;<label for="a_43">A</label><input type="radio" value="B" id="b_43" name="k43" />&nbsp;<label for="b_43">B</label><input type="radio" value="C" id="c_43" name="k43" />&nbsp;<label for="c_43">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78493_danxuan_6_43" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian44"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>44、 标志牌的平面与视线夹角应接近(　　　)。 </h5><p>A、30°</p><p>B、45°</p><p>C、90°</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_44" name="k44" />&nbsp;<label for="a_44">A</label><input type="radio" value="B" id="b_44" name="k44" />&nbsp;<label for="b_44">B</label><input type="radio" value="C" id="c_44" name="k44" />&nbsp;<label for="c_44">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78060_danxuan_6_44" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian45"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>45、 消防水泵房安装一台控制配电箱,控制箱底口距操作平台高度为0.8m,操作平台距地高度为0.5m。(    )用螺丝固定在箱腿上,底部用木螺丝固定在平台上。 </h5><p>A、配电柜</p><p>B、控制柜</p><p>C、配电箱</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_45" name="k45" />&nbsp;<label for="a_45">A</label><input type="radio" value="B" id="b_45" name="k45" />&nbsp;<label for="b_45">B</label><input type="radio" value="C" id="c_45" name="k45" />&nbsp;<label for="c_45">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78975_danxuan_6_45" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian46"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>46、 高处作业由于其殊危害性,相关单位除了落实安全技术措施外,还应该加强其(    )管理工作。 </h5><p>A、人员</p><p>B、预防</p><p>C、安全</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_46" name="k46" />&nbsp;<label for="a_46">A</label><input type="radio" value="B" id="b_46" name="k46" />&nbsp;<label for="b_46">B</label><input type="radio" value="C" id="c_46" name="k46" />&nbsp;<label for="c_46">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_79152_danxuan_6_46" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian47"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>47、 物料提升机上料口应装设有联锁装置的安全门,同时采用断绳保护装置或安全停靠装置。通道口走道板应满铺并固定牢靠,两侧边应设置符合要求的防护栏杆和挡脚板,并用(    )安全网封闭两侧。 </h5><p>A、普通</p><p>B、阻燃</p><p>C、密目式</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_47" name="k47" />&nbsp;<label for="a_47">A</label><input type="radio" value="B" id="b_47" name="k47" />&nbsp;<label for="b_47">B</label><input type="radio" value="C" id="c_47" name="k47" />&nbsp;<label for="c_47">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_79024_danxuan_6_47" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian48"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>48、 直接引起坠落的客观危险因素之平均温度低于(　　　)℃。 </h5><p>A、10</p><p>B、3</p><p>C、5</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_48" name="k48" />&nbsp;<label for="a_48">A</label><input type="radio" value="B" id="b_48" name="k48" />&nbsp;<label for="b_48">B</label><input type="radio" value="C" id="c_48" name="k48" />&nbsp;<label for="c_48">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_77981_danxuan_6_48" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian49"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>49、 静力破碎是利用静力破碎剂固化膨胀力破碎混凝土、岩石等的一种技术。一般操作程序是(    )。 </h5><p>A、钻孔-注入静力破碎剂-破裂。</p><p>B、钻孔-注入静力破碎剂-固化膨胀-破裂。</p><p>C、填涂静力破碎剂-固化膨胀-破裂。</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_49" name="k49" />&nbsp;<label for="a_49">A</label><input type="radio" value="B" id="b_49" name="k49" />&nbsp;<label for="b_49">B</label><input type="radio" value="C" id="c_49" name="k49" />&nbsp;<label for="c_49">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78896_danxuan_6_49" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian50"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>50、 模板工程在绑扎钢筋、粉刷模板、支撑模板时应保证作业人员有可靠(    ),作业面应固定设置安全防护措施。 </h5><p>A、扶手</p><p>B、立足点</p><p>C、安全带</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_50" name="k50" />&nbsp;<label for="a_50">A</label><input type="radio" value="B" id="b_50" name="k50" />&nbsp;<label for="b_50">B</label><input type="radio" value="C" id="c_50" name="k50" />&nbsp;<label for="c_50">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_79201_danxuan_6_50" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian51"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>51、 落地广告设施总荷载的计算和以下哪种因素无关(　　　)。 </h5><p>A、广告设施自重</p><p>B、风荷载</p><p>C、广告形式</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_51" name="k51" />&nbsp;<label for="a_51">A</label><input type="radio" value="B" id="b_51" name="k51" />&nbsp;<label for="b_51">B</label><input type="radio" value="C" id="c_51" name="k51" />&nbsp;<label for="c_51">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78158_danxuan_6_51" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian52"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>52、 防护脚手架是只用作(    )防护的脚手架。 </h5><p>A、人身</p><p>B、物品</p><p>C、安全</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_52" name="k52" />&nbsp;<label for="a_52">A</label><input type="radio" value="B" id="b_52" name="k52" />&nbsp;<label for="b_52">B</label><input type="radio" value="C" id="c_52" name="k52" />&nbsp;<label for="c_52">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78768_danxuan_6_52" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian53"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>53、 安全自锁器每隔(　　　)年检验一次。 </h5><p>A、3</p><p>B、2</p><p>C、1</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_53" name="k53" />&nbsp;<label for="a_53">A</label><input type="radio" value="B" id="b_53" name="k53" />&nbsp;<label for="b_53">B</label><input type="radio" value="C" id="c_53" name="k53" />&nbsp;<label for="c_53">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78335_danxuan_6_53" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian54"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>54、 (    )应设置安全可靠的防倾覆、防坠落装置,每一作业层架体外侧应设置符合要求的防护栏杆和挡脚板。 </h5><p>A、一般脚手架</p><p>B、外挂电梯</p><p>C、附着式升降脚手架</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_54" name="k54" />&nbsp;<label for="a_54">A</label><input type="radio" value="B" id="b_54" name="k54" />&nbsp;<label for="b_54">B</label><input type="radio" value="C" id="c_54" name="k54" />&nbsp;<label for="c_54">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78640_danxuan_6_54" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian55"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>55、 施工现场安全电气产品必须经过国家级(　　　)检测机构认证。 </h5><p>A、电器</p><p>B、专业</p><p>C、电子</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_55" name="k55" />&nbsp;<label for="a_55">A</label><input type="radio" value="B" id="b_55" name="k55" />&nbsp;<label for="b_55">B</label><input type="radio" value="C" id="c_55" name="k55" />&nbsp;<label for="c_55">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_77902_danxuan_6_55" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian56"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>56、 用吊杆安装室内机的分体空调是(    )。 </h5><p>A、分体柜式空调器</p><p>B、分体壁挂式空调</p><p>C、分体吸顶式空调</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_56" name="k56" />&nbsp;<label for="a_56">A</label><input type="radio" value="B" id="b_56" name="k56" />&nbsp;<label for="b_56">B</label><input type="radio" value="C" id="c_56" name="k56" />&nbsp;<label for="c_56">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_79250_danxuan_6_56" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian57"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>57、 各类配电箱、开关箱外观应完整、牢固、防雨、防尘,箱体应外涂(   )。 </h5><p>A、黄色标记</p><p>B、红色色标</p><p>C、安全色标</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_57" name="k57" />&nbsp;<label for="a_57">A</label><input type="radio" value="B" id="b_57" name="k57" />&nbsp;<label for="b_57">B</label><input type="radio" value="C" id="c_57" name="k57" />&nbsp;<label for="c_57">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78817_danxuan_6_57" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian58"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>58、 室外机距地面高度应大于(    )m。 </h5><p>A、1.5</p><p>B、2.5</p><p>C、3.5</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_58" name="k58" />&nbsp;<label for="a_58">A</label><input type="radio" value="B" id="b_58" name="k58" />&nbsp;<label for="b_58">B</label><input type="radio" value="C" id="c_58" name="k58" />&nbsp;<label for="c_58">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78689_danxuan_6_58" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian59"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>59、 安全施工作业票,应由施工(    )审查。 </h5><p>A、项目部技术员和安全员</p><p>B、负责人</p><p>C、项目经理</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_59" name="k59" />&nbsp;<label for="a_59">A</label><input type="radio" value="B" id="b_59" name="k59" />&nbsp;<label for="b_59">B</label><input type="radio" value="C" id="c_59" name="k59" />&nbsp;<label for="c_59">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78994_danxuan_6_59" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian60"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>60、 安全自锁器在(　　　)前要进行检查。 </h5><p>A、使用</p><p>B、保存</p><p>C、保护</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_60" name="k60" />&nbsp;<label for="a_60">A</label><input type="radio" value="B" id="b_60" name="k60" />&nbsp;<label for="b_60">B</label><input type="radio" value="C" id="c_60" name="k60" />&nbsp;<label for="c_60">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78256_danxuan_6_60" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian61"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>61、 安全带(    )挂在管件的自由端、安全网上。 </h5><p>A、不可</p><p>B、直接</p><p>C、可以</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_61" name="k61" />&nbsp;<label for="a_61">A</label><input type="radio" value="B" id="b_61" name="k61" />&nbsp;<label for="b_61">B</label><input type="radio" value="C" id="c_61" name="k61" />&nbsp;<label for="c_61">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_79171_danxuan_6_61" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian62"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>62、 空调连接管保温是为了(　　　)。 </h5><p>A、节能</p><p>B、防止烫伤</p><p>C、捆绑方便</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_62" name="k62" />&nbsp;<label for="a_62">A</label><input type="radio" value="B" id="b_62" name="k62" />&nbsp;<label for="b_62">B</label><input type="radio" value="C" id="c_62" name="k62" />&nbsp;<label for="c_62">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78433_danxuan_6_62" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian63"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>63、 挂梯的踏脚间距不宜过大或过小,以下哪种间距不合理。(　　　)mm。 </h5><p>A、200</p><p>B、300</p><p>C、400</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_63" name="k63" />&nbsp;<label for="a_63">A</label><input type="radio" value="B" id="b_63" name="k63" />&nbsp;<label for="b_63">B</label><input type="radio" value="C" id="c_63" name="k63" />&nbsp;<label for="c_63">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78305_danxuan_6_63" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian64"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>64、 广告施工作业中遇有大风天气(  )级以上应停止一切高处作业。 </h5><p>A、四</p><p>B、五</p><p>C、六</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_64" name="k64" />&nbsp;<label for="a_64">A</label><input type="radio" value="B" id="b_64" name="k64" />&nbsp;<label for="b_64">B</label><input type="radio" value="C" id="c_64" name="k64" />&nbsp;<label for="c_64">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78915_danxuan_6_64" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian65"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>65、 施工单位应根据原设计方案或图纸按拆除解体情况,进行结构稳定性及吊装重量的精确核算,确保安全适用于(    )设备拆除。 </h5><p>A、大型</p><p>B、大型运动(需解体)</p><p>C、通用</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_65" name="k65" />&nbsp;<label for="a_65">A</label><input type="radio" value="B" id="b_65" name="k65" />&nbsp;<label for="b_65">B</label><input type="radio" value="C" id="c_65" name="k65" />&nbsp;<label for="c_65">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_79220_danxuan_6_65" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian66"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>66、 大型运动设施拆除工程,安全专项方案的内容应包括设备、设施的(    )。 </h5><p>A、解体方案及安全防护措施</p><p>B、解体方案</p><p>C、安全防护措施拆除预算</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_66" name="k66" />&nbsp;<label for="a_66">A</label><input type="radio" value="B" id="b_66" name="k66" />&nbsp;<label for="b_66">B</label><input type="radio" value="C" id="c_66" name="k66" />&nbsp;<label for="c_66">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78787_danxuan_6_66" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian67"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>67、 爬升式提升机构是利用滑轮或压轮与吊篮钢丝绳之间产生(　　　),来达到升降吊篮平台目的的,一般用于暂设式作业吊篮。 </h5><p>A、摩擦力</p><p>B、阻力</p><p>C、动力</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_67" name="k67" />&nbsp;<label for="a_67">A</label><input type="radio" value="B" id="b_67" name="k67" />&nbsp;<label for="b_67">B</label><input type="radio" value="C" id="c_67" name="k67" />&nbsp;<label for="c_67">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78049_danxuan_6_67" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian68"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>68、 通常在一个控制系统中,控制装置在机器运转时,(　　　)锁定在闭合的状态。 </h5><p>A、保持</p><p>B、回到</p><p>C、不会</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_68" name="k68" />&nbsp;<label for="a_68">A</label><input type="radio" value="B" id="b_68" name="k68" />&nbsp;<label for="b_68">B</label><input type="radio" value="C" id="c_68" name="k68" />&nbsp;<label for="c_68">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78354_danxuan_6_68" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian69"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>69、 电动吊篮悬挂机构的抗倾覆系数应是(    )。 </h5><p>A、≥1.5</p><p>B、≥2</p><p>C、≥2.5</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_69" name="k69" />&nbsp;<label for="a_69">A</label><input type="radio" value="B" id="b_69" name="k69" />&nbsp;<label for="b_69">B</label><input type="radio" value="C" id="c_69" name="k69" />&nbsp;<label for="c_69">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78659_danxuan_6_69" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian70"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>70、 生产经营单位还应建立安全生产规章制度和安全(    )规程。 </h5><p>A、生产</p><p>B、工作</p><p>C、操作</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_70" name="k70" />&nbsp;<label for="a_70">A</label><input type="radio" value="B" id="b_70" name="k70" />&nbsp;<label for="b_70">B</label><input type="radio" value="C" id="c_70" name="k70" />&nbsp;<label for="c_70">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78964_danxuan_6_70" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian71"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>71、 电动吊篮的前后支架间距,不得(　　　)《产品使用说明书》规定的数量。 </h5><p>A、小于</p><p>B、等于</p><p>C、大于</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_71" name="k71" />&nbsp;<label for="a_71">A</label><input type="radio" value="B" id="b_71" name="k71" />&nbsp;<label for="b_71">B</label><input type="radio" value="C" id="c_71" name="k71" />&nbsp;<label for="c_71">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78226_danxuan_6_71" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian72"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>72、 窒息(呼吸道完全堵塞)或心脏呼吸骤停的伤员,必须进(    )或心脏复苏后再搬运。 </h5><p>A、安抚</p><p>B、抢救</p><p>C、人工呼吸</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_72" name="k72" />&nbsp;<label for="a_72">A</label><input type="radio" value="B" id="b_72" name="k72" />&nbsp;<label for="b_72">B</label><input type="radio" value="C" id="c_72" name="k72" />&nbsp;<label for="c_72">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78531_danxuan_6_72" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian73"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>73、 在距坠落高度基准面(    )m或2m以上有可能坠落的高处进行的作业。 </h5><p>A、1.5</p><p>B、2</p><p>C、3</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_73" name="k73" />&nbsp;<label for="a_73">A</label><input type="radio" value="B" id="b_73" name="k73" />&nbsp;<label for="b_73">B</label><input type="radio" value="C" id="c_73" name="k73" />&nbsp;<label for="c_73">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78836_danxuan_6_73" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian74"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>74、 生产经营单位应当建立健全安全生产责任制,是搞好(    )的关键。 </h5><p>A、安全生产</p><p>B、企业效益</p><p>C、后勤</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_74" name="k74" />&nbsp;<label for="a_74">A</label><input type="radio" value="B" id="b_74" name="k74" />&nbsp;<label for="b_74">B</label><input type="radio" value="C" id="c_74" name="k74" />&nbsp;<label for="c_74">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_79141_danxuan_6_74" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian75"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>75、 人们处于紧张时,神经系统会发送信号,促使肾上腺分泌量增加,而使心跳加快、血管收缩、暂时性的血压(　　　)。 </h5><p>A、暴涨</p><p>B、升高</p><p>C、变小</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_75" name="k75" />&nbsp;<label for="a_75">A</label><input type="radio" value="B" id="b_75" name="k75" />&nbsp;<label for="b_75">B</label><input type="radio" value="C" id="c_75" name="k75" />&nbsp;<label for="c_75">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78403_danxuan_6_75" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian76"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>76、 (    )是高处作业中最常见的事故。 </h5><p>A、触电</p><p>B、坠落</p><p>C、坠物</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_76" name="k76" />&nbsp;<label for="a_76">A</label><input type="radio" value="B" id="b_76" name="k76" />&nbsp;<label for="b_76">B</label><input type="radio" value="C" id="c_76" name="k76" />&nbsp;<label for="c_76">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_79013_danxuan_6_76" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian77"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>77、 防倾斜锁安装在提升机安装架(　　　)。 </h5><p>A、下端</p><p>B、上端</p><p>C、左端</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_77" name="k77" />&nbsp;<label for="a_77">A</label><input type="radio" value="B" id="b_77" name="k77" />&nbsp;<label for="b_77">B</label><input type="radio" value="C" id="c_77" name="k77" />&nbsp;<label for="c_77">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_77970_danxuan_6_77" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian78"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>78、 一根锚桩上的临时拉线不得超过(   )根。 </h5><p>A、一</p><p>B、二</p><p>C、三</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_78" name="k78" />&nbsp;<label for="a_78">A</label><input type="radio" value="B" id="b_78" name="k78" />&nbsp;<label for="b_78">B</label><input type="radio" value="C" id="c_78" name="k78" />&nbsp;<label for="c_78">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78580_danxuan_6_78" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian79"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>79、 遇到伤害时,不要惊慌失措,要保持(    ),并设法维护好现场秩序。 </h5><p>A、焦急</p><p>B、镇静</p><p>C、慌乱</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_79" name="k79" />&nbsp;<label for="a_79">A</label><input type="radio" value="B" id="b_79" name="k79" />&nbsp;<label for="b_79">B</label><input type="radio" value="C" id="c_79" name="k79" />&nbsp;<label for="c_79">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78885_danxuan_6_79" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian80"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>80、 在外界条件不具备的时候,是(　　　)高处作业的。 </h5><p>A、允许</p><p>B、不允许</p><p>C、酌情</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_80" name="k80" />&nbsp;<label for="a_80">A</label><input type="radio" value="B" id="b_80" name="k80" />&nbsp;<label for="b_80">B</label><input type="radio" value="C" id="c_80" name="k80" />&nbsp;<label for="c_80">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78147_danxuan_6_80" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian81"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>81、 绳索固定直接采用配重形式的配重量,不得小于人体重量的(　　　)倍。 </h5><p>A、2</p><p>B、3</p><p>C、5</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_81" name="k81" />&nbsp;<label for="a_81">A</label><input type="radio" value="B" id="b_81" name="k81" />&nbsp;<label for="b_81">B</label><input type="radio" value="C" id="c_81" name="k81" />&nbsp;<label for="c_81">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78452_danxuan_6_81" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian82"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>82、 脚手架应按相关规定编制施工方案,作业层脚手架的脚手板应铺设严密,下部应用(    )兜底。 </h5><p>A、安全平网</p><p>B、阻燃安全网</p><p>C、密目式安全网</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_82" name="k82" />&nbsp;<label for="a_82">A</label><input type="radio" value="B" id="b_82" name="k82" />&nbsp;<label for="b_82">B</label><input type="radio" value="C" id="c_82" name="k82" />&nbsp;<label for="c_82">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_79062_danxuan_6_82" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian83"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>83、 地下室、人防设备安装必须派有经验的施工人员进行施工,线路架空要求(_x0016_以上,照明灯泡必须有(　　　)罩。 </h5><p>A、保护</p><p>B、防护</p><p>C、防尘</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_83" name="k83" />&nbsp;<label for="a_83">A</label><input type="radio" value="B" id="b_83" name="k83" />&nbsp;<label for="b_83">B</label><input type="radio" value="C" id="c_83" name="k83" />&nbsp;<label for="c_83">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_78324_danxuan_6_83" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian84"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>84、 室内机需要用送风管安装的空调是(    )。 </h5><p>A、分体吸顶式空调</p><p>B、分体柜式空调</p><p>C、户式中央空调</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_84" name="k84" />&nbsp;<label for="a_84">A</label><input type="radio" value="B" id="b_84" name="k84" />&nbsp;<label for="b_84">B</label><input type="radio" value="C" id="c_84" name="k84" />&nbsp;<label for="c_84">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78934_danxuan_6_84" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian85"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>85、 高处作业中在吊篮上使用安全带,哪种系挂方法是正确的(　　　)。 </h5><p>A、系在吊篮框架上</p><p>B、系在安全绳上</p><p>C、系挂在固定结构上
                            查看答案</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_85" name="k85" />&nbsp;<label for="a_85">A</label><input type="radio" value="B" id="b_85" name="k85" />&nbsp;<label for="b_85">B</label><input type="radio" value="C" id="c_85" name="k85" />&nbsp;<label for="c_85">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_77891_danxuan_6_85" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian86"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>86、 过墙孔低于室内机的原因是(    )。 </h5><p>A、打孔方便</p><p>B、冷凝水流淌顺畅</p><p>C、房间太高</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_86" name="k86" />&nbsp;<label for="a_86">A</label><input type="radio" value="B" id="b_86" name="k86" />&nbsp;<label for="b_86">B</label><input type="radio" value="C" id="c_86" name="k86" />&nbsp;<label for="c_86">C</label><input type="hidden" value="B" name="result" /><input type="hidden" value="no_79239_danxuan_6_86" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="B" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian87"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>87、 施工面积较大地下多层施工、施工环境复杂的临建设施,应编制单项照明(　　　)方案。 </h5><p>A、阻燃</p><p>B、消防</p><p>C、用电</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_87" name="k87" />&nbsp;<label for="a_87">A</label><input type="radio" value="B" id="b_87" name="k87" />&nbsp;<label for="b_87">B</label><input type="radio" value="C" id="c_87" name="k87" />&nbsp;<label for="c_87">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78196_danxuan_6_87" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian88"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>88、 含有大量尘埃但无爆炸和火灾危险的场所,选用(   )型照明器。 </h5><p>A、防尘</p><p>B、防爆</p><p>C、防震</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_88" name="k88" />&nbsp;<label for="a_88">A</label><input type="radio" value="B" id="b_88" name="k88" />&nbsp;<label for="b_88">B</label><input type="radio" value="C" id="c_88" name="k88" />&nbsp;<label for="c_88">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78501_danxuan_6_88" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian89"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>89、 占用室内空间最大的空调是(   )。 </h5><p>A、分体柜式空调器</p><p>B、小型户式中央空调</p><p>C、分体壁挂式空调器</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_89" name="k89" />&nbsp;<label for="a_89">A</label><input type="radio" value="B" id="b_89" name="k89" />&nbsp;<label for="b_89">B</label><input type="radio" value="C" id="c_89" name="k89" />&nbsp;<label for="c_89">C</label><input type="hidden" value="A" name="result" /><input type="hidden" value="no_78806_danxuan_6_89" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="A" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div><a name="maodian90"></a><div class="test"><div class="warp_test"><table class="outer_table"><tr><td><h5>90、 自控器的水平活动应该在以垂直线为中心半径的(   )m范围内。 </h5><p>A、2</p><p>B、3</p><p>C、1.5</p><table cellpadding="0" cellspacing="0" class="choice_table"><tr><td><input type="radio" value="A" id="a_90" name="k90" />&nbsp;<label for="a_90">A</label><input type="radio" value="B" id="b_90" name="k90" />&nbsp;<label for="b_90">B</label><input type="radio" value="C" id="c_90" name="k90" />&nbsp;<label for="c_90">C</label><input type="hidden" value="C" name="result" /><input type="hidden" value="no_78678_danxuan_6_90" name="ansResult" /><input type="hidden" value="" name="result2" id="test2" /><input type="hidden" value="C" name="result3" id="test3" /></td></tr></table></td><td align="right"></td></tr></table></div></div>

                        </div>
                        <div class="submit_answer">
                            <span><input type="button" name="submit" value="交卷评分" /></span>
                            <span><input name="reset" type="button" value="重新出题" onclick="javascript:location.reload();" /></span><input type="hidden" id="hidJige" value="60" />
                        </div>
                    </dd>

                </dl>
            </div>

        </div>

        <div class="w960 bottom cl">

            <p class="mt20">&copy; 2015 - 2016 <a href="http://www.srwlkj.com/" class="li">无锡世融网络科技</a> 提供技术</p>
        </div>

        <div style="background:#ff0;width:240px;position:fixed;left:auto;right:auto;bottom:0;_position:absolute;_top:expression(document.documentElement.clientHeight + document.documentElement.scrollTop - this.offsetHeight);text-align:center;">
            <div class="floatDiv">
                <div id="timer"></div>
                <div class="warp_ans" >
					<table >
						<tr>
							<td>
								<a href="#maodian1" id="k1">1</a>
							</td>
							<td>
							<a href="#maodian2" id="k2">2</a>
							</td>
							<td>
							<a href="#maodian3">3</a>
							</td>
							<td>
							<a href="#maodian4">4</a>
							</td>
							<td>
							<a href="#maodian5">5</a>
							</td>
							<td>
							<a href="#maodian6">6</a>
							</td>
							<td>
							<a href="#maodian7">7</a>
							</td>
							<td>
							<a href="#maodian8">8</a>
							</td>
							<td>
							<a href="#maodian9">9</a>
							</td>
							<td>
							<a href="#maodian10">10</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian11">11</a>
							</td>
							<td>
							<a href="#maodian12">12</a>
							</td>
							<td>
							<a href="#maodian13">13</a>
							</td>
							<td>
							<a href="#maodian14">14</a>
							</td>
							<td>
							<a href="#maodian15">15</a>
							</td>
							<td>
							<a href="#maodian16">16</a>
							</td>
							<td>
							<a href="#maodian17">17</a>
							</td>
							<td>
							<a href="#maodian18">18</a>
							</td>
							<td>
							<a href="#maodian19">19</a>
							</td>
							<td>
							<a href="#maodian20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian21">21</a>
							</td>
							<td>
							<a href="#maodian22">22</a>
							</td>
							<td>
							<a href="#maodian23">23</a>
							</td>
							<td>
							<a href="#maodian24">24</a>
							</td>
							<td>
							<a href="#maodian25">25</a>
							</td>
							<td>
							<a href="#maodian26">26</a>
							</td>
							<td>
							<a href="#maodian27">27</a>
							</td>
							<td>
							<a href="#maodian28">28</a>
							</td>
							<td>
							<a href="#maodian29">29</a>
							</td>
							<td>
							<a href="#maodian30">30</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian31">31</a>
							</td>
							<td>
							<a href="#maodian32">32</a>
							</td>
							<td>
							<a href="#maodian33">33</a>
							</td>
							<td>
							<a href="#maodian34">34</a>
							</td>
							<td>
							<a href="#maodian35">35</a>
							</td>
							<td>
							<a href="#maodian36">36</a>
							</td>
							<td>
							<a href="#maodian37">37</a>
							</td>
							<td>
							<a href="#maodian38">38</a>
							</td>
							<td>
							<a href="#maodian39">39</a>
							</td>
							<td>
							<a href="#maodian40">40</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian41">41</a>
							</td>
							<td>
							<a href="#maodian42">42</a>
							</td>
							<td>
							<a href="#maodian43">43</a>
							</td>
							<td>
							<a href="#maodian44">44</a>
							</td>
							<td>
							<a href="#maodian45">45</a>
							</td>
							<td>
							<a href="#maodian46">46</a>
							</td>
							<td>
							<a href="#maodian47">47</a>
							</td>
							<td>
							<a href="#maodian48">48</a>
							</td>
							<td>
							<a href="#maodian49">49</a>
							</td>
							<td>
							<a href="#maodian50">50</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian51">51</a>
							</td>
							<td>
							<a href="#maodian52">52</a>
							</td>
							<td>
							<a href="#maodian53">53</a>
							</td>
							<td>
							<a href="#maodian54">54</a>
							</td>
							<td>
							<a href="#maodian55">55</a>
							</td>
							<td>
							<a href="#maodian56">56</a>
							</td>
							<td>
							<a href="#maodian57">57</a>
							</td>
							<td>
							<a href="#maodian58">58</a>
							</td>
							<td>
							<a href="#maodian59">59</a>
							</td>
							<td>
							<a href="#maodian60">60</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian61">61</a>
							</td>
							<td>
							<a href="#maodian62">62</a>
							</td>
							<td>
							<a href="#maodian63">63</a>
							</td>
							<td>
							<a href="#maodian64">64</a>
							</td>
							<td>
							<a href="#maodian65">65</a>
							</td>
							<td>
							<a href="#maodian66">66</a>
							</td>
							<td>
							<a href="#maodian67">67</a>
							</td>
							<td>
							<a href="#maodian68">68</a>
							</td>
							<td>
							<a href="#maodian69">69</a>
							</td>
							<td>
							<a href="#maodian70">70</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian71">71</a>
							</td>
							<td>
							<a href="#maodian72">72</a>
							</td>
							<td>
							<a href="#maodian73">73</a>
							</td>
							<td>
							<a href="#maodian74">74</a>
							</td>
							<td>
							<a href="#maodian75">75</a>
							</td>
							<td>
							<a href="#maodian76">76</a>
							</td>
							<td>
							<a href="#maodian77">77</a>
							</td>
							<td>
							<a href="#maodian78">78</a>
							</td>
							<td>
							<a href="#maodian79">79</a>
							</td>
							<td>
							<a href="#maodian80">80</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian81">81</a>
							</td>
							<td>
							<a href="#maodian82">82</a>
							</td>
							<td>
							<a href="#maodian83">83</a>
							</td>
							<td>
							<a href="#maodian84">84</a>
							</td>
							<td>
							<a href="#maodian85">85</a>
							</td>
							<td>
							<a href="#maodian86">86</a>
							</td>
							<td>
							<a href="#maodian87">87</a>
							</td>
							<td>
							<a href="#maodian88">88</a>
							</td>
							<td>
							<a href="#maodian89">89</a>
							</td>
							<td>
							<a href="#maodian90">90</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#maodian91">91</a>
							</td>
							<td>
							<a href="#maodian92">92</a>
							</td>
							<td>
							<a href="#maodian93">93</a>
							</td>
							<td>
							<a href="#maodian94">94</a>
							</td>
							<td>
							<a href="#maodian95">95</a>
							</td>
							<td>
							<a href="#maodian96">96</a>
							</td>
							<td>
							<a href="#maodian97">97</a>
							</td>
							<td>
							<a href="#maodian98">98</a>
							</td>
							<td>
							<a href="#maodian99">99</a>
							</td>
							<td>
							<a href="#maodian100">100</a>
							</td>
						</tr>
					</table>
                    <!-- <a href="#maodian1">1</a>

                    <a href="#maodian2">2</a>

                    <a href="#maodian3">3</a>

                    <a href="#maodian4">4</a>

                    <a href="#maodian5">5</a>

                    <a href="#maodian6">6</a>

                    <a href="#maodian7">7</a>

                    <a href="#maodian8">8</a>

                    <a href="#maodian9">9</a>

                    <a href="#maodian10">10</a>

                    <a href="#maodian11">11</a>

                    <a href="#maodian12">12</a>

                    <a href="#maodian13">13</a>

                    <a href="#maodian14">14</a>

                    <a href="#maodian15">15</a>

                    <a href="#maodian16">16</a>

                    <a href="#maodian17">17</a>

                    <a href="#maodian18">18</a>

                    <a href="#maodian19">19</a>

                    <a href="#maodian20">20</a>

                    <a href="#maodian21">21</a>

                    <a href="#maodian22">22</a>

                    <a href="#maodian23">23</a>

                    <a href="#maodian24">24</a>

                    <a href="#maodian25">25</a>

                    <a href="#maodian26">26</a>

                    <a href="#maodian27">27</a>

                    <a href="#maodian28">28</a>

                    <a href="#maodian29">29</a>

                    <a href="#maodian30">30</a>

                    <a href="#maodian31">31</a>

                    <a href="#maodian32">32</a>

                    <a href="#maodian33">33</a>

                    <a href="#maodian34">34</a>

                    <a href="#maodian35">35</a>

                    <a href="#maodian36">36</a>

                    <a href="#maodian37">37</a>

                    <a href="#maodian38">38</a>

                    <a href="#maodian39">39</a>

                    <a href="#maodian40">40</a>

                    <a href="#maodian41">41</a>

                    <a href="#maodian42">42</a>

                    <a href="#maodian43">43</a>

                    <a href="#maodian44">44</a>

                    <a href="#maodian45">45</a>

                    <a href="#maodian46">46</a>

                    <a href="#maodian47">47</a>

                    <a href="#maodian48">48</a>

                    <a href="#maodian49">49</a>

                    <a href="#maodian50">50</a>

                    <a href="#maodian51">51</a>

                    <a href="#maodian52">52</a>

                    <a href="#maodian53">53</a>

                    <a href="#maodian54">54</a>

                    <a href="#maodian55">55</a>

                    <a href="#maodian56">56</a>

                    <a href="#maodian57">57</a>

                    <a href="#maodian58">58</a>

                    <a href="#maodian59">59</a>

                    <a href="#maodian60">60</a>

                    <a href="#maodian61">61</a>

                    <a href="#maodian62">62</a>

                    <a href="#maodian63">63</a>

                    <a href="#maodian64">64</a>

                    <a href="#maodian65">65</a>

                    <a href="#maodian66">66</a>

                    <a href="#maodian67">67</a>

                    <a href="#maodian68">68</a>

                    <a href="#maodian69">69</a>

                    <a href="#maodian70">70</a>

                    <a href="#maodian71">71</a>

                    <a href="#maodian72">72</a>

                    <a href="#maodian73">73</a>

                    <a href="#maodian74">74</a>

                    <a href="#maodian75">75</a>

                    <a href="#maodian76">76</a>

                    <a href="#maodian77">77</a>

                    <a href="#maodian78">78</a>

                    <a href="#maodian79">79</a>

                    <a href="#maodian80">80</a>

                    <a href="#maodian81">81</a>

                    <a href="#maodian82">82</a>

                    <a href="#maodian83">83</a>

                    <a href="#maodian84">84</a>

                    <a href="#maodian85">85</a>

                    <a href="#maodian86">86</a>

                    <a href="#maodian87">87</a>

                    <a href="#maodian88">88</a>

                    <a href="#maodian89">89</a>

                    <a href="#maodian90">90</a>

                    <a href="#maodian91">91</a>

                    <a href="#maodian92">92</a>

                    <a href="#maodian93">93</a>

                    <a href="#maodian94">94</a>

                    <a href="#maodian95">95</a>

                    <a href="#maodian96">96</a>

                    <a href="#maodian97">97</a>

                    <a href="#maodian98">98</a>

                    <a href="#maodian99">99</a>

                    <a href="#maodian100">100</a> -->

                </div>
                <div class="clear"></div>
                <div class="tishi">
                    <span class="tishi_errorAns">错误答案</span><span class="tishi_yesAns">正确答案</span><span class="tishi_noAns">暂无答案</span>
                </div>
                <div class="clear"></div>
            </div>
        </div>

    </div>

</form>

</body>
</html>

