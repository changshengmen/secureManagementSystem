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
	form{
	 	width : 80%;
	}
	table td{font-family:Microsoft YaHei;}
	
	/*table 第一列单元格*/
	td:nth-child(1){
		text-align:right;
	}
	/*table 第三列单元格*/
	td:nth-child(3){
		text-align:right;
	}
	td:nth-child(2){
		width:250px;
	}
	td:nth-child(4){
		width:250px;
	}
	table select{
	 width:200px
	}
	
	.sep td{
		text-align:left;
	}
	.table-bordered{
		border-right-width : 1;
	}
	.codeTr td{  /* 隐藏三列加粗*/
	   font-weight:bold;
	}
	/*左侧显示房屋信息*/
	#trends3 td:nth-child(1){
		text-align:left;
	}
	
	
</style>
<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
<div id="tabs">
		<ul>
			<li><a href="#tabs-1">投保人/被保人基本信息</a></li>					
		</ul>
		<!--------------------------支付页面的url------------------------------------->		
		 <#if payUrl??>
			<input type="hidden"id="payUrl"  name="payUrl" value="${payUrl}"></input>	
		 </#if>		
		<!--------------------------支付页面的url------------------------------------->	
		<!--------------------------订单的流水号------------------------------------->		
		 <#if base.serialNumber??>
			<input type="hidden"id="SerialNumber"  name="serialNumber" value="${base.serialNumber}"></input>	
		 </#if>		
		<!--------------------------订单的流水号------------------------------------->	
		<!--------------------------用于后面支付的时候查询保险产品的隐藏域------------------------------------->
		<input type="hidden" name="occPropFlag" value="${secure.occPropFlag!""}"></input>
		<!--当前产品的主键id-->
		<input type="hidden" name="id" value="${secure.id!""}"></input>
		<input type="hidden" id="CProdNo" name="CProdNo" value="${base.CProdNo!""}"></input>	
		<input type="hidden" name="NAmt" value="${base.NAmt!""}"></input>	
		<input type="hidden" name="NPrm" value="${base.NPrm!""}"></input>	
		<!--------------------------用于后面支付的时候查询保险产品的隐藏域------------------------------------->	
		<!--------------------------投保人模块------------------------------------->		
        
			 <table class="table-bordered table-condensed" style="margin-bottom:5px;" id="tableInfo">
				<tr class="codeTr">
					
					<td style="text-align: right;">投保人代码</td>
					<td>
						<input type="text" name="appCde" value="${applicantVO.appCde!""}"
		                                             id="appCde" />
		             
					</td>
					<td >被保人代码</td>
					<td>
						<input type="text" name="insuredCde" value="${insuredVO.insuredCde!""}"
		                                             id="insuredCde" />
		              
					</td>
				</tr>
				<tr class="codeTr">
					<td >投保单号</td>
					<td>
						<input type="text" name="CAppNo" value="${base.CAppNo!""}"
		                                             id="CAppNo" />		                                          
					</td>
					<td colspan="2">
						                                          
					</td>
				</tr>
				<tr>
					<td id="xzkh" >选择客户</td>
	        		<td id="xzkh1">
	        		  <select id="quickChoose" name="selIndex" class="input-medium" data-settings='{"cutOff":4}'>
	        				<option value="0" selected="selected">请选择客户</option>
		        				<#if applcantList??>
		        					<#list applcantList as item>
	                            		<option  value="${item.appNme!""}">${item.appNme!""}</option>
	                        		</#list>
		        				</#if>                       		
                   		</select>
                   		
	          		 </td>
	           		<td >投保企业名称</td>
	        		<td colspan="3"><input type="text" name="appNme"  data-rule="投保企业名称;required;length[0~40];" 
	                          id="Name" value="${applicantVO.appNme!""}"/>&nbsp;<span style="color:red">*</span>
	          		 </td>	
	          		        		  
	           </tr>
	            <tr>
	            	 
	                <td style="">邮箱</td>
	        		<td ><input type="text" name="TEmail" data-rule="邮箱;required;length[0~40];email:true;" value="${common.TEmail!""}"
	                                             id="Email" />&nbsp;<span style="color:red">*</span>
	                </td> 
	           		<td >客户类型</td>
	        		<td colspan="2"><#assign map = {"0":'非自然人',"1":'自然人'}>
	                    <select id="ClntMrk" name="TClntMrk" class="input-medium">
                        		<#list map?keys as key>
                            		<option value="${key}"<#if common.TClntMrk?? && common.TClntMrk==key>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 
	           		
	           </tr>
	           <tr>
	           		<td >证件类型</td>
	        		<td><#assign map = {"110002":'工商注册号码',"110001":'组织机构代码',"110009",'其他'}>
	                    <select id="CertfCls" name="TCertfCls" class="input-medium">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if common.TCertfCls?? && common.TCertfCls==key>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	           		 <td >证件号码</td>
	        		 <td colspan="2"><input type="text" name="TCertfCde"  data-rule="证件号码;required;length[0~20];" value="${common.TCertfCde!""}" 
	                                             id="CertfCde" />&nbsp;<span style="color:red">*</span>
	           		 </td>            		
	           </tr>
	            
	           <tr>
	           		<td >通讯地址</td>
	        		 <td> <input type="text" name="TClntAddr" data-rule="通讯地址;required;length[0~40];" value="${common.TClntAddr!""}"
	                                             id="ClntAddr" />&nbsp;<span style="color:red">*</span>
	                 </td>
	                 <td >联系电话</td>
	        	     <td colspan="2"><input type="text" name="TMobile"  data-rule="联系电话;required;integer;length[0~11]" maxlength="11"
	                                             id="Mobile" value="${common.TMobile!""}" />&nbsp;<span style="color:red">*</span>
	                 </td>                
	           <tr>	         
	           	<tr> 
	           	 	<td >国籍</td>
	        	    <td><input type="text" name="TCountry"  value="${common.TCountry!""}"
	                     id="Country" data-rule="国籍;required;length[0~40];"/>&nbsp;<span style="color:red">*</span>
	                </td>     		
                  	<td >邮编</td>
	        	    <td colspan="2"> <input type="text" name="TZipCde" value="${common.TZipCde!""}" id="ZipCde" data-rule="邮编;required;length[0~20];"/>&nbsp;<span style="color:red">*</span>
	                </td>					 
	           </tr>
	             <tr>
	                 <td >客户风险等级</td>
	        		 <td> <#assign map = {"915102":'低风险客户',"915103":'高风险客户',"915106":'中等风险客户'}>
	                         <select id="CusRiskLvl" name="TCusRiskLvl" class="input-medium">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if common.TCusRiskLvl?? && common.TCusRiskLvl==key>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                        	 </select>
                    </td>   
           		
           			<td >反洗钱客户风险等级</td>
	        		<td colspan="2"> <#assign map = {"925105":'普通',"925106":'关注级',"925107":'特别关注级',"925108":'高度关注级'}>
		                         <select id="CustRiskRank" name="TCustRiskRank" class="input-medium" >
                        			<#list map?keys as key>
                            			<option value="${key}" <#if common.TCustRiskRank?? && common.TCustRiskRank==key>selected="selected" </#if>>${map[key]}</option>
                        			</#list>
                    			</select>
	           		</td> 
	           	</tr>
	           <tr>   	                		
	                 <td >投保日期</td>
	        		  <td> <input id="TAppTm" type="text" name="TAppTm" style="line-height:4px;height:30px;"
							class="Wdate search-query input-small" value="${base.TAppTm!""}" data-rule="required;"
							onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '2008-03-08 11:30:00', maxDate: '2200-03-10 20:59:30' })"/>
							&nbsp;<span style="color:red">*</span>
					  </td>
					   <td >保险起期</td>
	        		 <td colspan="2"> <input id="TInsrncBgnTm" type="text" name="TInsrncBgnTm" style="line-height:4px;height:30px;"
							class="Wdate search-query input-small" value="${base.TInsrncBgnTm!""}" data-rule="required;" 
							onFocus="WdatePicker({el:'TInsrncBgnTm',onpicked:setTInsrncEndTm, skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'TAppTm\')||\'2008-03-08\'}', maxDate: '2200-03-10 20:59:30' })"/>
							&nbsp;<span style="color:red">*</span>
					 </td>  
	           </tr>
	            <tr>	
	             	 <td >保期/(年)</td> 
	           		 <td>   
			        	<div class="input-group spinner" style="width:40%" data-trigger="spinner">
					          <input type="text" id="secureCount" class="form-control text-center" value="1" data-rule="quantity">
					          <div class="input-group-addon">
					            <a href="javascript:;" class="spin-up" data-spin="up" onclick="setSecureYearAdd()"><i class="fa fa-caret-up"></i></a>
					            <a href="javascript:;" class="spin-down" data-spin="down" onclick="setSecureYearDec()"><i class="fa fa-caret-down"></i></a>
					          </div>
					        </div>
     				 </td>       		 
	                  <td >保险止期</td>
	        		  <td colspan="2">   	        		  
						<input id="TInsrncEndTm" style="line-height:3px;height:30px;" class="Wdate search-query input-small" 
						name="TInsrncEndTm" type="text" value="${base.TInsrncEndTm!""}" data-rule="required;"
						 onFocus="WdatePicker({skin:'whyGreen',dateFmt: 'yyyy-MM-dd HH:mm:ss', minDate: '#F{$dp.$D(\'TInsrncBgnTm\')||\'2008-03-08 11:30:00\'}', maxDate: '2200-03-10 20:59:30' })" />
						&nbsp;<span style="color:red">*</span>
					  </td>
				</tr>
				
					
				<tr id="trends">
				
					<td >营业性质</td> 
						<td> 
		                         <select id="yyxz" name="key1" class="input-medium">
                        			<#list dicList as key>
                            			<option value="${key.key1}"<#if common.key1?? && common.key1==key.key1>selected="selected" </#if>>${key.value}</option>
                        			</#list>
                    			</select>
                    			
	           		</td>  
	           		
	           		<td >行业类型清单</td> 
						<td> 
		                        <select id="hylxList" name="p_code" class="input-medium">
                        			<#list hylxList as key>
                            			<option value="${key.p_code}"<#if pcode?? && pcode==key.p_code>selected="selected" </#if>>${key.value}</option>
                        			</#list>
                    			</select>
	           		</td> 
				</tr>
				<#if secure?? && secure.occPropFlag == "0">
					<tr>
						<td >占地性质</td>
						<td colspan="1">
						<#assign map = {"598001":'第一级工业',"598002":'第二级工业',"598003":'第三级工业',"598004":'第四级工业',"598005":'第五级工业',"598006":'第六级工业',"598007":'一般物资',
						"598008":'危险品',"598009":'特别危险品',"598010":'金属专储',"598011":'粮食专储',"598012":'石油专储',"598013":'社会团体、机关、事业单位/办公楼、住宅、公寓',"598014":'综合商业、商贸、写字楼、交通运输业等等',"598015":'其他',
						"598016":'半导体制造业',"598017":'电厂',"598018":'电网',"598019":'港口',"598020":'商业楼宇',"598021":'石化',"598022":'道路',"598023":'铁路',
						"598024":'地铁',"598025":'煤炭开采',"598026":'铁矿开采',"598027":'有色金属矿开采',"598028":'非金属矿开采'}>
		                    <select id="occProp" name="occProp" class="input-medium">
	                        		<#list map?keys as key>
	                            		<option value="${key}">${map[key]}</option>
	                        		</#list>
	                   		</select>
		           		 </td>
		           		 <td colspan="2"></td>
		           		 
					</tr>
				</#if>
	                 
	                     
		<!-------------------------table ending---------------------------------->

		<!--------------------------投保人模块 end------------------------------------->
		
		<!--------------------------被保人模块------------------------------------->		

			<tr class = "sep">
				<td colspan="5" >
		        <input type="button" id="copyInfo" value="信息同步" style="font-size:13px;margin-bottom:5px;background-color:rgba(171, 124, 58, 0.99);border-color:rgba(171, 124, 58, 0.99)" class="btn btn-primary "/>  
		 		</td>
		 	</tr>      
		 	<!--------------table---------------->
				<tr>
	           		<td >被保企业名称</td>
	        		<td><input type="text" name="insuredNme" value="${insuredVO.insuredNme!""}" 
	                                             id="NameA" />&nbsp;<span style="color:red">*</span>
	          		 </td>
	          		 
	                 <td >邮箱</td>
	        		 <td colspan="2"><input type="text" name="BCEmail" data-rule="邮箱;required;length[0~44];email:true;"
	                                             id="EmailA" value="${common.BCEmail!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>
	           </tr>
	            
	           <tr>
	           		<td >客户类型</td>
	        		<td><#assign map = {"0":'非自然人',"1":'自然人'}>
	                    <select id="ClntMrkA" name="BClntMrk" class="input-medium" >
                        		<#list map?keys as key>
                            		<option value="${key}"<#if common.BClntMrk?? && common.BClntMrk==key> selected="selected"</#if> >${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 <td >通讯地址</td>
	        		 <td colspan="2"> <input type="text" name="BClntAddr" data-rule="通讯地址;required;length[0~100];"
	                                             id="ClntAddrA" value="${common.BClntAddr!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>	           		
	           </tr>
	           <tr>
	           		<td >证件类型</td>
	        		<td><#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
	                    <select id="CertfClsA" name="BCCertfCls" class="input-medium" >
                        		<#list map?keys as key>
                            		<option value="${key}"<#if common.BCCertfCls?? && common.BCCertfCls ==key> selected="selected"</#if>>${map[key]}</option>
                        		</#list>
                   		</select>
	           		 </td>
	          		 <td >证件号码</td>
	        		 <td colspan="2"><input type="text" name="BCCertfCde"  data-rule="证件号码;required;length[0~44];" 
	                                             id="CertfCdeA" value="${common.BCCertfCde!""}"/>&nbsp;<span style="color:red">*</span>
	           		 </td>	           		
	           </tr>	             	           
	           <tr>
	            <td >联系电话</td>
	        	     <td><input type="text" name="BMobile"  data-rule="联系电话;required;integer;length[0~11]" maxlength="11"
	                                             id="MobileA" value="${common.BMobile!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>
	           		
	           		<td >国籍</td>
	        		 <td colspan="2"> <input type="text" name="BCountry" data-rule="通讯地址;required;length[0~100];"
	                                             id="CountryA" value="${common.BCountry!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>	      	                 
	           <tr>
	           <tr>
	           	<td >邮编</td>
	        	     <td><input type="text" name="BZipCde"id="ZipCdeA" value="${common.BZipCde!""}"/>&nbsp;<span style="color:red">*</span>
	                 </td>
	            <td  >客户风险等级</td>
	        		 <td> <#assign map = {"915102":'低风险客户',"915103":'高风险客户',"915106":'中等风险客户'}>
	                         <select id="CusRiskLvlA" name="BCusRiskLvl" class="input-medium">
                        		<#list map?keys as key>
                            		<option value="${key}"<#if common.BCusRiskLvl?? && common.BCusRiskLvl==key>selected="selected"</#if>>${map[key]}</option>
                        		</#list>
                        	 </select>
                    </td>	          		
	           </tr>
          		<tr>
          			 <td style="text-align: right;">反洗钱客户风险等级</td>
	        		 <td><#assign map = {"925105":'普通',"925106":'关注级',"925107":'特别关注级',"925108":'高度关注级'}>
		                         <select id="CustRiskRankA" name="BCustRiskRank" class="input-medium" >
                        			<#list map?keys as key>
                            			<option value="${key}" <#if common.BCustRiskRank?? && common.BCustRiskRank==key>selected="selected"</#if>>${map[key]}</option>
                        			</#list>
                    			</select>
	           		</td>	           		
          		</tr>
          		
				
			<tr id="trends3">
				<td colspan="4">
				<span style="font-size:16px;" class="badge badge-warning">房屋信息</span>
		         
		 		</td>
		 	</tr>  
				
				<tr id="trends1">
					<td style="text-align: right;">承保区域</td> 
						<td><input type="text" name="Tcbqy" value="${cbqy!""}" id="cbqy" data-rule="承保区域;required;length[0~20];"/>&nbsp;<span style="color:red">*</span>
	           		 	</td>  
	           		
	           		 <td style="text-align: right;">营业场所地址</td> 
						<td><input type="text" name="Tyycs" value="${yycs!""}" id="yycs" data-rule="营业场所地址;required;length[0~20];"/>&nbsp;<span style="color:red">*</span>
	           		 	</td>
	           		 		  
				</tr>
				
				<tr id="trends2">
					 <td style="text-align: right;">邮政编码</td> 
						<td><input type="text" name="Tzip" value="${zip!""}" id="zip" data-rule="邮编;required;length[0~7];"/>&nbsp;<span style="color:red">*</span>
	           		 </td>	 
				</tr>
         	
	           </table>
		  	 <!------------------table ending---------------------------------->																
	</div>
	
	<!--end tab-->
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
	            <span id="resultShow" style=""></span>				           
	            <a href="selectList"class="btn btn-warning" style="float:right">返回</a>  
			</span>	
			</div>
			<!--------------------------操作按钮模块------------------------------------->	
</form>
 <link rel="stylesheet" href="${basepath}/resource/uploadify/uploadify.css"  type="text/css">
<link rel="stylesheet" type="text/css" href="${basepath}/resource/bootstrap3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${basepath}/resource/css/select/easydropdown.css">
<link rel="stylesheet" type="text/css" href="${basepath}/resource/jquery-spinner/bootstrap-spinner.css">





<script>
//动态下拉框功能实现
 $('#yyxz').change(function(){
      //调用方法实现下拉框级联	
       yycxChange();
       });
       
 function yycxChange(){
 	//获取当前选中的pcode
       	var pcode = $('#yyxz').val()
       	//alert(pcode)
       	//访问action的url
       	var url = basepath+'/manage/secureProduct/toChangeSelect?pcode='+pcode;
		//异步实现级联下拉框
      	$.ajax({
			 url:url,
			 type:"get",
			 dataType: "json",
         	 success:function(data){
         	 	//遍历拼接下拉框
         		var html='';
         		$.each(data,function(index,obj){
         			html+='<option value="'+obj.p_code+'">'+obj.value+'</option>';  			
         		});
         		
         		$('#hylxList').html(html);	
         	 },   
      	});
 }     
       
$(function(){
//------页面初始化将动态生成的下拉框的样式remove掉---------
	$("select").addClass("setSelect");
	//为动态添加的下拉框赋新的样式和宽度
	$('#hylxList').css({"overflow-x":"hidden", "width":"200px"});
	$('#occProp').css({"width":"200px"});
	$('#quickChoose').css({"width":"200px","overflow-x":"hidden"});
	
	
//---------------end-----------------------	

//获取投保人代码 判断是否为空动态显示选择客户文本框
var appCdeStr=$('#appCde').val();
	if(appCdeStr != null && appCdeStr != ""){
		$('#xzkh').remove();
		$('#xzkh1').remove();
	}
	var a = $(".navbar-top-links li").attr("class","dropdown1"); //角色切换 和 下拉框重名 改
   
	$( "#tabs" ).tabs({
	});
	if($("#payUrl")[0]!==undefined){
		window.onbeforeunload = null;			
		window.location.href = $("#payUrl").val();
	}
	else{
		window.onbeforeunload=function(event){return confirm("您确定离开此页面吗？");}	
	}
	showCode();
	//信息同步（按钮） 时从投保人信息自动带出被保人
	$("#copyInfo").click(function(){			
		copyInfo();		
  	});
  	
  	$("#quickChoose").change(function(){		
  		if($(this).val()!=0){
  			selectApplicantInfo($(this).val());
  		}
  		else{
	  		$("table input").val("");
	  		$("#secureCount").val("1");
	  		$("#copyInfo").val("信息同步");
			// jquery1.6或以上版本
			$("table select").prop('selectedIndex', 0);
			//调用方法级联下拉框
			yycxChange();
       	
      
  		}
  		
  	});
  		
      	
      	//----判断是哪份保险如果是010001财产险则删除页面中营业性质承保区域等字段 ----------------------------------------------
      	var cProdNo=$('#CProdNo').val();
      	//alert(cProdNo=="010001");
      	if(cProdNo=="010001")
      	{
      		$('#trends').empty(); 
      		$('#trends1').remove();	 
      		$('#trends2').remove();	 
      		$('#trends3').remove();	 
      		//alert($('#zip').val());
		}
  		//---------判断保险end--------------------------------------------------------------
});


//设置保期-
function setSecureYearDec(){
//投保起期不为空才做操作
	var bgnTm = $("#TInsrncBgnTm").val();
	if(bgnTm != ''){
		if($("#secureCount").val()!="1"){
			var bgnTm = $("#TInsrncBgnTm").val();
			if(bgnTm != ''){
				var year = parseInt(bgnTm.substring(0,4));
				var secureCount = parseInt($("#secureCount").val())-1;
				$("#TInsrncEndTm").val(year+secureCount+bgnTm.substring(4));
			} 
		}	
	}	
}
//设置保期+
function setSecureYearAdd(){
//投保起期不为空才做操作
	var bgnTm = $("#TInsrncBgnTm").val();
	if(bgnTm != ''){
		var year = parseInt(bgnTm.substring(0,4));
		var secureCount = parseInt($("#secureCount").val())+1;
		$("#TInsrncEndTm").val(year+secureCount+bgnTm.substring(4));
	} 
}
//给保险止期赋值
function setTInsrncEndTm(){
	$dp.$('TInsrncEndTm').value = parseInt($dp.cal.getP('y'))+parseInt($("#secureCount").val())+'-'+$dp.cal.getP('M')+'-'+$dp.cal.getP('d')
		+' '+$dp.cal.getP('H')+':'+$dp.cal.getP('m')+':'+$dp.cal.getP('s');
return true;
}
//不用验证是否离开页面，此方法解除验证
function unbind(){
	window.onbeforeunload = null;
}
//把投保人信息复制到被保人
function copyInfo(){
		var source=["NameA","ClntMrkA","CountryA","EmailA","CertfClsA","CertfCdeA","ClntAddrA","MobileA","ZipCdeA","CusRiskLvlA","CustRiskRankA"];	
		//debugger;
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
              $.each(data,function(){
             	$("#Name").val(data.appNme);
             	$("#ClntMrk").val(data.clntMrk);
             	$("#ClntAddr").val(data.clntAddr);        	
             	$("#CertfCls").val(data.certfCls);                 	
             	$("#CertfCde").val(data.certfCde);
             	$("#Mobile").val(data.mobile);
             	$("#Country").val(data.country);
             	$("#ZipCde").val(data.zipCde);
             	$("#Email").val(data.email);
             	$("#CusRiskLvl").val(data.cusRiskLvl);
             	$("#CustRiskRank").val(data.custRiskRank);
             })   	                            	           	                   
          }                
       });             
}

//显示投保单号，投保人编码和被保人编码 ;
//showflag提交后页面是否返回正确的单号
function showCode(){
	var showFlag=$.trim($("#CAppNo").val());
	if(showFlag==""||showFlag==null){
		$(".codeTr").hide();
	}else{
		//显示投保单号，投保人编码和被保人编码 ;
		$(".codeTr").show();
		$(".dropdown").hide();
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