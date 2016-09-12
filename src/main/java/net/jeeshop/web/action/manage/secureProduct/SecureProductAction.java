package net.jeeshop.web.action.manage.secureProduct;import com.alibaba.fastjson.JSON;import net.jeeshop.core.ManageContainer;import net.jeeshop.core.front.SystemManager;import net.jeeshop.core.oscache.ManageCache;import net.jeeshop.core.system.bean.User;import net.jeeshop.services.front.product.bean.ProductStockInfo;import net.jeeshop.services.manage.attribute.AttributeService;import net.jeeshop.services.manage.attribute.bean.Attribute;import net.jeeshop.services.manage.attribute_link.Attribute_linkService;import net.jeeshop.services.manage.attribute_link.bean.Attribute_link;import net.jeeshop.services.manage.gift.GiftService;import net.jeeshop.services.manage.gift.bean.Gift;import net.jeeshop.services.manage.secureProduct.SecureProductService;import net.jeeshop.services.manage.secureProduct.bean.SecureProduct;import net.jeeshop.services.manage.spec.SpecService;import net.jeeshop.services.manage.spec.bean.Spec;import net.jeeshop.web.action.BaseController;import net.jeeshop.web.util.LoginUserHolder;import net.jeeshop.web.util.RequestHolder;import org.apache.commons.lang.StringUtils;import org.slf4j.Logger;import org.slf4j.LoggerFactory;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.stereotype.Controller;import org.springframework.ui.ModelMap;import org.springframework.web.bind.annotation.ModelAttribute;import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.RequestMethod;import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.web.servlet.mvc.support.RedirectAttributes;import javax.servlet.http.HttpServletRequest;import java.io.File;import java.io.IOException;import java.util.*;/** * 商品信息管理1 *  * @author jqsl2012@163.com * @author dylan *  */@Controller@RequestMapping("/manage/secureProduct/")public class SecureProductAction extends BaseController<SecureProduct> {	private static final Logger logger = LoggerFactory.getLogger(SecureProductAction.class);	private static final long serialVersionUID = 1L;	@Autowired	private SecureProductService secureProductService;	@Autowired	private AttributeService attributeService;	@Autowired	private Attribute_linkService attribute_linkService;	@Autowired	private ManageCache manageCache;	@Autowired	private SpecService specService;	@Autowired	private GiftService giftService;	private static final String page_toList = "/manage/secureProduct/secureProductList";	private static final String page_toEdit = "/manage/secureProduct/secureProductEdit";	private static final String page_toAdd = "/manage/secureProduct/secureProductEdit";	private SecureProductAction() {		super.page_toList = page_toList;		super.page_toAdd = page_toAdd;		super.page_toEdit = page_toEdit;	}	public GiftService getGiftService() {		return giftService;	}	public void setGiftService(GiftService giftService) {		this.giftService = giftService;	}	public SpecService getSpecService() {		return specService;	}	public void setSpecService(SpecService specService) {		this.specService = specService;	}	public AttributeService getAttributeService() {		return attributeService;	}	public ManageCache getManageCache() {		return manageCache;	}	public void setManageCache(ManageCache manageCache) {		this.manageCache = manageCache;	}	public void setAttributeService(AttributeService attributeService) {		this.attributeService = attributeService;	}	public Attribute_linkService getAttribute_linkService() {		return attribute_linkService;	}	public void setAttribute_linkService(Attribute_linkService attribute_linkService) {		this.attribute_linkService = attribute_linkService;	}		public SecureProductService getService() {		return secureProductService;	}	public void setSecureProductService(SecureProductService secureProductService) {		this.secureProductService = secureProductService;	}	/**	 * 添加商品	 */	@Override	public String toAdd(@ModelAttribute("e") SecureProduct e, ModelMap model) throws Exception {		e.setId(null);        model.addAttribute("catalogs", systemManager.getCatalogs());		String chanageCatalog = RequestHolder.getRequest().getParameter("chanageCatalog");		if(StringUtils.isNotBlank(chanageCatalog)){			if(Boolean.valueOf(chanageCatalog)){				String catalog = RequestHolder.getRequest().getParameter("catalog");//新目录				logger.error("添加商品-修改目录 。catalog = " + catalog + ",chanageCatalog = " + chanageCatalog);//				e.clear();				e.setCatalogID(catalog);								//加载指定类别下商品属性和参数				changeCatalog(e, true);//				return page_toAdd;			}else{				throw new NullPointerException("请求非法！");			}		}				//List<Gift> giftList = loadGiftList();		//model.addAttribute("giftList", giftList);				return page_toAdd;	}		/**	 * 加载商品赠品列表	 */	private List<Gift> loadGiftList(){		Gift gift = new Gift();		gift.setStatus(Gift.gift_status_up);		List<Gift> giftList = giftService.selectList(gift);		return giftList;	}		//列表页面点击 编辑商品	@Override	public String toEdit(@ModelAttribute("e")SecureProduct e, ModelMap model) throws Exception {//		getSession().setAttribute("insertOrUpdateMsg", "");		return toEdit0(e, model);	}	/**	 * 修改商品的类别，会联动清除商品已有的属性和参数	 * @return	 * @throws Exception	 */	@RequestMapping(value = "updateProductCatalog", method = RequestMethod.POST)	public String updateProductCatalog(SecureProduct e, ModelMap model) throws Exception {//		getSession().setAttribute("insertOrUpdateMsg", "");		return toEdit0(e, model);	}		/**	 * 添加或编辑商品后程序回转编辑	 * @return	 * @throws Exception	 */	@RequestMapping(value = "toEdit2")	public String toEdit2(SecureProduct e, ModelMap model) throws Exception {		return toEdit0(e, model);	}	/**	 * 根据商品ID，加载商品全部信息	 */	private String toEdit0(SecureProduct e, ModelMap model) throws Exception {        RequestHolder.getRequest().setAttribute("catalogs", systemManager.getCatalogs());		if(StringUtils.isBlank(e.getId())){			throw new NullPointerException("商品ID不能为空！");		}				e = getService().selectById(e.getId());		if(e==null || StringUtils.isBlank(e.getId())){			throw new NullPointerException("根据商品ID查询不到指定的商品！");		}		model.addAttribute("e", e);				//加载商品图片列表		if(StringUtils.isNotBlank(e.getImages())){			if(e.getImagesList()==null){				e.setImagesList(new LinkedList<String>());			}else{				e.getImagesList().clear();			}			String[] _images = e.getImages().split(ManageContainer.product_images_spider);			for(int i=0;i<_images.length;i++){				if(StringUtils.isNotBlank(_images[i])){					e.getImagesList().add(_images[i]);				}			}		}else{			if(e.getImagesList()==null){				e.setImagesList(Collections.EMPTY_LIST);			}else{				e.getImagesList().clear();			}		}		//如果未切换商品目录，则加载商品目录		if(!changeCatalog(e, false)){			if(StringUtils.isNotBlank(e.getCatalogID())){				int catalogID = Integer.valueOf(e.getCatalogID());				loadAttribute(e, catalogID);				loadParameter(e, catalogID);				loadSpec(e);			}		}		List<Gift> giftList = loadGiftList();		model.addAttribute("giftList", giftList);		return page_toEdit;	}		/**	 * 加载商品规格	 */	private void loadSpec(SecureProduct p){		if(StringUtils.isBlank(p.getId())){			logger.error("loadSpec id = " + p.getId());			return;		}				Spec specInfo = new Spec();		specInfo.setProductID(p.getId());		p.setSpecList(specService.selectList(specInfo));				if(p.getSpecList()!=null){			logger.error("loadSpec = p.getSpecList() = " + p.getSpecList().size());		}else{			logger.error("loadSpec = p.getSpecList() is null");		}				if(p.getSpecList()!=null && p.getSpecList().size() > 0){						//如果有规格，则添加3个到集合的最后，以方便添加数据			for(int i=0;i<3;i++){				p.getSpecList().add(new Spec());			}					}else{						//如果没有规格，则默认添加10个空的，以方便添加数据			if(p.getSpecList()==null){				p.setSpecList(new ArrayList<Spec>(10));			}			for(int i=0;i<10;i++){				p.getSpecList().add(new Spec());			}		}	}		/**	 * 如果添加或编辑商品的时候切换了商品目录，则该商品的属性和参数得重新加载。	 * @return true：重新加载商品的属性和参数。	 */	private boolean changeCatalog(SecureProduct e, boolean toAdd){		String chanageCatalog = RequestHolder.getRequest().getParameter("chanageCatalog");		if(toAdd){			chanageCatalog = "true";		}				if(StringUtils.isNotBlank(chanageCatalog)){			if(Boolean.valueOf(chanageCatalog)){//				getSession().setAttribute("insertOrUpdateMsg", "改变商品目录，已重新加载了商品的属性和参数。");				int catalog = Integer.valueOf(RequestHolder.getRequest().getParameter("catalog"));				logger.error("catalogID====="+catalog);				//删除该商品之前的目录对应的属性和参数				if(StringUtils.isNotBlank(e.getId())){					Attribute_link attrLink = new Attribute_link();					attrLink.setProductID(Integer.valueOf(e.getId()));					attribute_linkService.deleteByCondition(attrLink);				}								e.setCatalogID(String.valueOf(catalog));				//切换商品目录，则自动切换商品属性和参数				loadAttribute(e, catalog);				loadParameter(e, catalog);				return true;			}		}		return false;	}	/**	 * 根据商品分类加载商品属性列表	 * @catalogID 商品类别ID	 */	private void loadParameter(SecureProduct e, int catalogID) {		Attribute attr = new Attribute();		attr.setCatalogID(catalogID);		attr.setPid(-1);		attr = this.attributeService.selectOne(attr);//加载参数主属性，一个参数下包含多个子参数		if(attr!=null){			//加载每个属性下的子属性列表			int id = Integer.valueOf(attr.getId());			attr.clear();			attr.setPid(id);//			attr.setPid(0);			attr.setCatalogID(0);			//@@@			e.setParameterList(this.attributeService.selectList(attr));		}				//如果商品ID不存在，则不加载商品选中的参数列表		if(StringUtils.isBlank(e.getId())){			return;		}				//加载商品参数		if(e.getParameterList()!=null && e.getParameterList().size()>0){			Attribute_link attrLink = new Attribute_link();			attrLink.setProductID(Integer.valueOf(e.getId()));			//查询参数列表			List<Attribute_link> attrLinkList = attribute_linkService.selectList(attrLink);			if(attrLinkList!=null && attrLinkList.size()>0){								for(int i=0;i<e.getParameterList().size();i++){//循环主属性					Attribute itemInfo = e.getParameterList().get(i);					int _attrID = Integer.valueOf(itemInfo.getId());					for(int k=0;k<attrLinkList.size();k++){//循环用户选择的属性						Attribute_link al = attrLinkList.get(k);						if(al.getAttrID()==_attrID){							itemInfo.setParameterValue(al.getValue());							break;						}					}				}							}		}	}	/**	 * 根据商品分类加载商品属性列表	 * @catalogID 商品类别ID	 */	private void loadAttribute(SecureProduct e, int catalogID) {		Attribute attr = new Attribute();		attr.setCatalogID(catalogID);		List<Attribute> attrList = this.attributeService.selectList(attr);		//加载每个属性下的子属性列表		if(attrList!=null && attrList.size()>0){			attr.setCatalogID(0);			attr.setPid(0);//属性的			for(int i=0;i<attrList.size();i++){				Attribute item = attrList.get(i);				attr.setPid(Integer.valueOf(item.getId()));				//###				item.setAttrList(this.attributeService.selectList(attr));			}		}		e.setAttrList(attrList);				//如果商品ID不存在，则不加载商品选中的属性列表		if(StringUtils.isBlank(e.getId())){			return;		}				//加载商品所选中的属性列表		Attribute_link attrLink = new Attribute_link();		attrLink.setProductID(Integer.valueOf(e.getId()));		List<Attribute_link> attrLinkList = attribute_linkService.selectList(attrLink);		if(attrLinkList!=null && attrLinkList.size()>0){			if(e.getAttrList()!=null && e.getAttrList().size()>0){//				for(int i=0;i<attrLinkList.size();i++){//					Attribute_link al = attrLinkList.get(i);//					loop:for(int j=0;j<e.getAttrList().size();j++){//						List<Attribute> attrItemList = e.getAttrList().get(j).getAttrList();//						for(int k=0;k<attrItemList.size();k++){//							Attribute attrInfo = attrItemList.get(k);//							int _selected = Integer.valueOf(attrInfo.getId());//							//选中用户设置的属性//							if(al.getAttrID()==_selected){//								attrInfo.setSelectedID(_selected);//								break loop;//							}//						}//					}//				}												for(int i=0;i<e.getAttrList().size();i++){//循环主属性					Attribute mainAttr = e.getAttrList().get(i);					List<Attribute> itemList = mainAttr.getAttrList();					loop:for(int j=0;j<itemList.size();j++){//循环子属性列表						Attribute itemInfo = itemList.get(j);						int _attrID = Integer.valueOf(itemInfo.getId());						for(int k=0;k<attrLinkList.size();k++){//循环用户选择的属性							Attribute_link al = attrLinkList.get(k);							if(al.getAttrID()==_attrID){								mainAttr.setSelectedID(_attrID);								break loop;							}						}					}				}							}		}	}	//分页查询商品	@Override	public String selectList(HttpServletRequest request,@ModelAttribute("e") SecureProduct e) throws Exception {		try {            RequestHolder.getRequest().setAttribute("catalogs", systemManager.getCatalogs());			e.setQueryCatalogIDs(SystemManager.getInstance().getCatalogsById(e.getCatalogID()));			super.selectList(request, e);			return page_toList;		} catch (Exception ex) {			ex.printStackTrace();			throw ex;		}	}		@Override	protected void setParamWhenInitQuery(SecureProduct e) {		super.setParamWhenInitQuery(e);		String selectOutOfStockProduct = RequestHolder.getRequest().getParameter("selectOutOfStockProduct");		if(StringUtils.isNotBlank(selectOutOfStockProduct)){			//后台--首页 需要查询缺货商品			e.setSelectOutOfStockProduct(Boolean.valueOf(selectOutOfStockProduct));		}	}	/**	 * ajax查询指定商品的图片集合	 * @return	 */	@Deprecated	@RequestMapping("ajaxLoadImgList")	@ResponseBody	public String ajaxLoadImgList(){		String id = RequestHolder.getRequest().getParameter("id");		String path = RequestHolder.getRequest().getSession().getServletContext().getRealPath("/");		System.out.println("path=" + path);//		path = path.substring(0, path.indexOf("WEB-INF"));//		System.out.println("path=" + path);		path = path+"/upload/"+id+"/";		System.out.println("path=" + path);				File dir = new File(path);		File[] fiels = dir.listFiles();		List<String> fileList = new LinkedList<String>();		if(fiels!=null && fiels.length>0){			String www_address = systemManager.getProperty("www_address");            for (int i=0;i<fiels.length;i++){				fileList.add(www_address + "/upload/"+id+"/"+fiels[i].getName());			}		}		String json = JSON.toJSONString(fileList);		System.out.println(json);		try {			return (json);		} catch (Exception ex) {			ex.printStackTrace();		}		return null;	}		/**	 *  添加产品	 */	@Override	public String insert(HttpServletRequest request, SecureProduct e, RedirectAttributes flushAttrs) throws Exception {		logger.error(">>>insert product...");				e.setStatus(0);		e.setCreateAccount(getAccount());		//		if(e.getPicture().indexOf(""))		int productID = getService().insert(e);//		e.clear();//		e.setId(String.valueOf(productID));		//sunshuo注释掉		//insertOrUpdateCommon(e);//		clearCache();//		getSession().setAttribute("insertOrUpdateMsg", "添加产品成功！");//		getResponse().sendRedirect(getEditUrl(String.valueOf(productID)));		return "redirect:selectList?init=y";	}	//获取后台管理人员的账号	private String getAccount(){		User user = LoginUserHolder.getLoginUser();		if(user==null){			throw new NullPointerException("登陆超时！");		}		return user.getUsername();	}		/**	 * 更新产品	 */	@Override	public String update(HttpServletRequest request, SecureProduct e, RedirectAttributes flushAttrs) throws Exception {		logger.error(">>>update product..."+e.getCatalogID());				String id = e.getId();		SecureProduct ee = secureProductService.selectById(id);				boolean loadReport = false;		//如果库存原来是0,现在变成大于0的了,那么需要重新加载商品库存数据		if (ee.getStock() <= 0 && e.getStock() > 0) {			loadReport = true;		}		e.setUpdateAccount(getAccount());		getService().update(e);//		e.clear();//		e.setId(id);//		getE().setStatus(1);//		getE().setName(null);		//sunshuo注释掉		//insertOrUpdateCommon(e);				if(loadReport){			manageCache.loadOrdersReport();		}//		clearCache();//		updateMsg = "更新产品成功！";//		getSession().setAttribute("insertOrUpdateMsg", "更新产品成功！");//		getResponse().sendRedirect(getEditUrl(id));		return "redirect:toEdit2?id="+ e.getId();	}		/**	 * 添加或更新商品的公共功能	 * @throws IOException	 */	private void insertOrUpdateCommon(SecureProduct e) throws IOException {		logger.error("=insertOrUpdateCommon=");				/**		 * 同步内存商品库存数据		 */        Map<String, ProductStockInfo> productStockMap = systemManager.getProductStockMap();        ProductStockInfo momeryProduct = productStockMap.get(e.getId());		List<String> productIDs = new LinkedList<String>();		productIDs.add(e.getId());		SecureProduct proObject = secureProductService.selectStockByIDs(productIDs).get(0);				if(momeryProduct==null){			ProductStockInfo p = new ProductStockInfo();			p.setId(proObject.getId());			p.setStock(proObject.getStock());			p.setScore(proObject.getScore());			productStockMap.put(proObject.getId(), p);            //update stock map            systemManager.setProductStockMap(productStockMap);		}else{			momeryProduct.setStock(proObject.getStock());			momeryProduct.setScore(proObject.getScore());		}				//上传图片//		uploadImages();				//删除产品旧的属性列表		Attribute_link oldAttr = new Attribute_link();		oldAttr.setProductID(Integer.valueOf(e.getId()));		attribute_linkService.deleteByCondition(oldAttr);				//保存商品属性//		e.setAttrSelectIds(RequestHolder.getRequest().getParameterValues("attrSelectIds"));		logger.error("attrSelectIds="+e.getAttrSelectIds());		if(e.getAttrSelectIds()!=null && e.getAttrSelectIds().length>0){			for(int i=0;i<e.getAttrSelectIds().length;i++){				String attrID = e.getAttrSelectIds()[i];				if(StringUtils.isBlank(attrID)){					continue;				}				//插入数据到属性中间表				Attribute_link attrLink = new Attribute_link();				attrLink.setAttrID(Integer.valueOf(attrID));				attrLink.setProductID(Integer.valueOf(e.getId()));				attribute_linkService.insert(attrLink);			}		}				//保存商品参数//		e.setParameterIds(RequestHolder.getRequest().getParameterValues("id"));//		e.setParameterNames(RequestHolder.getRequest().getParameterValues("parameterValue"));		if(e.getParameterNames()!=null && e.getParameterNames().length>0){			for(int i=0;i<e.getParameterNames().length;i++){				String pName = e.getParameterNames()[i];				if(StringUtils.isBlank(pName)){					continue;				}				//插入数据到属性中间表				Attribute_link attrLink = new Attribute_link();				attrLink.setAttrID(Integer.valueOf(e.getParameterIds()[i]));				attrLink.setValue(pName);				attrLink.setProductID(Integer.valueOf(e.getId()));				attribute_linkService.insert(attrLink);			}		}	}		/**	 * 上架指定商品	 * @return	 * @throws Exception 	 */	@RequestMapping(value = "updateUpProduct", method = RequestMethod.POST)	public String updateUpProduct(@ModelAttribute("e")SecureProduct e) throws Exception{		if(StringUtils.isBlank(e.getId())){			throw new NullPointerException();		}				User user = LoginUserHolder.getLoginUser();		secureProductService.updateProductStatus(new String[]{e.getId()},SecureProduct.Product_status_y,user.getUsername());//		getSession().setAttribute("insertOrUpdateMsg", "上架成功！");//		getResponse().sendRedirect(getEditUrl(e.getId()));		return "redirect:toEdit2?id="+e.getId();	}		/**	 * 下架指定商品	 * @return	 * @throws Exception 	 */	@RequestMapping(value = "updateDownProduct", method = RequestMethod.POST)	public String updateDownProduct(@ModelAttribute("e")SecureProduct e) throws Exception{		if(StringUtils.isBlank(e.getId())){			throw new NullPointerException();		}		User user = LoginUserHolder.getLoginUser();		secureProductService.updateProductStatus(new String[]{e.getId()},SecureProduct.Product_status_n,user.getUsername());//		getSession().setAttribute("insertOrUpdateMsg", "下架成功！");//		getResponse().sendRedirect(getEditUrl(e.getId()));		return "redirect:toEdit2?id="+e.getId();	}		/**	 * 商品上架	 * @return	 * @throws Exception 	 */	@RequestMapping(value = "updateUp", method = RequestMethod.POST)	public String updateUp(@ModelAttribute("e")SecureProduct e) throws Exception{				String[] ids = e.getId().split(",");		 List<String> tmp = new ArrayList<String>();	        for(String str:ids){	            if(str!=null && str.length()!=0){	                tmp.add(str);	            }	        }	        ids = tmp.toArray(new String[0]);		updateStatus(ids,SecureProduct.Product_status_y);		return "redirect:selectList";		//return selectList(RequestHolder.getRequest(), new SecureProduct());	}		/**	 * 商品下架	 * @return	 * @throws Exception 	 */	@RequestMapping(value = "updateDown", method = RequestMethod.POST)	public String updateDown(@ModelAttribute("e")SecureProduct e) throws Exception{		String[] ids = e.getId().split(",");				 List<String> tmp = new ArrayList<String>();	        for(String str:ids){	            if(str!=null && str.length()!=0){	                tmp.add(str);	            }	        }	        ids = tmp.toArray(new String[0]);		updateStatus(ids, SecureProduct.Product_status_n);		return selectList(RequestHolder.getRequest(), new SecureProduct());	}		private void updateStatus(String[] ids, int status){		User user = LoginUserHolder.getLoginUser();		secureProductService.updateProductStatus(ids,status,user.getUsername());	}		/**	 * 根据选择的商品图片名称来删除商品图片	 * @return	 * @throws IOException 	 */	@RequestMapping(value = "deleteImageByImgPaths", method = RequestMethod.POST)	public String deleteImageByImgPaths(@ModelAttribute("e")SecureProduct e, String[] imagePaths) throws IOException{		String id = e.getId();		if(imagePaths!=null & imagePaths.length>0){			SecureProduct ee = secureProductService.selectById(id);			if(StringUtils.isNotBlank(ee.getImages())){				String[] images = ee.getImages().split(ManageContainer.product_images_spider);				//和该商品的图片集合比对，找出不删除的图片然后保存到库				for(int i=0;i<imagePaths.length;i++){					for(int j=0;j<images.length;j++){						if(imagePaths[i].equals(images[j])){							images[j] = null;							break;						}					}					imagePaths[i] = null;				}				StringBuilder buff = new StringBuilder();				for(int j=0;j<images.length;j++){					if(images[j]!=null){						buff.append(images[j]+",");					}				}				ee.clear();				ee.setId(id);				ee.setImages(buff.toString());				if(ee.getImages().equals("")){					ee.setImages(ManageContainer.product_images_spider);//全部删除了				}				secureProductService.update(ee);			}			imagePaths = null;		}//		getResponse().sendRedirect(getEditUrl(id));		return "redirect:toEdit2?id="+id;	}		/**	 * 设置指定的图片为产品的默认图片	 * @return	 * @throws Exception 	 *///	@Deprecated//	public String setProductImageToDefault() throws Exception{////		productService.downGoods(getIds());////		Product goods = new Product();////		String imageUrl = getRequest().getParameter("imageUrl");////		imageUrl = "upload/"+getRequest().getParameter("id")+"/"+imageUrl.substring(imageUrl.lastIndexOf("/"));//取出相对路径////		goods.setId(getRequest().getParameter("id"));////		goods.setPicture(imageUrl);////		productService.update(goods);////		getResponse().getWriter().write("0");//		return null;//	}	/**	 * 删除指定的图片	 * @return	 * @throws Exception 	 */	@Deprecated//	public String deleteImageByProductID() throws Exception{//		//项目的物理地址//		String filePath = SystemManager.getInstance().get("file_path");////		goodsService.downGoods(getIds());//		Product goods = new Product();//		String imageUrl = getRequest().getParameter("imageUrl");//		String imageName = imageUrl.substring(imageUrl.lastIndexOf("/")+1);//		imageUrl = "upload/"+imageName;//		filePath += "\\upload\\"+getRequest().getParameter("id")+"\\"+imageName;//取出相对路径//		//		//删除图片文件//		System.out.println("filePath=="+filePath);//		File file = new File(filePath);//		if(file.exists()){//			file.delete();//		}////		FileUtils.deleteDirectory(new File(filePath));//		//		goods.setId(getRequest().getParameter("id"));////		goods.setPicture(imageUrl);//		goods = productService.selectOne(goods);//		if(goods!=null && goods.getPicture().equals(imageUrl)){//			//如果图片被设置为了封面图片，则删除//		}//		getResponse().getWriter().write("0");//		return null;//	}		/**	 * 批量生成测试用的商品	 * @return	 * @throws Exception	 * http://127.0.0.1:8080/myshop/manage/product!createTestProducts.action?_refProductID=10013&_refCatalogID=58&_refNum=33	 * http://127.0.0.1:8080/myshop/manage/product!createTestProducts.action?_refProductID=10009&_refCatalogID=28&_refNum=33	 *///	public String createTestProducts() throws Exception {//		String _refProductID = getRequest().getParameter("_refProductID");//参考商品ID//		String _refCatalogID = getRequest().getParameter("_refCatalogID");//参考类别ID//		int _refNum = Integer.valueOf(getRequest().getParameter("_refNum"));//生成数量//		if(StringUtils.isBlank(_refProductID) || StringUtils.isBlank(_refCatalogID) || _refNum<=0){//			throw new NullPointerException();//		}////		Product refp = productService.selectById(_refProductID);//		if(refp==null || StringUtils.isBlank(refp.getId())){//			throw new NullPointerException();//		}////		for(int i=0;i<_refNum;i++){//			Product product0 = new Product();//			product0.setName(refp.getName()+"_"+(i+1));//			product0.setCatalogID(refp.getCatalogID());//			product0.setPicture(refp.getPicture());//			product0.setPrice(refp.getPrice());//			product0.setNowPrice(refp.getNowPrice());//			product0.setSellcount(refp.getSellcount());//			product0.setStock(refp.getStock());//			product0.setIsnew(refp.getIsnew());//			product0.setSale(refp.getSale());//			product0.setTitle(refp.getTitle());//			product0.setDescription(refp.getDescription());//			product0.setKeywords(refp.getKeywords());//			product0.setIntroduce(refp.getIntroduce());//			product0.setImages(refp.getImages());//			product0.setProductHTML(refp.getProductHTML());//			product0.setStatus(refp.getStatus());////			productService.insert(product0);//		}//		return selectList();//	}		//	public String test2() throws IOException{//		List<Product> list = productService.selectList(new Product());//		for(int i=0;i<list.size();i++){//			Product pp = list.get(i);//			if(StringUtils.isNotBlank(pp.getProductHTML())){//				//				Product ppp = new Product();//				ppp.setId(pp.getId());//				ppp.setProductHTML(pp.getProductHTML().replace("http://jeeshopxx.oss.aliyuncs.com/", "http://myshopxx.oss.aliyuncs.com/"));//				//				logger.error(">>>test2>>"+ppp.getProductHTML());//				productService.update(ppp);//			}//		}//		//		getResponse().getWriter().write("success");//		return null;//	}		/**	 * 把所有商品的大图更新为小图	 * @return	 */	public String test10() {		logger.error("test10...");		List<SecureProduct> list =secureProductService.selectList(new SecureProduct());		for(int i=0;i<list.size();i++){			SecureProduct pp = list.get(i);			String img = pp.getPicture();			if(StringUtils.isBlank(img)){				continue;			}			String[] arr = img.split("_");			if(arr.length==2){				String fx = img.substring(img.lastIndexOf("."));				SecureProduct p = new SecureProduct();				p.setId(pp.getId());				p.setPicture(arr[0]+"_1"+fx);								if(pp.getIsnew().toString().equals("0")){					p.setIsnew(SecureProduct.Product_isnew_n);				}else{					p.setIsnew(SecureProduct.Product_isnew_y);				}								if(pp.getSale().toString().equals("0")){					p.setSale(SecureProduct.Product_sale_n);				}else{					p.setSale(SecureProduct.Product_sale_y);				}								logger.error("p.getPicture = " + p.getPicture());				secureProductService.updateImg(p);				//				throw new NullPointerException();			}		}				return null;	}}