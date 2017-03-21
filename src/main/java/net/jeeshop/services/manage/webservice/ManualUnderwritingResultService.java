package net.jeeshop.services.manage.webservice;

import javax.jws.WebService;

import net.jeeshop.core.Services;
import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;

/**
 * 
 * @author Administrator
 *
 */
@WebService
public interface ManualUnderwritingResultService extends Services<NvhlBaseVO>{
	//人工核保
	public String getPolicyStatus(String policyStatusResult);
}
