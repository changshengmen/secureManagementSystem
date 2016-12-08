<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="编辑客户信息">
	<form action="${basepath}/manage/nvhlApplicantVO" method="post" theme="simple">	
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">客户信息</a></li>	
			</ul>
			<!--------------------------客户信息模块------------------------------------->		
			<div id="tabs-1">
				<div class="row form-horizontal"-role="form">
				<input type="hidden" value="${e.id!""}" name="id" label="id" id="id"/>
			    <div class="form-group col-md-6">
                        <label class="col-md-4 control-label">企业代码</label>
                        <div class="col-md-8">
	                        <input type="text"  value="${e.appCde!""}" name="appCde"
		                     id="appCde" data-rule="企业名称;required;appCde;length[0~40]"/>
		                     &nbsp;<span style="color:red">*</span>
                        </div>
	             </div>
				 <div class="form-group col-md-6">
                        <label class="col-md-4 control-label">企业名称</label>
                        <div class="col-md-8">
	                        <input type="text"  value="${e.appNme!""}" name="appNme"
		                     id="appNme" data-rule="企业名称;required;appNme;length[0~40]"/>
		                     &nbsp;<span style="color:red">*</span>
                        </div>
		          </div>
		              
		          <div class="form-group col-md-6">
                        <label class="col-md-4 control-label">证件类型</label>
                        <div class="col-md-8">
                        	<#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
		                    <select id="certfCls" name="certfCls" class="input-medium" style="width:150px">
		                    		<#list map?keys as key>
		                        		<option value="${key}" <#if e.certfCls?? && e.certfCls==key>selected="selected" </#if>>${map[key]}</option>
		                    		</#list>
		               		</select>&nbsp;<span style="color:red">*</span>
                        </div>
		           </div>
		           <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">证件号码</label>
	                        <div class="col-md-8">
	                        	<input type="text"  value="${e.certfCde!""}" name="certfCde"  data-rule="证件号码;required;certfCde;length[0~40]"
		                        id="certfCde" />&nbsp;<span style="color:red">*</span>
	                        </div>
		            </div>
		            <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">邮箱</label>
	                        <div class="col-md-8">
	                        	<input type="text" value="${e.email!""}" name="email"  data-rule="邮箱;required;email;email;length[0~40]"
								id="email" />&nbsp;<span style="color:red">*</span>
	                        </div>
		             </div>
		             <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">手机</label>
	                        <div class="col-md-8">
	                        	<input type="text" value="${e.mobile!""}" name="mobile" data-rule="手机;required;mobile;length[0~11]"
							id="mobile" />&nbsp;<span style="color:red">*</span>
	                        </div>
		              </div>
		              <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">国籍</label>
	                        <div class="col-md-8">
	                        	<input type="text"  value="${e.country!""}" name="country"  data-rule="企业名称;required;country;length[0~40]"
		                    id="country" />&nbsp;<span style="color:red">*</span>
	                        </div>
		              </div>
		              <div class="form-group col-md-6">
	                        <label class="col-md-4 control-label">通讯地址</label>
	                        <div class="col-md-8">
	                        	<input type="text" value="${e.clntAddr!""}" name="clntAddr"
								id="clntAddr" data-rule="通讯地址;required;appNme;length[0~40]"/>
								&nbsp;<span style="color:red">*</span>
	                        </div>
		              </div>
				</div>				
			    <!--------------------------客户信息模块------------------------------------->	
			      
		       <!--------------------------操作按钮模块------------------------------------->  
				 	<button id="update" method="update" class="btn btn-success">
	                    <i class="icon-ok icon-white"></i>修改
	                </button>
	                <button onclick="javascript:history.back(-1)" class="btn btn-warning"">
		                <i class="icon-ok icon-white"></i>返回
		       		</button>
				<!--------------------------操作按钮模块------------------------------------->
			</div>
		</div>		
	</form>
<script>
$(function() {
	$( "#tabs" ).tabs({
	});	
	hideCheckbox();
});
//判断当前登陆者不是admin就隐藏。$("#currentUserID")此控件在pageBase.ftl中
function hideCheckbox(){
	if($("#currentUserID").val()!=1){
		$("#update").hide();
	}
}
</script>	
</@page.pageBase>