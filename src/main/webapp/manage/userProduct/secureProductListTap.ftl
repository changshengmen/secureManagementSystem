<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="用户产品">
<script type="text/javascript" src="${basepath}/manage/manage.js"></script>
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
	<script type="text/javascript">
	//删除cookies
$(function(){ 
debugger;
	var keys=document.cookie.match(/[^ =;]+(?=\=)/g); 
	if (keys) { 
		for (var i = keys.length; i--;){ 
			if((keys[i]=='cookieIDS')||(keys[i]=='oldIDS')){
				document.cookie=keys[i]+'=0;expires=' + new Date( 0).toUTCString()
			}
		}
	} 
})
	function bindProduct(){
		var obj = $("#bd");
		var ids =$("td[name='itemId']");
		var param ='';
		$.each(ids,function(a){
		  param += ","+ ids[a].innerHTML;
		})
	 	var _form = $("form");
		_form.attr("action",$(obj).attr("method")+"?ids="+param);
		_form.submit();
	}
	
	</script>
	<form action="${basepath}/manage/secureProduct" namespace="/manage" method="post" theme="simple">
	
	<!----------------------------------------------按钮-------------------------------------------->
	<table class="table table-bordere d table-condensed">
			<tr><td >
		<span class="badge badge-info" style="font-size:20px">用户: ${userName}</span>					</td><td>	
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
					<button method="getAllProduct" class="btn btn-primary" id="bd" onclick="bindProduct()">
							<i class="icon-arrow-up icon-white"></i> 绑定产品
						</button>
					<button class="btn btn-warning"  onclick="javascript:history.back(-1);">
							<i class="icon-arrow-up icon-white"></i> 返回
						</button>
					</div>
				</td>
			</tr>
		</table>
	<!----------------------------------------------商品列表-------------------------------------------->
		<table class="table table-bordered table-condensed table-hover">
				<tr style="background-color: #dff0d8">
					<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
					<th nowrap="nowrap">保险编号</th>
					<th>保险名称</th>
					<th>币种</th>
					<th>总保险金额</th>
					<th>总保险费</th>
					<th>保险简介</th>
				</tr>
				 <#list pager.list as item>
	   			<tr>
					<td><input type="checkbox" name="id" value="${item.id!""}" /></td>
					<td nowrap="nowrap" name="itemId">${item.id!""}</td>	
					<td>&nbsp;${item.name!""}</td>
					<td>&nbsp;${item.currency!""}</td>
					<td>&nbsp;${item.amounts!""}</td>
					<td>&nbsp;${item.premiums!""}</td>
					<td>&nbsp;${item.introduce!""}</td>
				</tr>
				</#list>
				<tr>
					<td colspan="70" style="text-align: center;">
                    <#include "/manage/system/pager.ftl"/></td>
			</tr>
		</table>
	</form>
	
</@page.pageBase>