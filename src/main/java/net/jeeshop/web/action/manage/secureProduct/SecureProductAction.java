package net.jeeshop.web.action.manage.secureProduct;import java.io.File;import java.io.IOException;import java.util.Iterator;import java.util.LinkedList;import java.util.List;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpSession;import org.apache.commons.lang.StringUtils;import org.slf4j.Logger;import org.slf4j.LoggerFactory;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.ui.ModelMap;import org.springframework.web.bind.annotation.ModelAttribute;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.RequestMethod;import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.web.servlet.mvc.support.RedirectAttributes;import com.alibaba.fastjson.JSON;import net.jeeshop.core.ManageContainer;import net.jeeshop.core.system.bean.User;import net.jeeshop.core.util.DateTimeUtil;import net.jeeshop.services.common.userProduct;import net.jeeshop.services.manage.NvhlApplicantVO.bean.NvhlApplicantVO;import net.jeeshop.services.manage.NvhlBaseVO.NvhlBaseService;import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;import net.jeeshop.services.manage.NvhlInsuredVO.bean.NvhlInsuredVO;import net.jeeshop.services.manage.secureProduct.SecureProductService;import net.jeeshop.services.manage.secureProduct.bean.SecureProduct;import net.jeeshop.services.manage.secureProduct.bean.SecureProductDetail;import net.jeeshop.services.manage.system.impl.UserService;import net.jeeshop.web.action.BaseController;import net.jeeshop.web.util.LoginUserHolder;import net.jeeshop.web.util.RequestHolder;/** * 商品信息管理123 *  * @author jqsl2012@163.com * @author dylan *  */@Controller@RequestMapping("/manage/secureProduct/")public class SecureProductAction extends BaseController<SecureProduct> {	private static final Logger logger = LoggerFactory.getLogger(SecureProductAction.class);	private static final long serialVersionUID = 1L;	@Autowired	private NvhlBaseService nvhlBaseService;	@Autowired	private SecureProductService secureProductService;	@Autowired	private UserService userService;	//非超级管理员的列表页面	private static final String page_toList = "/manage/secureProduct/secureProductList";	//超级管理员的列表页面	private static final String page_toListAdmin = "/manage/secureProduct/admin/secureProductListAdmin";	//修改主产品	private static final String page_toEdit = "/manage/secureProduct/admin/secureProductEdit";	//添加主产品	private static final String page_toAdd = "/manage/secureProduct/admin/secureProductEdit";	//下订单页面	private static final String page_toOrders = "/manage/secureProduct/secureProductOrders";	//结算页面	private static final String page_toPay = "/manage/secureProduct/secureProductPay";	private static final String selectListTap = "/manage/userProduct/secureProductListTap";		private static final String showBindProduct = "/manage/userProduct/secureProductListTap";	private static final String showAllProduct = "/manage/userProduct/allSecureProductList";	private SecureProductAction() {		super.page_toList = page_toList;		super.page_toAdd = page_toAdd;		super.page_toEdit = page_toEdit;	}	public NvhlBaseService getNvhlBaseService() {		return nvhlBaseService;	}	public void setNvhlBaseService(NvhlBaseService nvhlBaseService) {		this.nvhlBaseService = nvhlBaseService;	}	public UserService getUserService() {		return userService;	}	public void setUserService(UserService userService) {		this.userService = userService;	}	public SecureProductService getService() {		return secureProductService;	}	public void setSecureProductService(SecureProductService secureProductService) {		this.secureProductService = secureProductService;	}		/**	 * 跳到支付页面	 * 	 * @return	 * @throws Exception	 */	@RequestMapping(value="toPayPage")	public String toPayPage(HttpServletRequest request, @ModelAttribute("secure") SecureProduct secure,@ModelAttribute("base") NvhlBaseVO base,ModelMap model,@ModelAttribute("applicantVO") NvhlApplicantVO applicantVO,@ModelAttribute("insuredVO") NvhlInsuredVO insuredVO) throws Exception {						String secureProductID = RequestHolder.getRequest().getParameter("id");		User user = LoginUserHolder.getLoginUser();		secure.setUid(user.getId());		secure.setId(secureProductID);		super.selectList(request, secure);		model.addAttribute("secure",secure);		model.addAttribute("base", base);		model.addAttribute("applicantVO", applicantVO);		model.addAttribute("insuredVO", insuredVO);		return page_toPay;	}	/**	 * 支付	 * 	 * @return	 * @throws Exception	 */	@RequestMapping(value="toPay", method = RequestMethod.POST)	public String toPay(HttpServletRequest request, @ModelAttribute("secure") SecureProduct secure,@ModelAttribute("base") NvhlBaseVO base,ModelMap model,@ModelAttribute("applicantVO") NvhlApplicantVO applicantVO,@ModelAttribute("insuredVO") NvhlInsuredVO insuredVO) throws Exception {				//		String ss =p.getAppCde();//		String sw =f.getInsuredCde();		base.setCProdName(secure.getCProdName());		base.setCProdNo(secure.getCProdNo());		base.setNAmtRmbExch(secure.getNAmtRmbExch());		base.setNAmt(secure.getNAmt());		base.setNPrmRmbExch(secure.getNPrmRmbExch());		base.setNPrm(secure.getNPrm());		base.setTAppTm(DateTimeUtil.getDateNowByExpression("yyyy-MM-dd hh:mm:ss"));		int s =getNvhlBaseService().insert(base);		return page_toPay;	}	/**	 * 添加主产品	 */	@Override	public String toAdd(@ModelAttribute("e") SecureProduct e, ModelMap model) throws Exception {		String pid = RequestHolder.getRequest().getParameter("pid");				return page_toAdd;	}		//列表页面点击 查看商品	@RequestMapping(value = "toOrder")	public String toOrder(@ModelAttribute("e")SecureProduct e,ModelMap model) throws Exception {		//RequestHolder.getRequest().setAttribute("catalogs", systemManager.getCatalogs());//		getSession().setAttribute("insertOrUpdateMsg", "");		String id = RequestHolder.getRequest().getParameter("id");		e = getService().selectById(id);				List<SecureProductDetail> secureProductDetail=getService().selectSecureProductDetail(id);		if(e==null || StringUtils.isBlank(e.getId())){			throw new NullPointerException("根据产品ID查询不到指定的产品！");		}		e.setSecureProductDetailList(secureProductDetail);		model.addAttribute("e", e);		return page_toOrders;			}	//列表页面点击 编辑商品	@Override	public String toEdit(@ModelAttribute("e")SecureProduct e, ModelMap model) throws Exception {//		getSession().setAttribute("insertOrUpdateMsg", "");		return toEdit0(e, model);	}	/**	 * 修改商品的类别，会联动清除商品已有的属性和参数	 * @return	 * @throws Exception	 */	@RequestMapping(value = "updateProductCatalog", method = RequestMethod.POST)	public String updateProductCatalog(SecureProduct e, ModelMap model) throws Exception {//		getSession().setAttribute("insertOrUpdateMsg", "");		return toEdit0(e, model);	}	/**	 * 添加或编辑商品后程序回转编辑	 * @return	 * @throws Exception	 */	@RequestMapping(value = "toEdit2")	public String toEdit2(SecureProduct e, ModelMap model) throws Exception {		return toEdit0(e, model);	}	/**	 * 添加或编辑商品后程序回转编辑	 * @return	 * @throws Exception	 */	@RequestMapping(value = "toEditProduct")	public String toEditProduct(SecureProduct e, ModelMap model) throws Exception {		return toEdit0(e, model);	}		/**	 * 根据商品ID，加载商品全部信息	 */	private String toEdit0(SecureProduct e, ModelMap model) throws Exception {        //RequestHolder.getRequest().setAttribute("catalogs", systemManager.getCatalogs());		if(StringUtils.isBlank(e.getId())){			throw new NullPointerException("产品ID不能为空！");		}				e = getService().selectById(e.getId());		List<SecureProductDetail> secureProductDetail=getService().selectSecureProductDetail(e.getId());		e.setSecureProductDetailList(secureProductDetail);		if(e==null || StringUtils.isBlank(e.getId())){			throw new NullPointerException("根据产品ID查询不到指定的产品！");		}		model.addAttribute("e", e);		return page_toEdit;	}	//分页查询商品	@Override	public String selectList(HttpServletRequest request,@ModelAttribute("e") SecureProduct e) throws Exception {		try {//            RequestHolder.getRequest().setAttribute("catalogs", systemManager.getCatalogs());//			e.setQueryCatalogIDs(SystemManager.getInstance().getCatalogsById(e.getCatalogID()));			User user = LoginUserHolder.getLoginUser();			e.setUid(user.getId());			super.selectList(request, e);			return page_toListAdmin;				} catch (Exception ex) {			ex.printStackTrace();			throw ex;		}	}		@Override	protected void setParamWhenInitQuery(SecureProduct e) {		super.setParamWhenInitQuery(e);		String selectOutOfStockProduct = RequestHolder.getRequest().getParameter("selectOutOfStockProduct");		if(StringUtils.isNotBlank(selectOutOfStockProduct)){			//后台--首页 需要查询缺货商品			e.setSelectOutOfStockProduct(Boolean.valueOf(selectOutOfStockProduct));		}	}	/**	 * ajax查询指定商品的图片集合	 * @return	 */	@Deprecated	@RequestMapping("ajaxLoadImgList")	@ResponseBody	public String ajaxLoadImgList(){		String id = RequestHolder.getRequest().getParameter("id");		String path = RequestHolder.getRequest().getSession().getServletContext().getRealPath("/");		System.out.println("path=" + path);//		path = path.substring(0, path.indexOf("WEB-INF"));//		System.out.println("path=" + path);		path = path+"/upload/"+id+"/";		System.out.println("path=" + path);				File dir = new File(path);		File[] fiels = dir.listFiles();		List<String> fileList = new LinkedList<String>();		if(fiels!=null && fiels.length>0){			String www_address = systemManager.getProperty("www_address");            for (int i=0;i<fiels.length;i++){				fileList.add(www_address + "/upload/"+id+"/"+fiels[i].getName());			}		}		String json = JSON.toJSONString(fileList);		System.out.println(json);		try {			return (json);		} catch (Exception ex) {			ex.printStackTrace();		}		return null;	}		/**	 *  添加产品	 */	@RequestMapping(value = "insertSecureProduct", method = RequestMethod.POST)	public String insertSecureProduct(HttpServletRequest request, SecureProduct e, ModelMap model) throws Exception {		logger.error(">>>insert secureProduct...");				e.setStatus(1);		e.setDeleteFlag(0);		e.setCreateAccount(getAccount());		int pid=getService().insertSecureProduct(e);		//insertSubProduct(e,pid);		e.setCreateAccount(getAccount());		model.addAttribute("e", e);		return page_toEdit;	}	/**	 *  添加子产品	 */	public void insertSubProduct(SecureProduct e,int pid) throws Exception {		List<SecureProductDetail> secureProductDetaillist=e.getSecureProductDetailList();		if(secureProductDetaillist!=null && secureProductDetaillist.size()>0){			for(int i=0;i<secureProductDetaillist.size();i++){				logger.error("=======保存子产品" + secureProductDetaillist.get(i));				SecureProductDetail subProduct = secureProductDetaillist.get(i);				if(subProduct.getSubName()!=null&&subProduct.getSubName().length() >0){					subProduct.setpId(String.valueOf(pid));					subProduct.setCreateAccount(getAccount());					int id=getService().insertSecureProductDetail(subProduct);				}							}		}else{			logger.error("=======保存失败");		}	}	/**	 * 更新产品	 */	public String updateSubProduct(HttpServletRequest request, SecureProductDetail e) throws Exception {		e.setUpdateAccount(getAccount());		getService().updateSecureProductDetail(e);		return null;	}		//获取后台管理人员的账号	private String getAccount(){		User user = LoginUserHolder.getLoginUser();		if(user==null){			throw new NullPointerException("登陆超时！");		}		return user.getUsername();	}		/**	 * 更新产品	 */	@Override	public String update(HttpServletRequest request, SecureProduct e, RedirectAttributes flushAttrs) throws Exception {		e.setUpdateAccount(getAccount());		//insertSubProduct(e,Integer.parseInt(e.getId()));		getService().update(e);		return "redirect:toEdit2?id="+ e.getId();	}	/**     * 公共的批量删除数据的方法，子类可以通过重写此方法实现个性化的需求。     *     * @return     * @throws Exception     */	@Override	        public String deletes(HttpServletRequest request, String[] ids, SecureProduct e, RedirectAttributes flushAttrs) throws Exception {	    			User user = LoginUserHolder.getLoginUser();				getService().deletes(ids,SecureProduct.Delete_flag_y,user.getUsername());        addMessage(flushAttrs, "操作成功！");        return "redirect:selectList";    }	/**	 * 上架指定商品	 * @return	 * @throws Exception 	 */	@RequestMapping(value = "updateUpProduct", method = RequestMethod.POST)	public String updateUpProduct(@ModelAttribute("e")SecureProduct e) throws Exception{		if(StringUtils.isBlank(e.getId())){			throw new NullPointerException();		}				User user = LoginUserHolder.getLoginUser();		secureProductService.updateProductStatus(new String[]{e.getId()},SecureProduct.Product_status_y,user.getUsername());//		getSession().setAttribute("insertOrUpdateMsg", "上架成功！");//		getResponse().sendRedirect(getEditUrl(e.getId()));		return "redirect:toEdit2?id="+e.getId();	}		/**	 * 下架指定商品	 * @return	 * @throws Exception 	 */	@RequestMapping(value = "updateDownProduct", method = RequestMethod.POST)	public String updateDownProduct(@ModelAttribute("e")SecureProduct e) throws Exception{		if(StringUtils.isBlank(e.getId())){			throw new NullPointerException();		}		User user = LoginUserHolder.getLoginUser();		secureProductService.updateProductStatus(new String[]{e.getId()},SecureProduct.Product_status_n,user.getUsername());//		getSession().setAttribute("insertOrUpdateMsg", "下架成功！");//		getResponse().sendRedirect(getEditUrl(e.getId()));		return "redirect:toEdit2?id="+e.getId();	}		/**	 * 商品上架	 * @return	 * @throws Exception 	 */	@RequestMapping(value = "updateUp", method = RequestMethod.POST)	public String updateUp(@ModelAttribute("e")SecureProduct e,String[] ids) throws Exception{		//		String[] ids = e.getId().split(",");//		 List<String> tmp = new ArrayList<String>();//	        for(String str:ids){//	            if(str!=null && str.length()!=0){//	                tmp.add(str);//	            }//	        }//	        ids = tmp.toArray(new String[0]);		updateStatus(ids,SecureProduct.Product_status_y);		return "redirect:selectList";		//return selectList(RequestHolder.getRequest(), new SecureProduct());	}		/**	 * 商品下架	 * @return	 * @throws Exception 	 */	@RequestMapping(value = "updateDown", method = RequestMethod.POST)	public String updateDown(@ModelAttribute("e")SecureProduct e,String[] ids) throws Exception{//		String[] ids = e.getId().split(",");//		//		 List<String> tmp = new ArrayList<String>();//	        for(String str:ids){//	            if(str!=null && str.length()!=0){//	                tmp.add(str);//	            }//	        }//	        ids = tmp.toArray(new String[0]);		updateStatus(ids, SecureProduct.Product_status_n);		return selectList(RequestHolder.getRequest(), new SecureProduct());	}		private void updateStatus(String[] ids, int status){		User user = LoginUserHolder.getLoginUser();		secureProductService.updateProductStatus(ids,status,user.getUsername());	}		/**	 * 根据选择的商品图片名称来删除商品图片	 * @return	 * @throws IOException 	 */	@RequestMapping(value = "deleteImageByImgPaths", method = RequestMethod.POST)	public String deleteImageByImgPaths(@ModelAttribute("e")SecureProduct e, String[] imagePaths) throws IOException{		String id = e.getId();		if(imagePaths!=null & imagePaths.length>0){			SecureProduct ee = secureProductService.selectById(id);			if(StringUtils.isNotBlank(ee.getImages())){				String[] images = ee.getImages().split(ManageContainer.product_images_spider);				//和该商品的图片集合比对，找出不删除的图片然后保存到库				for(int i=0;i<imagePaths.length;i++){					for(int j=0;j<images.length;j++){						if(imagePaths[i].equals(images[j])){							images[j] = null;							break;						}					}					imagePaths[i] = null;				}				StringBuilder buff = new StringBuilder();				for(int j=0;j<images.length;j++){					if(images[j]!=null){						buff.append(images[j]+",");					}				}				ee.clear();				ee.setId(id);				ee.setImages(buff.toString());				if(ee.getImages().equals("")){					ee.setImages(ManageContainer.product_images_spider);//全部删除了				}				secureProductService.update(ee);			}			imagePaths = null;		}//		getResponse().sendRedirect(getEditUrl(id));		return "redirect:toEdit2?id="+id;	}			/**	 * 把所有商品的大图更新为小图	 * @return	 */	public String test10() {		logger.error("test10...");		List<SecureProduct> list =secureProductService.selectList(new SecureProduct());		for(int i=0;i<list.size();i++){			SecureProduct pp = list.get(i);			String img = pp.getPicture();			if(StringUtils.isBlank(img)){				continue;			}			String[] arr = img.split("_");			if(arr.length==2){				String fx = img.substring(img.lastIndexOf("."));				SecureProduct p = new SecureProduct();				p.setId(pp.getId());				p.setPicture(arr[0]+"_1"+fx);								if(pp.getIsnew().toString().equals("0")){					p.setIsnew(SecureProduct.Product_isnew_n);				}else{					p.setIsnew(SecureProduct.Product_isnew_y);				}								if(pp.getSale().toString().equals("0")){					p.setSale(SecureProduct.Product_sale_n);				}else{					p.setSale(SecureProduct.Product_sale_y);				}								logger.error("p.getPicture = " + p.getPicture());				secureProductService.updateImg(p);				//				throw new NullPointerException();			}		}				return null;	}		/**	 * @description 用户编辑页面查询该用户已绑定的所有产品	 * @author lin	 * @return	 * @throws Exception	 */	@RequestMapping("userProductList")	public String userProductList(HttpServletRequest request, ModelMap model , @ModelAttribute("e") SecureProduct e) throws Exception {		// 用户编号		String uid = request.getParameter("uid");		// 用户名存入session 供显示用		if (request.getParameter("uname") != null) {			RequestHolder.getSession().setAttribute("userName", request.getParameter("uname"));			RequestHolder.getSession().setAttribute("uid", uid);		}				super.selectList(request, e);		//分页查询//       /* this.initPageSelect();////        setParamWhenInitQuery(e);////        int offset = 0;//分页偏移量//        if (request.getParameter("pager.offset") != null) {//            offset = Integer.parseInt(request.getParameter("pager.offset"));//        }//        if (offset < 0) offset = 0;//        e.setOffset(offset);//        PagerModel pager = getService().selectProductPageList(e);//        if (pager == null) {//            pager = new PagerModel();//        }//        // 计算总页数//        pager.setPagerSize((pager.getTotal() + pager.getPageSize() - 1)  / pager.getPageSize());////        selectListAfter(pager);//        request.setAttribute("pager", pager);*/				return showBindProduct;	}	/**	 * 查询所有商品 标记已绑定的	 * 	 * @param request	 * @param ids	 *     已绑定的产品编号	 * @return	 * @throws Exception	 */	@RequestMapping("getAllProduct")	public String getAllProduct(HttpServletRequest request, @ModelAttribute("e") SecureProduct e)			throws Exception {		try {			HttpSession sess = RequestHolder.getSession();			String uid = e.getUid();			e.setUid("");			//e.setStatus(1); //查询所有已上架的产品			super.selectList(request, e);			e.setUid(uid);			userProduct u = new userProduct();			u.setUser_id(uid);			//查询该用户的所有产品信息			List<userProduct> idsList = getService().selectIDListFromUserProduct(u);			String ids = "";			if(idsList.size()>0){				 Iterator<userProduct> up = idsList.iterator(); 				 while(up.hasNext()){					 userProduct userproduct  = up.next();					 ids += "," + userproduct.getProduct_id();				 }				 ids = ids.substring(1,ids.length());			}			//所有产品id串返回前台供勾选			sess.setAttribute("repeatIds", ids);			return showAllProduct;		} catch (Exception ex) {			ex.printStackTrace();			throw ex;		}	}		/**	 * @Description: TODO(给用户绑定商品) 	 * @author lyx	 * @date 2016年9月21日 下午4:10:01 	 * @return String 返回类型 @throws	 */	@RequestMapping("bindUserProduct")	public String bindUserProduct(HttpServletRequest request, @ModelAttribute("e") SecureProduct e ) {		String userId = "";		String ids = request.getParameter("ids");		String uid ="";		userId = RequestHolder.getSession().getAttribute("uid").toString();//获取当前用户名		if(RequestHolder.getSession().getAttribute("userName")!=null){			 uid = RequestHolder.getSession().getAttribute("uid").toString();		}		int secureProductIDS = secureProductService.bindUserProduct(ids,uid);		logger.info("共插入了"+(secureProductIDS+1)+"条记录");					//查询该用户编号下的所有产品		try {			e.setUid(userId);			userProductList(request, null, e) ;		} catch (Exception e1) {			e1.printStackTrace();		}		return "redirect:userProductList?uid="+uid;	}}