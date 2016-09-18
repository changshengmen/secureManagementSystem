<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="产品管理">
<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">
	<span id="pifeSpan" class="input-group-addon" style="display:none">${systemSetting().imageRootPath}</span>
	<input type="hidden" value="${e.id!""}" id="productID"/>
	<input type="hidden" value="${e.catalogID!""}" id="catalogID"/>

		<div style="text-align: center;">
			<div id="updateMsg"><font color='red'>${updateMsg!""}</font></div>
			<button method="update" class="btn btn-success">
                    <i class="icon-ok icon-white"></i> 下单
                </button>
			<button onclick='javascript:history.back(-1);' class="btn btn-success">
                    <i class="icon-ok icon-white"></i>返回
            </button>	           
		</div>	
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">产品基本信息</a></li>		
			</ul>
			<div id="tabs-1">
                <input type="hidden" value="${e.id!""}" name="id" label="id" id="id"/>
				<div class="row form-horizontal"-role="form">

                    <div class="form-group">
                        <label class="col-md-2 control-label">名称:</label>
                        <div class="col-md-10">
                            <input type="text" value="${e.name!""}" name="name" size="44" maxlength="44" style="width: 80%;"
                                   id="name" disabled="disabled" />        
                        </div>
                    </div>
                     <div class="form-group col-md-6">
                        <label class="col-md-4 control-label">类别:</label>
						<div class="col-md-8">
                            <select onchange="catalogChange(this)" name="catalogID" id="catalogSelect" disabled="disabled">
                                <option></option>
								<#list catalogs as item>
                                    <option pid="0" value="${item.id!""}"><font color='red'>${item.name!""}</font></option>
									<#if item.children??>
										<#list item.children as item>
                                            <option value="${item.id!""}">&nbsp;&nbsp;&nbsp;&nbsp;${item.name!""}</option>
										</#list>
									</#if>
								</#list>
                            </select>
                        </div>
						</div>
                    <div class="form-group col-md-6">
                         <label class="col-md-2 control-label">价格/元:</label>
                        <div class="col-md-4"><input type="text"  value="${e.price!""}" name="price" size="10" maxlength="10"
                                                     id="price" disabled="disabled"/>
                        </div>
					</div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">简介:</label>
                        <div class="col-md-10">
							<textarea name="introduce" class="form-control" rows="3" id="introduce" disabled="disabled">${e.introduce!""}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">备注:</label>
                        <div class="col-md-10">
							<textarea name="remark" class="form-control" rows="3" id="remark" disabled="disabled">${e.remark!""}</textarea>
                        </div>
                    </div>
					<div class="form-group">
                        <label class="col-md-2 control-label">产品图片：</label>
                        <div class="col-md-10">
							<#if e.picture_url??>                               
                                    <img id="productImg" style="max-width: 50px;max-height: 50px;" alt="" src="${systemSetting().imageRootPath}${e.picture_url!""}">    
							</#if>						
                        </div>
                    </div>                  
					
                    </div> <!--end form-->
			    </div>
																		
		</div>
</form>

<script>
$(function() {	
	$( "#tabs" ).tabs({
	});	
	selectDefaultCatalog();
	
	
});
function selectDefaultCatalog(){
	var _catalogID = $("#catalogID").val();
	if(_catalogID!='' && _catalogID>0){
		//$("#catalogSelect").attr("value",_catalogID);
		$("#catalogSelect").val(_catalogID);
	}
}

function catalogChange(obj){
	var _pid = $(obj).find("option:selected").attr("pid");
	if(_pid==0){
		alert("不能选择大类!");
		return false;
	}
	var _productID = $("#productID").val();
	
	if(confirm("修改险种类别会置空产品的一些属性信息，您确认要修改么？")){
		$.blockUI({ message: "正在切换产品目录，请稍候...",css: { 
            border: 'none', 
            padding: '15px', 
            backgroundColor: '#000', 
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px', 
            opacity: .5, 
            color: '#fff' 
        }});		
		//alert($(obj).val());
		if(_productID==''){
			//alert(3);
			document.form.action = "toAdd?chanageCatalog=true&catalog="+$(obj).val();
		}else{
			document.form.action = "updateProductCatalog?id="+_productID+"&chanageCatalog=true&catalog="+$(obj).val();
		}
		document.form.submit();
	}else{
		selectDefaultCatalog();
	}
}



</script>

</@page.pageBase>