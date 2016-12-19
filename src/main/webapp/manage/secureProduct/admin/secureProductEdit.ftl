<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="产品信息">
<script>
$(function() {

	$( "#tabs" ).tabs({
	});
	$("#addRow").click(function(){
		addRow();
	});
	$("#delRow").click(function(){
		delRow();
	});
	hideCheckbox();	
});
//判断当前登陆者不是admin就隐藏。$("#currentUserID")此控件在pageBase.ftl中
function hideCheckbox(){
	if($("#currentUserID").val()!=1){
		$(".checkboxTh").hide();
		$(".toEditProduct").hide();
	}
}
//减行 
function delRow(){
	if(${e.secureProductDetailList?size}>0){
		if($("#subProductList tr").size()>(${e.secureProductDetailList?size}+2)){
			$("#subProductList tr").eq(-1).remove();
		}
	}else{
		if($("#subProductList tr").size()>2){		
			$("#subProductList tr").eq(-1).remove();
		}
	}
	
} 
//加行
function addRow(){
	var count = $("#subProductList tr").size()-2;
	var tr="<tr>"
	var cvrgNoTd = "<td><input type='text' name='secureProductDetailList["+count+"].cvrgNo'class='search-query form-control input-small'data-rule='险别代码;required;cvrgNo'maxlength='40'/></td>"						
	var subNameTd="<td><input type='text' name='secureProductDetailList["+count+"].subName'class='search-query form-control input-small'maxlength='40'/></td>"	
	var	premiumTd="<td><input type='text' name='secureProductDetailList["+count+"].premium'class='search-query form-control input-small'data-rule='保费;required;integer;premium;'maxlength='9'/></td>"
	var amountTd="<td><input type='text' name='secureProductDetailList["+count+"].amount'class='search-query form-control input-small'data-rule='保额;required;integer;premium;length[1~10];'maxlength='9'/></td>"
	var rateTd="<td><input type='text' name='secureProductDetailList["+count+"].rate'class='search-query form-control input-small'data-rule='费率;required;double;rate;'maxlength='9'/></td>"
	var NIndemLmt="<td><input type='text' name='secureProductDetailList["+count+"].NIndemLmt'class='search-query form-control input-small'maxlength='9'/></td>"
	var	wayTd="<td><select id='sure_way' name='secureProductDetailList["+count+"].sure_way'class='search-query form-control input-medium'><option value='0'>市场价值</option></select></td></tr>"	
	var checkBoxTd="<td><input type='checkbox' name='ids'/></td>";
	if(${e.secureProductDetailList?size}>0){
		var trHtml=tr+checkBoxTd+cvrgNoTd+subNameTd+premiumTd+amountTd+rateTd+NIndemLmt+wayTd;	
	
	}else{
		var trHtml=tr+cvrgNoTd+subNameTd+premiumTd+amountTd+rateTd+NIndemLmt+wayTd;	
	
	}
	$("#subProductList").append(trHtml);	
}
</script>

<form action="${basepath}/manage/secureProduct"  namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">保险主产品基本信息</a></li>	
			<li><a href="#tabs-2">保险子产品基本信息</a></li>
		<!--	<li><a href="#tabs-3">保险条款</a></li>		-->		
			<!--<li><a href="#tabs-4">本地上传图片</a></li>-->	
		</ul>
		<!--------------------------主产品信息添加模块------------------------------------->		
		<div id="tabs-1">
		 	<input type="hidden" value="${e.id!""}" name="id" label="id" id="id"/>
			<div class="row form-horizontal"-role="form">
				  <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">产品代码</label>
	                        <div class="col-md-8">
	                        	<input type="text"  value="${e.CProdNo!""}" name="CProdNo"
	                          	data-rule="产品编号;required;CProdNo;"  maxlength="40"id="CProdNo" />
	                        </div>
	              </div>
			  	  <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">产品名称</label>
	                        <div class="col-md-8">
		                        <input type="text"  value="${e.CProdName!""}" name="CProdName"
		                          data-rule="产品名称;required;CProdName;"  maxlength="40"id="CProdName" />
	                        </div>
	              </div>
	               <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">保费币种</label>
	                         <#assign map = {"01":'人民币',"02":'港币',"03":'美元',"04":'英镑',"12",'欧元'}>
	                         <select id="NAmtRmbExch" name="NPrmRmbExch" class="input-medium" style="margin-left:16px;">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if e.NPrmRmbExch?? && e.NPrmRmbExch==key>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                     		</select>
	                      <!--  <div class="col-md-8"><input type="text"  value="${e.NPrmRmbExch!""}" name="NPrmRmbExch"  data-rule="总保险费;required;NPrmRmbExch;" size="10" maxlength="10"
	                                                     id="NPrmRmbExch" />
	                        </div>-->
	              </div>
	               <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">保费合计</label>
	                        <div class="col-md-8"><input type="text"   value="${e.NPrm!""}" name="NPrm"  data-rule="总保险费;required;integer;NPrm;"  maxlength="9"
	                                                     id="NPrm" />
	                        </div>
	              </div>
	               <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">保额币种</label>
	                        <#assign map = {"01":'人民币',"02":'港币',"03":'美元',"04":'英镑',"12",'欧元'}>
	                         <select id="NAmtRmbExch" name="NAmtRmbExch" class="input-medium" style="margin-left:16px;">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if e.NAmtRmbExch?? && e.NAmtRmbExch==key>selected="selected"</#if>>${map[key]}</option>
                        		</#list>
                     		</select>
	                      <!--  <div class="col-md-8"><input type="text"  value="${e.NAmtRmbExch!""}" name="NAmtRmbExch"  data-rule="币种（默认值RMB）;required;NAmtRmbExch;"  maxlength="10"
	                                                     id="NAmtRmbExch" />
	                        </div>-->
	              </div>
	               <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">保额合计</label>
	                        <div class="col-md-8"><input type="text" value="${e.NAmt!""}"   name="NAmt"  data-rule="总保险金额;required;integer;NAmt;"  maxlength="9"
	                                                     id="NAmt" />
	                        </div>
	              </div>
	
	                <div class="form-group col-md-12">
	                        <label class="col-md-2 control-label">产品简介</label>
	                        <div class="col-md-10">
								<textarea name="introduce" class="form-control" rows="3" id="introduce"
										  data-rule="产品简介;introduce;length[4~500];">${e.introduce!""}</textarea>
	                        </div>
	               </div>
	               
	            </div>
            </div>
            <!--------------------------主产品信息添加模块------------------------------------->
            <!--------------------------start子产品信息添加模块------------------------------------->
            <div id="tabs-2"> 
            	<table id="subProductList" class="table table-bordered table-condensed table-hover" style="text-align:center;"> 
            	<tr>          	
            	<img src="${systemSetting().www}/resource/images/maximize.png" onclick="addRow()"/>
            	<img src="${systemSetting().www}/resource/images/minimize.png" onclick="delRow()"/>
	             </br>
            	</tr>                
     				<tr>
     				<#if e.secureProductDetailList?? && e.secureProductDetailList?size gt 0>
     				<th style="text-align: center;"><input type="checkbox" id="firstCheckbox" /></th>
     				</#if>
     				<td style="display: none;">id</th>
     				<th style="text-align: center;">险别代码</th>
     				<th style="text-align: center;">标的名称</th>
     				<th style="text-align: center;">保费(元)</th> 
     				<th style="text-align: center;">保额(元)</th>
     				<th style="text-align: center;">费率(‰)</th>
     				<th style="text-align: center;">累计赔偿限额</th>	
     				<th style="text-align: center;">确定方式</th>	
     				</tr>
        	        <#if e.secureProductDetailList?? && e.secureProductDetailList?size gt 0>
	                    <#list e.secureProductDetailList as item>
							<tr>
							<td><input type="checkbox" name="ids" value="${e.secureProductDetailList[item_index].id!""}" /></td>
								<td style="display: none;"><input type="hidden" value="${e.secureProductDetailList[item_index].id!""}" name="secureProductDetailList[${item_index}].id"/></td>
								<td>
									<input type="text" value="${e.secureProductDetailList[item_index].cvrgNo!""}" name="secureProductDetailList[${item_index}].cvrgNo" 
									 class="search-query input-small" 
									 <#if item.cvrgNo??>
									 data-rule="险别代码;required" 
									 </#if>
									 maxlength="40"/>
								</td>		
								<td>
									<input type="text" value="${e.secureProductDetailList[item_index].subName!""}" name="secureProductDetailList[${item_index}].subName" 
									 class="search-query input-small" maxlength="40"/>
								</td>
								<td>
									<input type="text" value="${e.secureProductDetailList[item_index].premium!""}" name="secureProductDetailList[${item_index}].premium"
									 class="search-query input-small" maxlength="9"/>
								</td>
								
								<td>
									<input type="text"  value="${e.secureProductDetailList[item_index].amount!""}" name="secureProductDetailList[${item_index}].amount"  
									class="search-query input-small" maxlength="9"/>
								</td>
								<td>
									<input type="text"  id="rate" value="${e.secureProductDetailList[item_index].rate!""}" name="secureProductDetailList[${item_index}].rate"
									class="search-query input-small" maxlength="9"/>
								</td>
								<td>
									<input type="text"  value="${e.secureProductDetailList[item_index].NIndemLmt!""}" name="secureProductDetailList[${item_index}].NIndemLmt"
									class="search-query input-small" maxlength="9"/>
								</td>
								<td>
	                                <#assign map = {'0':'市场价值'}>
	                                <select id="sure_way" name="secureProductDetailList[${item_index}].sure_way" class="search-query input-medium">
	                                    <#list map?keys as key>
	                                        <option value="${key}" <#if item.sure_way?? && item.sure_way==key>selected="selected" </#if>>${map[key]}</option>
	                                    </#list>
	                                </select>
	                            </td>
	                            	<!--<td><input type="text" value="${e.secureProductDetailList[item_index].remark!""}" name="secureProductDetailList[${item_index}].remark"  class="search-query input-small"/></td>-->
							</tr>
	                    </#list>
								
           		  </#if>
           		  </table>          	 	
			</div>	
		</div><!--end tab-->
			<!--------------------------操作按钮模块------------------------------------->
			</br>
			<#if e.id??>
			 	<button id="updateProduct" method="update" class="btn btn-success">
                    <i class="icon-ok icon-white"></i>修改
                </button>
        		<button id="deleteProduct" method="deletes?deleteFlag=0" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的子产品?');">
                    <i class="icon-ok icon-white"></i>删除
                </button>	
			<#else>
				<span style="margin-left:0px;">				
					<button id="insertProduct"method="insertSecureProduct" class="btn btn-success">
		                <i class="icon-ok icon-white"></i>新增	
		            </button>		           
				</span>				
			</#if>
		
	        <a href="selectList"class="btn btn-warning" >返回</a>
						
			<!--------------------------操作按钮模块------------------------------------->	
</form>
</@page.pageBase>