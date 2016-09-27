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
    text-overflow:ellipsis;/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*/  
}  
</style>
	<form action="${basepath}/manage/secureProduct" namespace="/manage" method="post" theme="simple">
		
		<table class="table table-bordered table-condensed">
			<tr>

				<td style="text-align: right;">商品编号</td>
				<td style="text-align: left;"><input type="text"  value="${e.id!""}" name="id"  class="search-query input-small"
						id="id" /></td>

				<td style="text-align: right;">商品名称</td>
				<td style="text-align: left;" ><input type="text"  value="${e.name!""}" name="name"  class="input-small"
						id="name" /></td>	
				
			</tr>
			<tr>
				<td style="text-align: right;">录入时间</td>
				<td style="text-align: left;" ><input type="text"  value="${e.createtime!""}" name="createtime"  class="input-small"
						id="createtime" /></td>
					
				<td style="text-align: right;">状态</td>
				<td style="text-align: left;">
                    <#assign map = {"0":'全部',"1":'已上架',"2":'已下架'}>
                    <select id="status" name="status" class="input-medium">
                        <#list map?keys as key>
                            <option value="${key}" <#if e.status?? && e.status==key?eval>selected="selected" </#if>>${map[key]}</option>
                        </#list>
				</td>						
			</tr>
			<tr>
				<td colspan="20">
                    <#if checkPrivilege("secureProduct/selectList")>
						<button method="selectList" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
                    </#if>

                     <#if checkPrivilege("secureProduct/toAdd")>
						<a href="toAdd" class="btn btn-success">
							<i class="icon-plus-sign icon-white"></i> 添加
						</a>
                     </#if>

                    <#if checkPrivilege("secureProduct/deletes")>
						<button method="deletes" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的记录?');">
							<i class="icon-remove-sign icon-white"></i> 删除
						</button>
                    </#if>

                    <#if checkPrivilege("secureProduct/updateUp")>
<!-- 							<i class="icon-arrow-up icon-white"></i> 上架 -->
						<button method="updateUp" class="btn btn-warning" onclick="return submitIDs(this,'确定上架选择的记录?');">
							<i class="icon-arrow-up icon-white"></i> 上架
						</button>
                    </#if>
                    <#if checkPrivilege("secureProduct/updateDown")>
						<button method="updateDown" class="btn btn-warning" onclick="return submitIDs(this,'确定下架选择的记录?');">
							<i class="icon-arrow-down icon-white"></i> 下架
						</button>
                    </#if>

				</td>
			</tr>
		</table>

		<table id="t_secure" class="table table-bordered table-condensed table-hover" style="text-align: center;">
			<tr style="background-color: #dff0d8">
				<th style="width:5%;text-align: center"><input type="checkbox" id="firstCheckbox" /></th>
				<th style="width:10%;text-align: center">保险编号</th>				
				<th style="width:10%;text-align: center">保险名称</th>
				<th style="width:10%;text-align: center">币种</th>
				<th style="width:15%;text-align: center">总保险金额</th>
				<th style="width:15%;text-align: center">总保险费</th>	
				<th style="width:20%;text-align: center">保险简介</th>					
				<th style="width:5%">状态</th>				
				<th style="width:10%;text-align: center">操作</th>
			</tr>
            <#list pager.list as item>
				<tr>
					<td><input type="checkbox" name="ids"
						value="${item.id!""}" /></td>
					<td >&nbsp;${item.id!""}</td>									
					<td>&nbsp;${item.name!""}</td>
					<td>&nbsp;${item.currency!""}</td>	
					<td>&nbsp;${item.amounts!""}</td>
					<td>&nbsp;${item.premiums!""}</td>	
					<td>&nbsp;${item.introduce!""}</td>			
					<td>&nbsp;
						<#if item.status??&&item.status==1>
							<img alt="已上架" src="${basepath}/resource/images/action_check.gif">
						
						<#elseif item.status??&&item.status==2>
							<img alt="已下架" src="${basepath}/resource/images/action_delete.gif">
						</#if>
					</td>
					<td >
						<a href="toEditProduct?id=${item.id}">编辑</a>|
					
						<a href="toOrder?id=${item.id}">查看</a>
					</td>
				</tr>
            </#list>

			<tr>
				<td colspan="70" style="text-align: center;">
                    <#include "/manage/system/pager.ftl"/></td>
			</tr>
		</table>
		
		<div class="alert alert-info" style="text-align: left;font-size: 14px;margin: 2px 0px;">
			图标含义：<BR>
			
			<img alt="已上架" src="${basepath}/resource/images/action_check.gif">：商品已上架
			<img alt="已下架" src="${basepath}/resource/images/action_delete.gif">：商品已下架
		</div>

	</form>
</@page.pageBase>