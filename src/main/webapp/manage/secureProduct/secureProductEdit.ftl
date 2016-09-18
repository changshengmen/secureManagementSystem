<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="产品管理">
<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">
	<span id="pifeSpan" class="input-group-addon" style="display:none">${systemSetting().imageRootPath}</span>
	<input type="hidden" value="${e.id!""}" id="productID"/>
	<input type="hidden" value="${e.catalogID!""}" id="catalogID"/>

		<div style="text-align: center;">
			<div id="updateMsg"><font color='red'>${updateMsg!""}</font></div>
			<#if e.id??>
                产品ID：<span class="badge badge-success">${e.id!""}</span>
                <button method="update" class="btn btn-success">
                    <i class="icon-ok icon-white"></i> 保存
                </button>
                <#if e.status??&&e.status!=2>
                    <button method="updateUpProduct?id=${e.id!""}" class="btn btn-warning" onclick="return confirm('确定上架产品吗?');">
                    <i class="icon-arrow-up icon-white"></i> 上架
                    </button>
                <#else>
                    <button method="updateDownProduct?id=${e.id!""}" class="btn btn-warning" onclick="return confirm('确定下架产品吗?');">
                    <i class="icon-arrow-down icon-white"></i> 下架
                    </button>
                </#if>
            <#else>
                <button method="insert" class="btn btn-success">
                    <i class="icon-ok icon-white"></i> 新增
                </button>
			</#if>
			<button onclick='javascript:history.back(-1);' class="btn btn-success">
                    <i class="icon-ok icon-white"></i>返回
            </button>	           
		</div>	
		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">产品基本信息</a></li>
				
				<li><a href="#tabs-2">本地上传图片</a></li>			
			</ul>
			<div id="tabs-1">
                <input type="hidden" value="${e.id!""}" name="id" label="id" id="id"/>
				<div class="row form-horizontal"-role="form">

                    <div class="form-group">
                        <label class="col-md-2 control-label">名称</label>
                        <div class="col-md-10">
                            <input type="text" value="${e.name!""}" name="name"  data-rule="产品名称;required;name;length[0~44];" size="44" maxlength="44" style="width: 80%;"
                                   id="name" />
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label class="col-md-4 control-label">类别</label>
						<div class="col-md-8">
                            <select onchange="catalogChange(this)" name="catalogID" id="catalogSelect">
                                <option></option>
								<#list catalogs as item>
                                    <option pid="0" value="${item.id!""}"><font color='red'>${item.name!""}</font></option>
									<#if item.children??>
										<#list item.children as item>
                                            <option value="${item.id!""}">&nbsp;&nbsp;&nbsp;&nbsp;${item.name!""}</option>
										</#list>
									</#if>
								</#list>
                            </select>(请选择子类别)
                        </div>
						</div>
                    <div class="form-group col-md-6">
                         <label class="col-md-2 control-label">价格/元</label>
                        <div class="col-md-4"><input type="text"  value="${e.price!""}" name="price"  data-rule="定价;required;price;" size="10" maxlength="10"
                                                     id="price" />
                        </div>
					</div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">简介</label>
                        <div class="col-md-10">
							<textarea name="introduce" class="form-control" rows="3" id="introduce"
									  data-rule="产品简介;required;introduce;length[4~500];">${e.introduce!""}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">备注</label>
                        <div class="col-md-10">
							<textarea name="remark" class="form-control" rows="3" id="remark"
									  data-rule="备注;required;introduce;length[4~500];">${e.remark!""}</textarea>
                        </div>
                    </div>
					<div class="form-group">
                        <label class="col-md-2 control-label">图片库</label>
                        <div class="col-md-10">
                            <input type="button" name="filemanager" value="浏览图片库" class="btn btn-success"/>
                            <input type="text"  value="${e.picture_url!""}" name="picture_url" type="text" id="picture_url"  ccc="imagesInput" style="width: 600px;"
                                   data-rule="小图;maxPicture;"/>
							<#if e.picture_url??>
                                <a target="_blank" href="${systemSetting().imageRootPath}${e.picture_url!""}">
                                    <img id="productImg" style="max-width: 50px;max-height: 50px;" alt="" src="${systemSetting().imageRootPath}${e.picture_url!""}">
                                </a>
							</#if>						
                        </div>
                    </div>                  
					<#if e.id??>
                    <div class="form-group">
                        <label class="col-md-2 control-label">其他信息</label>
                        <div class="col-md-10">
			                            录入人：<a style="text-decoration: underline;" target="_blank" href="${basepath}/manage/user/show?account=${e.createAccount!""}">${e.createAccount!""}</a>
			                            录入时间：${e.createtime!""}<br>
			                            最后修改人：<a style="text-decoration: underline;" target="_blank" href="${basepath}/manage/user/show?account=${e.updateAccount!""}">${e.updateAccount!""}</a>
			                            最后修改时间：${e.updatetime!""}
                        </div>
                    </div>
					</#if>
                    </div> <!--end form-->
			    </div>
				<div id="tabs-2">
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
//本地上传图片后添加预览图片的行
function previewImg(imgSrc){
debugger;
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
		editor = K.create('textarea[name="productHTML"]', {
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
	debugger;	
	
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
	$(document).ready(function() {
	
		ajaxLoadImgList();
		
		var url = '${basepath}/uploadify.do';
		
		$("#uploadify").uploadify({
		
		   'auto'           : false,
           'swf'        	 : '${basepath}/resource/uploadify/uploadify.swf',
           'uploader'       : url,//后台处理的请求
           'queueID'        : 'fileQueue',//与下面的id对应
           'queueSizeLimit' :5,
           'fileTypeDesc'   : '图片文件' , //出现在上传对话框中的文件类型描述,
           'fileTypeExts' : '*.jpg;*.bmp;*.png;*.gif', //控制可上传文件的扩展名，启用本项时需同时声明filedesc
           'multi'          : true,
           'buttonText'     : '本地上传',         
           onUploadSuccess:function(file, data, response){
           
				alert("上传成功,data="+data+",file="+file+",response="+response);  
				    
//				ajaxLoadImgList();
		  
			   if(data.error == '1') {
				   alert("上传失败：\n失败原因:" + data.msg);
			   } else {
			       previewImg(data);
				   imgArr=data.split("/");
				   var imgSrc=imgArr[6]+"/"+imgArr[7];
				   $("#picture_url").val(imgSrc);
				   $("#productImg").attr("src",data);	
			   }
           },
           
           onUploadError:function(file, errorCode, errorMsg) {
        	   alert("上传失败,data="+data+",file="+file+",response="+response);   
           }
	 	});
	});
	
	
	//ajax加载内容图片列表
	function ajaxLoadImgList(){
	
		if($("#id").val()==''){
			 $("#fileListDiv").html("");
			 return;
		}
		
		 $("#fileListDiv").html("");
		var _url = "ajaxLoadImgList?id="+$("#id").val();
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  success: function(data){
			  var _tableHtml = "<table class='table table-bordered' style='border:0px solid red;'>";
				  _tableHtml += "<tr style='background-color: #dff0'>";
				  _tableHtml += "<td>图片地址</td><td>设为默认图片</td><td>操作</td>";
				  _tableHtml += "</tr>";
			  $.each(data,function(i,row){
				  _tableHtml += "<tr>";
				  var str = "<a target='_blank' href='"+row+"'>"+row+"</a>";
				  _tableHtml += "<td>"+str+"</td><td><input type='radio' onclick='setProductImageToDefault(\""+row+"\")' name='abcdef123'/></td><td><input type='button' Class='btn btn-danger' value='删除' onclick='deleteImageByProductID(\""+row+"\")'/></td>";
				  _tableHtml += "</tr>";
				  //$("#fileListDiv").append("<a target='_blank' href='"+row+"'>"+row+"</a><br>");
			  });
			  _tableHtml += "</table>";
			  $("#fileListDiv").append(_tableHtml);
		  },
		  dataType: "json",
		  error:function(){
			alert("加载图片列表失败！");
		  }
		});
	}
	
	//产品图片设置为默认图片
	function setProductImageToDefault(imageUrl){
		var _url = "setProductImageToDefault?id="+$("#id").val()+"&imageUrl="+imageUrl;
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  success: function(data){
			  //alert("设置成功!");
			  $("#showMessage").append("设置成功！").fadeTo(2000, 1, function(){
				   //alert("Animation Done.");
				   $("#showMessage").html("").hide();
			  });
		  },
		  dataType: "text",
		  error:function(){
			alert("设置失败！");
		  }
		});
	}
	
	//产品图片设置为默认图片
	function deleteImageByProductID(imageUrl){
		if(!confirm("确定删除选择的记录?")){
			return ;
		}
		var _url = "deleteImageByProductID?id="+$("#id").val()+"&imageUrl="+imageUrl;
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  success: function(data){
				  	ajaxLoadImgList();
			  //$("#showMessage").append("删除成功！").fadeTo(2000, 1, function(){
				//   $("#showMessage").html("").hide();
			  //});
			  
		  },
		  dataType: "text",
		  error:function(){
			alert("删除失败！");
		  }
		});
	}
	</script>
</@page.pageBase>