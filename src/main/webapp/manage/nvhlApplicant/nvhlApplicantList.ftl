<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="客户信息">
<form action="${basepath}/manage/nvhlApplicantVO" method="post" theme="simple">		
	<table class="table table-bordered table-condensed">
		<tr>				
			<td style="text-align: right;">企业名称</td>
			<td style="text-align: left;" ><input type="text" name="appNme"  class="input-small"
					id="appNme" /></td>
			<td style="text-align: right;">通讯地址</td>
			<td style="text-align: left;"><input type="text" name="clntAddr"  class="search-query input-small"
					id="clntAddr" /></td>					
		</tr>
		<!--------------------------------------------------------	<tr>
			<td style="text-align: right;">录入时间</td>
			<td style="text-align: left;">
				<input id="d4311" type="text" name="startDate"
				value="${e.startDate!""}"
				onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
				~ 
				<input id="d4312" type="text" name="endDate"
				value="${e.endDate!""}"
				onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
			</td>				
			<td style="text-align: right;">状态</td>
			<td style="text-align: left;">
                <#assign map = {"0":'全部',"1":'已上架',"2":'已下架'}>
                <select id="status" name="status" class="input-medium">
                    <#list map?keys as key>
                        <option value="${key}" <#if e.status?? && e.status==key?eval>selected="selected" </#if>>${map[key]}</option>
                    </#list>
                 </select>
			</td>						
		</tr>---------------------------------------------------------------->
		<tr>
			<td colspan="20">                    
				<button method="selectList" class="btn btn-primary" onclick="selectList(this)">
					<i class="icon-search icon-white"></i> 查询
				</button>
			</td>
		</tr>
	</table>
	<table id="t_secure" class="table table-bordered table-condensed table-hover" style="text-align: center;">
		<tr style="background-color: #dff0d8">
			<th style="text-align: center">企业代码</th>		
			<th style="text-align: center">企业名称</th>				
			<th style="text-align: center">证件类型</th>
			<th style="text-align: center">证件号码</th>
			
			<!--<th style="text-align: center">通讯地址</th>
			<th style="text-align: center">邮箱</th>
			<th style="text-align: center">手机</th>	-->				
			
			<th style="text-align: center">操作</th>													
		</tr>
        <#list pager.list as item>
			<tr>
				<td >&nbsp;${item.appCde!""}</td>									
				<td >&nbsp;${item.appNme!""}</td>									
				
				<td>
					 <#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
					 <#list map?keys as key>
					  <#if item.certfCls?? && item.certfCls==key>
					  ${map[key]}
					  </#if>
					 </#list>										
				</td>	
				<td>&nbsp;${item.certfCde!""}</td>						
				<!--<td>&nbsp;${item.clntAddr!""}</td>			
				<td >&nbsp;${item.email!""}</td>									
				<td>&nbsp;${item.mobile!""}</td>-->															
				<td >
					<a class="application" href="toEdit?id=${item.id}">编辑</a> |						
					<a href="selectApplicationInfo?id=${item.id!""}"> 查看客户 |</a>	
					<a href="selectSecureProduct?appCde=${item.appCde}"> 查看订单</a>
				</td>			
			</tr>
        </#list>
		<tr>
			<td colspan="70" style="text-align: center;">
                <#include "/manage/system/pager.ftl"/>
            </td>
		</tr>
	</table>
</form>
<script>
$(function(){
	hideCheckbox();
});

//判断当前登陆者不是admin就隐藏。$("#currentUserID")此控件在pageBase.ftl中
function hideCheckbox(){
	if($("#currentUserID").val()!=1){
		$(".application").hide();
	}
}
</script>
</@page.pageBase>