package net.jeeshop.core.oscache;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import net.jeeshop.core.FrontContainer;
import net.jeeshop.core.KeyValueHelper;
import net.jeeshop.core.ManageContainer;
import net.jeeshop.core.front.SystemManager;
import net.jeeshop.core.util.DateTimeUtil;
import net.jeeshop.services.front.catalog.CatalogService;
import net.jeeshop.services.front.catalog.bean.Catalog;
import net.jeeshop.services.front.keyvalue.KeyvalueService;
import net.jeeshop.services.front.keyvalue.bean.Keyvalue;
import net.jeeshop.services.front.product.ProductService;
import net.jeeshop.services.front.product.bean.Product;
import net.jeeshop.services.front.product.bean.ProductStockInfo;
import net.jeeshop.services.manage.systemSetting.SystemSettingService;
import net.jeeshop.services.manage.systemSetting.bean.SystemSetting;
import net.jeeshop.services.manage.accountRank.AccountRankService;
import net.jeeshop.services.manage.accountRank.bean.AccountRank;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 缓存管理器。 后台项目可以通过接口程序通知该类重新加载部分或全部的缓存
 *
 * @author huangf
 *
 */
public class FrontCache {
	private static final Logger logger = LoggerFactory.getLogger(FrontCache.class);

	/**
	 * manage后台
	 */
	@Autowired
	private KeyvalueService keyvalueService;
	@Autowired
	private SystemSettingService systemSettingService;
	@Autowired
	private CatalogService catalogService;
	// private OssService ossService;
	@Autowired
	private AccountRankService accountRankService;

	/**
	 * front前台
	 */
	@Autowired
	private ProductService productService;

	private static SystemManager systemManager;

	@Autowired
	public void setSystemManager(SystemManager systemManager) {
		FrontCache.systemManager = systemManager;
	}

	public AccountRankService getAccountRankService() {
		return accountRankService;
	}

	public void setAccountRankService(AccountRankService accountRankService) {
		this.accountRankService = accountRankService;
	}

	public void setSystemSettingService(SystemSettingService systemSettingService) {
		this.systemSettingService = systemSettingService;
	}

	public void setCatalogService(CatalogService catalogService) {
		this.catalogService = catalogService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setKeyvalueService(KeyvalueService keyvalueService) {
		this.keyvalueService = keyvalueService;
	}

	/**
	 * 加载key-value键值对
	 */
	public void loadKeyValue() {
		logger.info("load...");
		KeyValueHelper.load(keyvalueService.selectList(new Keyvalue()));
	}

	/**
	 * 如果类别ID是是主类别，则返回该主类别的下面所有子类别
	 * 
	 * @param catalogID
	 * @return
	 */
	public static List<Catalog> loadCatalogChildren(String catalogID) {
		try {
			logger.info(">>catalogID=" + catalogID);
			if (StringUtils.isBlank(catalogID)) {
				throw new NullPointerException();
			}

			// Catalog catalog = SystemManager.catalogsMap.get(catalogID);
			Catalog catalog = systemManager.getCatalogsMap().get(catalogID);
			if (catalog == null) {
				throw new NullPointerException();
			}

			if (catalog.getPid().equals("0")) {
				if (catalog.getChildren() == null) {
					logger.info(">>主类别catalog.getChildren()=0");
				} else {
					logger.info(">>主类别catalog.getChildren()=" + catalog.getChildren().size());
				}
				// 主类别
				return catalog.getChildren();
			} else {
				// 子类别

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getPid(String catalogID) {
		if (StringUtils.isBlank(catalogID)) {
			throw new NullPointerException();
		}
		Map<String, Catalog> catalogsMap = systemManager.getCatalogsMap();
		Catalog catalog = catalogsMap.get(catalogID);
		if (catalog == null) {
			throw new NullPointerException();
		}
		if (catalog.getPid().equals("0")) {
			return catalog.getId();
		} else {
			catalog = catalogsMap.get(catalog.getPid());
			return catalog.getId();
		}
	}

	/**
	 * 加载目录列表,树形结构
	 * 
	 * @param loadProduct
	 *            是否加载商品数据。true：加载，false:不加载
	 * @throws Exception
	 */
	public void loadCatalogs(boolean loadProduct) throws Exception {
		logger.info("load...");

		List<Catalog> catalogs = loadCatalogs2("p");
		systemManager.setCatalogs(catalogs);
		List<Catalog> catalogsArticle = loadCatalogs2("a");
		systemManager.setCatalogsArticle(catalogsArticle);

		Map<String, Catalog> catalogsMap = Maps.newHashMap();
		Map<String, Catalog> catalogsCodeMap = Maps.newHashMap();
		putToMap(systemManager.getCatalogs(), loadProduct, catalogsMap, catalogsCodeMap);
		systemManager.setCatalogsMap(catalogsMap);
		systemManager.setCatalogsCodeMap(catalogsCodeMap);
	}

	/**
	 * 将商品目录结构转化为map的形式。
	 * 
	 * @param catalogs
	 * @throws Exception
	 */
	public void putToMap(List<Catalog> catalogs, boolean loadProduct, Map<String, Catalog> catalogsMap,
			Map<String, Catalog> catalogsCodeMap) throws Exception {
		if (catalogs == null || catalogs.size() == 0) {
			return;
		}
		for (int i = 0; i < catalogs.size(); i++) {
			Catalog item = catalogs.get(i);

			if (loadProduct) {
				// 超级菜单里面的推荐商品
				loadsuperMenuProducts(item);

				// 加载每个目录下的热门推荐商品列表
				loadHotProductByCatalog(item);
			}

			catalogsMap.put(item.getId(), item);

			if (catalogsCodeMap.get(item.getCode()) != null) {
				logger.error("item.code = " + item.getCode());
				throw new Exception("错误：商品类别code重复!");
			}

			catalogsCodeMap.put(item.getCode(), item);
			if (item.getChildren() != null && item.getChildren().size() > 0) {

				// 递归调用
				putToMap(item.getChildren(), loadProduct, catalogsMap, catalogsCodeMap);
			}
		}
	}

	/**
	 * 加载超级菜单的位置显示的热门推荐商品列表
	 * 
	 * @param item
	 */
	private void loadsuperMenuProducts(Catalog item) {
		if (!item.getPid().equals("0")) {
			// 子目录则不加载任何数据
			return;
		}

		if (item.getChildren() == null || item.getChildren().size() == 0) {
			return;
		}
		List<String> ids = new LinkedList<String>();
		for (int j = 0; j < item.getChildren().size(); j++) {
			ids.add(item.getChildren().get(j).getId());
		}

		Product product = new Product();
		product.setTop(3);// 显示的最大个数
		product.setProductIds(ids);// 目录集合
		List<Product> superMenuProducts = productService.loadHotProductShowInSuperMenu(product);

		// if(superMenuProducts==null || superMenuProducts.size()==0){
		// logger.info("superMenuProducts = 0" + ",catalogCode = " +
		// item.getCode());
		// }else{
		// logger.info("superMenuProducts = " + superMenuProducts.size() +
		// ",catalogCode = " + item.getCode());
		// }
		if (superMenuProducts != null && superMenuProducts.size() > 0) {
			item.setSuperMenuProducts(superMenuProducts);
		}
	}

	/**
	 * 加载每个目录下的热门推荐商品列表（包括子目录）
	 * 
	 * @param item
	 */
	private void loadHotProductByCatalog(Catalog item) {
		if (item.getPid().equals("0") && (item.getChildren() == null || item.getChildren().size() == 0)) {
			return;
		}

		Product p = new Product();
		p.setTop(FrontContainer.default_page_left_product_size);

		if (item.getPid().equals("0")) {
			List<Integer> ids = new LinkedList<Integer>();
			for (int j = 0; j < item.getChildren().size(); j++) {
				ids.add(Integer.valueOf(item.getChildren().get(j).getId()));
			}
			p.setQueryCatalogIDs(ids);
		} else {
			p.setCatalogID(item.getId());
		}
		List<Product> hotProducts = productService.selectPageLeftHotProducts(p);

		if (hotProducts == null || hotProducts.size() == 0) {
			logger.info("loadHotProductByCatalog.hotProducts = 0" + ",catalogCode = " + item.getCode());
		} else {
			logger.info(
					"loadHotProductByCatalog.hotProducts = " + hotProducts.size() + ",catalogCode = " + item.getCode());
		}

		if (hotProducts != null && hotProducts.size() > 0) {
			item.setHotProducts(hotProducts);
		}
	}

	/**
	 * 原来递归的方式修改为非递归方式。 非递归方法查询商品/文章目录结构，并且自动排序。
	 * 
	 * @param type
	 */
	private List<Catalog> loadCatalogs2(String type) {
		List<Catalog> catalogs = Lists.newLinkedList();
		Catalog cc = new Catalog();
		cc.setType(type);
		List<Catalog> catalogsList = catalogService.selectList(cc);
		if (catalogsList != null) {

			Map<String, Catalog> map = new HashMap<String, Catalog>();
			for (Iterator<Catalog> it = catalogsList.iterator(); it.hasNext();) {
				Catalog item = it.next();

				if (StringUtils.isNotBlank(item.getPid()) && item.getPid().equals("0")) {
					// 是否在导航栏显示中文化
					if (item.getShowInNav().equals(Catalog.catalog_showInNav_y)) {
						item.setShowInNavStr("是");
					}

					map.put(item.getId(), item);
					it.remove();
				}
			}

			for (Iterator<Catalog> it = catalogsList.iterator(); it.hasNext();) {
				Catalog item = it.next();
				if (StringUtils.isNotBlank(item.getPid())) {
					// list.add(item);
					Catalog rootItem = map.get(item.getPid());
					if (rootItem != null) {
						if (rootItem.getChildren() == null) {
							rootItem.setChildren(new LinkedList<Catalog>());
						}
						rootItem.getChildren().add(item);
					}
					it.remove();
				}
			}

			for (Iterator<Entry<String, Catalog>> it = map.entrySet().iterator(); it.hasNext();) {
				catalogs.add(it.next().getValue());
			}

			// 对主类别和子类别进行排序
			Collections.sort(catalogs, new Comparator<Catalog>() {
				public int compare(Catalog o1, Catalog o2) {
					if (o1.getOrder1() > o2.getOrder1()) {
						return 1;
					} else if (o1.getOrder1() < o2.getOrder1()) {
						return -1;
					}
					return 0;
				}
			});

			for (int i = 0; i < catalogs.size(); i++) {
				if (catalogs.get(i).getChildren() == null) {
					continue;
				}
				Collections.sort(catalogs.get(i).getChildren(), new Comparator<Catalog>() {
					public int compare(Catalog o1, Catalog o2) {
						if (o1.getOrder1() > o2.getOrder1()) {
							return 1;
						} else if (o1.getOrder1() < o2.getOrder1()) {
							return -1;
						}
						return 0;
					}
				});
			}
		}
		return catalogs;
	}

	/**
	 * 加载促销的商品
	 */
	public void selectTopProducts() {
		Product e = new Product();
		e.setStatus(1);
		e.setTop(8);

		List<Product> result = productService.selectList(e);
		if (result == null || result.size() == 0) {
			return;
		}

		System.out.println("result=" + result);

		List<List<Product>> list = new LinkedList<List<Product>>();
		int nn = 0;
		int maxLen = 4;
		int i = 0;
		List<Product> row = new LinkedList<Product>();
		for (Iterator<Product> it = result.iterator(); it.hasNext();) {
			Product ee = (Product) it.next();
			row.add(ee);
			nn++;
			i++;
			if (nn == maxLen) {
				list.add(row);
				nn = 0;
				row = new LinkedList<Product>();
			}

			if ((result.size() == 1 + i)) {
				if (row.size() == 0) {
					row.add(ee);
				}
				list.add(row);
				break;
			}
		}
		// SystemManager.goodsTopList = list;//
		// productTypeService.selectList(e);
		systemManager.setGoodsTopList(list);
		System.out.println("list====" + list);
	}

	// 加载商品
	private List<Product> loadProducts(int type) {
		Product p = new Product();
		p.setTop(8);
		if (type == 1) {
			p.setIsnew(Product.Product_isnew_y);// 最新
		} else if (type == 2) {
			p.setSale(Product.Product_sale_y);// 特价
		} else if (type == 3) {
			p.setHot(true);// 热门
		}
		return productService.selectList(p);
	}

	/**
	 * 加载商品内存库存
	 */
	public void loadProductStock() {
		List<ProductStockInfo> list = productService.selectStockList(new Product());
		Map<String, ProductStockInfo> productStockMap = Maps.newHashMap();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				ProductStockInfo p = list.get(i);
				productStockMap.put(p.getId(), p);
			}
		}
		systemManager.setProductStockMap(productStockMap);
	}

	/**
	 * 加载指定商品的库存到内存
	 */
	public void loadProductStockByID(String productID) {
		if (StringUtils.isNotBlank(productID)) {
			throw new NullPointerException("商品ID不能为空！");
		}

		Product p = new Product();
		p.setId(productID);
		List<ProductStockInfo> list = productService.selectStockList(p);
		if (list != null && list.size() > 0) {
			Map<String, ProductStockInfo> stockInfoMap = systemManager.getProductStockMap();
			stockInfoMap.put(productID, list.get(0));
			systemManager.setProductStockMap(stockInfoMap);
		}
	}

	/**
	 * 加载会员等级列表
	 */
	private void loadAccountRank() {
		List<AccountRank> list = accountRankService.selectList(new AccountRank());
		Map<String, AccountRank> accountRankMap = Maps.newHashMap();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				AccountRank item = list.get(i);
				accountRankMap.put(item.getCode(), item);
			}
		}
		systemManager.setAccountRankMap(accountRankMap);
	}

	/**
	 * 加载热卖商品列表，此数据将会在门户的超级菜单上显示出来。
	 */

	/**
	 * 加载首页左侧的商品列表，此位置的商品从全局加载
	 */
	private void loadIndexLeftProduct() {
		Product p = new Product();
		p.setTop(FrontContainer.default_page_left_product_size);
		List<Product> indexLeftProduct = productService.selectPageLeftHotProducts(p);
		systemManager.setIndexLeftProduct(indexLeftProduct);
	}

	/**
	 * 加载全部的缓存数据
	 * 
	 * @throws Exception
	 */
	public void loadAllCache() throws Exception {
		logger.info("loadAllCache...");
		loadCatalogs(true);
		loadIndexLeftProduct();
		loadKeyValue();
		loadProductStock();
		loadAccountRank();
		// 加载所有的活动列表

		logger.info("前台缓存加载完毕!");
	}

}
