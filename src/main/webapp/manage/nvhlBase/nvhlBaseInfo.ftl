<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="产品详细信息">
<form action="${basepath}/manage/NvhlBase" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
	<div id="tabs">
		<span id="showErrM"></span> 
		<ul>
			<li><a href="#tabs-1">订单详细信息</a></li>	
				
		</ul>
		<table class="table table-bordered table-condensed" style="margin-bottom:5px;" id="tableInfo">
			<tr>
			 	 <td style="text-align: right;">投保单号</td>
           		 <td>${base.CAppNo!""}
           		 </td>
           		
           		 <td style="text-align: right;">保单号</td>
           		 <td>${base.policyNo!""}
           		 </td>	        
           		          		
	        </tr>
	        <tr>
	         	 <td style="text-align: right;">支付申请号</td>
           		 <td>${base.payNo!""}
           		 </td>
           		 
           		 	        
           		 <td style="text-align: right;">险种名称</td>
           		 <td>${base.CProdName!""}
           		 </td>
           		
           		         		
	        </tr>
	         <tr>
	          <td style="text-align: right;">投保企业</td>
           		 <td>${base.appNme!""}
           		 </td>
	          	<td style="text-align: right;">被保企业</td>
           		 <td>${base.insuredNme!""}
           		 </td>  
           		          		
	        </tr>
	        <tr>
	         	  <td style="text-align: right;">保额(元)</td>
           		 <td>${base.NAmt!""}
           		 </td>
	        
           		 <td style="text-align: right;">保费(元)</td>
           		 <td>${base.NPrm!""}
           		 </td>  
					        
           		             		
	        </tr>
	        <tr>	        
           		 <td style="text-align: right;">订单状态</td>
           		 <td>
					<#assign map = {"0":'支付成功',"1":'支付中',"2":'信息审核中',"3":"保单落地失败","4":"保单落地","5":"核保通过"}>
					<#list map?keys as key>
					  <#if base.status?? && base.status==key>
					  ${map[key]}
					  </#if>
					</#list>
				 </td>   
				 <td style="text-align: right;">支付时间</td>
           		 <td name="timeManage">
           		 	${base.bankAcctDate!""}
           		 </td>        		
	        </tr>
	        <tr>
           		 <td style="text-align: right;">投保起期</td>
           		 <td name="timeManage">
           		 	${base.TInsrncBgnTm!""}
           		 </td>	        
           		 <td style="text-align: right;">投保止期</td>           		 	
           		 <td name="timeManage">
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
	/*获取保单状态返回信息 页面显示 start-----------------*/
	var href = window.location.href;
	var msg = '';
	var indexNum = href.indexOf('msg');
	if(indexNum > 0){	
		msg = href.split('&')[1].split('=')[1];//拆分url得到”=”后面的参数 
		var htmlStr='<div class="alert alert-success alert-dismissable fade in" id="alert-success"><label id="msgBtn"></label></div>';
		$('#showErrM').html(htmlStr);
		$("#msgBtn").html(decodeURI(msg)); 
	}
	/*获取保单状态返回信息 页面显示 end---------------*/
	$( "#tabs" ).tabs({
	});	
	//格式化支付时间  投保起期 投保止期
		formatTime();
});


function formatTime(){
	$('td[name="timeManage"]').each(function(){
		var startTime=$(this).html().trim();
			if(startTime.length!=0){
				var newStartTime = startTime.substring(0,4)+'-'+startTime.substring(4,6)+'-'+startTime.substring(6,8)
 					+' '+startTime.substring(8,10)+':'+startTime.substring(10,12)+':'+startTime.substring(12,14);
 				$(this).html(newStartTime);
			}
	});
}

</script>

</@page.pageBase>