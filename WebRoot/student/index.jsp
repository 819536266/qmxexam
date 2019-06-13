<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>

<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title></title>
		<link rel="stylesheet" href="<%=path %>/css/student.css" type="text/css" />
		<link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css" type="text/css" />
	<script  src="<%=path %>/js/jquery-1.9.1.min.js"></script>
	<script  src="<%=path %>/js/jquery-ui-1.9.2.min.js"></script>
	<script  src="<%=path %>/js/bootstrap.min.js"></script>
	<style type="text/css">

body{

margin: 0px;

padding: 5px;

}

.box {

text-align: center;

}

.left {

display: inline-block;

width: 49.5%;

margin-right: 0.5%;

border: 1px solid rgba(127, 127, 127, 0.6);

-webkit-box-sizing: border-box;

-moz-box-sizing: border-box;

box-sizing: border-box;

}

.right {

display: inline-block;

width: 49.5%;

margin-left: 0.5%;

border: 1px solid rgba(127, 127, 127, 0.6);

-webkit-box-sizing: border-box;

-moz-box-sizing: border-box;

box-sizing: border-box;

}

</style>
        <script>
       $(function () {
		   $("input[type='checkbox']").each(function () {
			   this.checked=false;
           })
           $("input[type='radio']").each(function () {
               this.checked=false;
           })
       })
        	window.onload=function(){     
        		daojishi();
     		}

      var counttime=120*60;//总秒钟
     
      function daojishi(){
      if(counttime>=0){
             var ms = counttime%60;//余数 89%60==29秒
             var mis = Math.floor(counttime/60);//分钟
             if(mis>=60){
              var hour=Math.floor(mis/60);

     mis=Math.floor((counttime-hour*60*60)/60);

              document.getElementById("mss").innerHTML=hour+":"+mis+":"+ms;
              document.getElementById("mss1").innerHTML=hour+":"+mis+":"+ms;
             }else if(mis>=1){
              document.getElementById("mss").innerHTML=mis+":"+ms; 
              document.getElementById("mss1").innerHTML=mis+":"+ms; 
             }else{
              document.getElementById("mss").innerHTML=ms; 
              document.getElementById("mss1").innerHTML=ms;
             }

   
              counttime--;
              vartt =  window.setTimeout("daojishi()",1000);
   }else{
       window.clearTimeout(vartt);
       window.confirm("考试时间结束,请单击提交"); 
       tijiao();
      
   }

   
     }
     
     function tijiao(){
        document.forms[0].submit();
     }
        </script>
  <script type="text/javascript">
      function clickBut(r){
          var num=0;
          checked=false;
		  $("input[name='"+r.name+"']").each(function(){
			  if(this.checked){
				  checked=true;
				  return false;
			  }
		  })
		  num=r.name.substring(9,r.name.length-1);
		  if(checked){
              num=parseInt(num)+1;
              document.getElementById("k"+num).style.background="#800";
              document.getElementById("k"+num).style.opacity="1";
          }else{
              num=parseInt(num)+1;
              document.getElementById("k"+num).style.background="rgba(144, 238, 144)";
              document.getElementById("k"+num).style.opacity="1";
		  }
    }
    function fun(){
    	$("#from").submit();
    }
</script>
<title>员工登陆成功</title>
</head>
<body>

 <div class="container-fluid">
    
	<div id="move" class="col-xs-3" style="width:19%;margin-top:170px; position:fixed;text-align:center;border:1px solid #888">
		         <div class="floatDiv" >
		                <div id="timer"></div>
		                <div class="warp_ans" >
		                <font size="4" face="楷体">考试题(每题一分)</font>
							<table border="1" cellspacing="0" >
								<s:iterator value="#request.subjects" status="s1">
									<c:if test="${(s1.index) % 10==0}">
										<tr height="5%" >
											<c:forEach var="s" begin="0" end="${subjects.size()-s1.index-1}">
                                                <c:if test="${(s+1)<=10}">
                                                    <td width="5%" id="k${s+1+s1.index}" >
                                                        <a href="#xmd${s+1+s1.index}"  ><div style="margin: 0px;background-color: rgba(144, 238, 144,0.5);height:25px;border:1px solid #888"  >${s+1+s1.index}</div></a>
                                                    </td>
                                                </c:if>
                                            </c:forEach>
<%--
                                            <s:iterator value="#request.subjects"   status="s">

											</s:iterator>--%>
										</tr>		
									</c:if>
								</s:iterator>
							</table>
							<%--<font size="4" face="楷体">判断题</font>--%>
							<table >
								<s:iterator value="#request.subjectsjud" status="s1">
									<c:if test="${(s1.index) % 10==0}">
										<tr height="5%">
                                            <c:forEach var="s" begin="0" end="${subjectsjud.size()-s1.index-1}">
												<c:if test="${(s+1)<=10}">
													<td width="3%" id="k${s+1+s1.index+subjects.size()}">
														<a href="#pmd${s+1+s1.index+subjects.size()}"><div style="margin: 0px;background-color: rgba(144, 238, 144,0.5);height:25px; border:1px solid #888"  >${s+1+s1.index+subjects.size()}<div></div></a>
													</td>
												</c:if>
                                            </c:forEach>
										</tr>		
									</c:if>
								</s:iterator>
							</table>
							<div align="center" >
								<a href="<%=path %>/getRandomSubject.action" ><button style="background-color: rgba(144, 238, 144,0.9); height: 45px;width: 20%">重做</button></a>
								<button  onclick="fun()" style="background-color: rgba(144, 238, 144,0.9); height: 45px;width: 20%" >提交</button>
								 <span >剩余时间为：<font id="mss"></font></span>
							</div>
						</div>
					</div>
				</div>
			
	<div class="col-xs-8"  style="margin:auto;width: 50%">
			
			<div class="header">
				<div class="logo">
					<a href="<%=path %>/getRandomSubject.action"><h2 style="margin-top: 10px;" ><font color="#f0f8ff" face="楷体">企明星考核系统</font></h2></a>
				</div>
				<div class="headerinner">
					<ul class="headmenu">

						<li class="right">
							<div class="userloggedinfo">
								<img src="<%=path %>/images/photos/thumb5.png" alt="" />
								<div class="userinfo">
									<h5>${studentInfo.studentName}<small></small></h5>
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
				<h3 style="text-align: center;">企明星考核系统</h3>
				<br>
					<div class = "exam_time">  
            <span>剩余时间为：</span><label  name="mss" id="mss1"></label>   
        </div>  
				<div class="questionCell" id="D_Title_P">
					<div class="titleBar">
						<span><b id="D_Title">考试题(每题一分)</b></span>
						<div class="clear"></div>
					</div>
					<form id="from" action="submitExam.action" method="post">
					<s:iterator value="#request.subjects" var="subject" status="sta">
					<div id="xmd${sta.index+1 }" name="xmd${sta.index+1 }" class="question" >
						<input type="hidden" name="stID" value="${subject.stID}" />
						<p>${sta.index + 1}、${subject.stTitle}&nbsp;(<span class="D_score">1.00</span>分)</p>
						<c:if test="${subject.stOptionD != null&&subject.stOptionD !=''&&subject.stOptionD=='判断'}">
							<ul>
								<li>
									<input type="radio" name="stAnswer[${sta.index}]" value="1"  onclick="clickBut(this);" /> <font size="3" face="加粗" >正确</font>
								</li>
								<li >
									<input type="radio"  name="stAnswer[${sta.index}]" value="2" onclick="clickBut(this);" /> <font size="3" face="加粗" >错误</font>
								</li>
							</ul>
						</c:if >
						<c:if test="${subject.stOptionD!='判断'}">


						<ul>
						<li>
							<c:if test="${subject.stOptionA != null&&subject.stOptionA !=''}">
								<input type="checkbox" name="stAnswer[${sta.index}]" value="A" onclick="clickBut(this);" /><font size="3" face="加粗" >A．${subject.stOptionA}</font>
								</c:if>
							</li>

							<li >
							<c:if test="${subject.stOptionB != null&&subject.stOptionB !=''}">
								<input type="checkbox"  name="stAnswer[${sta.index}]" value="B" onclick="clickBut(this);" /> <font size="3" face="加粗" >B．${subject.stOptionB}</font>
								</c:if>
							</li>

							<li >
								<c:if test="${subject.stOptionC != null&&subject.stOptionC !=''}">
									<input type="checkbox"  name="stAnswer[${sta.index}]" value="C" onclick="clickBut(this);" />  <font size="3" face="加粗" >C．${subject.stOptionC}</font>
								</c:if>
							</li>

							<li >
								<c:if test="${subject.stOptionD != null&&subject.stOptionD !=''}">
									<input type="checkbox" name="stAnswer[${sta.index}]" value="D" onclick="clickBut(this);" />  <font size="3" face="加粗" >D．${subject.stOptionD}</font>
								</c:if>
							</li>
							<li >
								<c:if test="${subject.stOptionE != null&&subject.stOptionE !=''}">
									<input type="checkbox" name="stAnswer[${sta.index}]" value="E" onclick="clickBut(this);" />  <font size="3" face="加粗" >E．${subject.stOptionE}</font>
								</c:if>
							</li>
							<li >
								<c:if test="${subject.stOptionF != null&&subject.stOptionF !=''}">
									<input type="checkbox" name="stAnswer[${sta.index}]" value="F" onclick="clickBut(this);" />  <font size="3" face="加粗" >F．${subject.stOptionF}</font>
								</c:if>
							</li>
							<li >
								<c:if test="${subject.stOptionG != null&&subject.stOptionG !=''}">
									<input type="checkbox" name="stAnswer[${sta.index}]" value="G" onclick="clickBut(this);" />  <font size="3" face="加粗" >G．${subject.stOptionG}</font>
								</c:if>
							</li>
							<li >
								<c:if test="${subject.stOptionH != null&&subject.stOptionH !=''}">
									<input type="checkbox" name="stAnswer[${sta.index}]" value="H" onclick="clickBut(this);" />  <font size="3" face="加粗" >H．${subject.stOptionH}</font>
								</c:if>
							</li>
							<li >
								<c:if test="${subject.stOptionI != null&&subject.stOptionI !=''}">
									<input type="checkbox" name="stAnswer[${sta.index}]" value="I" onclick="clickBut(this);" />  <font size="3" face="加粗" >I．${subject.stOptionI}</font>
								</c:if>
							</li>
							</c:if>
						</ul>
					</div>
					</s:iterator><br>
					<%--<span><b id="D_Title">判断题(${subjectsjud.size()}分)</b></span>--%>

					<s:iterator value="#request.subjectsjud" var="subjectjud" status="sta">
					<div id="pmd${sta.index+1+subjects.size()}" name="pmd${sta.index+1+subjects.size() }" class="question">
						<input type="hidden" name="stID" value="${subjectjud.stID}" />
						<p>${sta.index + subjects.size()+1}、${subjectjud.stTitle}&nbsp;(<span class="D_score">1.00</span>分)</p>
						<ul>
						<li>
								<input type="radio" name="stAnswer[${sta.index+subjects.size()}]" value="1"  onclick="clickBut(this);" /> <font size="3" face="加粗" >正确</font>
							</li>
							<li >
								<input type="radio"  name="stAnswer[${sta.index+subjects.size()}]" value="2" onclick="clickBut(this);" /> <font size="3" face="加粗" >错误</font>
							</li>
						</ul>
					</div>
					</s:iterator><br>
					
					</form>
					
				</div>
				
				
			</div>

		</div>
		
</div>
</body>
</html>