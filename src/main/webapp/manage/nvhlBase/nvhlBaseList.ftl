<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="订单信息">
<style type="text/css">
.loading{
            width: 120px;
            height: 15px;
            margin: 0 auto;
            margin-top:-15px;
        }
        .loading span{
            display: inline-block;
            width: 15px;
            height: 80%;
            margin-right: 5px;
            border-radius: 50%;
            background: lightgreen;
            -webkit-animation: load 1.04s ease infinite;
        }
        .loading span:last-child{
            margin-right: 0px; 
        }
        @-webkit-keyframes load{
            0%{
                opacity: 1;
                -webkit-transform: scale(1.3);
            }
            100%{
                opacity: 0.2;
                -webkit-transform: scale(.3);
            }
        }
        .loading span:nth-child(1){
            -webkit-animation-delay:0.13s;
        }
        .loading span:nth-child(2){
            -webkit-animation-delay:0.26s;
        }
        .loading span:nth-child(3){
            -webkit-animation-delay:0.39s;
        }
        .loading span:nth-child(4){
            -webkit-animation-delay:0.52s;
        }
</style>


<script type="text/javascript">
    
$(function() {
//保单落地加载条
 	$(".see").click(function(){
		$("#btn_bdld_show").prepend("<div class='loading'> <span></span> <span></span><span></span> <span></span></div>")
	})
//废弃操作
	var discard = $('input[name="discard"]').val();
	if(discard != 0 && discard == 1){
		$('#selDiscard').remove();
		$('#selectLi').remove();
		$('span[name="hideDis"]').each(function(){
			$(this).remove();
		});
	}
	if(discard != 1 && discard == 0 || discard == undefined){
		$('#selectDisLi').remove();
		$('#backBtn').remove();
	}
	//点击保单落地按钮 该按钮不可多次点击提交 变灰操作
	$("#btn_bdld").click(function(){ 
		  $(this).remove();
		  $("#btn_bdld_show").show();
	});
	
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
	
	$('a[name = "toDiscard"]').click(function(){
		flag = confirm('msg!您确定要废弃此订单吗?');
		if(flag == true){
			return true;
		}else{
			return false;
		}
	});
		
});

function selDisListfun(){
	$('form:eq(0)').prop("action","${basepath}/manage/NvhlBase/selectDiscardList").submit();
}
//更改废弃废弃状态的请求
function changeDiscardStatus(){
	$('form:eq(0)').prop("action","${basepath}/manage/NvhlBase/todiscardStatus").submit();
}
function flushPage(){//刷新页面
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
		<td colspan="13" id="selectArea">
			<button method="selectList" id="selectLi" class="btn btn-primary" onclick="selectList(this)">
				<i class="icon-search icon-white"></i> 查询
			</button>
			<input id="selectDisLi" onclick="selDisListfun();" type="button" class="btn btn-primary" value="查询订单"/>
			<input id="selDiscard" type="button" class="btn btn-warning" onclick="selDisListfun();" value="查询废弃订单"/>	
			<button method="selectList" onclick="selectList(this)" class="btn btn-warning" id="backBtn">返回</button>	
		</td>
	</tr>
	</table>
	<div style="" id="tableList">	
	<table id = "orderList" class = "table table-bordered table-hover" style = "text-align: center;">
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
			<input type = "hidden" name = "discard" value = "${item.discardStatus}">
			<tr>
				<td class = "tipso" name="cappNo" data-tipso="${item.CAppNo!""}">${item.CAppNo!""}</td>
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
				<#if item.status == "1" ||item.status == "2" || item.status == "4" || item.status == "5">				
						<span name="hideDis">
							&nbsp;<a href="#" onclick="flushPage()">刷新</a> |
						</span>
					<#if item.discardStatus ==0 && item.status == "1" ||item.status == "2" || item.status == "3">
						<span name="hideDis">
								<a name="toDiscard" href="todiscardStatus?CAppNo=${item.CAppNo!""}&discardStatus=${item.discardStatus!""}">废弃</a> |
						</span>
					</#if>
					<#else>	
						<span name="hideDis">	
							<a class = "see" id = "btn_bdld" href="toInsurancePolicy?payNo=${item.payNo!""}&cappNo=${item.CAppNo!""}" >保单落地</a>	
							<a  id = "btn_bdld_show" href="javascript:void(0)"  style="color:gray;display:none">保单落地</a> |
						</span>
					
						<span name="hideDis">
							 <a href="todiscardStatus?CAppNo=${item.CAppNo!""}&discardStatus=${item.discardStatus!""}">废弃</a> |
						</span>
				</#if>		
						
					 <a href="selectOrderInfo?id=${item.id!""}">查看 </a>
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