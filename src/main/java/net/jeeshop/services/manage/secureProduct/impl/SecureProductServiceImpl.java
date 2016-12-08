package net.jeeshop.services.manage.secureProduct.impl;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import net.jeeshop.core.ServersManager;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.services.common.userProduct;
import net.jeeshop.services.manage.secureProduct.SecureProductService;
import net.jeeshop.services.manage.secureProduct.bean.SecureProduct;
import net.jeeshop.services.manage.secureProduct.bean.SecureProductDetail;
import net.jeeshop.services.manage.secureProduct.dao.SecureProductDao;
import net.jeeshop.services.manage.spec.SpecService;
import net.jeeshop.services.manage.spec.bean.Spec;

@Service("secureProductServiceManage")
public class SecureProductServiceImpl extends ServersManager<SecureProduct, SecureProductDao> implements
SecureProductService {
	private static final Logger logger = LoggerFactory.getLogger(SecureProductServiceImpl.class);
    @Resource(name = "secureProductDaoManage")
    @Override
    public void setDao(SecureProductDao productDao) {
        this.dao = productDao;
    }

    @Resource(name = "specServiceManage")
	private SpecService specService;

	public SpecService getSpecService() {
		return specService;
	}

	public void setSpecService(SpecService specService) {
		this.specService = specService;
	}

	/**
	 * 添加商品信息
	 */
	@Override
	public int insert(SecureProduct e) {
		int productID = super.insert(e);
		//insertOrUpdateSpec(e);
		return productID;
	}
	
	/**
	 * 更新商品信息
	 */
	@Override
	public int update(SecureProduct e) {
		super.update(e);		
		return 1;
	}
	
	

	/**
	 * 批量删除商品
	 * 包括:
	 * 1、商品表数据。
	 * 2、属性关联表数据。
	 * 				3、商品图片。  这个不一定要删除，因为有可能同一张图片被多处引用了。
	 * @param ids
	 * @return
	 */
	public int deletes(@ModelAttribute("e")SecureProduct e) {
		String[] ids = e.getId().split(",");
		
		 List<String> tmp = new ArrayList<String>();
	        for(String str:ids){
	            if(str!=null && str.length()!=0){
	                tmp.add(str);
	            }
	        }
	        ids = tmp.toArray(new String[0]);
		if (ids != null && ids.length > 0) {
			for (int i = 0; i < ids.length; i++) {
				String id = ids[i];
				logger.error("删除商品deleteById.id="+id);
				if(StringUtils.isBlank(id)){
					throw new NullPointerException();
				}
//				attributeDao.deleteById(Integer.parseInt(pid));//根据ID删除选择的属性
				
				//根据PID删除选择属性下 的所有子属性
//				attributeDao.deleteByPid(pid);
				
				//删除attribute_link表的相关联的数据
//				attribute_linkDao.de
				
//				attributeDao.deleteAllById(id);
				
				dao.deleteById(Integer.parseInt(id));
				dao.deleteAttributeLinkByProductID(Integer.parseInt(id));
			}
		}
		return 0;
	}

	@Override
	public void updateProductStatus(String[] ids,int status,String updateAccount) {
		if (ids == null || ids.length == 0) {
			throw new NullPointerException("商品ID不能为空！");
		}
		
		if(StringUtils.isBlank(updateAccount)){
			throw new NullPointerException("操作人账号不能为空！");
		}

		for (int i = 0; i < ids.length; i++) {
			if(StringUtils.isBlank(ids[i])){
				throw new NullPointerException("商品ID不能存在空的！");
			}
			
			SecureProduct p = new SecureProduct();
			p.setId(ids[i]);
			p.setStatus(status);
			p.setUpdateAccount(updateAccount);
			dao.updateProductStatus(p);
		}
	}

	@Override
	public List<SecureProduct> selectStockByIDs(List<String> productIDs) {
		return dao.selectStockByIDs(productIDs);
	}
	@Override
	public List<SecureProductDetail> selectSecureProductDetail(SecureProductDetail p) {
		// TODO Auto-generated method stub
		return dao.selectSecureProductDetail(p);
	}
	@Override
	public int selectOutOfStockProductCount() {
		return dao.selectOutOfStockProductCount();
	}

	@Override
	public void updateImg(SecureProduct p) {
		dao.updateImg(p);
	}

	@Override
	public void updateProductBindActivityId(SecureProduct pro) {
		dao.updateProductBindActivityId(pro);
	}

	@Override
	public void updateResetThisProductActivityID(String activityID) {
		dao.updateResetThisProductActivityID(activityID);
	}

	@Override
	public void deletes(String[] ids, int deleteFlagY, String username) {
		// TODO Auto-generated method stub
		dao.deletes(ids,deleteFlagY,username);
	}

	@Override
	public int insertSecureProduct(SecureProduct p) {
		// TODO Auto-generated method stub
		return dao.insertSecureProduct(p);
	}

	@Override
	public int insertSecureProductDetail(SecureProductDetail p) {
		// TODO Auto-generated method stub
		return dao.insertSecureProductDetail(p);
	}
	public int deleteSubProduct(String[] ids,SecureProduct e){
		return dao.deleteSubProduct(ids, e);
	}
	
	@Override
	public int updateSecureProductDetail(SecureProductDetail p) {
		// TODO Auto-generated method stub
		return dao.updateSecureProductDetail(p);
	}
	
	@Override
	public PagerModel selectProductPageList(SecureProduct e) {
		return dao.selectProductPageList(e);
	}
	
	@Override
	public int bindUserProduct(String ids, String uid) {
		if(ids== null || ids.length() <= 0){
			dao.deleteUsersBind(uid);
			return 0;
		}else{
			dao.deleteUsersBind(uid);
			return dao.addUsersBind(ids,uid);
		}		
	}

	@Override
	public List<userProduct> selectIDListFromUserProduct(userProduct e) {
		return dao.selectIDListFromUserProduct(e);
	}

	
}
