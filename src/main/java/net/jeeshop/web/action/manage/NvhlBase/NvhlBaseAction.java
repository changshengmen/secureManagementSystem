package net.jeeshop.web.action.manage.NvhlBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import net.jeeshop.core.system.bean.User;
import net.jeeshop.services.manage.NvhlBaseVO.NvhlBaseService;
import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;
import net.jeeshop.services.manage.system.impl.UserService;
import net.jeeshop.web.action.BaseController;
import net.jeeshop.web.action.manage.SecureOrder.SecureOrderAction;
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
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
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
	public String selectOrderList(HttpServletRequest request,ModelMap model,RedirectAttributes flushAttrs) throws Exception {		
		NvhlBaseVO base = new NvhlBaseVO();
		if(StringUtils.isNotBlank(RequestHolder.getRequest().getParameter("cid"))){						
			//model.addAttribute("message", "支付成功");
			flushAttrs.addFlashAttribute("message", "支付成功！");
			//String cid = RequestHolder.getRequest().getParameter("cid");			
//			base.setCreateAccount(cid);
			return "redirect:selectOrder";						
		}else{			
			String appCde = RequestHolder.getRequest().getParameter("appCde");//企业编码	
			base.setAppCde(appCde);
			base.setDiscardStatus(0);
			super.selectList(request, base);	
			return page_toList;
		}	
		
	}
	
	
	
	@RequestMapping(value="selectDiscardList")
	public String selectDiscardList(HttpServletRequest request,ModelMap model,RedirectAttributes flushAttrs)throws Exception{
		NvhlBaseVO base = new NvhlBaseVO();
		base.setDiscardStatus(1);
		super.selectList(request, base);	
		return page_toList;
	}
	
	
	/**
	 * 跳转到调用1003 接口
	 * @throws Exception 
	 */
	@RequestMapping(value="toInsurancePolicy")
	public void toInsurancePolicy(HttpServletRequest request,HttpServletResponse response,RedirectAttributes model) throws Exception{
		String payNo = RequestHolder.getRequest().getParameter("payNo");//支付申请号
		String cAppNo=RequestHolder.getRequest().getParameter("cappNo");//投保单号
		response.sendRedirect("/JDT/manage/secureProduct/insurancePolicy?payNo="+payNo+"&cappNo="+cAppNo);
		
		
	}
	/**
	 * 此方法用于显示flushAttrs.addFlashAttribute("message", "支付成功！")
	 * @param request
	 * @param base
	 * @throws Exception
	 */
	@RequestMapping(value = "selectOrder")
	public String selectOrder(HttpServletRequest request,NvhlBaseVO base) throws Exception{
		super.selectList(request, base);
		return page_toList;
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
			User user = new User();
			user.setId(base.getCreateAccount());
			user = getUserService().selectOne(user);
			base.setCSlsNme(user.getNickname());
			model.addAttribute("base", base);			
		}
		return page_toInfo;
	}
	
	/**
	 * 
	* @param
	* @Description: TODO(更改订单废弃状态的方法) 
	* @author yc
	* @date 2017年4月6日 上午11:45:39 
	* @return void    返回类型 
	* @throws
	 */
	@RequestMapping(value="todiscardStatus")
	public String toChageDiscard(HttpServletRequest request ,NvhlBaseVO baseVO){
		String []ids=request.getParameterValues("ids");
		String discard=request.getParameter("discard");
		if(discard.equals("0"))
		{
			for(int i=0; i<ids.length;i++){
				baseVO.setCAppNo(ids[i]);
				baseVO.setDiscardStatus(1);
				nvhlBaseService.updateDiscardStatus(baseVO);
			}
		}else{
			for(int i=0; i<ids.length;i++){
				baseVO.setCAppNo(ids[i]);
				baseVO.setDiscardStatus(0);
				nvhlBaseService.updateDiscardStatus(baseVO);
			}
		}
		
		return "redirect:selectList";
	}
	
	
}