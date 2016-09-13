<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="用户管理">
<style>
	.td_right{text-align: right;}
</style>
<script type="text/javascript">
	$(function() {
		 $( "#tabs" ).tabs({
	            //event: "mouseover"
	        });
		 $("#username").focus();
		 
	});
</script>
</head>

<body>
<#if e.id??>
    <#assign formAction="111">
<#assign insertAction=false />
<#else >
<#assign formAction="insert">
    <#assign insertAction=true />
</#if>

 <div id="tabs">
            <ul>
                <li><a href="#tabs-1" style="font-size: 14px;">用户管理</a>
                </li>
               <li><a href="#tabs-2" style="font-size: 14px;">产品绑定</a></li>
            </ul>
            <!--------------------------------tap1 用户管理----------------------------->
            <div id="tabs-1">
				<form action="${basepath}/manage/user" id="form" method="post">
						<table class="table table-bordered">
							<tr>
								<td colspan="2" style="background-color: #dff0d8;text-align: center;">
									<strong>帐号编辑</strong>
								</td>
							</tr>
							<tr style="display:none;">
								<th>id</th>
								<td><input type="hidden" name="id" value=""></td>
							</tr>
							<tr>
								<th class="td_right">帐号</th>
								<td style="text-align: left;">
				                    <#if insertAction>
				                        <input type="text" name="username" id="username"  data-rule="帐号:required;username;length[4~20];remote[unique]">
				                    <#else >
				                        <input type="text" name="username" id="username" >
				                        ${e.username}
				                    </#if>
								</td>
							</tr>
							<tr>
								<th class="td_right">昵称</th>
								<td style="text-align: left;">
								<input type="text" name="nickname" id="nickname"  data-rule="昵称:required;nickname;length[2~20];remote[unique, id]"/>
									</td>
							</tr>
				
				                <tr>
				                    <th class="td_right">密码</th>
				                    <td style="text-align: left;"><input type="password" name="password" data-rule="密码:password;length[6~20];"
				                                                              id="password" />
				
				            <#if !insertAction> <br>(不输入表示不修改密码)</#if>
				                    </td>
				                </tr>
				                <tr>
				                    <th class="td_right">确认密码</th>
				                    <td style="text-align: left;"><input type="password" name="newpassword2" data-rule="确认密码:match(password)"
				                                                              id="newpassword2" />
				                    </td>
				                </tr>
							<tr>
								<th class="td_right">选择角色</th>
								<td style="text-align: left;">
				                    <select name="rid">
				                            <option > </option>
				                    </select>
								</td>
							</tr>
								
						</table>
				</form>
            </div>
            <!--------------------------------tap2 产品管理----------------------------->
            <div id="tabs-2">
            </div>
        </div>

</@page.pageBase>