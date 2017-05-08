package net.jeeshop.core.util;

import javax.xml.rpc.ParameterMode;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.jeeshop.web.action.manage.secureProduct.SecureProductAction;

/**
 * @author lin axis1.4 调用webservice接口
 */
public class webServiceUtil
{	
	private static final Logger logger = LoggerFactory.getLogger(webServiceUtil.class);

	public static String getSupplyInfo(String json, String url,String operationName)
	{
		String result = "";
		try
		{
			Service service = new Service();
			Call call = (Call) service.createCall();
			call.setTargetEndpointAddress(url);
			call.setOperationName(operationName);
			call.addParameter("TotalParValue", XMLType.XSD_STRING, ParameterMode.IN);
			call.setReturnType(XMLType.XSD_STRING);
			// 调用并且获取返回的报文结果
			logger.info("入参=" + json);
			result = (String) call.invoke(new Object[] { json });
			
		} catch (Exception e)
		{
			System.out.println("GeneratorData_error_supply:" + e);
		}
		logger.info("出参=" + result);
		return result;

	}
}
