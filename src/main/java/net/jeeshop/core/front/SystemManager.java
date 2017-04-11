package net.jeeshop.core.front;

import com.google.common.collect.Lists;
import net.jeeshop.core.cache.CacheProvider;
import net.jeeshop.core.cache.SimpleCacheProvider;
import net.jeeshop.core.listener.SystemListener;
import net.jeeshop.services.front.catalog.bean.Catalog;
import net.jeeshop.services.front.indexImg.bean.IndexImg;
import net.jeeshop.services.front.product.bean.Product;
import net.jeeshop.services.front.product.bean.ProductStockInfo;
import net.jeeshop.services.manage.accountRank.bean.AccountRank;
import net.jeeshop.services.manage.order.bean.OrdersReport;
import net.jeeshop.services.manage.systemSetting.bean.SystemSetting;
import org.apache.commons.lang.StringUtils;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;


/**
 * 系统管理类.
 * 1、负责管理system.properties的东东
 * 2、负责缓存管理
 * @author huangf
 */
public class SystemManager {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SystemManager.class);
	private static Properties p = new Properties();
    private static CacheProvider cacheProvider = new SimpleCacheProvider();
	private static SystemManager instance;

    @PostConstruct
    public void afterPropertiesSet(){
        instance = this;
    }
	  private SystemSetting systemSetting;//系统设置
	private static Map<String,String> manageExpressMap = new HashMap<String, String>();//后台发货页面物流公司列表

    public static SystemManager getInstance(){
        return instance;
    }

    static {
		init();
	}
	private static void init(){
		try {
			p.load(SystemListener.class
					.getResourceAsStream("/system.properties"));
			logger.info(p.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

        manageExpressMap.put("shunfeng", "顺风快递");
        manageExpressMap.put("ems", "EMS");
        manageExpressMap.put("shentong", "申通E物流");
        manageExpressMap.put("yuantong", "圆通速递");
        manageExpressMap.put("zhongtong", "中通速递");
        manageExpressMap.put("zhaijisong", "宅急送");
        manageExpressMap.put("yunda", "韵达快运");
        manageExpressMap.put("tiantian", "天天快递");
        manageExpressMap.put("lianbangkuaidi", "联邦快递");
        manageExpressMap.put("huitongkuaidi", "汇通快运");
	}
	
	public String getProperty(String key){
		return p.getProperty(key);
	}
	
	private Random random = new Random();
	
	/**
	 * 随机从图集里面选取一张图片
	 * @return
	 */
	public String getImageRandom(){
        SystemSetting systemSetting = getSystemSetting();
		if(systemSetting==null || systemSetting.getImagesList()==null || systemSetting.getImagesList().size()==0){
			logger.error("系统未设置图集，但广告位却设置了图集优先显示。请管理员立刻设置图集。");
			return null;
		}
		
		int n = random.nextInt(systemSetting.getImagesList().size());
		
		return systemSetting.getImageRootPath()+systemSetting.getImagesList().get(n);
	}

	
	/**
	 * 根据类别ID获取该类别下的所有ID集合
	 * @param catalogID
	 * @return
	 */
	public List<String> getCatalogsById(String catalogID) {
		if(StringUtils.isBlank(catalogID)){
			return null;
		}

        List<Catalog> catalogs = getCatalogs();
        if(catalogs ==null || catalogs.size()==0){
			return null;
		}
		
		List<String> list = new LinkedList<String>();
		Catalog cataInfo = getCatalogsMap().get(catalogID);
		if(cataInfo.getPid().equals("0")){
			//主类
			for(int i=0;i<cataInfo.getChildren().size();i++){
				list.add(cataInfo.getChildren().get(i).getId());
			}
		}else{
			//子类
			list.add(catalogID);
		}
		return list;
	}
	
	
    //应用缓存管理

    public CacheProvider getCacheProvider() {
        return cacheProvider;
    }

    public void setCacheProvider(CacheProvider cacheProvider) {
        SystemManager.cacheProvider = cacheProvider;
    }

    private static String buildKey(String key) {
        return "SystemManager." + StringUtils.trimToEmpty(key);
    }
    private static void putCacheObject(String key, Serializable cacheObject){
        String key1 = buildKey(key);
        if(cacheObject == null){
            cacheProvider.remove(key1);
        } else {
            cacheProvider.put(key1, cacheObject);
        }
    }

	private static <T extends Serializable> T getCacheObject(String key){
        return (T)cacheProvider.get(buildKey(key));
    }

    /**
     * 产品目录列表
     * @return
     */
    public List<Catalog> getCatalogs() {
        return getCacheObject("catalogs");
    }

    public void setCatalogs(List<Catalog> catalogs) {
//        this.catalogs = catalogs;
        putCacheObject("catalogs", (Serializable)(catalogs));
    }

    /**
     * 文章目录列表
     * @return
     */
    public List<Catalog> getCatalogsArticle() {
        return getCacheObject("catalogsArticle");
    }

    public void setCatalogsArticle(List<Catalog> catalogsArticle) {
        putCacheObject("catalogsArticle", (Serializable)catalogsArticle);
    }



    //系统设置
    public SystemSetting getSystemSetting() {
        return getCacheObject("systemSetting");
    }

    public void setSystemSetting(SystemSetting systemSetting) {
        putCacheObject("systemSetting", systemSetting);
    }

    /**
     * 后台首页/统计数据
     * @return
     */
    public OrdersReport getOrdersReport() {
        return getCacheObject("ordersReport");
    }

    public void setOrdersReport(OrdersReport ordersReport) {
        putCacheObject("ordersReport", ordersReport);
    }

    /**
     * 会员等级列表
     * @return
     */
    public Map<String, AccountRank> getAccountRankMap() {
        return getCacheObject("accountRankMap");
    }

    public void setAccountRankMap(Map<String, AccountRank> accountRankMap) {
        putCacheObject("accountRankMap", (Serializable)accountRankMap);
    }

   
   
    /**
     * 热门搜索的商品列表
     * @return
     */
    public List<Product> getHotSearchProductList() {
        return getCacheObject("hotSearchProductList");
    }

    public void setHotSearchProductList(List<Product> hotSearchProductList) {
        putCacheObject("hotSearchProductList", (Serializable)(hotSearchProductList));
    }

    /**
     * 支付宝卖家账号
     * @return
     */
    public String getAlipayConfig() {
        return getCacheObject("alipayConfig");
    }

    public void setAlipayConfig(String alipayConfig) {
        putCacheObject("alipayConfig", alipayConfig);
    }

    /**
     * 启用的评论插件代号
     * @return
     */
    public String getCommentTypeCode() {
        return getCacheObject("commentTypeCode");
    }

    public void setCommentTypeCode(String commentTypeCode) {
        putCacheObject("commentTypeCode", commentTypeCode);
    }

    

    /**
     * 目录的MAP形式，具有层级关系。key：主类别ID，value：主类别对象，可以通过该对象的getChildren()方法获取该主类别的所有的子类别集合
     * @return
     */
    public Map<String, Catalog> getCatalogsMap() {
        return getCacheObject("catalogsMap");
    }

    public void setCatalogsMap(Map<String, Catalog> catalogsMap) {
        putCacheObject("catalogsMap", (Serializable)catalogsMap);
    }

    /**
     * 目录的MAP形式，具有层级关系。key：主类别code，value：主类别对象，可以通过该对象的getChildren()方法获取该主类别的所有的子类别集合
     * @return
     */
    public Map<String, Catalog> getCatalogsCodeMap() {
        return getCacheObject("catalogsCodeMap");
    }

    public void setCatalogsCodeMap(Map<String, Catalog> catalogsCodeMap) {
        putCacheObject("catalogsCodeMap", (Serializable)catalogsCodeMap);
    }

    /**
     * 商品库存信息,应该使用JAVA类库中的读写锁，key:商品ID，value：商品对象
     * @return
     */
    public Map<String, ProductStockInfo> getProductStockMap() {
        return getCacheObject("productStockMap");
    }

    public void setProductStockMap(Map<String, ProductStockInfo> productStockMap) {
        putCacheObject("productStockMap", (Serializable)productStockMap);
    }

    /**
     * 促销的商品 top=10
     * @return
     */
    public List<List<Product>> getGoodsTopList() {
        return getCacheObject("goodsTopList");
    }

    public void setGoodsTopList(List<List<Product>> goodsTopList) {
        putCacheObject("goodsTopList", (Serializable)(goodsTopList));
    }

    

   

    

  

    
   
    

    public void setSaleProducts(List<Product> saleProducts) {
        putCacheObject("saleProducts", (Serializable)(saleProducts));
    }


   

    /**
     * 文章目录。文章目前只有一级目录
     * @return
     */
    public List<Catalog> getNewsCatalogs() {
        return getCacheObject("newsCatalogs");
    }

    public void setNewsCatalogs(List<Catalog> newsCatalogs) {
        putCacheObject("newsCatalogs", (Serializable)(newsCatalogs));
    }


   

    public void setManageExpressMap(Map<String, String> manageExpressMap) {
        putCacheObject("manageExpressMap", Lists.newArrayList(manageExpressMap));
    }



    public void setIndexLeftProduct(List<Product> indexLeftProduct) {
//        this.indexLeftProduct = indexLeftProduct;
        putCacheObject("indexLeftProduct", Lists.newArrayList(indexLeftProduct));
    }




    public void setActivityProductMap(Map<String, List<Product>> activityProductMap) {
//        this.activityProductMap = activityProductMap;
        putCacheObject("activityProductMap", (Serializable)activityProductMap);
    }

   

    


    public void setActivityTuanProductList(List<Product> activityTuanProductList) {
//        this.activityTuanProductList = activityTuanProductList;
        putCacheObject("activityTuanProductList", (Serializable)(activityTuanProductList));
    }

    /////////////////后台类目查询的JSON字符串缓存///////////////////
    /**
     * 商品类目JSON字符串缓存
     * @return
     */
    public String getProductCatalogJsonStr() {
//        return productCatalogJsonStr;
        return getCacheObject("productCatalogJsonStr");
    }

    public void setProductCatalogJsonStr(String productCatalogJsonStr) {
//        this.productCatalogJsonStr = productCatalogJsonStr;
        putCacheObject("productCatalogJsonStr", productCatalogJsonStr);
    }

    /**
     * 缓存类目JSON字符串缓存
     * @return
     */
    public String getArticleCatalogJsonStr() {
//        return articleCatalogJsonStr;
        return getCacheObject("articleCatalogJsonStr");
    }

    public void setArticleCatalogJsonStr(String articleCatalogJsonStr) {
//        this.articleCatalogJsonStr = articleCatalogJsonStr;
        putCacheObject("articleCatalogJsonStr", articleCatalogJsonStr);
    }
}
