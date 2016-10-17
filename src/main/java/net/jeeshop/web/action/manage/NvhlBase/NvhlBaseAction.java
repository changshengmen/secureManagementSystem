package net.jeeshop.web.action.manage.NvhlBase;

import java.util.Date;
import java.util.UUID;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import net.jeeshop.core.util.DateTimeUtil;
import net.jeeshop.services.manage.NvhlBaseVO.NvhlBaseService;
import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;
import net.jeeshop.web.action.BaseController;
import net.jeeshop.web.action.manage.SecureOrder.SecureOrderAction;
import net.jeeshop.web.util.LoginUserHolder;

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
	
	public String toAdd(@ModelAttribute("e") NvhlBaseVO e, ModelMap model) throws Exception {
		NvhlBaseVO baseVo = new NvhlBaseVO();
		Date dt = new Date();
		UUID uuid = UUID.randomUUID();
		baseVo.setId(uuid.toString());
		baseVo.setCDptCde("jgdm");
		baseVo.setSysRes("xtly");
		baseVo.setCBsnsTyp("19002");
		baseVo.setCChaType("1900201");
		baseVo.setCChaSubtype("1900201001");
		baseVo.setCProdNo("010001");
		baseVo.setNAmt(Double.valueOf("1200"));
		baseVo.setNPrm(Double.valueOf("160000"));
		baseVo.setTAppTm(DateTimeUtil.getDateNowByExpression("yyyy-MM-dd hh:mm"));
		baseVo.setTInsrncBgnTm(DateTimeUtil.getDateNowByExpression("yyyy-MM-dd hh:mm"));
		baseVo.setTInsrncEndTm(DateTimeUtil.getDateNowByExpression("yyyy-MM-dd hh:mm"));
		baseVo.setCreateAccount(LoginUserHolder.getLoginUser().getId());
		baseVo.setCreateTime(DateTimeUtil.getDateNowByExpression("yyyy-MM-dd hh:mm"));
		int i = nvhlBaseService.insert(baseVo);
	    return page_toList;
	}

}
