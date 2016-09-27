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
<script type="text/javascript">
  //初始化将已绑定的产品check
	$(function(){
	 var ids = $("#repeatIds").val();
	 var arr = ids.split(',');
		 $.each(arr,function(a){
		 $("input[name='ids'][value="+arr[a]+"]").attr("checked",true);
		})
	})

  //模糊查询	
	function query(){
	  var qName = $("#name").val();
	  var _form = $("form");
		_form.attr("action","queryList?qName="+qName);
		_form.submit();
	}
	
	//绑定
	function bind(){
	 var ids =''	;
		$("input:checkbox[name='ids']:checked").each(function(i){ 
			ids += ','+ $(this).val();
		})
		var _form = $("form");
		_form.attr("action","bindUserProduct?ids="+ids);
		_form.submit();
	}
</script>

	<input id="repeatIds" value="${repeatIds!""}" type="hidden"/>
	<form action="${basepath}/manage/secureProduct" namespace="/manage" method="post" theme="simple">
		
		<table class="table table-bordered table-condensed">
		<td style="text-align:center;line-height:20px"><label>用户名  : ${userName}</label></td>
					<td  style="text-align: right;">商品名称</td>
						<td style="text-align: left;"  >
						<input type="text"  value="${e.name!""}" name="name"  class="input-small" id="name" />&nbsp;&nbsp;&nbsp;
						<button  class="btn btn-primary" onclick="query()">
							<i class="icon-search icon-white"></i> 查询
						</button>&nbsp;&nbsp;&nbsp;
						<button class="btn btn-primary"  onclick="bind()">
							<i class="icon-arrow-up icon-white"></i> 绑定
						</button>
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
				<th nowrap="nowrap">保险编号</th>
					<th>保险名称</th>
					<th>币种</th>
					<th>总保险金额</th>
					<th>总保险费</th>
					<th>保险简介</th>
			</tr>
            <#list productList as item>
				<tr>
					<td><input type="checkbox" name="ids" 
						value="${item.id!""}" /></td>
					<td nowrap="nowrap">&nbsp;${item.id!""}</td>	
					<td>&nbsp;${item.name!""}</td>
					<td>&nbsp;${item.currency!""}</td>
					<td>&nbsp;${item.amounts!""}</td>
					<td>&nbsp;${item.premiums!""}</td>
					<td>&nbsp;${item.introduce!""}</td>
				</tr>
            </#list>

			<tr>
				<td colspan="70" style="text-align: center;">
                    </td>
			</tr>
		</table>
		

	</form>
	

</@page.pageBase>