<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="查看订单">
<style type="text/css">
.titleCss {
	background-color: #e6e6e6;
	border: solid 1px #e6e6e6;
	position: relative;
	margin: -1px 0 0 0;
	line-height: 32px;
	text-align: left;
}

.aCss {
	overflow: hidden;
	word-break: keep-all;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: left;
	font-size: 12px;
}

.liCss {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	height: 30px;
	text-align: left;
	margin-left: 10px;
	margin-right: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
	  //如果从客户页面跳转进来 显示返回按钮
	  var href = window.location.href;
	  if(href.indexOf('appCde')>-1){
	  	$("#btnRet").show();
	  } 
		$("#clearContent").click(function(){//清空查询信息
		  $(".selectArea").each(function(){
		    $(this).val("");
		  })
		  return false;
		})
	});
	
</script>
	<form action="${basepath}/manage/NvhlBase" method="post" theme="simple">
		<table class="table table-bordered">
		<tr>
		<td style="text-align: right;">险种名称</td>
		<td style="text-align: left;width:30px" ><input class="selectArea" type="text" name="CProdName"  class="input-small"
						id="CProdName" /></td>	
				<td style="text-align: right;">保险止期</td>
				<td style="text-align: left;">
					<input class="selectArea" id="d4311" type="text" name="TInsrncEndTmStartDate"
					
					onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
					~ 
					<input class="selectArea" id="d4312" type="text" name="TInsrncEndTmEndDate"
					
					onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2020-10-01'})"/>
				</td>	
				<td>
				       <button class="btn btn-danger" id="clearContent">
							<i class="icon-search icon-white"></i> 清空
						</button>
						<button id="btnRet" style="display:none" onclick='javascript:history.back(-1);' class="btn btn-warning">
	               			 <i class="icon-ok icon-white"></i>返回
	           			 </button>	
				</td>				
		</tr>
			<tr>
				<td colspan="14" id="selectArea">

						<button method="selectList" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
						
				</td>
			</tr>
		</table>
				
		<table class="table table-bordered table-hover"style="text-align: center;">
			<tr style="background-color: #dff0d8">
				<th style="text-align: center;">险种名称</th>
				<th style="text-align: center;">产品代码</th>
				<th style="text-align: center;">投保企业</th>
				<th style="text-align: center;">保额合计</th>
				<th style="text-align: center;">保费合计</th>
				<th style="text-align: center;">投保日期</th>
				<th style="text-align: center;">保险起期</th>
				<th style="text-align: center;">保险止期</th>
				<th style="text-align: center;">业务员</th>
			</tr>
			<#list pager.list as item>
				<tr>
					<td>${item.CProdName!""}</td>
					<td>${item.CProdNo!""}</td>
					<td>${item.appnme!""}</td>
					<td>${item.NAmt!""}</td>
					<td>${item.NPrm!""}</td>
					<td>${item.TAppTm!""}</td>
					<td>${item.TInsrncBgnTm!""}</td>
					<#if item.TInsrncEndTm??>
					<!--如果超期天数为负数 则高亮显示-->
					<#if item.expire_days gt 0> <!--大于等于0 表示已过期-->
					<td id="expireDate" bgcolor="#FF8888">${item.TInsrncEndTm!""}</td>
					<#elseif  item.expire_days lte -30> <!--小于等于30 表示 距离截止日期一个月以上-->
					<td id="expireDate">${item.TInsrncEndTm!""}</td>
					<#else>   <!--一个月之内到期-->
					<td id="expireDate"  bgcolor="#FFBB66" >${item.TInsrncEndTm!""}</td>
					</#if> 
					<#else>
					<td></td>
					</#if>
					<td>${item.username!""}</td>
			</tr>
			</#list>
			<tr>
				<td colspan="55" style="text-align: center;">
					<#include "/manage/system/pager.ftl"/></td>
			</tr>
		</table>
	<div class="alert alert-info" style="text-align: left;font-size: 14px;margin: 2px 0px;">
			颜色含义：<BR>
			<img  src="${basepath}/resource/images/ydq.png">：已过期 &nbsp;
			<img  src="${basepath}/resource/images/jjdq.png">：即将到期
		</div>
	</form>
</@page.pageBase>