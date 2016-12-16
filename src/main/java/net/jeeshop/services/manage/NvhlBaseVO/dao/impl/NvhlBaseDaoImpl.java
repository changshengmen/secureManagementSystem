package net.jeeshop.services.manage.NvhlBaseVO.dao.impl;import java.util.List;import javax.annotation.Resource;import org.apache.commons.lang.StringUtils;import org.slf4j.LoggerFactory;import org.springframework.stereotype.Repository;import ch.qos.logback.classic.Logger;import net.jeeshop.core.dao.BaseDao;import net.jeeshop.core.dao.page.PagerModel;import net.jeeshop.core.system.bean.Role;import net.jeeshop.services.manage.NvhlApplicantVO.bean.NvhlApplicantVO;import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;import net.jeeshop.services.manage.NvhlBaseVO.dao.NvhlBaseDao;import net.jeeshop.services.manage.NvhlInsuredVO.bean.NvhlInsuredVO;import net.jeeshop.services.manage.secureProduct.bean.SecureProduct;import net.jeeshop.web.action.manage.report.ReportInfo;import net.jeeshop.web.util.LoginUserHolder;/** * 保险订单管理 * @author lin * */@Repository("NvhlBaseDaoManage")public class NvhlBaseDaoImpl implements NvhlBaseDao {    @Resource	private BaseDao dao;	public void setDao(BaseDao dao) {		this.dao = dao;	}	public int insert(NvhlBaseVO e) {				return dao.insert("manage.NvhlBase.insertNvhlBase", e);	}	/**     * 插入 投保人NvhlApplicantVO     */	@Override	public int insertApplication(NvhlApplicantVO e) {		//先查询 if exists 删除后 添加		NvhlApplicantVO vo = new NvhlApplicantVO();						vo.setCertfCls(e.getCertfCls());		vo.setCertfCde(e.getCertfCde());		vo.setCreateAccount(e.getCreateAccount());				int record = dao.delete("manage.NvhlBase.deleteNvhlApplication", vo);		System.out.print("NvhlApplication表"+record+"条记录删除");		return dao.insertByUUID("manage.NvhlBase.insertNvhlApplication", e);	}	/**     * 插入 被保人NvhlInsuredVO     */	@Override	public int insertInsured(NvhlInsuredVO e) { 		//先查询 if exists 删除后 添加		NvhlInsuredVO vo = new NvhlInsuredVO();		vo.setCcertfCls(e.getCcertfCls());		vo.setCcertfCde(e.getCcertfCde());		vo.setCreateAccount(e.getCreateAccount());			//被保人 setCreateAccount		int record = dao.delete("manage.NvhlBase.deleteNvhlInsured", vo);		System.out.print("NvhlInsured表"+record+"条记录删除");		return dao.insertByUUID("manage.NvhlBase.insertNvhlInsured", e);	}		@Override	public int delete(NvhlBaseVO e) {		// TODO Auto-generated method stub		return 0;	}	@Override	public int update(NvhlBaseVO e) {		return dao.update("manage.NvhlBase.update", e);	}	/**	 * 	* @param	* @Description: 更新支付申请号，订单状态改为支付中	* @author sunshuo	* @date 2016年11月24日 上午9:53:36 	* @return int    返回类型 	* @throws	 */	public int updatePayNo(NvhlBaseVO e) {		return dao.update("manage.NvhlBase.updatePayNo", e);	}		@Override	public NvhlBaseVO selectOne(NvhlBaseVO e) {		return (NvhlBaseVO) dao.selectOne("manage.NvhlBase.selectOne", e);	}	public PagerModel selectPageList(NvhlBaseVO e) {		//获取当前用户权限 		//订单记录 查看 createAccount是当前登陆人的记录 如果是查看个人		Role role = LoginUserHolder.getUserRole();		if(role != null){			String range = LoginUserHolder.getUserRole().getSelect_range();			if(range.indexOf("个人")>-1){				e.setCreateAccount(LoginUserHolder.getLoginUser().getId());			}		}				return dao.selectPageList("manage.NvhlBase.selectPageList",				"manage.NvhlBase.selectPageCount", e);	}		@Override	public List<NvhlBaseVO> selectList(NvhlBaseVO e) {		return null;	}	@Override	public int deleteById(int id) {		// TODO Auto-generated method stub		return 0;	}	@Override	public NvhlBaseVO selectById(String id) {		// TODO Auto-generated method stub		return null;	}	@Override	public List<ReportInfo> selectProductSales(NvhlBaseVO base)	{				return dao.selectList("manage.NvhlBase.selectOrderReport", base);	}}