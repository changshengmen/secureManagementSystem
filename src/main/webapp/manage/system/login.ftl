<#import "/manage/tpl/loginBase.ftl" as html>
<@html.loginBase checkLogin=false jsFiles=["system/login.js"]>

<style type="text/css">
.vintage{
	color: #fafafa;
	letter-spacing: 1;
	text-shadow: 0px 1px 0px #999, 0px 2px 0px #888, 0px 3px 0px #777, 0px 4px 0px #666, 0px 5px 0px #555, 0px 6px 0px #444, 0px 7px 0px #333, 0px 8px 7px #001135 ;
	font-size:25px;
	letter-spacing: 0.7px
 }
 .press {
	color: transparent;
	background-color : black;
	text-shadow : rgba(255,255,255,0.5) 0 5px 6px, rgba(255,255,255,0.2) 1px 3px 3px;
	-webkit-background-clip : text;
	letter-spacing: 0.3px;
	font-size:18px;
}
.inputBox{
  width:30px;
  text-align:center;
}
</style>

<body >
<div class="wrapper" style="width:100%;height:100%">
<div  class="main"  >
    <div class="row" style="margin-right:0px;" >
    		<div class="panel" style="width:25%;margin-left:39%;margin-top:13%">
                <div class="panel-heading" style="color:#336b82;background-color:#5dbba4;">
                   <label class="vintage" >金鼎涛</label>&nbsp;	<label class="press">保险业务系统</label>
               </div>
                <div class="panel-body">
                    <form role="form" id="formLogin" action="${basepath}/manage/user/login" method="post" style="padding:0px;0px;0px;0px">
                        <fieldset>
                        <div class="form-group">
                        
                            <#if errorMsg??>
                                <div class="alert alert-danger alert-dismissable" style="color:#0c0c13;">
                                    ${errorMsg}	 
                                     <button type="button" class="close" data-dismiss="alert" aria-hidden="true" style="width:10px;position:inherit">
                                           &times;
                                     </button>
                                </div>
                            </#if>
                            
                        </div>
                        <div class="form-group has-success" style="text-align:center">
                            <div class="input-group" style="width:90%;margin:0 auto">
                                <span class="input-group-addon">
                                    <span class="">用户名</span>
                                </span>
                                <input type="text" value="${e.username!""}" placeholder="账号" name="username"
                                       class="len form-control" id="username" autofocus style="text-align:left"/>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <div class="input-group" style="width:90%;margin:0 auto">
                                <span class="input-group-addon" style="width:65px">
                                    <span >密  码</span>
                                </span>
                                <input type="password" name="password" placeholder="密码" class="len form-control"
                                       label="密码" style="text-align:left"/>
                            </div>
                        </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type="submit" id="btnLogin" class="btn btn-lg btn-success btn-block" style="background-color:#2c8bb9;border-color:#5b8092;width:90%;align:left" value="登录">
                        </fieldset>
                    </form>
                </div>
                   
            </div> 
              <div style="">
                   <div style="width:100%; position:fixed;  bottom:0;text-align:center">${systemSetting().version} &nbsp;${systemSetting().icp}</div>
                </div> 
            </div> 
            <ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
</div>
</body>
</@html.loginBase>