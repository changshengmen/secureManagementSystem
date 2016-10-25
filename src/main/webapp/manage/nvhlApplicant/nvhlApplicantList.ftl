<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">


	<form action="${basepath}/manage/nvhlApplicantVO" namespace="/manage" method="post" theme="simple">		
		 <table class="table table-bordered table-condensed table-hover">
	 
			<tr>
				<td style="text-align: right;">产品代码</td>
				<td style="text-align: left;"><input type="text" name="AppCde"  class="search-query input-small"
						id="CProdNo" /></td>
				<td style="text-align: right;">产品名称</td>
				<td style="text-align: left;" ><input type="text" name="AppNme"  class="input-small"
						id="CProdName" /></td>					
			</tr>
			
		<tr style="background-color: #dff0d8">
				<td style="text-align: right;">投保企业代码</td>
		</tr>
		
		 <#list pager.list as item>	
	 
			<tr>
   			<td>&nbsp;${item.AppCde!""}</td>
   			<td>&nbsp;${item.CertfCls!""}</td>
    		</tr>
      	 </#list>

			<tr>
				<td colspan="70" style="text-align: center;">
                    <#include "/manage/system/pager.ftl"/></td>
			</tr>
			
       </table>
	</form>

</@page.pageBase>