package net.jeeshop.web.action.manage.NvhlApplicantVO;import java.util.List;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;import org.apache.commons.lang.StringUtils;import org.slf4j.Logger;import org.slf4j.LoggerFactory;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.ui.ModelMap;import org.springframework.web.bind.annotation.ModelAttribute;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.servlet.mvc.support.RedirectAttributes;import com.alibaba.fastjson.JSON;import net.jeeshop.core.system.bean.User;import net.jeeshop.core.util.EncodingUtil;import net.jeeshop.services.manage.NvhlApplicantVO.NvhlApplicantService;import net.jeeshop.services.manage.NvhlApplicantVO.bean.NvhlApplicantVO;import net.jeeshop.web.action.BaseController;import net.jeeshop.web.util.LoginUserHolder;import net.jeeshop.web.util.RequestHolder;/** * 产品管理的Action *  * @author sunshuo * */@Controller@RequestMapping("/manage/nvhlApplicantVO/")public class NvhlApplicantVOAction extends BaseController<NvhlApplicantVO> {	private static final Logger logger = LoggerFactory.getLogger(NvhlApplicantVOAction.class);	private static final long serialVersionUID = 1L;	@Autowired	private NvhlApplicantService nvhlApplicantService;	public NvhlApplicantService getService() {		return nvhlApplicantService;	}	public void setNvhlApplicantService(NvhlApplicantService nvhlApplicantService) {		this.nvhlApplicantService = nvhlApplicantService;	}		// 客户列表页面	private static final String page_toList = "/manage/nvhlApplicant/nvhlApplicantList";	//修改客户信息	private static final String page_toEdit = "/manage/nvhlApplicant/nvhlApplicantEdit";			private NvhlApplicantVOAction() {		super.page_toList = page_toList;		// super.page_toAdd = page_toAdd;		 super.page_toEdit = page_toEdit;	}	/**	 * 	* @param	* @Description: 跳转到查看客户所购买的产品	* @author sunshuo	* @date 2016年10月21日 上午10:41:13 	* @return String    返回类型 	* @throws	 */		@RequestMapping(value="selectSecureProduct")	public void selectSecureProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {						String appCde = RequestHolder.getRequest().getParameter("appCde");//企业编码						response.sendRedirect("/jshop/manage/NvhlBase/selectList?appCde="+appCde);			}	/**	 * 编辑用户	 */    @RequestMapping("toEdit")	public String toEdit(@ModelAttribute("e") NvhlApplicantVO e, ModelMap model) throws Exception {    	String id = RequestHolder.getRequest().getParameter("id");//企业编码    	if(StringUtils.isBlank(e.getId())){			throw new NullPointerException("产品ID不能为空！");		}				e = getService().selectById(e.getId());				if(e==null || StringUtils.isBlank(e.getId())){			throw new NullPointerException("根据产品ID查询不到指定的产品！");		}		model.addAttribute("e",e);        return page_toEdit;    }    /**     *     * @param    * @Description: 获取后台管理人员的账号     * @author sunshuo    * @date 2016年10月27日 下午1:39:14     * @return String    返回类型     * @throws     */  	private String getAccount(){  		User user = LoginUserHolder.getLoginUser();  		if(user==null){  			throw new NullPointerException("登陆超时！");  		}  		return user.getId();  	}  	/**     *     * @param appName 企业证件号 ：企业名称    * @Description: ajax 动态 获取客户信息     * @author sunshuo    * @date 2016年10月27日 下午1:39:14     * @return String    返回类型     * @throws     */  		@RequestMapping(value="selectApplicantList")  	public String selectApplicantList(HttpServletRequest request,HttpServletResponse res){		String appName = ""; 		try {			RequestHolder.getRequest().setCharacterEncoding("utf-8");			appName = EncodingUtil.encodeStr(RequestHolder.getRequest().getParameter("name"));			String[] sourceStrArray = appName.split(":");						NvhlApplicantVO applicant=new NvhlApplicantVO ();			applicant.setAppNmePlay(sourceStrArray[1]);					applicant.setCertfCdePlay(sourceStrArray[0]);			//获取当前用户权限 			//订单记录 查看 createAccount是当前登陆人的记录 如果是查看个人			String range = LoginUserHolder.getUserRole().getSelect_range();			if(range.indexOf("个人")>-1){				applicant.setCreateAccount(getAccount());			}						List<NvhlApplicantVO> applicantList = getService().selectList(applicant);			String json = JSON.toJSONString(applicantList);			System.out.println(json);			res.getWriter().print(json);		} catch (Exception e) {			e.printStackTrace();		}		return null;  	}		/**	 * 更新产品	 */	@Override	public String update(HttpServletRequest request, NvhlApplicantVO e,RedirectAttributes flushAttrs) throws Exception {						//insertSubProduct(e,Integer.parseInt(e.getId()));		try {			getService().update(e);			flushAttrs.addFlashAttribute("message", "更新成功！");		} catch (Exception e1) {			// TODO Auto-generated catch block			e1.printStackTrace();		}		return "redirect:selectList";	}}