<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="产品详细信息">
<form action="${basepath}/manage/NvhlBase" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">订单详细信息</a></li>	
				
		</ul>
		<table class="table table-bordered table-condensed" style="margin-bottom:5px;" id="tableInfo">
			<tr>
           		 <td style="text-align: right;">机构代码</td>
           		 <td><input type="text" name="CDptCde" value="${base.CDptCde!""}" 
                                             id="CDptCde" />
           		 </td>
	        
           		 <td style="text-align: right;">流水号</td>
           		 <td><input type="text" name="serialNumber" value="${base.serialNumber!""}" 
                                             id="serialNumber" />
           		 </td>            		
	        </tr>
	        <tr>
           		 <td style="text-align: right;">支付申请号</td>
           		 <td><input type="text" name="CAppNo" value="${base.CAppNo!""}" 
                                             id="CAppNo" />
           		 </td>
	        
           		 <td style="text-align: right;">险种名称</td>
           		 <td><input type="text" name="CProdName" value="${base.CProdName!""}" 
                                             id="CProdName" />
           		 </td>            		
	        </tr>
	        <tr>
           		 <td style="text-align: right;">客户名称</td>
           		 <td><input type="text" name="cappnme" value="${base.appnme!""}" 
                                             id="appnme" />
           		 </td>
	        
           		 <td style="text-align: right;">业务员</td>
           		 <td><input type="text" name="cslsnme" value="${base.cslsnme!""}" 
                                             id="cslsnme" />
           		 </td>            		
	        </tr>
	        <tr>
           		 <td style="text-align: right;">支付时间</td>
           		 <td>
           		 	<input type="text" name="bankAcctDate" value="${base.bankAcctDate!""}"id="bankAcctDate" />
           		 </td>
	        
           		 <td style="text-align: right;">订单状态</td>
           		 <td>
					<#assign map = {"0":'保单落地',"1":'支付中',"2":'信息审核中',"3":"支付成功"}>
					<#list map?keys as key>
					  <#if base.status?? && base.status==key>
					  ${map[key]}
					  </#if>
					</#list>
				 </td>           		
	        </tr>
	        <tr>
           		 <td style="text-align: right;">投保起期</td>
           		 <td>
           		 	<input type="text" name="TInsrncBgnTm" value="${base.TInsrncBgnTm!""}"id="TInsrncBgnTm" />
           		 </td>	        
           		 <td style="text-align: right;">投保止期</td>           		 	
           		 <td>
           		 	<input type="text" name="TInsrncEndTm" value="${base.TInsrncEndTm!""}"id="TInsrncEndTm" />
           		 </td>            		
	        </tr>
		</table>	
										
	</div><!--end tabs-->
	<!--------------------------操作按钮模块------------------------------------->
	<br>
   		<a href="selectList"class="btn btn-warning">返回</a>  		
	<!--------------------------操作按钮模块------------------------------------->
</form>
<script>
$(function() {
	$( "#tabs" ).tabs({
	});	
	
	selectDefaultCatalog();
});

function selectDefaultCatalog(){
	var _catalogID = $("#catalogID").val();
	if(_catalogID!='' && _catalogID>0){
		//$("#catalogSelect").attr("value",_catalogID);
		$("#catalogSelect").val(_catalogID);
	}
}

</script>

</@page.pageBase>