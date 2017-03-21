package net.jeeshop.services.manage.webservice.impl;

import javax.annotation.Resource;
import javax.jws.WebService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.jeeshop.core.ServersManager;
import net.jeeshop.core.dao.BaseDao;
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
	@Resource
	private BaseDao dao;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public String getPolicyStatus(String policyStatusResult) {
		String res = "";
		try {
			 res = getPolicyPram(policyStatusResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
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
		String coperId = "";
		String cpassWd = "";
		
		if(telOperVO != null)
		{
			coperId = telOperVO.getString("COperId");
			cpassWd = telOperVO.getString("CPassWd");
			//验证用户名密码
			if(!(coperId.equals("JDT") && cpassWd.equals("JDT"))){
				logger.error("用户名或密码不对");
				return "0";
			}
		}
		NvhlBaseVO base	= new NvhlBaseVO();	
		//  String policyStatusResult = request.getParameter("TelBaseVOList");		
		System.out.println(policyStatusJson);
		String cUdrMrk = policyStatusJson.getString("CUdrMrk");
		String telBaseOutVOList = "";
		//判断支付结果是否为4
		if(cUdrMrk.equals("4"))//如果核保失败不会回调
		{
			//更新订单
			base.setCAppNo(policyStatusJson.getString("CAppNo"));
			base.setPolicyNo(policyStatusJson.getString("policyNo"));
			base.setEdrAppNo(policyStatusJson.getString("edrAppNo"));
			base.setCudrMrk(policyStatusJson.getString("CUdrMrk"));
			base.setPolicyIdef(policyStatusJson.getString("policyIdef"));
			base.setCresvTxt(policyStatusJson.getString("CResvTxt"));
			base.setUndwrMsg(policyStatusJson.getString("undwrMsg"));
			base.setCudrCde(policyStatusJson.getString("CUdrCde"));
			base.setTudrTm(policyStatusJson.getString("TUdrTm"));
			base.setStatus("5");
			dao.update("manage.manualUnderwritingResult.update", base);
			//更新订单 end
			telBaseOutVOList = getReturnTelBaseOutVOList(policyStatusJson.getString("CAppNo"),"1","成功");
			System.out.println(telBaseOutVOList);
		}
		
	
		//拼接返回字符串
		
		return telBaseOutVOList;
	}
	/**
	 * 人工核保调用接口后，需要返回结果信息
	 * @return 结果信息字符串
	 */
	public String getReturnTelBaseOutVOList(String cappNo, String cEctRst, String cRstTxt){
		//拼接返回时的参数
		JSONObject TelBaseOutVOList = new JSONObject();
		telOperVO telOperVOObject = new telOperVO();
		
		telOperVOObject.setId("");
		telOperVOObject.setCPassWd("ecargoceshi");
		telOperVOObject.setCOperId("ecargo");
		telOperVOObject.setAccequ("");				
		telOperVOObject.setIp("");
		telOperVOObject.setMacAddress("");
		telOperVOObject.setOperTm("");
		
		JSONObject telTradeRtnVO = new JSONObject();
		JSONObject dataTranArea = new JSONObject();
		JSONArray returnList = new JSONArray();
		JSONArray packageList = new JSONArray();
		JSONObject returnListJson = new JSONObject();
		
		returnListJson.put("CAppNo", cappNo);
		returnListJson.put("CEctRst", cEctRst);
		returnListJson.put("CRstTxt", cRstTxt);
		returnList.add(0, returnListJson);
		
		dataTranArea.put("packageList",packageList);
		dataTranArea.put("returnList",returnList);
		
		telTradeRtnVO.put("dataTranArea", dataTranArea);
		telTradeRtnVO.put("pageRecord", "");
		telTradeRtnVO.put("respNo", "");
		telTradeRtnVO.put("resultVO", "");
		telTradeRtnVO.put("subtransNo", "");
		telTradeRtnVO.put("telTradeRtnVO", "");
		telTradeRtnVO.put("transDate", "");
		telTradeRtnVO.put("transTime", "");
		telTradeRtnVO.put("transType", "");
		
		TelBaseOutVOList.put("telOperVO", telOperVOObject);
		TelBaseOutVOList.put("telTradeRequestVO", "");
		TelBaseOutVOList.put("telTradeRtnVO", telTradeRtnVO);
		return TelBaseOutVOList.toString();
	}

	@Override
	public void setDao(NvhlBaseDao dao) {
		// TODO Auto-generated method stub
		
	}
	

	
	
}
