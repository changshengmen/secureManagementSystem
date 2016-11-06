<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="编辑/新增产品信息">
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
            	<table class="table table-bordered table-condensed table-hover" style="text-align:center;"> 
            	<tr>
            		<button method="deletes?deleteFlag=0" class="btn btn-danger" onclick="return submitIDs(this,'确定删除选择的子产品?');">
	                    <i class="icon-ok icon-white"></i>删除子产品
	                </button>
            	</tr>                
     				<tr>
     				<#if e.secureProductDetailList?? && e.secureProductDetailList?size gt 0>
     				<th style="text-align: center;"><input type="checkbox" id="firstCheckbox" /></th>
     				</#if>
     				<td style="display: none;">id</th>
     				<th style="text-align: center;">标的名称</th>
     				<th style="text-align: center;">保费</th> 
     				<th style="text-align: center;">保额</th>
     				<th style="text-align: center;">费率</th>
     				<th style="text-align: center;">确定方式</th>	
     				</tr>
        	        <#if e.secureProductDetailList?? && e.secureProductDetailList?size gt 0>
	                    <#list e.secureProductDetailList as item>
							<tr>
							<td><input type="checkbox" name="ids" value="${e.secureProductDetailList[item_index].id!""}" /></td>
								<td style="display: none;"><input type="hidden" value="${e.secureProductDetailList[item_index].id!""}" name="secureProductDetailList[${item_index}].id"/></td>
								<td>
									<input type="text" value="${e.secureProductDetailList[item_index].subName!""}" name="secureProductDetailList[${item_index}].subName" 
									 class="search-query input-small" 
									 <#if item.subName??>
									 data-rule="标的名称;required" 
									 </#if>
									 maxlength="40"/>
								</td>
								<td>
									<input type="text" value="${e.secureProductDetailList[item_index].premium!""}" name="secureProductDetailList[${item_index}].premium"
									 class="search-query input-small"   maxlength="9"/>
								</td>
								
								<td>
									<input type="text"  value="${e.secureProductDetailList[item_index].amount!""}" name="secureProductDetailList[${item_index}].amount"  
									class="search-query input-small"  maxlength="9"/>
								</td>
								<td>
									<input type="text"  value="${e.secureProductDetailList[item_index].rate!""}" name="secureProductDetailList[${item_index}].rate"
									class="search-query input-small"   maxlength="9"/></td>
								<td>
	                                <#assign map = {'0':'市场价值'}>
	                                <select id="sure_way" name="secureProductDetailList[${item_index}].sure_way" class="search-query input-medium">
	                                    <#list map?keys as key>
	                                        <option value="${key}" <#if item.sure_way?? && item.sure_way==key>selected="selected" </#if>>${map[key]}</option>
	                                    </#list>
	                                </select>
	                            </td>
	                            	<!--<td><input type="text"  value="${e.secureProductDetailList[item_index].remark!""}" name="secureProductDetailList[${item_index}].remark"  class="search-query input-small"/></td>-->
							</tr>
	                    </#list>
					<#else>           
            	    <#list [1,2,3] as item>					
						<tr>							
							<td>
								<input type="text" name="secureProductDetailList[${item_index}].subName"  class="search-query input-small"
								data-rule="子产品名称;subName;"data-rule="标的名称;required"  maxlength="40"/>
							</td>
							<td>
								<input type="text" name="secureProductDetailList[${item_index}].premium"  class="search-query input-small"
								data-rule="保费;integer;subName;"  maxlength="9"/>
							</td>
							<td>
								<input type="text" name="secureProductDetailList[${item_index}].amount"  class="search-query input-small"
								data-rule="保额:integer;premium;length[1~10];"  maxlength="9"/>
							</td>
							<td>
								<input type="text" name="secureProductDetailList[${item_index}].rate"  class="search-query input-small"
								data-rule=""  maxlength="9"/>
							</td>
							
							<td>
	                            <#assign map = {'0':'市场价值'}>
	                            <select id="sure_way" name="secureProductDetailList[${item_index}].sure_way" class="search-query input-medium">
	                                <#list map?keys as key>
	                                    <option value="${key}">${map[key]}</option>
	                                </#list>
	                            </select>
	                        </td>
						</tr>				
						
           		  </#list>
           		  </#if>
           		  </table>          	 	
			</div>	
		</div><!--end tab-->
			<!--------------------------操作按钮模块------------------------------------->
			<br>
			<#if e.id??>
				<#if checkDbPrivilege()>
				 	<button method="update" class="btn btn-success">
	                    <i class="icon-ok icon-white"></i>修改
	                </button>
                </#if>
               	
			<#else>
			<span style="margin-left:0px;">
				<#if checkDbPrivilege()>
					<button method="insertSecureProduct" class="btn btn-success">
		                <i class="icon-ok icon-white"></i>新增	
		            </button>
		        </#if>				           
			</span>	
			
			</#if>
		
	        <a href="selectList"class="btn btn-warning" >返回</a>
						
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