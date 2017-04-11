package net.jeeshop.services.front.account.impl;import java.text.MessageFormat;import java.util.Map;import net.jeeshop.core.FrontContainer;import net.jeeshop.core.ServersManager;import net.jeeshop.services.front.account.AccountService;import net.jeeshop.services.front.account.bean.Account;import net.jeeshop.services.front.account.dao.AccountDao;import net.jeeshop.services.manage.accountRank.bean.AccountRank;import org.apache.commons.lang.StringUtils;import org.slf4j.Logger;import org.slf4j.LoggerFactory;import org.springframework.stereotype.Service;import javax.annotation.Resource;@Service("accountServiceFront")public class AccountServiceImpl extends ServersManager<Account, AccountDao> implements		AccountService {	private static final Logger logger = LoggerFactory.getLogger(AccountServiceImpl.class);    @Resource(name = "accountDaoFront")    @Override    public void setDao(AccountDao accountDao) {        this.dao = accountDao;    }	public int selectCount(Account e) {		return dao.selectCount(e);	}		/**	 * 更新会员信息。	 * 如果会员等级发生变动，则需要使用邮件、短信、站内信的方式告知用户。	 *///	@Override//	public int update(Account e) {//		int r = 0;//		if(StringUtils.isNotBlank(e.getRank())){//			Account acc = accountDao.selectOne(e);//			if(!acc.getRank().equals(e.getRank())){//				int a = Integer.valueOf(acc.getRank().substring(1));//				int b = Integer.valueOf(e.getRank().substring(1));//				if( a > b){//					//会员等级降了//					r = -1;//				}else if(a < b){//					//会员等级升了//					r = 1;//				}else {//					//等级没变化//					r = 0;//				}//			}//		}//		//		super.update(e);//		//		if(StringUtils.isNotBlank(e.getRank())){//			if(r==-1){//				//邮件、短信、或站内信通知用户//			}else if(r==-1){//				//邮件、短信、或站内信通知用户//			}//		}//		return 1; //	}		@Override	public void updateScore(Account acc) {		if(StringUtils.isBlank(acc.getAccount())){			throw new NullPointerException();		}				synchronized (FrontContainer.update_account_score_lock) {			Account account = dao.selectAccountScore(acc.getAccount());			if(account==null){				throw new NullPointerException();			}						acc.setScore(acc.getAddScore() + account.getScore());            Map<String, AccountRank> accountRankMap = systemManager.getAccountRankMap();            logger.error("SystemManager.accountRankMap = " + accountRankMap.size());			for(AccountRank accountRank : accountRankMap.values()){				if (acc.getScore() == accountRank.getMinScore()						|| acc.getScore() == accountRank.getMaxScore()						|| (acc.getScore() > accountRank.getMinScore() && acc								.getScore() < accountRank.getMaxScore())) {					// 得到此范围内的会员等级代号					acc.setRank(accountRank.getCode());										logger.error(">>accountRank.getCode() = " + accountRank.getCode());					break;				}			}						logger.error("account.getRank()="+account.getRank()+",acc.getRank()="+acc.getRank());						//如果新的会员等级代号和旧的一样，则说明会员的等级没有发生任何的变化。不需要更新 也不需要邮件通知			if(acc.getRank().equals(account.getRank())){				acc.setRank(null);			}else{				int oldAccountRank = Integer.valueOf(account.getRank().substring(1));//旧的会员等级				int newAccountRank = Integer.valueOf(acc.getRank().substring(1));//新的会员等级				if(oldAccountRank > newAccountRank){					//会员等级降了				}else if(oldAccountRank < newAccountRank){					//会员等级升了				}								//..通知会员			}						dao.updateScore(acc);			//可以邮件、短信、站内信 等方式通知用户，订单完成，积分已经打到用户的账户上了。		}	}		public void insertOutAccount(Account acc){		synchronized (this) {			if(acc==null){				throw new NullPointerException("acc is null");			}						acc.setAccount("_out_"+System.currentTimeMillis());			acc.setNickname("_out_");			dao.insert(acc);			logger.error("insertOutAccount.acc="+acc);		}	}		@Override	public void updatePasswordByAccount(Account acc) {		dao.updatePasswordByAccount(acc);	}	@Override	public void updateEmailByAccount(Account acc) {		dao.updateEmailByAccount(acc);	}	public static void main(String[] args) {//		Object arguments;//		String pattern = "你好{1}";//		System.out.println(MessageFormat.format(pattern , 12,34));				String content = "ab,cc,{1},{2},{0},dd,ff";		Object array[] = {"userName", "password", "2014-10-12"};	      content = MessageFormat.format(content, array);	      System.out.println(content);	}}