package net.jeeshop.core.oscache;

import com.alibaba.fastjson.JSON;
import net.jeeshop.core.ManageContainer;
import net.jeeshop.core.front.SystemManager;
import net.jeeshop.services.manage.order.OrderService;
import net.jeeshop.services.manage.order.bean.OrdersReport;
import net.jeeshop.services.manage.product.ProductService;
import net.jeeshop.services.manage.systemSetting.SystemSettingService;
import net.jeeshop.services.manage.systemSetting.bean.SystemSetting;
import net.jeeshop.services.manage.task.TaskService;
import net.jeeshop.services.manage.task.bean.Task;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;

/**
 * 缓存管理器。 后台项目可以通过接口程序通知该类重新加载部分或全部的缓存
 * 
 * @author huangf
 * 
 */
public class ManageCache {
	private static final Logger logger = LoggerFactory.getLogger(ManageCache.class);
	
	/**
	 * manage后台
	 */
    @Resource(name = "orderServiceManage")
	private OrderService orderService;
    @Resource(name = "productServiceManage")
	private ProductService productService;
    @Autowired
    private SystemSettingService systemSettingService;
    @Autowired
    private SystemManager systemManager;
	


	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}


    /**
	 * 加载订单报表
	 */
	public void loadOrdersReport(){
		OrdersReport ordersReport = orderService.loadOrdersReport();
		if(ordersReport==null){
			ordersReport = new OrdersReport();
		}
		//加载缺货商品数
		ordersReport.setOutOfStockProductCount(productService.selectOutOfStockProductCount());
		logger.error("SystemManager.ordersReport = " + ordersReport.toString());
        systemManager.setOrdersReport(ordersReport);
	}
	
	
	/**
	 * 加载全部的缓存数据
	 * @throws Exception 
	 */
	public void loadAllCache() throws Exception {
		logger.error("ManageCache.loadAllCache...");
		loadOrdersReport();
        loadSystemSetting();
		logger.error("后台缓存加载完毕!");
	}

    /**
     * 加载系统配置信息
     */
    public void loadSystemSetting() {
        SystemSetting systemSetting = systemSettingService.selectOne(new SystemSetting());
        if (systemSetting == null) {
            throw new NullPointerException("未设置本地环境变量，请管理员在后台进行设置");
        }

        //从环境变量中分解出图集来。
        if (StringUtils.isNotBlank(systemSetting.getImages())) {
            String[] images = systemSetting.getImages().split(ManageContainer.product_images_spider);
            if (systemSetting.getImagesList() == null) {
                systemSetting.setImagesList(new LinkedList<String>());
            } else {
                systemSetting.getImagesList().clear();
            }

            for (int i = 0; i < images.length; i++) {
                systemSetting.getImagesList().add(images[i]);
            }
        }
        systemManager.setSystemSetting(systemSetting);
    }

	public static void main(String[] args) {
		String str = "10280|10281|10282";
		String[] arr = str.split("\\|");
		for(int i=0;i<arr.length;i++){
			System.out.println(arr[i]);
		}
	}
}
