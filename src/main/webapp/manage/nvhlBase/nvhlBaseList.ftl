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
		var dt = $("#expireDate").text();
	
	});
</script>
	<form action="${basepath}/manage/NvhlBase" method="post" theme="simple">
		<table class="table table-bordered">
		
			<tr>
				<td colspan="14">

						<button method="selectList" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
						
							<a href="toAdd" class="btn btn-success">
							<i class="icon-plus-sign icon-white"></i> 添加
						</a>
				</td>
			</tr>
		</table>
				
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th>流水号</th>
				<th>产品代码</th>
				<th>保额合计</th>
				<th>保费合计</th>
				<th>投保日期</th>
				<th>保险起期</th>
				<th>保险止期</th>
			</tr>
			<#list pager.list as item>
				<tr>
					<td>${item.id!""}</td>
					<td>${item.CProdNo!""}</td>
					<td>${item.NAmt!""}</td>
					<td>${item.NPrm!""}</td>
					<td>${item.TAppTm!""}</td>
					<td>${item.TInsrncBgnTm!""}</td>
					
					<!--如果超期天数为负数 则高亮显示-->
					<#if item.expire_days gt 0> <!--大于等于0 表示已过期-->
					<td id="expireDate" bgcolor="#CC0000">${item.TInsrncEndTm!""}</td>
					<#elseif  item.expire_days lte -30> <!--小于等于30 表示 距离截止日期一个月以上-->
					<td id="expireDate">${item.TInsrncEndTm!""}</td>
					<#else>   <!--一个月之内到期-->
					<td id="expireDate"  bgcolor="#FF8800" >${item.TInsrncEndTm!""}</td>
					</#if> 
					
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