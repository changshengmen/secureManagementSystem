<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="产品详细信息">
<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" method="post">		
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">保险主产品基本信息</a></li>	
			<li><a href="#tabs-2">保险子产品基本信息</a></li>
			<!--<li><a href="#tabs-3">保险条款</a></li>-->				
			<!--<li><a href="#tabs-4">本地上传图片</a></li>-->	
		</ul>
		<!--------------------------主产品信息添加模块------------------------------------->		
		<div id="tabs-1">		
		 	<input type="hidden" value="${e.id!""}" name="id" label="id" id="id"/>
		 	<!--没有实际意义，去掉的话，点击下单按钮进入不到下一页面-->
		 	<input type="hidden"  value="${e.currency!""}" name="currency"  data-rule="币种;currency;" size="10" maxlength="10"
	                                                     id="currency" />
		 	<!----------------------------------------------商品列表-------------------------------------------->
			<table id="secureProductTable" class="table table-bordered table-condensed table-hover"style="text-align: center;">				
				<tr style="background-color: #dff0d8">
					<td style="display: none;">id</td>
					<th nowrap="nowrap">产品代码</th>
					<th style="width:20%;text-align: center">产品名称</th>
					<th style="width:10%;text-align: center">保费币种</th>
					<th style="width:20%;text-align: center">保费合计(元)</th>
					<th style="width:10%;text-align: center">保额币种</th>
					<th style="width:20%;text-align: center">保额合计(元)</th>
					<th style="width:20%;text-align: center">简介</th>					
				</tr>
	   			<tr>
					<td style="display: none;">${e.id!""}</td>	
					<td>${e.CProdNo!""}</td>
					<td>${e.CProdName!""}</td>
					<td>
						<#assign map = {"01":'人民币',"02":'港币',"03":'美元',"04":'英镑',"12",'欧元'}>
						 <#list map?keys as key>
						  <#if e.NPrmRmbExch?? && e.NPrmRmbExch==key>
						  ${map[key]}
						  </#if>
						 </#list>
					</td>
					<td>${e.NPrm!""}</td>
					<td>
						 <#assign map = {"01":'人民币',"02":'港币',"03":'美元',"04":'英镑',"12",'欧元'}>
						 <#list map?keys as key>
						  <#if e.NAmtRmbExch?? && e.NAmtRmbExch==key>
						  ${map[key]}
						  </#if>
						 </#list>	
					 </td>
					<td>${e.NAmt!""}</td>
					<td id="introduce"class="tipso" name="introduce" data-tipso="${e.introduce!""}">${e.introduce!""}</td>
				</tr>
			</table>
           </div>
            <!--------------------------主产品信息添加模块------------------------------------->
        <!--------------------------start子产品信息模块------------------------------------->
            <div id="tabs-2"> 
            	<table class="table table-bordered table-condensed table-hover" style="text-align: center;">                 
     				<tr style="background-color: #dff0d8">
	     				<th style="display: none;">id</th>
	     				<th style="width:15%;text-align: center">险别代码</th>
	     				<th style="width:15%;text-align: center">标的名称</th>
	     				<th style="width:15%;text-align: center">保费(元)</th> 
	     				<th style="width:15%;text-align: center">保额(元)</th>
	     				<th style="width:15%;text-align: center">费率(‰)</th>
	     				<th style="width:15%;text-align: center">累计赔偿限额</th>
	     				<th style="width:40%;text-align: center">保险金额的确定方式</th>	  
     				</tr>
        	        <#if e.secureProductDetailList?? && e.secureProductDetailList?size gt 0>
	                    <#list e.secureProductDetailList as item>
							<tr>
								<td style="display: none;"><input type="hidden" value="${item.id!""}" name="secureProductDetailList[${item_index}].id"/></td>
								<td>${e.secureProductDetailList[item_index].cvrgNo!""}</td>
								<td>${e.secureProductDetailList[item_index].subName!""}</td>
								<td>${e.secureProductDetailList[item_index].premium!""}</td>
								<td>${e.secureProductDetailList[item_index].amount!""}</td>
								<td>${e.secureProductDetailList[item_index].rate!""}</td>
								<td>${e.secureProductDetailList[item_index].NIndemLmt!""}</td>
								<td>
	                                <#assign map = {'0':'市场价值'}>	                             	                                    
	                                <#list map?keys as key>
	                                     <#if item.sure_way?? && item.sure_way==key>
	                                     	${map[key]}
	                                     </#if>	                                       
	                                </#list>                                
	                            </td>
							</tr>
	                    </#list>
				     </#if>
           		  </table>          	 	
			</div>	
            <!--------------------------end子产品信息模块------------------------------------->
		  
			<!--------------------------start-tabs-3------------------------------------->
			<!--<div id="tabs-3">
				${e.insuranceClause!""}
			</div>	
			-->			
			<!--------------------------end-tabs-3------------------------------------->		
			<!--------------------------start-tabs-4------------------------------------->
			<!--<div id="tabs-4">
					<div>
						<h4><div class="alert alert-info">图片列表</div></h4>
						<table class="table table-bordered">
						<tr id="firstTr" style="display:none">
							<td>
									<img name="img"  style="width:50px;height:50px;max-width: 50px;max-height: 50px;">								
							</td>
						</tr>
						<tr>
						<div id="fileQueue"></div> 
							<td>
	                            <input id="uploadify" name="uploadify" value="添加" class="btn btn-warning" type="button"/>
	                        </td>
						</tr>
						<tr>
							 <p>    
		                		<a href="javascript:$('#uploadify').uploadify('upload')">开始上传</a>     
		                		<a href="javascript:$('#uploadify').uploadify('cancel','*')">取消上传</a>    
	           				</p>              									
						</tr>
						
						</table>
					</div>
				</div>
				-->
			<!--------------------------end-tabs-4------------------------------------->	
																
		</div><!--end tab-->
			<!--------------------------操作按钮模块------------------------------------->
			<br>
			<#if e.id??>
			 	<a href="toPayPage?CProdNo=${e.CProdNo}&NAmt=${e.NAmt}&NPrm=${e.NPrm}&occPropFlag=${e.occPropFlag}" class="btn btn-success">下单</a>            
                <button method="selectList?init=y" class="btn btn-warning">
	                <i class="icon-ok icon-white"></i>返回
	        	</button>	
			
			</#if>
						
			<!--------------------------操作按钮模块------------------------------------->	
</form>
<script>
$(function() {
	$( "#tabs" ).tabs({
	});	
	$('.tipso').tipso({
		useTitle: false
	});
	//投保单号 缩短 显示
	cutIntroduce();
});
//投保单号 缩短 显示
function cutIntroduce(){	
	var introduce = $("#introduce").text();
	var len = introduce.length;
	var showContent = introduce.substring(0,20) + " ...";
	$("#introduce").html(showContent);
}
</script>

</@page.pageBase>