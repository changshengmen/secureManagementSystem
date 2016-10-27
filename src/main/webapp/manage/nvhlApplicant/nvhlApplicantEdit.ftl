<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">
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
		                        <label class="col-md-4 control-label">企业名称</label>
		                        <div class="col-md-8"><input type="text"  value="${e.appNmePlay!""}" name="appNmePlay"  data-rule="企业名称;required;appNmePlay;" size="25" maxlength="10"
			                                           id="appNmePlay" />
		                        </div>
		              </div>
		              <div class="form-group col-md-6">
		                        <label class="col-md-4 control-label">通讯地址</label>
		                        <div class="col-md-8"><input type="text" value="${e.clntAddrPlay!""}" name="clntAddrPlay"  class="search-query input-small"
														id="clntAddrPlay" />
		                        </div>
		              </div>
		               <div class="form-group col-md-6">
		                        <label class="col-md-4 control-label">证件类型</label>
		                        <div class="col-md-8">
		                        	<#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
				                    <select id="certfClsPlay" name="certfClsPlay" class="input-medium" style="width:150px">
				                    		<#list map?keys as key>
				                        		<option value="${key}" <#if e.certfClsPlay?? && e.certfClsPlay==key>selected="selected" </#if>>${map[key]}</option>
				                    		</#list>
				               		</select>
		                        </div>
		              </div>
		              <div class="form-group col-md-6">
		                        <label class="col-md-4 control-label">证件号码</label>
		                        <div class="col-md-8">
		                        	<input type="text"  value="${e.certfCdePlay!""}" name="certfCdePlay"  data-rule="企业名称;required;appNmePlay;" size="25" maxlength="10"
			                                                     id="certfCdePlay" />
		                        </div>
		              </div>
		              <div class="form-group col-md-6">
		                        <label class="col-md-4 control-label">邮箱</label>
		                        <div class="col-md-8">
		                        	<input type="text" value="${e.emailPlay!""}" name="emailPlay"  class="search-query input-small"
								id="emailplay" />
		                        </div>
		              </div>
		               <div class="form-group col-md-6">
		                        <label class="col-md-4 control-label">手机</label>
		                        <div class="col-md-8">
		                        	<input type="text" value="${e.mobilePlay!""}" name="mobilePlay"  class="search-query input-small"
								id="mobilePlay" />
		                        </div>
		              </div>
		              <div class="form-group col-md-6">
		                        <label class="col-md-4 control-label">国籍</label>
		                        <div class="col-md-8">
		                        	<input type="text"  value="${e.countryPlay!""}" name="countryPlay"  data-rule="企业名称;required;appNmePlay;" size="25" maxlength="10"
			                    id="countryPlay" />
		                        </div>
		              </div>
				</div>				
			    <!--------------------------客户信息模块------------------------------------->	
			      
			       <!--------------------------操作按钮模块------------------------------------->  
					
						<#if checkDbPrivilege()>
						 	<button method="update" class="btn btn-success">
			                    <i class="icon-ok icon-white"></i> 修改
			                </button>
		                </#if>
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
});
</script>	
</@page.pageBase>