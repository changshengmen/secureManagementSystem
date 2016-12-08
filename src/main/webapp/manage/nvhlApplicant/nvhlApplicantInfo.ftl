<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="客户详细信息">
<form action="${basepath}/manage/nvhlApplicantVO" id="form" name="form" namespace="/manage" theme="simple" method="post">		
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">客户详细信息</a></li>	
		</ul>
		<!--------------------------主产品信息添加模块------------------------------------->		
		<div id="tabs-1">		
		 	<input type="hidden" value="${e.id!""}" name="id" label="id" id="id"/>
		 	<!-------------------------------------客户start-------------------------------------------->
			<table class="table table-bordered table-condensed" style="margin-bottom:5px;" id="tableInfo">
				<tr>
	           		 <td style="text-align: right;">企业代码</td>
	           		 <td>${e.appCde!""}</td>
	           		 <td style="text-align: right;">企业名称</td>
	           		 <td>${e.appNme!""}</td>	                  		              		        		            		
		        </tr>
		       	<tr>
	           		 <td style="text-align: right;">证件类型</td>
	           		 <#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
	           		 <#list map?keys as key>
		           		 <#if e.certfCls?? && e.certfCls==key>
		           		  <td>${map[key]}</td>	           		 
		           		 </#if>
	           		 </#list>
	           		           		 	        
	           		 <td style="text-align: right;">证件号码</td>
	           		 <td>${e.certfCde!""}</td>              		        		            		
		        </tr>
		        <tr>
	           		 <td style="text-align: right;">邮箱</td>
	           		 <td>${e.email!""}</td>
	           		 	        
	           		 <td style="text-align: right;">手机</td>
	           		 <td>${e.mobile!""}</td>              		        		            		
		        </tr>
		        <tr>
	           		 <td style="text-align: right;">国籍</td>
	           		 <td>${e.country!""}</td>          		 	                		              		        		            		
		        	 <td style="text-align: right;">通讯地址</td>
	           		 <td>${e.clntAddr!""}</td> 
		        </tr>	        
			</table>
			<!-------------------------------------客户end-------------------------------------------->		
           </div>
            <!--------------------------主产品信息添加模块------------------------------------->																
		</div><!--end tab-->
		<!--------------------------操作按钮模块------------------------------------->
		<br>
        <a href="selectList" class="btn btn-warning">返回</a>		
		<!--------------------------操作按钮模块------------------------------------->	
</form>
<script>
$(function() {
	$( "#tabs" ).tabs({
	});	
});
</script>

</@page.pageBase>