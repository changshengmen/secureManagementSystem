package net.jeeshop.core.util;

import javax.xml.rpc.ParameterMode;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;

/**
 * @author lin axis1.4 调用webservice接口
 */
public class webServiceUtil
{
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
			System.out.println("入参=" + json);
			result = (String) call.invoke(new Object[] { json });
			
		} catch (Exception e)
		{
			System.out.println("GeneratorData_error_supply:" + e);
		}
		System.out.println("出参=" + result);
		return result;

	}
}
