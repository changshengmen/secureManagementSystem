package net.jeeshop.services.manage.webservice.impl;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;

public class TestService {
	public static void main(String[] args) {
//		ManualUnderwritingResultServiceImpl factory = new ManualUnderwritingResultServiceImpl();
//		String result = factory.getPolicyStatus('world');
//		//HelloService hs = factory.getHelloServicePort();
//		System.out.println('success' + result);
		
		String endpoint = "http://123.207.254.113:8080/JDT/manualUnderwriting?wsdl";
		 try {  
			 
	            String str = "{'telOperVP':{'COperId':'JDT','cpASSwD':'JDT'},'packageList':[{'CAppNo':'0100115000104000120170000010','CResvTxt':'提交成功!','CUdrCde':'100000001052','CUdrMrk':'4','TUdrTm':'2017-03-02 00:00:00','edrAppNo':'','policyIdef':'A','policyNo':'','undwrMsg':'fff'}],'returnList':[{'CAppNo':'','CEctRst':'','CRstTxt':''}]}" ;  
	            Service service = new Service() ;  
	            Call call = (Call) service.createCall() ;  
	            call.setTargetEndpointAddress(endpoint) ;  
	            call.setOperationName("getPolicyStatus") ;//ws方法名  
	            //一个输入参数,如果方法有多个参数,复制多条该代码即可,参数传入下面new Object后面  
	            call.addParameter("policyStatusResult",org.apache.axis.encoding.XMLType.XSD_DATE,javax.xml.rpc.ParameterMode.IN) ;  
	            call.setReturnType(XMLType.XSD_STRING) ;  
	            call.setUseSOAPAction(true) ;  
	              
	            String result = (String) call.invoke(new Object[]{str}) ;  
	              
	            System.out.println(result);  
	              
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  

	}
}
