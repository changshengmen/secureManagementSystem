package net.jeeshop.web.action.manage.NvhlBase;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import net.jeeshop.core.util.DateTimeUtil;
import net.jeeshop.services.common.telOperVO;
import net.jeeshop.services.manage.NvhlBaseVO.NvhlBaseService;
import net.jeeshop.services.manage.NvhlBaseVO.bean.NvhlBaseVO;
import net.jeeshop.services.manage.NvhlBaseVO.impl.NvhlBaseServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 用于解析payresult的servlet
 * @author Yang
 *
 */
public class SecureProductServlet extends HttpServlet {
	//Servlet中注入service
	@Autowired
	private NvhlBaseService baseService;
	private static final long serialVersionUID = 1L;
    
	/**
	 * 重写init方法 完成使用spring在Servlet中注入Service
	 */
	@Override
	public void init(ServletConfig config)throws ServletException
	{
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, config.getServletContext());
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecureProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------------payResult----------------------");
		String payNo = "";//解析支付申请号
		String cashNo = "";//票据号
		String payType = "";//支付方式
		String bankAcctDate = "";//支付时间
		String bankCode = "";//收单行号
		String tidNo = "";//终端号
		String bkSerial = "";//银行交易流水
		String cardNo = "";//卡号
		String remark = "";//备注
		String status = "";//支付状态

		NvhlBaseVO base	= new NvhlBaseVO();	
		String payResultXml = request.getParameter("responseXml");
		if(payResultXml !=null){
			HashMap payResultMap = xmlElements(payResultXml);	
			base.setPayNo(payResultMap.get("PAY_APP_NO").toString());//支付申请号
			base.setCashNo(payResultMap.get("CASH_NO").toString());//票据号
			base.setPayType(payResultMap.get("PAYTYPE").toString());//支付方式
			base.setBankAcctDate(payResultMap.get("BANK_ACCT_DATE").toString());//支付时间
			base.setBankCode(payResultMap.get("BANK_CODE").toString());//收单行号
			base.setTidNo(payResultMap.get("TID_NO").toString());//终端号
			base.setBkSerial(payResultMap.get("BK_SERIAL").toString());//银行交易流水
			base.setCardNo(payResultMap.get("CARD_NO").toString());//卡号
			base.setRemark(payResultMap.get("REMARK").toString());//备注
			base.setStatus(payResultMap.get("STATUS").toString());//0:支付成功完成						
			//更新订单
			int orderSucc = baseService.update(base);	
			
			JSONObject policyStatusJSON = new JSONObject();
			telOperVO telOperVOObject = new telOperVO();
			telOperVOObject.setId("");
			telOperVOObject.setCPassWd("JDT");
			telOperVOObject.setCOperId("JDT");
			telOperVOObject.setAccequ("");				
			telOperVOObject.setIp("");
			telOperVOObject.setMacAddress("");
			telOperVOObject.setOperTm(DateTimeUtil.getDateNowByExpression("yyyy-MM-dd HH:mm:ss"));
			JSONObject packageListObject = new JSONObject();
			packageListObject.put("CAppNo", "0100101000102000420170000008");
			packageListObject.put("CResvTxt", "核保通过&&保单号：1100101000102000420170000002");
			packageListObject.put("CUdrCde", "100000001065");
			packageListObject.put("CUdrMrk", "4");
			packageListObject.put("TUdrTm", "2017-01-10 00:00:00");
			packageListObject.put("edrAppNo", "");
			packageListObject.put("policyIdef", "A");
			packageListObject.put("policyNo", "1100101000102000420170000002");
			packageListObject.put("undwrMsg", "通过");
			JSONObject returnListObject = new JSONObject();
			returnListObject.put("CAppNo", "");
			returnListObject.put("CEctRst", "");
			returnListObject.put("CRstTxt", "");
			JSONArray packageListArray = new JSONArray();
			
			JSONArray returnListArray = new JSONArray();
			packageListArray.add(0, packageListObject);
			packageListArray.add(1, returnListObject);
			
			policyStatusJSON.put("telOperVO", telOperVOObject);
			policyStatusJSON.put("packageList", packageListArray);
			policyStatusJSON.put("returnList", packageListArray);
			//支付成功回写
			response.setContentType("text/html;charset=gb2312");
			try{
				PrintWriter pw = response.getWriter();
				//支付成功回写 返回xml
				pw.print(paySuccessBack(payResultMap).toString());
				pw.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}else{
			return ;
		}
	
		
	}
	
	
	/**
	 * 解析payResult返回的xml
	 * @param xmlDoc
	 * @return
	 */
	public  HashMap xmlElements(String xmlDoc ) {
		Document doc = null;
		HashMap hm = new HashMap();
		try {
			doc = DocumentHelper.parseText(xmlDoc);
			Element root = doc.getRootElement();
			Element el = root.element("BODY").element("PAY_INFO");
			List<Element> list = el.elements();
			for(Element e :list){
				hm.put(e.getName(),  e.getText());
			}
		} catch (Exception e) {
		}
		return hm;
	}
	
	/**
	 * 拼接支付成功回写xml
	 * @param re
	 * @return
	 */
	public StringBuffer paySuccessBack(HashMap re){
		StringBuffer paySuccessReback = new StringBuffer();
		paySuccessReback.append("<?xml version='1.0' encoding='UTF-8'?>");
		paySuccessReback.append("<PACKET TYPE='RESPONSE'>");
		paySuccessReback.append("<BODY>");
		paySuccessReback.append("<PAY_RESULT>");
		paySuccessReback.append("<PAY_APP_NO>").append(re.get("PAY_APP_NO").toString()).append("</PAY_APP_NO>");
		paySuccessReback.append("<RESULT_CODE>0</RESULT_CODE>");
		paySuccessReback.append("<RESULT_MSG></RESULT_MSG>");
		paySuccessReback.append("<REMARK></REMARK>");
		paySuccessReback.append("</PAY_RESULT>");
		paySuccessReback.append("</BODY>");
		paySuccessReback.append("</PACKET> ");	
		return paySuccessReback;
	}

}
