<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">
<style>
#application {
	border-bottom:1px solid #e78f08;
	}
</style>

<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1" >投保人基本信息</a></li>
			<li><a href="#tabs-2">被保人基本信息</a></li>			
		</ul>
	<!--------------------------投保人模块------------------------------------->		
		<div id="tabs-1" >
		
		<div class="row form-horizontal"-role="form">
		 		
			 <table class="table table-bordered table-condensed">
				<tr>
					<td style="text-align: right;">投保企业代码</td>
	       			<td><input type="text" name="AppCde"  data-rule="投保企业代码;required;length[0~44];"
	                                             id="Code" />&nbsp;<span style="color:red">*</span>
	          		</td>
	           		<td style="text-align: right;">投保企业名称</td>
	        		<td><input type="text" name="AppNme"  data-rule="投保企业名称;required;length[0~44];"
	                                             id="Name" />&nbsp;<span style="color:red">*</span>
	          		 </td>
	           </tr>
	            <tr>
	           		<td style="text-align: right;">客户类型</td>
	        		<td><#assign map = {"1":'自然人',"0":'非自然人'}>
	                    <select id="ClntMrk" name="T_ClntMrk" class="input-medium" style="width:150px">
                        		<#list map?keys as key>
                            		<option value="${key}">${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 <td style="text-align: right;">通讯地址</td>
	        		 <td> <input type="text" name="T_ClntAddr" data-rule="通讯地址;required;length[0~44];"
	                                             id="ClntAddr" />&nbsp;<span style="color:red">*</span>
	                 </td>
	           		
	           </tr>
	           <tr>
	           		<td style="text-align: right;">证件类型</td>
	        		<td><#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
	                    <select id="CertfCls" name="T_CertfCls" class="input-medium" style="width:150px">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if CertfCls?? && CertfCls==key?eval>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	           		 <td style="text-align: right;">证件号码</td>
	        		 <td><input type="text" name="T_CertfCde"  data-rule="证件号码;required;length[0~44];" 
	                                             id="CertfCde" />&nbsp;<span style="color:red">*</span>
	           		 </td>            		
	           </tr>
	             <tr>
	           		 <td style="text-align: right;">邮箱</td>
	        		 <td><input type="text" name="T_Email" data-rule="邮箱;required;length[0~44];email:true;"
	                                             id="Email" />&nbsp;<span style="color:red">*</span>
	                 </td>
	                 <td style="text-align: right;">邮编</td>
	        	     <td><input type="text" name="T_ZipCde"id="ZipCde" />
	                 </td>
	           <tr>
	            
	           <tr>
	                 <td style="text-align: right;">联系电话</td>
	        	     <td><input type="text" name="T_Mobile"  data-rule="联系电话;required;length[0~44];" maxlength="11"
	                                             id="Mobile" />&nbsp;<span style="color:red">*</span>
	                 </td>
	                  <td style="text-align: right;">国籍</td>
	        	     <td><input type="text" name="T_Country"  data-rule="联系电话;required;length[0~44];" maxlength="11"
	                                             id="Country" />&nbsp;<span style="color:red">*</span>
	                 </td>
	           <tr>
	           <tr>
		           <td style="text-align: right;">客户风险等级</td>
		        		 <td> <#assign map = {"915102":'低风险客户',"915103":'高风险客户',"915106":'中等风险客户'}>
		                         <select id="CusRiskLvl" name="T_CusRiskLvl" class="input-medium">
	                        		<#list map?keys as key>
	                            		<option value="${key}" <#if CusRiskLvl?? && CusRiskLvl==key?eval>selected="selected" </#if>>${map[key]}</option>
	                        		</#list>
	                        	 </select>
	                    </td>
		           <td style="text-align: right;">反洗钱客户风险等级</td>
		        		<td> <#assign map = {"925105":'普通',"925106":'关注级',"925107":'特别关注级',"925108":'高度关注级'}>
			                         <select id="CustRiskRank" name="T_CustRiskRank" class="input-medium" >
	                        			<#list map?keys as key>
	                            			<option value="${key}" <#if CustRiskRank?? && CustRiskRank==key?eval>selected="selected" </#if>>${map[key]}</option>
	                        			</#list>
	                    			</select>
		           	</td>          		
	           </tr>           
	           <tr>	           		
	                  <td style="text-align: right;">投保日期</td>
	        		  <td> <input id="TAppTm" type="text" name="TAppTm" style="line-height:3px"
							class="Wdate search-query input-small"
							onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '2008-03-08 11:30:00', maxDate: '2100-03-10 20:59:30' })"/>
							&nbsp;<span style="color:red">*</span>
					  </td>
					  <td style="text-align: right;">保险起期</td>
	        		 <td> <input id="TInsrncBgnTm" type="text" name="TInsrncBgnTm" style="line-height:3px"
							class="Wdate search-query input-small" 
							onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '2008-03-08 11:30:00', maxDate: '2100-03-10 20:59:30' })"/>
							&nbsp;<span style="color:red">*</span>
					 </td>
	           </tr>
	            <tr>	           		 
	                  <td style="text-align: right;">保险止期</td>
	        		  <td colspan="3">  	        		  
						<input id="TInsrncEndTm" style="line-height:3px" class="Wdate search-query input-small" name="TInsrncEndTm" type="text"
						 onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '2008-03-08 11:30:00', maxDate: '2100-03-10 20:59:30' })" />
						&nbsp;<span style="color:red">*</span>
					  </td>
				</tr>
	           </table>
		<!-------------------------table ending---------------------------------->
		    </div>
		</div>
		<!--------------------------投保人模块 end------------------------------------->
		
		<!--------------------------被保人模块------------------------------------->		
		<div id="tabs-2">
		
		<div class="row form-horizontal"-role="form">

		        <input type="button" id="copyInfo" value="信息同步" style="font-size:11px;margin-bottom:5px;" class="btn btn-primary "/>  
		      
		        <!--------------table---------------->
		    	<table class="table table-bordered table-condensed" id="insureTable">
				<tr>
					<td style="text-align: right;" >被保企业代码</td>
	       			<td><input type="text" name="InsuredCde"  data-rule="被保企业代码;required;length[0~44];"
	                                             id="CodeA" />&nbsp;<span style="color:red">*</span>
	          		</td>
	           		<td style="text-align: right;">被保企业名称</td>
	        		<td><input type="text" name="InsuredNme"  
	                                             id="NameA" />&nbsp;<span style="color:red">*</span>
	          		 </td>
	           </tr>
	            
	           <tr>
	           		<td style="text-align: right;">客户类型</td>
	        		<td><#assign map = {"1":'自然人',"0":'非自然人'}>
	                    <select id="ClntMrkA" name="B_ClntMrk" class="input-medium" style="width:150px">
                        		<#list map?keys as key>
                            		<option value="${key}">${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 <td style="text-align: right;">通讯地址</td>
	        		 <td > <input type="text" name="B_ClntAddr" data-rule="通讯地址;required;length[0~44];"
	                                             id="ClntAddrA" />&nbsp;<span style="color:red">*</span>
	                 </td>	           		
	           </tr>
	           <tr>
	           		<td style="text-align: right;">证件类型</td>
	        		<td><#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
	                    <select id="CertfClsA" name="B_CCertfCls" class="input-medium" style="width:150px">
                        		<#list map?keys as key>
                            		<option value="${key}">${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 <td style="text-align: right;">证件号码</td>
	        		 <td><input type="text" name="B_CCertfCde"  data-rule="证件号码;required;length[0~44];" 
	                                             id="CertfCdeA" />&nbsp;<span style="color:red">*</span>
	           		 </td>
	           		
	           </tr>
	             <tr>
	           		
	                 <td style="text-align: right;">邮编</td>
	        	     <td><input type="text" name="B_ZipCde"id="ZipCdeA" />
	                 </td>
	                  <td style="text-align: right;">邮箱</td>
	        		 <td><input type="text" name="B_CEmail" data-rule="邮箱;required;length[0~44];email:true;"
	                                             id="EmailA" />&nbsp;<span style="color:red">*</span>
	                 </td>
	           <tr>	      	           
	           <tr>
	            <td style="text-align: right;">联系电话</td>
	        	     <td><input type="text" name="B_Mobile"  data-rule="联系电话;required;length[0~44];" maxlength="11"
	                                             id="MobileA" />&nbsp;<span style="color:red">*</span>
	                 </td>
	           		
	           		<td style="text-align: right;">国籍</td>
	        		 <td > <input type="text" name="B_Country" data-rule="通讯地址;required;length[0~44];"
	                                             id="CountryA" />&nbsp;<span style="color:red">*</span>
	                 </td>	      	                 
	           <tr>
	           <tr>
	            <td style="text-align: right;">客户风险等级</td>
	        		 <td> <#assign map = {"915102":'低风险客户',"915103":'高风险客户',"915106":'中等风险客户'}>
	                         <select id="CusRiskLvlA" name="B_CusRiskLvl" class="input-medium">
                        		<#list map?keys as key>
                            		<option value="${key}">${map[key]}</option>
                        		</#list>
                        	 </select>
                    </td>
	          		 <td style="text-align: right;">反洗钱客户风险等级</td>
	        		<td> <#assign map = {"925105":'普通',"925106":'关注级',"925107":'特别关注级',"925108":'高度关注级'}>
		                         <select id="CustRiskRankA" name="B_CustRiskRank" class="input-medium" >
                        			<#list map?keys as key>
                            			<option value="${key}">${map[key]}</option>
                        			</#list>
                    			</select>
	           		</td>
	          		
	           </tr>
          
	           </table>
		  	 <!------------------table ending---------------------------------->
		    </div>
		</div>
																
	</div><!--end tab-->
			<!--------------------------操作按钮模块------------------------------------->
			
			<div style="margin-top:5px"><span style="">
				<button method="toPay"+secure.id class="btn btn-success">
	                <i class="icon-ok icon-white"></i>支付
	            </button>
				<button onclick='javascript:history.back(-1);' class="btn btn-warning">
	                <i class="icon-ok icon-white"></i>返回
	            </button>	           
			</span>	
			</div>
			<!--------------------------操作按钮模块------------------------------------->	
</form>

<script>
$(function() {
	$( "#tabs" ).tabs({
	});
	//设置投保日期为当前时间	
	//alert(new Date());
	//$("#TAppTm").val(new Date(), "yyyy-MM-dd")); 
	//信息同步（按钮） 时从投保人信息自动带出被保人
	$("#copyInfo").click(function(){	
		var source=["CodeA","NameA","ClntMrkA","CountryA","EmailA","CertfClsA","CertfCdeA","ClntAddrA","MobileA","ZipCdeA","CusRiskLvlA","CustRiskRankA","CCntrNmeA"];	
		$.each(source,function(i,n){
			if($("#"+n.substring(0,n.length-1))){
				  var formerVal = $("#"+n.substring(0,n.length-1)).val();
				  $("#"+n).val(formerVal);
				   $("#"+n).focus();			  
		    }
		})
  	});	
});


</script>

<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="insuranceClause"]', {
			allowFileManager : true,
            uploadJson : '${basepath}/editor/upload',
            fileManagerJson : '${basepath}/editor/fileManager'
		});
				
	});

	
	function addTrFunc(){
	alert("addTrFunc函数");
		var cc = $("#firstTr").clone();
		$("#firstTr").after(cc);
		
		cc.find("a").show();
	}
	
	function removeThis(t){
		$(t).parent().parent().remove();
		return false;
	}
</script>

</@page.pageBase>