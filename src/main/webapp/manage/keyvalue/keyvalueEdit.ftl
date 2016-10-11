<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="键值对管理">
 <script type="text/javascript">
 $(function(){
 //-------规则：如果 键 父建值 重复则clear  键+父键值 为唯一标识 BEGIN---------------------------
 //记录父建值
  var pCode =  $("#p_code").val();
 //当父建值失去焦点时 判断数据库是否有重复记录
  $("#p_code").blur(function(){
    var p_code = $("#p_code").val();
    var key1  = $("#key1").val();
    
    if(p_code == pCode){ //如果没有修改 不验证
    	return false;
    }
	if(key1 == ""){ alert("请先输入键！"); $("#p_code").val(""); return false; }
	   
	    var _url = "checkPcodeIsRepeat?p_code="+p_code+"&key1="+key1;
	    $.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  dataType:"text",
		  async: false,
		  success: function(data){
		   if(data == 'isRepeat'){
		    //查到重复的记录
		    $("#td_pcode").append("<span class='msg-wrap n-error n-msg' style='padding-left:100px;line-height:23px' id='span_pcode'>已存在该父键值</span>");
		    $("#p_code").val("");
		   }
		   else{
		     if($("#span_pcode")){
  				$("#span_pcode").remove();		     
		     }
		   }
	     }
	  });
  	});
  	 //-------规则：如果 键 父建值 重复则clear  键+父键值 为唯一标识 END---------------------------
 })
 
</script>
<form action="${basepath}/manage/keyvalue" id="form" name="form">
			<table class="table table-bordered">
				<tr style="background-color: #dff0d8">
					<td colspan="2" style="background-color: #dff0d8;text-align: center;">
						<strong>键值对编辑</strong>
					</td>
				</tr>
				<tr style="display: none;">
					<td>id</td>
					<td><input type="hidden" name="id" value="${e.id!""}" id="id"></td>
				</tr>
				<tr>
					<td style="text-align: right;">键</td>
					<td style="text-align: left;"><input type="text" name="key1" value="${e.key1!""}" id="key1" data-rule="键:required;key1;length[1~45];"/></td>
				</tr>
				<tr>
					<td style="text-align: right;">值</td>
					<td style="text-align: left;"><input type="text" name="value" value="${e.value!""}" id="value" data-rule="值:required;value;length[1~45];"/></td>
				</tr>
				<tr>
					<td style="text-align: right;">父键值</td>
					<td style="text-align: left;" id="td_pcode"><input type="text" name="p_code" value="${e.p_code!""}" id="p_code" data-rule="值:required;value;length[1~45];"/></td>
				</tr>
				<tr>
					<td style="text-align: right;">备注</td>
					<td style="text-align: left;"><input type="text" name="remark" value="${e.remark!""}" id="remark" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<#if e.id??>
							<button method="update" class="btn btn-success" >
								<i class="icon-ok icon-white"></i> 保存
							</button>
							<#else>
								<button method="insert" class="btn btn-success" >
									<i class="icon-ok icon-white"></i> 新增
								</button>
						</#if>
					</td>
				</tr>
			</table>
	</form>

</@page.pageBase>