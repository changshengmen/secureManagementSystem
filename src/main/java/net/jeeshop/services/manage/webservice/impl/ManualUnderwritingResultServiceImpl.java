package net.jeeshop.services.manage.webservice.impl;

import javax.jws.WebService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.jeeshop.core.ServersManager;
import net.jeeshop.core.util.DateTimeUtil;
import net.jeeshop.services.common.telOperVO;
import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;
import net.jeeshop.services.manage.NvhlBaseVO.dao.NvhlBaseDao;
import net.jeeshop.services.manage.secureProduct.bean.SecureProduct;
import net.jeeshop.services.manage.secureProduct.dao.SecureProductDao;
import net.jeeshop.services.manage.task.bean.Task;
import net.jeeshop.services.manage.task.dao.TaskDao;
import net.jeeshop.services.manage.webservice.ManualUnderwritingResultService;
import net.jeeshop.web.action.manage.secureProduct.SecureProductAction;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebService(endpointInterface="net.jeeshop.services.manage.webservice.ManualUnderwritingResultService")//endpointInterface是为了在实现多个接口情况下指明webservice的接口
@Component//这个是spring的注解

public class ManualUnderwritingResultServiceImpl extends ServersManager<NvhlBaseVO, NvhlBaseDao> implements ManualUnderwritingResultService{
	private static final Logger logger = LoggerFactory.getLogger(SecureProductAction.class);
	
	public void setDao(NvhlBaseDao dao) {
        this.dao =dao;
	}
	@Override
	public String getPolicyStatus(String policyStatusResult) {
		try {
			getPolicyPram(policyStatusResult);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "success";
	}
	/**
	 * 
	* @param
	* @Description: 1：人工核保后调用该方法，根据返回信息更新订单表
	* @author sunshuo
	* @date 2017年1月16日 下午3:05:55 
	* @return void    返回类型 
	* @throws
	 */
	
	public String getPolicyPram(String policyStatusResult)throws Exception{
		
		System.out.println("------------------getPolicyStatus----------------------");
	
		//验证入参非空
		if(StringUtils.isEmpty(policyStatusResult) || (!policyStatusResult.contains("packageList"))){
			logger.error("人工核保返回参数为空");		
			return "0";
		}
		JSONObject policyStatusJson = JSONObject.fromObject(policyStatusResult).getJSONArray("packageList").getJSONObject(0);
		JSONObject telOperVO = JSONObject.fromObject(policyStatusResult).getJSONObject("telOperVO");
		String coperId = telOperVO.getString("COperId");
		String cpassWd = telOperVO.getString("CPassWd");
		//验证用户名密码
		if(!(coperId.equals("JDT") && cpassWd.equals("JDT"))){
			logger.error("用户名或密码不对");
			return "0";
		}
		NvhlBaseVO base	= new NvhlBaseVO();	
		//  String policyStatusResult = request.getParameter("TelBaseVOList");		
		System.out.println(policyStatusJson);
	
		base.setCAppNo(policyStatusJson.getString("CAppNo"));
		base.setPolicyNo(policyStatusJson.getString("PolicyNo"));
		base.setEdrAppNo(policyStatusJson.getString("EdrAppNo"));
		base.setCudrMrk(policyStatusJson.getString("CUdrMrk"));
		base.setPolicyIdef(policyStatusJson.getString("PolicyIdef"));
		base.setCresvTxt(policyStatusJson.getString("CResvTxt"));
		base.setUndwrMsg(policyStatusJson.getString("undwrMsg"));
		base.setCudrCde(policyStatusJson.getString("CUdrCde"));
		base.setTudrTm(policyStatusJson.getString("TUdrTm"));
		//更新订单
		int orderSucc = dao.update(base);		
		//拼接返回字符串
		
		String telBaseOutVOList = getReturnTelBaseOutVOList(policyStatusJson.getString("CAppNo"),"1","成功");
		System.out.println(telBaseOutVOList);
		return telBaseOutVOList;
	}
	/**
	 * 人工核保调用接口后，需要返回结果信息
	 * @return 结果信息字符串
	 */
	public String getReturnTelBaseOutVOList(String cappNo, String cEctRst, String cRstTxt){
		JSONObject TelBaseOutVOList = new JSONObject();
		telOperVO telOperVOObject = new telOperVO();
		telOperVOObject.setId("");
		telOperVOObject.setCPassWd("JDT");
		telOperVOObject.setCOperId("JDT");
		telOperVOObject.setAccequ("");				
		telOperVOObject.setIp("");
		telOperVOObject.setMacAddress("");
		telOperVOObject.setOperTm(DateTimeUtil.getDateNowByExpression("yyyy-MM-dd HH:mm:ss"));
		JSONObject telTradeRtnVO = new JSONObject();
		
		JSONObject dataTranArea = new JSONObject();
		
		JSONArray returnList = new JSONArray();
		JSONObject returnListJson = new JSONObject();
		returnListJson.put("CAppNo", cappNo);
		returnListJson.put("CEctRst", cEctRst);
		returnListJson.put("CRstTxt", cRstTxt);
		returnList.add(0, returnListJson);
		
		dataTranArea.put("packageList",null);
		dataTranArea.put("returnList",returnList);
		
		telTradeRtnVO.put("dataTranArea", dataTranArea);
		telTradeRtnVO.put("pageRecord", dataTranArea);
		telTradeRtnVO.put("respNo", dataTranArea);
		telTradeRtnVO.put("resultVO", dataTranArea);
		telTradeRtnVO.put("subtransNo", dataTranArea);
		telTradeRtnVO.put("telTradeRtnVO", dataTranArea);
		telTradeRtnVO.put("transDate", dataTranArea);
		telTradeRtnVO.put("transTime", dataTranArea);
		telTradeRtnVO.put("transType", dataTranArea);
		
		TelBaseOutVOList.put("telOperVO", telOperVOObject);
		TelBaseOutVOList.put("telTradeRequestVO", null);
		TelBaseOutVOList.put("telTradeRtnVO", telTradeRtnVO);
		return TelBaseOutVOList.toString();
	}

	
	
}
