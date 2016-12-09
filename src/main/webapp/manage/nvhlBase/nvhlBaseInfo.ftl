<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="产品详细信息">
<form action="${basepath}/manage/NvhlBase" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">订单详细信息</a></li>	
				
		</ul>
		<table class="table table-bordered table-condensed" style="margin-bottom:5px;" id="tableInfo">
			<tr>
           		 <td style="text-align: right;">支付申请号</td>
           		 <td>${base.payNo!""}
           		 </td>	        
           		 <td style="text-align: right;">流水号</td>
           		 <td>${base.serialNumber!""}
           		 </td>            		
	        </tr>
	        <tr>
	        
	         <td style="text-align: right;">投保单号</td>
           		 <td>${base.CAppNo!""}
           		 </td>
           		 <td style="text-align: right;">险种名称</td>
           		 <td>${base.CProdName!""}
           		 </td>
           		
           		         		
	        </tr>
	         <tr>
	          <td style="text-align: right;">投保企业</td>
           		 <td>${base.appNme!""}
           		 </td>
	          	<td style="text-align: right;">被保人名称</td>
           		 <td>${base.insuredNme!""}
           		 </td>  
           		          		
	        </tr>
	        <tr>
	         	  <td style="text-align: right;">保额</td>
           		 <td>${base.NAmt!""}
           		 </td>
	        
           		 <td style="text-align: right;">保费</td>
           		 <td>${base.NPrm!""}
           		 </td>  
					        
           		             		
	        </tr>
	        <tr>	        
           		 <td style="text-align: right;">订单状态</td>
           		 <td>
					<#assign map = {"0":'保单落地',"1":'支付中',"2":'信息审核中',"3":"支付成功"}>
					<#list map?keys as key>
					  <#if base.status?? && base.status==key>
					  ${map[key]}
					  </#if>
					</#list>
				 </td>   
				 <td style="text-align: right;">支付时间</td>
           		 <td>
           		 	${base.bankAcctDate!""}
           		 </td>        		
	        </tr>
	        <tr>
           		 <td style="text-align: right;">投保起期</td>
           		 <td>
           		 	${base.TInsrncBgnTm!""}
           		 </td>	        
           		 <td style="text-align: right;">投保止期</td>           		 	
           		 <td>
           		 	${base.TInsrncEndTm!""}
           		 </td>            		
	        </tr>
	        <tr>
	        	<td style="text-align: right;">业务员</td>
           		 <td colspan="3">${base.CSlsNme!""}
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