<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="保险产品管理">
<style>
#application {
	border-bottom:1px solid #e78f08;
	}
</style>

<form action="${basepath}/manage/secureProduct" id="form" name="form" namespace="/manage" theme="simple" enctype="multipart/form-data" method="post">		
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">投保人基本信息</a></li>
			<li><a href="#tabs-2">被保人基本信息</a></li>			
		</ul>
	<!--------------------------投保人模块------------------------------------->		
		<div id="tabs-1" >
		<input type="hidden" value="${secure.id!""}" name="id" label="id" id="id"/>
		<input type="hidden" value="${secure.CProdName!""}" name="CProdName"  id="CProdName"/>
		<input type="hidden" value="${secure.CProdNo!""}" name="CProdNo"  id="CProdNo"/>
		<div class="row form-horizontal"-role="form">
		 		
			  <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">企业代码</label>
	                <div class="col-md-8"><input type="text"  value="${AppCde!""}" name="AppCde"  data-rule="产品名称;NvhlApplicantVO.AppCode;" size="25" maxlength="10"
	                                             id="CodeA" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		  	  <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">企业名字</label>
	                <div class="col-md-8"><input type="text"  value="${AppName!""}" name="AppName"  data-rule="产品名称;AppName;" size="25" maxlength="10"
	                                             id="NameA" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		       <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">投保企业性质</label>
	               <!-- <div class="col-md-8"><input type="text"  value="${ClntMrk!""}" name="ClntMrk"  data-rule="币种（默认值RMB）;NAmtRmbExch;" size="25" maxlength="10"
	                                             id="ClntMrkA" />&nbsp;<span style="color:red">*</span>
	                </div>-->
	                <#assign map = {"1":'自然人',"0":'非自然人'}>
	                         <select id="ClntMrkA" name="ClntMrk" class="input-medium" style="margin-left:16px;">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if ClntMrk?? && ClntMrk==key?eval>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                    </select>
		      </div>
		      <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">邮箱</label>
	                <div class="col-md-8"><input type="text"  value="${Email!""}" name="Email"  data-rule="总保险费;NPrm;" size="25" maxlength="10"
	                                             id="EmailA" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>	
		       <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">证件类型</label>
	               <!-- <div class="col-md-8"><input type="text"  value="${CertfCls!""}" name="CertfCls"  data-rule="总保险金额;NAmt;" size="25" maxlength="10"
	                                             id="CertfClsA" />&nbsp;<span style="color:red">*</span>
	                </div>-->
	                  <#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
	                         <select id="CertfClsA" name="CertfCls" class="input-medium" style="margin-left:16px;">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if CertfCls?? && CertfCls==key?eval>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                    </select>
		      </div>
		      <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">证件号码</label>
	                <div class="col-md-8"><input type="text"  value="${CertfCde!""}" name="CertfCde"  data-rule="总保险费;CertfCde;" size="25" maxlength="10"
	                                             id="CertfCdeA" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		       <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">通讯地址</label>
	                <div class="col-md-8"><input type="text"  value="${ClntAddr!""}" name="ClntAddr"  data-rule="总保险费;ClntAddr;" size="25" maxlength="10"
	                                             id="ClntAddrA" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>	

		      <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">联系电话</label>
	                <div class="col-md-8"><input type="text"  value="${Mobile!""}" name="Mobile"  data-rule="总保险费;NPrm;" size="25" maxlength="10"
	                                             id="MobileA" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		       <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">邮编</label>
	                <div class="col-md-8"><input type="text"  value="${ZipCde!""}" name="ZipCde"  data-rule="总保险费;ZipCde;" size="25" maxlength="10"
	                                             id="ZipCdeA" />&nbsp;<span style="color:red">*</span>
	           </div>
		      </div>
		       <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">客户等级</label>
	                <div class="col-md-8"><input type="text"  value="${CusRiskLvl!""}" name="CusRiskLvl"  data-rule="总保险费;CusRiskLvl;" size="25" maxlength="10"
	                                             id="CusRiskLvlA" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		        <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">反洗钱客户风险等级</label>
	                <div class="col-md-8"><input type="text"  value="${CustRiskRank!""}" name="CustRiskRank"  data-rule="总保险费;CustRiskRank;" size="25" maxlength="10"
	                                             id="CustRiskRankA" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		           <div class="form-group col-md-12">
	                <label class="col-md-2 control-label">投保日期</label>
	                <div class="col-md-10">
	                	<input id="d4311" type="text" name="TAppTm"
							value="${TAppTm!""}" 
							onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
							&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		      <div class="form-group col-md-12">
	                <label class="col-md-2 control-label">保险起期</label>
	                <div class="col-md-10">
	                	<input id="d4311" type="text" name="TInsrncBgnTm"
							value="${TInsrncBgnTm!""}"
							onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
							&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		        <div class="form-group col-md-12">
	                <label class="col-md-2 control-label">保险止期</label>
	                <div class="col-md-10">
	                	<input id="d4311" type="text" name="TInsrncEndTm"
							value="${TInsrncEndTm!""}"
							onFocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'d4312\')||\'2020-10-01\'}'})"/>
						&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>	
		      	       
		    </div>
		</div>
	<!--------------------------投保人模块------------------------------------->
		
		<!--------------------------被保人模块------------------------------------->		
		<div id="tabs-2">
		
		<div class="row form-horizontal"-role="form">

		       <div class="form-group col-md-12">
		        <input type="button" id="copyInfo" value="信息同步" class="btn btn-primary "/>  
	               
		      </div>
			  <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">被保企业代码</label>
	                <div class="col-md-8"><input type="text"  value="${InsuredCde!""}" name="InsuredCde"  data-rule="产品名称;AppCode;" size="25" maxlength="10"
	                                             id="Code" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		  	  <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">被保企业名字</label>
	                <div class="col-md-8"><input type="text"  value="${CProdName!""}" name="CProdName"  data-rule="产品名称;CProdName;" size="25" maxlength="10"
	                                             id="Name" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		       <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">被保企业性质</label>
	                 <#assign map = {"1":'自然人',"0":'非自然人'}>
	                         <select id="ClntMrk" name="ClntMrk" class="input-medium" style="margin-left:16px;">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if ClntMrk?? && ClntMrk==key?eval>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                    </select>
		      </div>
		      <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">邮箱</label>
	                <div class="col-md-8"><input type="text"  value="${CEmail!""}" name="CEmail"  data-rule="总保险费;NPrm;" size="25" maxlength="10"
	                                             id="Email" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>	
		       <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">证件类型</label>
	                 <#assign map = {"110001":'组织机构代码',"110002":'工商注册号码',"110009",'其他'}>
	                         <select id="CertfCls" name="CertfCls" class="input-medium" style="margin-left:16px;">
                        		<#list map?keys as key>
                            		<option value="${key}" <#if CertfCls?? && CertfCls==key?eval>selected="selected" </#if>>${map[key]}</option>
                        		</#list>
                    </select>
		      </div>
		      <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">证件号码</label>
	                <div class="col-md-8"><input type="text"  value="${CCertfCde!""}" name="CCertfCde"  data-rule="总保险费;CCertfCde;" size="25" maxlength="10"
	                                             id="CertfCde" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		       <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">通讯地址</label>
	                <div class="col-md-8"><input type="text"  value="${ClntAddr!""}" name="ClntAddr"  data-rule="总保险费;ClntAddr;" size="25" maxlength="10"
	                                             id="ClntAddr" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>	

		      <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">联系电话</label>
	                <div class="col-md-8"><input type="text"  value="${Mobile!""}" name="Mobile"  data-rule="总保险费;Mobile;" size="25" maxlength="10"
	                                             id="Mobile" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>	
		      <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">邮编</label>
	                <div class="col-md-8"><input type="text"  value="${ZipCde!""}" name="ZipCde"  data-rule="总保险费;ZipCde;" size="25" maxlength="10"
	                                             id="ZipCde" />&nbsp;<span style="color:red">*</span>
	                 </div>
	           </div>
		      <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">客户等级</label>
	                <div class="col-md-8"><input type="text"  value="${CusRiskLvl!""}" name="CusRiskLvl"  data-rule="总保险费;required;CusRiskLvl;" size="25" maxlength="10"
	                                             id="CusRiskLvl" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		        <div class="form-group col-md-6">
	                <label class="col-md-4 control-label">反洗钱客户风险等级</label>
	                <div class="col-md-8"><input type="text"  value="${CustRiskRank!""}" name="CustRiskRank"  data-rule="总保险费;CustRiskRank;" size="25" maxlength="10"
	                                             id="CustRiskRank" />&nbsp;<span style="color:red">*</span>
	                </div>
		      </div>
		  
		     	       
		    </div>
		</div>
            <!--------------------------被保人模块------------------------------------->
 
			<!--------------------------start-tabs-3---------------------------------------->
				
			<!--------------------------end-tabs-3------------------------------------------>			
			<!--------------------------start-tabs-4---------------------------------------->
			
			<!--------------------------end-tabs-4------------------------------------->	
																
	</div><!--end tab-->
			<!--------------------------操作按钮模块------------------------------------->
			<br>
			<span style="margin-left:0px;">
				<button method="toPay" class="btn btn-success">
	                <i class="icon-ok icon-white"></i>支付
	            </button>
				<button onclick='javascript:history.back(-1);' class="btn btn-success">
	                <i class="icon-ok icon-white"></i>返回
	            </button>	           
			</span>	
			<!--------------------------操作按钮模块------------------------------------->	
</form>

<script>
$(function() {
	$( "#tabs" ).tabs({
	});	
	$("#copyInfo").click(function(){
	var source=["CodeA","NameA","ClntMrkA","EmailA","CertfClsA","CertfCdeA","ClntAddrA","MobileA","ZipCdeA","CusRiskLvlA","CustRiskRankA"];	
		$.each(source, function(i, n){
		var sourceVal=document.getElementById(n).value;
		var destinationName=n.substring(0,n.length-1);
		document.getElementById(destinationName).value=sourceVal;
		});

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