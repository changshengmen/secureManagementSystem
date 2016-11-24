<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">
<form action="${basepath}/manage/NvhlBase/selectList" id="form" name="form" namespace="/manage" theme="simple" method="post">
	还有<span id="num"></span>秒跳转到查看订单页面
	<!--------------------------操作按钮模块------------------------------------->				
	<button id="/secureProduct/selectList" method="toCommit" class="btn btn-success" onclick="unbind()">
        <i class="icon-ok icon-white"></i>查看产品
    </button>
 
	 <button id="toPay" method="toPay?id=1" class="btn btn-success" style="background-color:#4cae4c;border-color:#4cae4c;display:none" onclick="beforePay()" >
        <i class="icon-ok icon-white"></i>查看订单
    </button>	
	<!--------------------------操作按钮模块------------------------------------->	
</form>
<script src="${basepath}/resource/js/jquery.min.js"></script>
<script>
$(function(){
	jump(5);
})
//定时跳转
function jump(count){
	window.setTimeout(function(){
		count--;
		if(count > 0){
			$("#num").html(count);
			jump(count);
		}else{
			$("#form").submit();	
		}
	},1000);
}
</script>
</@page.pageBase>