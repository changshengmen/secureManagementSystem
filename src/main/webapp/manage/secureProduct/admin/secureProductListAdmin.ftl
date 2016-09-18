<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="商品管理">
<style type="text/css">
.product-name {
	display: inline-block;
	width: 250px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
</style>

	<form action="${basepath}/manage/secureProduct" namespace="/manage" method="post" theme="simple">
		
		<table class="table table-bordered table-condensed">
			<tr>
			
				<!--
				<td style="text-align: right;">商品编号</td>
				<td style="text-align: left;"><input type="text"  value="${e.id!""}" name="id"  class="search-query input-small"
						id="id" /></td>
				-->
				<td style="text-align: right;">商品名称</td>
				<td style="text-align: left;" ><input type="text"  value="${e.name!""}" name="name"  class="input-small"
						id="name" /></td>	
				<td style="text-align: right;">录入时间</td>
				<td style="text-align: left;" ><input type="text"  value="${e.createtime!""}" name="createtime"  class="input-small"
						id="createtime" /></td>
			</tr>
			<tr>
				<td style="text-align: right;">
					险种
				</td>
				<td>
					<select onchange="catalogChange(this)" name="catalogID" id="catalogID" class="input-medium">
						<option></option>
                        <#list catalogs as item>
							<option pid="0" value="${item.id!""}"><font color='red'>${item.name!""}</font></option>
                            <#if item.children??>
                                <#list item.children as item>
								    <option value="${item.id!""}">&nbsp;&nbsp;&nbsp;&nbsp;${item.name!""}</option>
                                </#list>
                            </#if>
                        </#list>
					</select>
				</td>	
					
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

		<table class="table table-bordered table-condensed table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th nowrap="nowrap">商品编号</th>
				
				<th>名称</th>
				<th>定价</th>
				<th>产品简介</th>
				<th>录入日期</th>
				<th>险种</th>
				<th>状态</th>
				<th>备注</th>
				<th width="60">操作</th>
			</tr>
            <#list pager.list as item>
				<tr>
					<td><input type="checkbox" name="ids"
						value="${item.id!""}" /></td>
					<td nowrap="nowrap">&nbsp;${item.id!""}</td>	
					
					
					<td>&nbsp;${item.name!""}</td>
					<td>&nbsp;${item.price!""}</td>
					<td>&nbsp;${item.introduce!""}</td>
					<td>&nbsp;${item.createtime!""}</td>
					
					<td>&nbsp;${item.catalogID!""}</td>
			
					<td>&nbsp;
						<#if item.status??&&item.status==1>
							<img alt="已上架" src="${basepath}/resource/images/action_check.gif">
						
						<#elseif item.status??&&item.status==2>
							<img alt="已下架" src="${basepath}/resource/images/action_delete.gif">
						</#if>
					</td>
					
					<td>&nbsp;
						${item.remark!""}
					</td>
					<td ><a href="toEdit?id=${item.id}">编辑</a>|
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
	
<script type="text/javascript">
function catalogChange(obj){
	var _pid = $(obj).find("option:selected").attr("pid");
	if(_pid==0){
		alert("不能选择大类!");
		$(obj).val("");
		return false;
	}	
}
</script>
</@page.pageBase>