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
	
$(function(){
 	$.each($(".pageLink"),function(a,oldHref){
		var newHref=oldHref.href+'&'+'uid='+$('input[name="uid"]').val();
		oldHref.href=newHref;
	}); 
	//删除cookies 
	var keys=document.cookie.match(/[^ =;]+(?=\=)/g); 
	if (keys) { 
		for (var i = keys.length; i--;){ 
			if((keys[i]=='cookieIDS')||(keys[i]=='oldIDS')){
				document.cookie=keys[i]+'=0;expires=' + new Date( 0).toUTCString()
			}
		}
	} 
})
//绑定
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
	<input type="hidden" name="uid" value=${uid}>
	<!----------------------------------------------按钮-------------------------------------------->
	<table class="table table-bordere d table-condensed">
			<tr><td >
		<span class="badge badge-info" style="font-size:20px">用户: ${userName}</span>	
						</td><td>	
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
					<th style="width:10%;text-align: center">产品代码（险种）</th>				
					<th style="width:15%;">产品名称</th>
					<th style="width:10%;">保额币种</th>
					<th style="width:15%;">保额合计</th>
					<th style="width:10%;">保费币种</th>	
					<th style="width:15%;">保费合计</th>	
					<th style="width:25%;">保险简介</th>
				</tr>
				 <#list pager.list as item>
	   			<tr>
		   			
				<td >&nbsp;${item.CProdNo!""}</td>									
					<td>&nbsp;${item.CProdName!""}</td>
					<td>
						<#assign map = {"01":'人民币',"02":'港币',"03":'美元',"04":'英镑',"12",'欧元'}>
					 <#list map?keys as key>
					  <#if item.NAmtRmbExch?? && item.NAmtRmbExch==key>
					  ${map[key]}
					  </#if>
					 </#list>
					</td>	
					<td>&nbsp;${item.NAmt!""}</td>
					<td>
					<#assign map = {"01":'人民币',"02":'港币',"03":'美元',"04":'英镑',"12",'欧元'}>
					 <#list map?keys as key>
					  <#if item.NPrmRmbExch?? && item.NPrmRmbExch==key>
					  ${map[key]}
					  </#if>
					 </#list>
					</td>	
					<td>&nbsp;${item.NPrm!""}</td>	
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