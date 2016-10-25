<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">
<style type="text/css">
.product-name {
	display: inline-block;
	width: 250px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
/* 设置td内容超出宽度时隐藏超出部分的内容 */
#t_secure{
    table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */  
}  
#t_secure td{
    word-break:keep-all;/*不换行 */  
    white-space:nowrap;/* 不换行 */  
    overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */  
    text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:Rhidden;一起使用*/  
}  
</style>

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