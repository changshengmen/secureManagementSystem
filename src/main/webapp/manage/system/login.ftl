<#import "/manage/tpl/htmlBase.ftl" as html>
<@html.htmlBase checkLogin=false jsFiles=["system/login.js"]>
<script type="text/css">
	
</script>
<body>
<div  class="main" style=" background-image:url('../../resource/images/mainForm3.png');background-repeat:no-repeat;background-size:cover;height:100%;width:100%" >
    <div class="row" style="width:100%;height:637px;margin 0px auto;" >
            <div class="login-panel panel" style="width:25.33%;margin-left:42%;margin-top:18%">
                <div class="panel-heading" style="color:#336b82;background-color:#ddd">
                    <h3 class="panel-title" style="font-weight:bold"><b>${systemSetting().name}</b></h3>
                </div>
                <div class="panel-body">
                    <form role="form" id="formLogin" action="${basepath}/manage/user/login" method="post">
                        <fieldset>
                        <div class="form-group">
                            <#if errorMsg??>
                                <div class="alert alert-danger alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert"
                                            aria-hidden="true">&times;</button>
                                ${errorMsg}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group has-success">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <span class="fa fa-user fa-fw"></span>
                                </span>
                                <input type="text" value="${e.username!""}" placeholder="账号" name="username"
                                       class="len form-control" id="username" autofocus/>
                            </div>
                        </div>
                        <div class="form-group has-success">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <span class="fa fa-key fa-fw"></span>
                                </span>
                                <input type="password" name="password" placeholder="密码" class="len form-control"
                                       label="密码"/>
                            </div>
                        </div>
                        <div class="row help-block">
                            <div class="col-md-offset-1 col-md-11">
                                <!-- <span class="fa fa-info-circle"></span>   默认用户名密码:admin/123456-->
                             
                                </span>
                            </div>
                        </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type="submit" id="btnLogin" class="btn btn-lg btn-success btn-block" style="background-color:#9ca2c3" value="登录">
                        </fieldset>
                    </form>
                </div>
                   
        </div> 
     <div style="width:100%; position:fixed;  bottom:0;text-align:center">${systemSetting().version} &nbsp;${systemSetting().icp}</div>
  
    </div>
   
</body>
</@html.htmlBase>