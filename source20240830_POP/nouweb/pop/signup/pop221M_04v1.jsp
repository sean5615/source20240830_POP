<%@page import="com.acer.util.Utility"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.nou.pop.signup.po.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>無標題文件</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/check.js"></script>

<%
//判斷session中是否有 IDNO 和 BIRTHDATE
String IDNO = Utility.checkNull(
		request.getSession().getAttribute("IDNO"), "");
String BIRTHDATE = Utility.checkNull(request.getSession()
		.getAttribute("BIRTHDATE"), "");

			
// String IDNO  = Utility.checkNull(request.getAttribute("IDNO"),"");
// String BIRTHDATE  = Utility.checkNull(request.getAttribute("BIRTHDATE"),"");
%>
<script type="text/JavaScript">
<!--



function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function toRegister(){
	var theForm = document.forms["popMainForm"];
	theForm.action = "/pop/signup/PopMainAction.do?method=toRegister";
	theForm.target = "mainFrame";
	theForm.submit();
}

function doLogin(){
	if(!doCheck()){
		return;
	}
	var theForm = document.forms["popMainForm"];
    var idno = theForm.elements["registerInfo.idno"].value;
    //持居留證現場報名學生，移除身份證檢核，供該學生登入系統20180719Maggie
	//if ( ! checkID( idno ) ){
    //	window.alert( "請確認身份證字號!" );
    //	return;
    //}  
    
	var theForm = document.forms["popMainForm"];
	theForm.action = "/pop/signup/PopMainAction.do?method=doLogin";
	theForm.target = "mainFrame";
	theForm.submit();
}

function init(){
	var message = "<%= (String) request.getAttribute("message") %>";
	if(message != null && message != "" && message != "null"){
		alert(message);
	}
	
	// 自動登入
	var IDNO  = '<%=IDNO%>';
	var BIRTHDATE  = '<%=BIRTHDATE%>';
	
	var theForm = document.forms["popMainForm"];
	if (IDNO != "" && BIRTHDATE != ""){
		theForm.elements["registerInfo.idno"].value = IDNO;
		theForm.elements["registerInfo.pwPop"].value = BIRTHDATE;
		theForm.elements["sessionBirthday"].value = "Y";
		doLogin();
	} else {
		theForm.elements["sessionBirthday"].value = "N";
	}
}

function doCheck(){
	var theForm = document.forms["popMainForm"];
    var idno = theForm.elements["registerInfo.idno"].value;
    var birthday = theForm.elements["registerInfo.pwPop"].value;
    
    if(idno == '' || birthday == ''){
    	alert("帳號密碼不可為空白！");
    	return false;
    }else{
    	alert("●● 注意  ●● \n 此網站為公開的報名系統，若您是透過中心協助選課。 \n 請登入後點選「訂購紀錄」繳費，已清楚再按確定！");
    	return true;
    }
}

function showForgetPwMsg() {
	alert("一、提示：「西元年出生日期」共８碼。\n\n二、忘記密碼，請電洽（02）22896997");
	//window.open('/pop/signup/ForgetPw.html', '忘記密碼', config='height=300,width=300'); //可以更改以開啟視窗方式
}

//-->
</script>
<style type="text/css">
<!--
.style3 {	FONT-WEIGHT: bold; COLOR: #000000
}
.style4 {	COLOR: #000000
}
.style5 {font-size: 24px}
-->
</style>
</head>

<body onload="init()">
<form name="popMainForm" action="/pop/signup/PopMainAction" method="post">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="5">
<input type="hidden" name="sessionBirthday">
	<tr>
		<td height="100%" align="left" valign="top" class="BgBody">
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="100%" align="center" valign="top" class="Padding1">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="7" height="7"><img src="images/table_1.gif" width="7" height="7" /></td>
						<td width="100%" height="7" background="images/table_2.gif"></td>
						<td width="7" height="7"><img src="images/table_3.gif" width="7" height="7" /></td>
					</tr>
					<tr>
						<td width="7" height="100%" valign="top" background="images/table_4.gif"><img src="images/table_left.gif" width="7" height="165" /></td>
						<td width="100%" height="100%" valign="top" bgcolor="#FFFFFF" class="TableBg">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td class="Padding2">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="50" align="left" valign="top">
										<div class="DivTitleIcon" id="ti2">
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td><img src="images/titleicon_02.gif" width="48" height="56" /></td>
												<td width="180" class="style5">會員登入</td>
											</tr>
										</table>
										</div>
										</td>
										<td height="40" align="left" valign="middle">&nbsp;</td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td align="right" class="Padding2"><FONT face=新細明體>&nbsp; </FONT>
								<TABLE style="BORDER-COLLAPSE: collapse" borderColor=#111111 cellSpacing=0 cellPadding=2 width="100%" border=0>
									<TBODY>
										<TR>
											<TD colspan="2" align=right vAlign=top>&nbsp;</TD>
										</TR>
										<TR class=table-boder1 bgColor=#f2f2f2>
											<TD width="85%" vAlign=top class=payListTitleTable-boder1><SPAN class=style3><SPAN class=title1><IMG height=32 alt="" src="images/a.gif" width=32 align=absMiddle border=0 name=a> &nbsp;輸入帳號及密碼</SPAN> </SPAN></TD>
											<TD width="15%" vAlign=top class=payListTitleTable-boder1>
											<div align="right"></div>
											</TD>
										</TR>
										<TR>
											<TD height=79 colspan="2">
											<DIV align=center>
											<TABLE id=Table2 cellSpacing=1 cellPadding=1 width=400>
												<TBODY>
													<TR>
														<TD>
														<TABLE cellSpacing=0 cellPadding=0 width=500 border=0>
															<TBODY>
																<TR>
																	<TD align=right width=60><FONT color=#423f1d>帳號： </FONT></TD>
																	<TD ><INPUT id=txtMemberId style="WIDTH: 100px" tabIndex=1 name="registerInfo.idno"> 為身份證號(英文字母為大寫) <FONT face=新細明體>&nbsp;</FONT></TD>
																</TR>
																<TR>
																	<TD align=right width=60><FONT color=#423f1d>密碼： </FONT></TD>
																	<!-- <TD><INPUT id=txtMemberPw style="WIDTH: 100px" tabIndex=2 type=password name="registerInfo.birthdate"> 預設值為生日(例68年08月16日生, 請輸入19790816)</TD> -->
																	<TD><INPUT id=txtMemberPw style="WIDTH: 150px" tabIndex=2 type=password name="registerInfo.pwPop"> <a href='javascript:showForgetPwMsg();' style="color:blue;">忘記密碼</a></TD>
																</TR>
																<TR>
																	<TD></TD>
																	<TD><FONT face=新細明體>&nbsp;&nbsp; </FONT></TD>
																</TR>
																<TR>
																	<TD><FONT face=新細明體></FONT></TD>
																	<TD vAlign=top align=middle>
																	<TABLE id=Table1 cellSpacing=1 cellPadding=1 width="100%" border=0>
																		<TBODY>
																			<TR>
																				<TD width="45%" vAlign=top><a href="#" onclick="doLogin();" title="Login"><img src="images/define.gif" width="90" height="29" border="0"></a></TD>
																				<TD width="55%" vAlign=top><FONT face=新細明體> <INPUT name=btnRegister type=image id=btnRegister style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" tabIndex=4 src="images/register.gif" alt="" width="120" height="29" onclick="toRegister();"> </FONT></TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																	</TD>
																</TR>
															</TBODY>
														</TABLE>
														</TD>
														<TD><FONT face=新細明體></FONT></TD>
													</TR>
												</TBODY>
											</TABLE>
											</DIV>
											</TD>
										</TR>
										<TR>
											<TD colspan="2" class=detail>
											<UL>
												<LI>若您已經是會員，請直接輸入帳號及密碼，按下「確認送出」鍵即可。
												<LI>若您尚未加入會員，請點選「新會員註冊」直接進入註冊申請流程，謝謝！
												<LI>若您忘記密碼，請電洽（02）22896997，謝謝！
											</UL>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
								</td>
							</tr>
							<tr>
								<td class="Padding2">
								<div align="right"></div>
								</td>
							</tr>
						</table>
						</td>
						<td width="7" height="100%" valign="top" background="images/table_5.gif"><img src="images/table_right.gif" width="7" height="165" /></td>
					</tr>
					<tr>
						<td width="7" height="7"><img src="images/table_6.gif" width="7" height="7" /></td>
						<td width="100%" height="7" background="images/table_7.gif"></td>
						<td width="7" height="7"><img src="images/table_8.gif" width="7" height="7" /></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td height="30" align="center" valign="middle" class="BgBody">地址：新北市蘆洲區中正路172號 e-mail：<a href="mailto:noueec@mail.nou.edu.tw" target="_blank">noueec@mail.nou.edu.tw</a> 版權所有 &copy; 國立空中大學資訊科技中心</td>
	</tr>
</table>
</form>
</body>
</html>
