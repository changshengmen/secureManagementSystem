<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="产品详细信息">
<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
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
		</table>	
										
	</div><!--end tabs-->
		
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