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
	<form action="${basepath}/manage/SecureOrder" method="post" theme="simple">
		<table class="table table-bordered">
			<tr>
				<td style="width:100px">保险名称</td>
				<td><input type="text" value="${e.productName!""}" name="productName" class="search-query input-small"/></td>
				<td style="width:100px">入保时间</td>
                <td ><input id="d4311" class="Wdate search-query input-small" style="width:50px" type="text" name="purchaseStartDate"
                           value="${e.purchaseStartDate!""}"
                           onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')||\'2030-10-01\'}'})"/>
                    ~
                    <input id="d4312" class="Wdate search-query input-small" style="width:80px" type="text" name="purchaseEndDate"
                           value="${e.purchaseEndDate!""}"
                           onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}',maxDate:'2030-10-01'})"/>
                </td>
			</tr>
			
			<tr>
				<td colspan="14">

						<button method="selectList" class="btn btn-primary" onclick="selectList(this)">
							<i class="icon-search icon-white"></i> 查询
						</button>
					<div style="float: right;vertical-align: middle;bottom: 0px;top: 10px;">
						<#include "/manage/system/pager.ftl"/>
					</div>
				</td>
			</tr>
		</table>
				
		<table class="table table-bordered table-hover">
			<tr style="background-color: #dff0d8">
				<th>订单号</th>
				<th>保险名称</th>
				<th>保险总金额</th>
				<th>参保时间</th>
				<th>失效时间</th>
			</tr>
			<#list pager.list as item>
				<tr>
					<td>${item.id!""}</td>
					<td>${item.productName!""}</td>
					<td>${item.orderAmount!""}</td>
					<td>${item.purchase_time!""}</td>
					<!--如果超期天数为负数 则高亮显示 -->
					<#if item.expire_days lt 0> 
					<td id="expireDate" style="color:red">${item.expire_time!""}</td>
					<#else> 
					<td id="expireDate">${item.expire_time!""}</td>
					</#if>
</tr>
			</#list>
			<tr>
				<td colspan="55" style="text-align: center;">
					<#include "/manage/system/pager.ftl"/></td>
			</tr>
		</table>
		

	</form>
</@page.pageBase>