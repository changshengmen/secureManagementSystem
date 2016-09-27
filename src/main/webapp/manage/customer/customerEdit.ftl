<#import "/manage/tpl/pageBase.ftl" as page>
<@page.pageBase currentMenu="客户管理">
<style type="text/css">
.product-name {
	display: inline-block;
	width: 250px;
	overflow: hidden; /*注意不要写在最后了*/
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}
</style>
<script type="text/javascript">


</script>

	<form action="${basepath}/manage/secureProduct" namespace="/manage" method="post" theme="simple">
		
		<table class="table table-bordered table-condensed table-hover">
			<table class="table table-bordered">
							<tr>
								<td colspan="2" style="background-color: #dff0d8;text-align: center;">
									<strong>客户信息录入</strong>
								</td>
							</tr>
							<tr style="display:none;">
								<th>id</th>
								<td><input type="hidden" name="id" value=""></td>
							</tr>
							<tr>
								<th class="td_right">投保单位名称</th>
								<td style="text-align: left;">
				                    <#if insertAction>
				                        <input type="text" name="insurance_unit" id="insurance_unit" data-rule="投保单位:required;nickname;length[2~20];remote[unique, id]" >
				                    </#if>
								</td>
							</tr>
							<tr>
								<th class="td_right">证件类型</th>
								<td style="text-align: left;">
								<input type="text" name="ID_type" value="" id="ID_type"  />
									</td>
							</tr>
				
				                <tr>
				                    <th class="td_right">证件号</th>
				                    <td style="text-align: left;"><input type="text" name="ID_num" data-rule="证件号:password;length[6~20];"
				                                                              id="ID_num" />
				                    </td>
				                </tr>
				                <tr>
				                    <th class="td_right">联系电话</th>
				                    <td style="text-align: left;"><input type="text" name="contacts_tel" id="contacts_tel" /> 
				                    </td>
				                </tr>
							<tr>
								<th class="td_right">联系人</th>
								<td style="text-align: left;">
				                    <td style="text-align: left;"><input type="text" name="contacts" id="contacts" /> 
								</td>
							</tr>
							<tr>
								<th class="td_right">通讯地址</th>
								<td style="text-align: left;">
				                    <td style="text-align: left;"><input type="text" name="address" id="address" /> 
								</td>
							</tr>
							<tr>
								<th class="td_right">邮编号码</th>
								<td style="text-align: left;">
				                    <td style="text-align: left;"><input type="text" name="postCode" id="postCode" /> 
								</td>
							</tr>
							<tr>
								<th class="td_right">企业类型</th>
								<td style="text-align: left;">
				                    <td style="text-align: left;"><input type="text" name="enterprise_type" id="enterprise_type" /> 
								</td>
							</tr>
							<tr>
								<th class="td_right">营业类型</th>
								<td style="text-align: left;">
				                    <td style="text-align: left;"><input type="text" name="business_type" id="business_type" /> 
								</td>
							</tr>
							<tr>
								<th class="td_right">行业类型</th>
								<td style="text-align: left;">
				                    <td style="text-align: left;"><input type="text" name="industry_type" id="industry_type" /> 
								</td>
							</tr>
							
							
							
							<tr >
								<td colspan="2" style="padding-left:25%">
										<button method="nextStep" class="btn btn-success">
											<i class="icon-ok icon-white"></i> 下一步
										</button>
										</td>
							</tr>
		</table>
	</form>

</@page.pageBase>