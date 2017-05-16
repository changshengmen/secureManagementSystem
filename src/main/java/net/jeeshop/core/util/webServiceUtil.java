package net.jeeshop.core.util;

import javax.xml.rpc.ParameterMode;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;


/**
 * @author lin axis1.4 调用webservice接口
 */
public class webServiceUtil
{	
	private static final Logger logger = Logger.getLogger(webServiceUtil.class);

	public static String getSupplyInfo(String json, String url,String operationName,String interfaceType)
	{
		String result = "";
		if(interfaceType.equals("1000")){
			
			try
			{
				Service service = new Service();
				Call call = (Call) service.createCall();
				call.setTargetEndpointAddress(url);
				call.setOperationName(operationName);
				call.addParameter("TotalParValue", XMLType.XSD_STRING, ParameterMode.IN);
				call.setReturnType(XMLType.XSD_STRING);
				// 调用并且获取返回的报文结果
				logger.info("1000入参=" + json);
				
				//项数据库日至表插入入参信息
				MDC.put("interfaceType", "1000");
				MDC.put("inPutParameter", json);
				
				result = (String) call.invoke(new Object[] { json });
				
			} catch (Exception e)
			{
				System.out.println("GeneratorData_error_supply:" + e);
			}
			logger.info("1000出参=" + result);
			//向数据库插入出参信息
			MDC.put("outPutParameter", result);
		}
		
		if(interfaceType.equals("1001")){
			try
			{
				Service service = new Service();
				Call call = (Call) service.createCall();
				call.setTargetEndpointAddress(url);
				call.setOperationName(operationName);
				call.addParameter("TotalParValue", XMLType.XSD_STRING, ParameterMode.IN);
				call.setReturnType(XMLType.XSD_STRING);
				// 调用并且获取返回的报文结果
				logger.info("1001入参=" + json);
				//项数据库日至表插入入参信息
				MDC.put("interfaceType", "1001");
				MDC.put("inPutParameter", json);
				result = (String) call.invoke(new Object[] { json });
				
			} catch (Exception e)
			{
				System.out.println("GeneratorData_error_supply:" + e);
			}
			logger.info("1001出参=" + result);
			//向数据库插入出参信息
			MDC.put("outPutParameter", result);
			
		}
		
		if(interfaceType.equals("1003")){
			try
			{
				Service service = new Service();
				Call call = (Call) service.createCall();
				call.setTargetEndpointAddress(url);
				call.setOperationName(operationName);
				call.addParameter("TotalParValue", XMLType.XSD_STRING, ParameterMode.IN);
				call.setReturnType(XMLType.XSD_STRING);
				// 调用并且获取返回的报文结果
				logger.info("1003入参=" + json);
				//项数据库日至表插入入参信息
				MDC.put("interfaceType", "1003");
				MDC.put("inPutParameter", json);
				result = (String) call.invoke(new Object[] { json });
				
			} catch (Exception e)
			{
				System.out.println("GeneratorData_error_supply:" + e);
			}
			logger.info("1003出参=" + result);
			//向数据库插入出参信息
			MDC.put("outPutParameter", result);
		}
		return result;
	}
}
