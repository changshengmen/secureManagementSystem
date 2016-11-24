package net.jeeshop.web.action.manage.NvhlBase;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import net.jeeshop.core.util.DateTimeUtil;
import net.jeeshop.services.manage.NvhlApplicantVO.bean.NvhlApplicantVO;
import net.jeeshop.services.manage.NvhlBaseVO.NvhlBaseService;
import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;
import net.jeeshop.services.manage.secureProduct.bean.SecureProduct;
import net.jeeshop.web.action.BaseController;
import net.jeeshop.web.action.manage.SecureOrder.SecureOrderAction;
import net.jeeshop.web.util.LoginUserHolder;
import net.jeeshop.web.util.RequestHolder;

@Controller
@RequestMapping("/manage/NvhlBase/")
public class NvhlBaseAction  extends BaseController<NvhlBaseVO>{
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SecureOrderAction.class);
	private static final long serialVersionUID = 1L;
	private static final String page_toList = "/manage/NvhlBase/nvhlBaseList";
	
	private NvhlBaseAction() {
		super.page_toList = page_toList;
	}
	@Autowired
	private NvhlBaseService nvhlBaseService;
	@Override
	public NvhlBaseService getService() {
		return nvhlBaseService;
	}
	public void setNvhlBaseService(NvhlBaseService nvhlBaseService) {
		this.nvhlBaseService = nvhlBaseService;
	}
	/**
	 * @return 
	 * @return 
	 * 
	* @param
	* @Description: 供applicantAction调用，查看客户购买的产品
	* @author sunshuo
	* @date 2016年10月21日 上午10:41:13 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "selectOrderList")
	public String selectOrderList(HttpServletRequest request,@ModelAttribute("base") NvhlBaseVO base,ModelMap model) throws Exception {				
		if(StringUtils.isNotBlank(RequestHolder.getRequest().getParameter("payReturnFlag"))){						
			super.selectList(request, base);
			model.addAttribute("message", "支付成功1");
			return page_toList;
		}else{			
			String appCde = RequestHolder.getRequest().getParameter("appCde");//企业编码	
			base.setAppCde(appCde);
			super.selectList(request, base);
			return page_toList;
		}
				 
	}
	
}
