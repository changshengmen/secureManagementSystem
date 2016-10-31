<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">
<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">保险主产品基本信息</a></li>	
			<li><a href="#tabs-2">保险子产品基本信息</a></li>
			<!--<li><a href="#tabs-3">保险条款</a></li>-->				
			<!--<li><a href="#tabs-4">本地上传图片</a></li>-->	
		</ul>
		<!--------------------------主产品信息添加模块------------------------------------->		
		<div id="tabs-1">		
		 	<input type="hidden" value="${e.id!""}" name="id" label="id" id="id"/>
		 	<!--没有实际意义，去掉的话，点击下单按钮进入不到下一页面-->
		 	<input type="hidden"  value="${e.currency!""}" name="currency"  data-rule="币种;currency;" size="10" maxlength="10"
	                                                     id="currency" />
		 	<!----------------------------------------------商品列表-------------------------------------------->
			<table class="table table-bordered table-condensed table-hover">				
				<tr style="background-color: #dff0d8">
					<td style="display: none;">id</td>
					<th nowrap="nowrap">产品代码（险种）</th>
					<th>产品名称</th>
					<th>保费币种</th>
					<th>保费合计</th>
					<th>保额币种</th>
					<th>保额合计</th>
					<th>简介</th>					
				</tr>
	   			<tr>
					<td style="display: none;">${e.id!""}</td>	
					<td style="width:10%;">${e.CProdNo!""}</td>
					<td style="width:20%;">${e.CProdName!""}</td>
						<td style="width:10%;">
						<#assign map = {"01":'人民币',"02":'港币',"03":'美元',"04":'英镑',"12",'欧元'}>
						 <#list map?keys as key>
						  <#if e.NPrmRmbExch?? && e.NPrmRmbExch==key>
						  ${map[key]}
						  </#if>
						 </#list>
					 </td>
					<td style="width:15%;">${e.NPrm!""}</td>
					<td style="width:10%;">
						 <#assign map = {"01":'人民币',"02":'港币',"03":'美元',"04":'英镑',"12",'欧元'}>
						 <#list map?keys as key>
						  <#if e.NAmtRmbExch?? && e.NAmtRmbExch==key>
						  ${map[key]}
						  </#if>
						 </#list>	
					 </td>
					<td style="width:15%;">${e.NAmt!""}</td>
				
					<td style="width:120%;">${e.introduce!""}</td>
				</tr>
			</table>
           </div>
            <!--------------------------主产品信息添加模块------------------------------------->
        <!--------------------------start子产品信息模块------------------------------------->
            <div id="tabs-2"> 
            	<table class="table" table-bordered table-condensed table-hover" id="childTable">                 
     				<tr style="background-color: #dff0d8">
     				<td style="display: none;">保险编号</td>
     				<td style=" font-weight: bold;">标的名称</td>
     					<td style=" font-weight: bold;">保费</td> 
     				<td style=" font-weight: bold;">保额</td>
     				<td style=" font-weight: bold;">费率</td>
     			<td style=" font-weight: bold;">保险金额的确定方式</td>	  
     				<td style=" font-weight: bold;">备注</td> 	
     				</tr>
        	        <#if e.secureProductDetailList?? && e.secureProductDetailList?size gt 0>
	                    <#list e.secureProductDetailList as item>
							<tr>
								<td style="display: none;"><input type="hidden" value="${item.id!""}" name="secureProductDetailList[${item_index}].id"/></td>
								<td>${e.secureProductDetailList[item_index].subName!""}</td>
								<td>${e.secureProductDetailList[item_index].premium!""}</td>
								<td>${e.secureProductDetailList[item_index].amount!""}</td>
								<td>${e.secureProductDetailList[item_index].rate!""}</td>
								<td>
	                                <#assign map = {'0':'市场价值'}>	                             
	                                    <select id="sure_way" name="secureProductDetailList[${item_index}].sure_way" class="search-query input-medium">
	                                    <#list map?keys as key>
	                                        <option value="${key}" <#if item.sure_way?? && item.sure_way==key>selected="selected" </#if>>${map[key]}</option>
	                                    </#list>
	                                </select>	                                
	                            </td>
	                            <td>${e.secureProductDetailList[item_index].remark!""}</td>
							</tr>
	                    </#list>
				     </#if>
           		  </table>          	 	
			</div>	
            <!--------------------------end子产品信息模块------------------------------------->
		  
			<!--------------------------start-tabs-3------------------------------------->
			<!--<div id="tabs-3">
				${e.insuranceClause!""}
			</div>	
			-->			
			<!--------------------------end-tabs-3------------------------------------->		
			<!--------------------------start-tabs-4------------------------------------->
			<!--<div id="tabs-4">
					<div>
						<h4><div class="alert alert-info">图片列表</div></h4>
						<table class="table table-bordered">
						<tr id="firstTr" style="display:none">
							<td>
									<img name="img"  style="width:50px;height:50px;max-width: 50px;max-height: 50px;">								
							</td>
						</tr>
						<tr>
						<div id="fileQueue"></div> 
							<td>
	                            <input id="uploadify" name="uploadify" value="添加" class="btn btn-warning" type="button"/>
	                        </td>
						</tr>
						<tr>
							 <p>    
		                		<a href="javascript:$('#uploadify').uploadify('upload')">开始上传</a>     
		                		<a href="javascript:$('#uploadify').uploadify('cancel','*')">取消上传</a>    
	           				</p>              									
						</tr>
						
						</table>
					</div>
				</div>
				-->
			<!--------------------------end-tabs-4------------------------------------->	
																
		</div><!--end tab-->
			<!--------------------------操作按钮模块------------------------------------->
			<br>
			<#if e.id??>
			 	<a href="toPayPage?id=${e.id}&&CProdNo=${e.CProdNo}" class="btn btn-success">下单</a> 
               
           
                <button method="selectList?init=y" class="btn btn-warning">
	                <i class="icon-ok icon-white"></i>返回
	        	</button>	
			
			</#if>
						
			<!--------------------------操作按钮模块------------------------------------->	
</form>

<script type="text/css">
#childTable td{
  font-weight: bold;
}

</script>

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
//本地上传图片后添加预览图片的行
function previewImg(imgSrc){
   var $tr = $("#firstTr").clone();
   $tr.find("img[name=img]").attr("src",imgSrc);
   $("#firstTr").parent().append($tr);
   $tr.show();
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
<script>
		KindEditor.ready(function(K) {
				var uploadbutton = K.uploadbutton({
					button : K('#uploadButton')[0],
					fieldName : 'imgFile',
					url : '${basepath}/editor/upload?dir=image',
					afterUpload : function(data) {
						if (data.error === 0) {
							var url = K.formatUrl(data.url, 'absolute');
							K('#url').val(url);
						} else {
							alert(data.message);
						}
					},
					afterError : function(str) {
						alert('自定义错误信息: ' + str);
					}
				});
				uploadbutton.fileBox.change(function(e) {
					uploadbutton.submit();
				});
			});
</script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="insuranceClause"]', {
			allowFileManager : true,
            uploadJson : '${basepath}/editor/upload',
            fileManagerJson : '${basepath}/editor/fileManager'
		});
				
	});

	
	function addTrFunc(){
	alert("addTrFunc函数");
		var cc = $("#firstTr").clone();
		$("#firstTr").after(cc);
		
		cc.find("a").show();
	}
	
	function removeThis(t){
		$(t).parent().parent().remove();
		return false;
	}
</script>

<script>
KindEditor.ready(function(K) {
	var editor = K.editor({
		fileManagerJson : '${basepath}/editor/fileManager'
	});
	K('input[name=filemanager]').click(function() {
	
		var imagesInputObj = $(this).parent().children("input[ccc=imagesInput]");
		editor.loadPlugin('filemanager', function() {
			editor.plugin.filemanagerDialog({
				viewType : 'VIEW',
				dirName : '',
				clickFn : function(url, title) {
					//K('#picture').val(url);
					arr=url.split("/");	
					imagesInputObj.val(arr[5]);
					editor.hideDialog();
					clearRootImagePath(imagesInputObj);//$("#picture"));
				}
			});
		});
	});
	
});
</script>
		
	 <link rel="stylesheet" href="${basepath}/resource/uploadify/uploadify.css"  type="text/css">
	 <script type="text/javascript" src="${basepath}/resource/uploadify/jquery.uploadify.min.js"></script>
	 
	 <script type="text/javascript">
	
	</script>
</@page.pageBase>