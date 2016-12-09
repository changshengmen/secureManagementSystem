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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java_cup.runtime.virtual_parse_stack;
import net.jeeshop.core.util.DateTimeUtil;
import net.jeeshop.services.manage.NvhlApplicantVO.bean.NvhlApplicantVO;
import net.jeeshop.services.manage.NvhlBaseVO.NvhlBaseService;
import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;
import net.jeeshop.services.manage.secureProduct.bean.SecureProduct;
import net.jeeshop.services.manage.system.impl.UserService;
import net.jeeshop.web.action.BaseController;
import net.jeeshop.web.action.manage.SecureOrder.SecureOrderAction;
import net.jeeshop.web.util.LoginUserHolder;
import net.jeeshop.web.util.RequestHolder;

@Controller
@RequestMapping("/manage/NvhlBase/")
public class NvhlBaseAction  extends BaseController<NvhlBaseVO>{
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SecureOrderAction.class);
	private static final long serialVersionUID = 1L;
	private static final String page_toList = "/manage/NvhlBase/nvhlBaseList";//列表页面
	private static final String page_toInfo = "/manage/NvhlBase/nvhlBaseInfo";//详细页面
	private NvhlBaseAction() {
		super.page_toList = page_toList;
	}
	@Autowired
	private NvhlBaseService nvhlBaseService;
	@Autowired
	private UserService userService;
	
	@Override
	public NvhlBaseService getService() {
		return nvhlBaseService;
	}
	public void setNvhlBaseService(NvhlBaseService nvhlBaseService) {
		this.nvhlBaseService = nvhlBaseService;
	}
	/**
	* @param payReturnFlag：支付返回标志
	* @Description: 该方法既是支付后返回调用的方法，也是供applicantAction调用，查看客户购买的产品的方法
	* @author sunshuo
	* @date 2016年10月21日 上午10:41:13 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "selectOrderList")
	public void selectOrderList(HttpServletRequest request,ModelMap model,RedirectAttributes flushAttrs) throws Exception {				
		NvhlBaseVO base = new NvhlBaseVO();
		if(StringUtils.isNotBlank(RequestHolder.getRequest().getParameter("cid"))){						
			//model.addAttribute("message", "支付成功");
			flushAttrs.addFlashAttribute("message", "支付成功！");
			String cid = RequestHolder.getRequest().getParameter("cid");			
			base.setCreateAccount(cid);
			super.selectList(request, base);			
		}else{			
			String appCde = RequestHolder.getRequest().getParameter("appCde");//企业编码	
			base.setAppCde(appCde);
			super.selectList(request, base);			
		}				 
	}
	/**
	 * 
	* @param
	* @Description: 根据id查看订单详细 
	* @author sunshuo
	* @date 2016年11月30日 下午2:32:18 
	* @return String    返回类型 
	* @throws
	 */
	@RequestMapping(value = "selectOrderInfo")
	public String selectOrderInfo(HttpServletRequest request,ModelMap model) throws Exception {				
		if(StringUtils.isNotBlank(RequestHolder.getRequest().getParameter("id"))){						
			NvhlBaseVO base = new NvhlBaseVO(); 
			base.setId(RequestHolder.getRequest().getParameter("id").toString());
			base = getService().selectOne(base);
			model.addAttribute("base", base);			
		}
		return page_toInfo;
	}
	
}
