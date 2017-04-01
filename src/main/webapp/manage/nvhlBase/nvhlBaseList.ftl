<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="订单信息">
<style type="text/css">
</style>


<script type="text/javascript">
$(function() {
/*获取保单状态返回信息 页面显示 start-----------------*/
	debugger;
	var href = window.location.href;
	var msg = '';
	var indexNum = href.indexOf('msg');
	if(indexNum > 0){	
		msg = href.split('?')[1].split('=')[1];//拆分url得到”=”后面的参数 
		var htmlStr='<div class="alert alert-success alert-dismissable fade in" id="alert-success"><label id="msgBtn"></label></div>';
		$('#showErrM').html(htmlStr);
		$("#msgBtn").html(decodeURI(msg)); 
	}
	/*获取保单状态返回信息 页面显示 end---------------*/
	$('.tipso').tipso({
		useTitle: false
	});
	//投保止期格式化
	$("#orderList").find("td[name='tinsrncEndTm']").each(function(){
	var tinsrncEndTm = $(this).text();	
	var year = tinsrncEndTm.substr(0,4);
	var moon = tinsrncEndTm.substr(4,2);
	var day = tinsrncEndTm.substr(6,2);
	var hour = tinsrncEndTm.substr(8,2);
	var min = tinsrncEndTm.substr(10,2);
	var sec = tinsrncEndTm.substr(12,2);
	$(this).text(tinsrncEndTm = year+"-"+moon+"-"+day+" "+hour+":"+min+":"+sec);
	})
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
		
	//投保单号 缩短 显示
	$("#orderList").find("td[name='cappNo']").each(function(){
		var cappNo = $(this).text();
		var len = cappNo.length;
		var showCappNo  = cappNo.substring(0,10) + " ...";
	    $(this).html(showCappNo);
	})
});
function flushPage(){
	window.location.reload();
}
</script>
<div id = "msgShow"></div>
<form action="${basepath}/manage/NvhlBase" method="post" theme="simple">
	<table class="table table-bordered">
	<tr>
		<td style="text-align: right;">产品名称</td>
		<td style="text-align: left" ><input class="selectArea" type="text" name="CProdName"
			class="input-small" id="CProdName" /></td>	
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
		
				<span id="showErrM"></span>   			
		
	</tr>
	</table>
	
	<div style="" id="tableList">		
	<table id="orderList" class="table table-bordered table-hover"style="text-align: center;">
		<tr style="background-color: #dff0d8">
			<th style="text-align: center;">投保单号</th>
			<!--<th style="text-align: center;">产品代码</th>-->
			<th style="text-align: center;">产品名称</th>				
			<th style="text-align: center;">投保企业</th>
			<!--<th style="text-align: center;">企业代码</th>-->
			<!--<th style="text-align: center;">保额合计</th>
			<th style="text-align: center;">保费合计</th>
			<th style="text-align: center;">投保起期</th>-->		
			<th style="text-align: center;">保险止期</th>
			<th style="text-align: center;">业务员</th>
			<th style="text-align: center;">创建日期</th>
			<th style="text-align: center;">投保状态</th>
			<th style="text-align: center;">操作</th>
		</tr>
		<#list pager.list as item>
			<tr>
				<td class="tipso" name="cappNo" data-tipso="${item.CAppNo!""}">${item.CAppNo!""}</td>
				<!--<td>${item.CProdNo!""}</td>-->
				<td>${item.CProdName!""}</td>					
				<td>${item.appNme!""}</td>
				<!--<td>${item.appCdePlay!""}</td>
				<td>${item.NAmt!""}</td>
				<td>${item.NPrm!""}</td>
				<td>${item.TAppTm!""}</td>
				<td>${item.TInsrncBgnTm!""}</td>-->				
				<#if item.TInsrncEndTm??>
				<!--如果超期天数为负数 则高亮显示-->
				<#if item.expire_days gt 0> <!--大于等于0 表示已过期-->
				<td id="expireDate" name="tinsrncEndTm" bgcolor="#FF8888">${item.TInsrncEndTm!""}</td>
				<#elseif  item.expire_days lte -30> <!--小于等于30 表示 距离截止日期一个月以上-->
				<td id="expireDate" name="tinsrncEndTm">${item.TInsrncEndTm!""}</td>
				<#else>   <!--一个月之内到期-->
				<td id="expireDate" name="tinsrncEndTm" bgcolor="#FFBB66" >${item.TInsrncEndTm!""}</td>
				</#if> 
				<#else>
				<td></td>
				</#if>
				<td>${item.CSlsNme!""}</td>
				<td>${item.TAppTm!""}</td>
				<td name="orderStatus">
					<#assign map = {"0":'支付成功',"1":'支付中',"2":'信息审核中',"3":"保单落地失败","4":"保单落地","5":"核保通过"}>
					<#list map?keys as key>
					  <#if item.status?? && item.status==key>
					  ${map[key]}
					  </#if>
					</#list>
				</td>
				<td>					
					<a href="selectOrderInfo?id=${item.id!""}">查看 |</a>
					<#if item.status == "1" ||item.status == "2" || item.status == "4" || item.status == "5" >				
						<a href="#" onclick="flushPage()">刷新</a>
					<#else>	
						<a href="toInsurancePolicy?payNo=${item.payNo!""}&cappNo=${item.CAppNo!""}">保单落地</a>	
					</#if>
				</td>
		</tr>
		</#list>
		<tr>
			<td colspan="55" style="text-align: center;">
			<#include "/manage/system/pager.ftl"/></td>
		</tr>
	</table>
		</div>
	<div class="alert alert-info" style="text-align: left;font-size: 14px;margin: 2px 0px;">
		颜色含义：<BR>
		<img  src="${basepath}/resource/images/ydq.png">：已过期 &nbsp;
		<img  src="${basepath}/resource/images/jjdq.png">：即将到期
	</div>
</form>
</@page.pageBase>