<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">
<style>
#application {
	border-bottom:1px solid #e78f08;
	}
	
	#btnTj{
		color: #fff;
		    display: inline-block;
	    padding: 6px 12px;
	    margin-bottom: 0;
	    font-size: 14px;
	    font-weight: 400;
	    line-height: 1.42857143;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: middle;
	    user-select: none;
	    background-image: none;
	    border: 1px solid transparent;
	    border-radius: 4px;
	    background-color:#e8423d;border-color:#e8423d;
	}
</style>
<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
<div id="tabs">
		<ul>
			<li><a href="#tabs-1">投保人/被保人基本信息</a></li>
					
		</ul>
		<!--------------------------用于后面支付的时候查询保险产品的隐藏域----产品代码--------------------------------->
		
		<input type="hidden" name="CProdNo" value="${base.CProdNo!""}"></input>	
		<!--------------------------用于后面支付的时候查询保险产品的隐藏域------------------------------------->	
	<!--------------------------投保人模块------------------------------------->		

			 <table class="table table-bordered table-condensed" style="margin-bottom:5px;" id="tableInfo">
				<tr id="codeTr">
					<td style="text-align: right;font-weight:bold">投保单号</td>
					<td >
						<input type="text" name="CAppNo" value="${base.CAppNo!""}"
		                                             id="CAppNo" />
		                                          
					</td>
					<td style="text-align: right;font-weight:bold">投保人代码</td>
					<td>
						<input type="text" name="appCdePlay" value="${applicantVO.appCdePlay!""}"
		                                             id="appCdePlay" />
		             
					</td>
					<td style="text-align: right;font-weight:bold">被保人代码</td>
					<td>
						<input type="text" name="insuredCdePlay" value="${insuredVO.insuredCdePlay!""}"
		                                             id="insuredCdePlay" />
		              
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">选择客户</td>
	        		<td colspan="2">
	        			<select id="quickChoose" class="input-medium" style="width:150px">
	        				<option value="0" selected="selected">请选择客户</option>
	        				<#if applcantList??>
	        					<#list applcantList as item>
                            		<option value="${item.appNmePlay!""}">${item.appNmePlay!""}</option>
                        		</#list>
	        				</#if>                       		
                   		</select>
	          		 </td>
	           		<td style="text-align: right;">投保企业名称</td>
	        		<td colspan="2"><input type="text" name="appNmePlay"  data-rule="投保企业名称;required;length[0~44];" 
	                          id="Name" value="${applicantVO.appNmePlay!""}"/>&nbsp;<span style="color:red">*</span>
	          		 </td>
	          		 
	          		  
	           </tr>
	            <tr>
	           		<td style="text-align: right;">客户类型</td>
	        		<td colspan="2"><#assign map = {"0":'非自然人',"1":'自然人'}>
	                    <select id="ClntMrk" name="TClntMrk" class="input-medium" style="width:150px">
                        		<#list map?keys as key>
                            		<option value="${key}"<#if common.TClntMrk?? && common.TClntMrk==key>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 <td style="text-align: right;">通讯地址</td>
	        		 <td colspan="2"> <input type="text" name="TClntAddr" data-rule="通讯地址;required;length[0~44];" value="${common.TClntAddr!""}"
	                                             id="ClntAddr" />&nbsp;<span style="color:red">*</span>
	                 </td>
	           		
	           </tr>
	           <tr>
	           		<td style="text-align: right;">证件类型</td>
	        		<td colspan="2"><#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
	                    <select id="CertfCls" name="TCertfCls" class="input-medium" style="width:150px">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if common.TCertfCls?? && common.TCertfCls==key>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	           		 <td style="text-align: right;">证件号码</td>
	        		 <td colspan="2"><input type="text" name="TCertfCde"  data-rule="证件号码;required;length[0~44];" value="${common.TCertfCde!""}" 
	                                             id="CertfCde" />&nbsp;<span style="color:red">*</span>
	           		 </td>            		
	           </tr>
	            
	           <tr>
	                 <td style="text-align: right;">联系电话</td>
	        	     <td colspan="2"><input type="text" name="TMobile"  data-rule="联系电话;required;integer" maxlength="11"
	                                             id="Mobile" value="${common.TMobile!""}" />&nbsp;<span style="color:red">*</span>
	                 </td>
	                  <td style="text-align: right;">国籍</td>
	        	     <td colspan="2"><input type="text" name="TCountry"  value="${common.TCountry!""}"
	                     id="Country" data-rule="联系电话;required;length[0~44];" maxlength="11" />&nbsp;<span style="color:red">*</span>
	                 </td>
	           <tr>
	           <tr>
	                 <td style="text-align: right;">客户风险等级</td>
	        		 <td colspan="2"> <#assign map = {"915102":'低风险客户',"915103":'高风险客户',"915106":'中等风险客户'}>
	                         <select id="CusRiskLvl" name="TCusRiskLvl" class="input-medium">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if common.TCusRiskLvl?? && common.TCusRiskLvl==key>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                        	 </select>
                    </td>   
           		
           			<td style="text-align: right;">反洗钱客户风险等级</td>
	        		<td colspan="2"> <#assign map = {"925105":'普通',"925106":'关注级',"925107":'特别关注级',"925108":'高度关注级'}>
		                         <select id="CustRiskRank" name="TCustRiskRank" class="input-medium" >
                        			<#list map?keys as key>
                            			<option value="${key}" <#if common.TCustRiskRank?? && common.TCustRiskRank==key>selected="selected" </#if>>${map[key]}</option>
                        			</#list>
                    			</select>
	           		</td> 
	           		</tr>
	           	<tr> 
	           	 	<td style="text-align: right;">邮编</td>
	        	     <td colspan="2"><input type="text" name="TZipCde" value="${common.TZipCde!""}" id="ZipCde" />&nbsp;<span style="color:red">*</span>
	                 </td>       		
                  <td style="text-align: right;">邮箱</td>
	        		 <td colspan="2"><input type="text" name="TEmail" data-rule="邮箱;required;length[0~44];email:true;" value="${common.TEmail!""}"
	                                             id="Email" />&nbsp;<span style="color:red">*</span>
	                 </td>
					 
	           </tr>
	           <tr>
	           		
	                 <td style="text-align: right;">投保日期</td>
	        		  <td colspan="2"> <input id="TAppTm" type="text" name="TAppTm" style="line-height:4px;height:30px;"
							class="Wdate search-query input-small" value="${base.TAppTm!""}" data-rule="required;"
							onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '2008-03-08 11:30:00', maxDate: '2100-03-10 20:59:30' })"/>
							&nbsp;<span style="color:red">*</span>
					  </td>
					   <td style="text-align: right;">保险起期</td>
	        		 <td colspan="2"> <input id="TInsrncBgnTm" type="text" name="TInsrncBgnTm" style="line-height:4px;height:30px;"
							class="Wdate search-query input-small" value="${base.TInsrncBgnTm!""}" data-rule="required;"
							onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '2008-03-08 11:30:00', maxDate: '2100-03-10 20:59:30' })"/>
							&nbsp;<span style="color:red">*</span>
					 </td>  
	           </tr>
	            <tr>	
	             	         		 
	                  <td style="text-align: right;">保险止期</td>
	        		  <td colspan="5">  	        		  
						<input id="TInsrncEndTm" style="line-height:3px;height:30px;" class="Wdate search-query input-small" 
						name="TInsrncEndTm" type="text" value="${base.TInsrncEndTm!""}" data-rule="required;"
						 onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '2008-03-08 11:30:00', maxDate: '2100-03-10 20:59:30' })" />
						&nbsp;<span style="color:red">*</span>
					  </td>
				</tr>
	                     
		<!-------------------------table ending---------------------------------->

		<!--------------------------投保人模块 end------------------------------------->
		
		<!--------------------------被保人模块------------------------------------->		

			<tr>
				<td colspan="6">
		        <input type="button" id="copyInfo" value="信息同步" style="font-size:13px;margin-bottom:5px;background-color:rgba(171, 124, 58, 0.99);border-color:rgba(171, 124, 58, 0.99)" class="btn btn-primary "/>  
		 		</td>
		 	</tr>      
		 	<!--------------table---------------->
				<tr>
	           		<td style="text-align: right;">被保企业名称</td>
	        		<td colspan="2"><input type="text" name="insuredNmePlay" value="${insuredVO.insuredNmePlay!""}" 
	                                             id="NameA" />&nbsp;<span style="color:red">*</span>
	          		 </td>
	          		 
	                 <td style="text-align: right;">邮箱</td>
	        		 <td colspan="2"><input type="text" name="BCEmail" data-rule="邮箱;required;length[0~44];email:true;"
	                                             id="EmailA" value="${common.BCEmail!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>
	           </tr>
	            
	           <tr>
	           		<td style="text-align: right;">客户类型</td>
	        		<td colspan="2"><#assign map = {"0":'非自然人',"1":'自然人'}>
	                    <select id="ClntMrkA" name="BClntMrk" class="input-medium" style="width:150px">
                        		<#list map?keys as key>
                            		<option value="${key}"<#if common.BClntMrk?? && common.BClntMrk==key> selected="selected"</#if> >${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 <td style="text-align: right;">通讯地址</td>
	        		 <td colspan="2"> <input type="text" name="BClntAddr" data-rule="通讯地址;required;length[0~100];"
	                                             id="ClntAddrA" value="${common.BClntAddr!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>	           		
	           </tr>
	           <tr>
	           		<td style="text-align: right;">证件类型</td>
	        		<td colspan="2"><#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
	                    <select id="CertfClsA" name="BCCertfCls" class="input-medium" style="width:150px">
                        		<#list map?keys as key>
                            		<option value="${key}"<#if common.BCCertfCls?? && common.BCCertfCls ==key> selected="selected"</#if>>${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 <td style="text-align: right;">证件号码</td>
	        		 <td colspan="2"><input type="text" name="BCCertfCde"  data-rule="证件号码;required;length[0~44];" 
	                                             id="CertfCdeA" value="${common.BCCertfCde!""}"/>&nbsp;<span style="color:red">*</span>
	           		 </td>	           		
	           </tr>	             	           
	           <tr>
	            <td style="text-align: right;">联系电话</td>
	        	     <td colspan="2"><input type="text" name="BMobile"  data-rule="联系电话;required;integer;" maxlength="11"
	                                             id="MobileA" value="${common.BMobile!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>
	           		
	           		<td style="text-align: right;">国籍</td>
	        		 <td colspan="2"> <input type="text" name="BCountry" data-rule="通讯地址;required;length[0~100];"
	                                             id="CountryA" value="${common.BCountry!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>	      	                 
	           <tr>
	           <tr>
	           	<td style="text-align: right;">邮编</td>
	        	     <td colspan="2"><input type="text" name="BZipCde"id="ZipCdeA" value="${common.BZipCde!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>
	            <td style="text-align: right;">客户风险等级</td>
	        		 <td colspan="2"> <#assign map = {"915102":'低风险客户',"915103":'高风险客户',"915106":'中等风险客户'}>
	                         <select id="CusRiskLvlA" name="BCusRiskLvl" class="input-medium">
                        		<#list map?keys as key>
                            		<option value="${key}"<#if common.BCusRiskLvl?? && common.BCusRiskLvl==key>selected="selected"</#if>>${map[key]}</option>
                        		</#list>
                        	 </select>
                    </td>	          		
	           </tr>
          		<tr>
          			 <td style="text-align: right;">反洗钱客户风险等级</td>
	        		<td colspan="2"> <#assign map = {"925105":'普通',"925106":'关注级',"925107":'特别关注级',"925108":'高度关注级'}>
		                         <select id="CustRiskRankA" name="BCustRiskRank" class="input-medium" >
                        			<#list map?keys as key>
                            			<option value="${key}" <#if common.BCustRiskRank?? && common.BCustRiskRank==key>selected="selected"</#if>>${map[key]}</option>
                        			</#list>
                    			</select>
	           		</td>
          		</tr>
	           </table>
		  	 <!------------------table ending---------------------------------->																
	</div><!--end tab-->
			<!--------------------------操作按钮模块------------------------------------->
			
			<div style="margin-top:5px;padding-bottom:16px">
			
				<button id="commit" method="toCommit" class="btn btn-success" onclick="unbind()">
	                <i class="icon-ok icon-white"></i>提交
	            </button>
	          <!-- <input value="支付" type="button"  id="btnTj" class="btn btn-success" style="background-color:#4cae4c;border-color:#4cae4c"  onclick="commitInfo()" />-->
	        
	          
				 <button id="toPay" method="toPay?id=1" class="btn btn-success" style="background-color:#4cae4c;border-color:#4cae4c;display:none" onclick="beforePay()" >
	                <i class="icon-ok icon-white"></i>支付
	            </button>
	        <!--  <a id="toPay" href="toPay" class="btn btn-warning" style="background-color:#4cae4c;border-color:#4cae4c;display:none">支付</a>--> 
	            <span id="resultShow" style="font-weight:bold"></span>				           
	            <a href="selectList"class="btn btn-warning" style="float:right">返回</a>  
			</span>	
			</div>
			<!--------------------------操作按钮模块------------------------------------->	
</form>

<script>
$(function() {
	$( "#tabs" ).tabs({
	});
	showCode();
	//信息同步（按钮） 时从投保人信息自动带出被保人
	$("#copyInfo").click(function(){	
		
		copyInfo();
		
  	});
  	$("#quickChoose").change(function(){		
  		if($(this).val()!=0){
  		debugger;
  		selectApplicantInfo($(this).val());
  		}
  		
  	});
  	window.onbeforeunload=function(event){return confirm("您确定离开此页面吗？");}	
  	
});
//点击提交或者支付的时候不用验证是否离开页面，此方法解除验证
function unbind(){
	window.onbeforeunload = null;
}
//把投保人信息复制到被保人
function copyInfo(){
		var source=["NameA","ClntMrkA","CountryA","EmailA","CertfClsA","CertfCdeA","ClntAddrA","MobileA","ZipCdeA","CusRiskLvlA","CustRiskRankA"];	
		$.each(source,function(i,n){
			if($("#"+n.substring(0,n.length-1))){
				  var formerVal = $("#"+n.substring(0,n.length-1)).val();
				  $("#"+n).val(formerVal);
				   $("#"+n).focus();			  
		    }
		})
}
function selectApplicantInfo(a){//提交
  	var url = basepath+'/manage/nvhlApplicantVO/selectApplicantList?name='+a;
  	  	$.ajax({
                 url: url,
                 type: "POST",                
                 dataType: "json",
                 async: false,
                 success: function(data){ 
	                 $.each(data,function(i){
	                 	$("#Name").val(data[i].appNmePlay);
	                 	$("#ClntMrk").val(data[i].ClntMrk);
	                 	$("#ClntAddr").val(data[i].clntAddrPlay);        	
	                 	$("#CertfCls").val(data[i].certfClsPlay);                 	
	                 	$("#CertfCde").val(data[i].certfCdePlay);
	                 	$("#Mobile").val(data[i].mobilePlay);
	                 	$("#Country").val(data[i].countryPlay);
	                 	$("#ZipCde").val(data[i].ZipCde);
	                 	$("#Email").val(data[i].emailPlay);
	                 	$("#CusRiskLvl").val(data[i].cusRiskLvl);
	                 	$("#CustRiskRank").val(data[i].custRiskRank);
	                 })   
	                            	           	                   
                  }
                
               }); 
             
}

//显示投保单号，投保人编码和被保人编码 ;
//showflag提交后页面是否返回正确的单号
function showCode(){
	var showFlag=$.trim($("#CAppNo").val());
	if(showFlag==""||showFlag==null){
		$("#codeTr").hide();
	}else{
		//显示投保单号，投保人编码和被保人编码 ;
		$("#codeTr").show();
		//信息同步按钮隐藏
		$("#copyInfo").hide();	
		$("table input").each(function(){
		  $(this).attr("disabled",true);
		})
		$("table select").each(function(){
		  $(this).attr("disabled",true);
		})
					
	$("#toPay").show();
	$("#commit").hide();
				
	}
}
//用于支付时把数据传到后台
function beforePay(){
window.onbeforeunload = null;
$("table input").each(function(){
		  $(this).attr("disabled",false);
		})
		$("table select").each(function(){
		  $(this).attr("disabled",false);
		})	
}

</script>

</@page.pageBase>