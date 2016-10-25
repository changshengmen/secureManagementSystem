<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">


	<form action="${basepath}/manage/nvhlApplicantVO" method="post" theme="simple">		
		
				
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th>险种名称</th>
				<th>产品代码</th>
				<th>投保企业</th>
			</tr>
			<#list pager.list as a>
				<tr>
					<td>${a.id}</td>
					<td>${a.updatetime!""}</td>
					<td>${a.ClntMrk!""}</td>
			</tr>
			</#list>
			<tr>
				<td colspan="55" style="text-align: center;">
					<#include "/manage/system/pager.ftl"/></td>
			</tr>
		</table>
	</form>

</@page.pageBase>