<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="所有产品列表">
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
 <script type="text/javascript" src="${basepath}/resource/js/jquery.cookie.js"></script>
<script type="text/javascript">
  //初始化将已绑定的产品check
$(function(){
debugger;
	var ids = $("#repeatIds").val();
	//alert(document.cookie.indexOf("oldIDS="));
	//alert(document.cookie.match(/[^ =;]+(?=\=)/g)[0]); 
	//alert($.cookie('oldIDS'));
	//alert(document.cookie.indexOf("cookieIDS="));
	//alert($.cookie('cookieIDS'));
	if(document.cookie.indexOf("oldIDS=")==-1){
	//初始化保存ids
		$.cookie('oldIDS',ids);
	}
	else{	
		if(document.cookie.indexOf("cookieIDS=")!=-1){
		//还原修改的ids
			ids=$.cookie('cookieIDS');
		}else{
		//还原原始ids
			ids=$.cookie('oldIDS');
		}
	}	
	//新建cookies,保存修改的ids
	$.cookie('cookieIDS',ids); 
   if(!ids==""){
	   var arr = ids.split(',');
	   $.each(arr,function(a){
		  $("input[name='ids'][value="+arr[a]+"]").attr("checked",true);
	   });  
   } 
    $(".pageLink").bind("click",function(){
   		ids=saveIDS(ids);
   		$.cookie('cookieIDS',ids);
	});   
})
//保存ids到cookies中
function saveIDS(ids){
	var id_len=$("input[name='ids']").length;
	if(!ids==""){
	//如果ids开始的时候不是空，没选中就删，选中就判断是否有重复，没重复就加。
		var ids_arr = ids.split(',');
		for(var i=0;i<id_len;i++){
			var id_value=$("input[name='ids']")[i].value;
			var is_checked=$("input[name='ids']")[i].checked;	
			if(is_checked&&(jQuery.inArray( id_value,ids_arr)<0)){
				ids=ids+","+id_value;
			}else{
				if(jQuery.inArray( id_value,ids_arr)>=0&&(!is_checked)){
					ids_arr.splice(jQuery.inArray(id_value,ids_arr),1);
					ids=ids_arr.join(",");
				}
			}
		}
	}
	else{
	//如果ids开始的时候就是空，直接判断添加ids
		for(var i=0;i<id_len;i++){
			var id_value=$("input[name='ids']")[i].value;
			var is_checked=$("input[name='ids']")[i].checked;	
			if(is_checked){
				if(!ids==""){
					ids=ids+","+id_value;
				}else{
					ids=id_value;
				}				
			}
		}
	}	
	return ids;
}

//绑定
function bind(){
	ids=$.cookie('cookieIDS');
	ids=saveIDS(ids);
	var oldIDS='oldIDS';
	var cookieIDS='cookieIDS';
	clearCookie(oldIDS);
	clearCookie(cookieIDS);
	var _form = $("form");
	_form.attr("action","bindUserProduct?ids="+ids);
	_form.submit();
}
//删除cookies
function clearCookie(name){ 
	var keys=document.cookie.match(/[^ =;]+(?=\=)/g); 
	if (keys) { 
		for (var i = keys.length; i--;){ 
			if(keys[i]==name){
				document.cookie=keys[i]+'=0;expires=' + new Date( 0).toUTCString()
			}
		}
	} 
}
</script>

	<input id="repeatIds" value="${repeatIds!""}" type="hidden"/>
	<form action="${basepath}/manage/secureProduct" namespace="/manage" method="post" theme="simple">
		
		<table class="table table-bordered table-condensed">
		
					<td  style="text-align: right;line-height:35px;font-weight:bold">产品名称</td>
						<td style="text-align: left;"  >
						<input type="text"  value="${e.CProdName!""}" name="CProdName"  class="input-small" id="CProdName" />&nbsp;&nbsp;&nbsp;
						<button method="getAllProduct" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
						</button>&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary"  onclick="bind()" >
							<i class="icon-arrow-up icon-white"></i> 绑定
						</button>
						<label style="font-size:20">&nbsp;到用户&nbsp;【&nbsp;<label style="color:red">${userName}</label>&nbsp;】</label>
						</td>	
					
				
						<td>
				 		<button class="btn btn-warning"  onclick="javascript:history.back(-1);" style="align:center">
							<i class="icon-arrow-up icon-white"></i> 返回
						</button>
					</td>	
			</tr>
		</table>

		<table class="table table-bordered table-condensed table-hover">
			<tr style="background-color: #dff0d8">
				<th width="20"><input type="checkbox" id="firstCheckbox" /></th>
				<th style="width:10%;">产品代码（险种）</th>				
				<th style="width:15%;">产品名称</th>
				<th style="width:10%;">保额币种</th>
				<th style="width:15%;">保额合计</th>
				<th style="width:10%;">保费币种</th>	
				<th style="width:15%;">保费合计</th>
				<th style="width:25%;">简介</th>		
			</tr>
           <#list pager.list as item>
				<tr>
					<td><input type="checkbox" name="ids" 
						value="${item.id!""}" /></td>
					<td >&nbsp;${item.CProdNo!""}</td>									
					<td>&nbsp;${item.CProdName!""}</td>
					<td>&nbsp;${item.NAmtRmbExch!""}</td>	
					<td>&nbsp;${item.NAmt!""}</td>
					<td>&nbsp;${item.NPrmRmbExch!""}</td>	
					<td>&nbsp;${item.NPrm!""}</td>	
					<td>&nbsp;${item.introduce!""}</td>
				</tr>
            </#list>

			<tr>
				<td colspan="70" style="text-align: center;">
                    </td>
			</tr>
			<tr>
				<td colspan="70" style="text-align: center;">
                    <#include "/manage/system/pager.ftl"/></td>
			</tr>
		</table>
		

	</form>
	

</@page.pageBase>