package net.jeeshop.services.manage.secureProduct.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import net.jeeshop.core.dao.BaseDao;
import net.jeeshop.core.dao.page.PagerModel;
import net.jeeshop.core.util.MathUtil;
import net.jeeshop.services.common.userProduct;
import net.jeeshop.services.manage.secureProduct.bean.SecureProduct;
import net.jeeshop.services.manage.secureProduct.bean.SecureProductDetail;
import net.jeeshop.services.manage.secureProduct.dao.SecureProductDao;

@Repository("secureProductDaoManage")
public class SecureProductDaoImpl implements SecureProductDao {
	@Resource
	private BaseDao dao;

	public void setDao(BaseDao dao) {
		this.dao = dao;
	}

	public PagerModel selectPageList(SecureProduct e) {

		return dao.selectPageList("manage.secureProduct.selectPageList", "manage.secureProduct.selectPageCount", e);
	}

	public List selectList(SecureProduct e) {
		return dao.selectList("manage.secureProduct.selectList", e);
	}

	public SecureProduct selectOne(SecureProduct e) {
		return (SecureProduct) dao.selectOne("manage.secureProduct.selectOne", e);
	}

	public int delete(SecureProduct e) {
		String[] ids=null;
		deleteSubProduct(ids,e);
		return dao.delete("manage.secureProduct.delete", e);
	}

	public int deleteSubProduct(String[] ids,SecureProduct e) {		
		SecureProductDetail subProduct = new SecureProductDetail();		
		if(ids!=null){			
			for (int i = 0; i < ids.length; i++) {
				if(ids[i].length()>0){
					subProduct.setId(ids[i]);
					subProduct.setUpdateAccount(e.getUpdateAccount());
					dao.delete("manage.secureProduct.deleteSubProduct", subProduct);
				}				
			}
		}else{
			subProduct.setpId(e.getId());
			subProduct.setUpdateAccount(e.getUpdateAccount());
			dao.delete("manage.secureProduct.deleteSubProduct", subProduct);
		}	
		return 0;
	}

	// 更新保险产品
	public int update(SecureProduct e) {
		if(e.getSecureProductDetailList() != null){
			updateSubProduct(e);
		}		
		return dao.update("manage.secureProduct.update", e);
	}

	// 更新保险子产品
	public void updateSubProduct(SecureProduct e) {
		List<SecureProductDetail> f = e.getSecureProductDetailList();
		for (int i = 0; i < f.size(); i++) {
			SecureProductDetail subProduct = f.get(i);
			if (subProduct.getId() != null && subProduct.getId().length() > 0) {
				subProduct.setUpdateAccount(e.getUpdateAccount());
				updateSecureProductDetail(subProduct);
			} else {
				if (subProduct.getSubName().length() > 0) {
					subProduct.setpId(e.getId());
					subProduct.setDeleteFlag(0);
					subProduct.setStatus(1);
					subProduct.setCreateAccount(e.getUpdateAccount());
					insertSecureProductDetail(subProduct);
				}

			}
		}
	}

	// 更新保险子产品子函数
	@Override
	public int updateSecureProductDetail(SecureProductDetail p) {
		return dao.update("manage.secureProduct.updateSecureProductDetail", p);
	}

	public int deletes(String[] ids, int delete_flag, String updateAccount) {

		SecureProduct e = new SecureProduct();
		for (int i = 0; i < ids.length; i++) {
			e.setId(ids[i]);
			e.setDeleteFlag(1);
			e.setUpdateAccount(updateAccount);
			delete(e);
		}
		return 0;
	}

	public int insert(SecureProduct e) {
		return dao.insert("manage.secureProduct.insert", e);
	}

	public int deleteById(int id) {
		return dao.delete("manage.secureProduct.deleteById", id);
	}

	public SecureProduct selectById(String id) {
		return (SecureProduct) dao.selectOne("manage.secureProduct.selectById", id);
	}

	@Override
	public void deleteAttributeLinkByProductID(int parseInt) {
		dao.delete("manage.secureProduct.deleteAttributeLinkByProductID", parseInt);
	}

	@Override
	public List<SecureProduct> selectStockByIDs(List<String> productIDs) {
		return dao.selectList("manage.secureProduct.selectStockByIDs", productIDs);
	}

	@Override
	// 查询保险子产品
	public List<SecureProductDetail> selectSecureProductDetail(SecureProductDetail p) {

		return dao.selectList("manage.secureProduct.selectDetail", p);
	}

	@Override
	public int selectOutOfStockProductCount() {
		return (Integer) dao.selectOne("manage.secureProduct.selectOutOfStockProductCount");
	}

	@Override
	public void updateImg(SecureProduct p) {
		dao.update("manage.secureProduct.updateImg", p);
	}

	@Override
	public void updateProductStatus(SecureProduct p) {
		SecureProductDetail subProduct = new SecureProductDetail();
		subProduct.setpId(p.getId());
		subProduct.setUpdateAccount(p.getUpdateAccount());
		updateSubProductStatus(subProduct);
		dao.update("manage.secureProduct.updateProductStatus", p);
	}

	public void updateSubProductStatus(SecureProductDetail e) {
		dao.update("manage.secureProduct.updateSubProductStatus", e);
	}

	@Override
	public void updateProductBindActivityId(SecureProduct pro) {
		dao.update("manage.secureProduct.updateProductBindActivityId", pro);
	}

	@Override
	public void updateResetThisProductActivityID(String activityID) {
		dao.update("manage.secureProduct.updateResetThisProductActivityID", activityID);
	}

	@Override
	public int insertSecureProduct(SecureProduct p) {
		return dao.insert("manage.secureProduct.insertSecureProduct", p);
	}

	@Override
	public int insertSecureProductDetail(SecureProductDetail p) {
		return dao.insert("manage.secureProduct.insertSecureProductDetail", p);
	}

	@Override
	public void deleteUsersBind(String uid) {
		dao.delete("manage.secureProduct.deleteUsersProduct", uid);
	}

	@Override
	public int addUsersBind(String ids, String uid) {
		String arr[] = ids.split(",");
		int k = 0;
		for (int i = 0; i < arr.length; i++) {
			userProduct up = new userProduct();
			up.setId(MathUtil.getUUID());
			up.setUser_id(uid);
			up.setProduct_id(arr[i]);
			try {
				dao.insertByUUID("manage.secureProduct.insertUsersProduct", up);
			} catch (Exception e) {
				e.printStackTrace();
			}
			k = i;
		}
		return k;
	}

	@Override
	public PagerModel selectProductPageList(SecureProduct e) {
		return dao.selectPageList("manage.secureProduct.getAllProductsByUserId",
				"manage.secureProduct.getProductsByUserIdPageCount", e);
	}

	@Override
	public List<userProduct> selectIDListFromUserProduct(userProduct e ) {
		return dao.selectList("manage.secureProduct.selectIDList",e);
	}

}
