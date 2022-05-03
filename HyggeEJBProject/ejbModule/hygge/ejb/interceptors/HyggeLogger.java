package hygge.ejb.interceptors;

import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

public class HyggeLogger {

	@AroundInvoke
	public Object logMethod(InvocationContext iCtx) throws Exception {
		System.out.println("**** Entering method: "+iCtx.getMethod().getName());
		System.out.println("Target Class: "+iCtx.getTarget().getClass());
		
		System.out.println("No. of Parameters: "+iCtx.getParameters().length);
		
		for(int i=0;i<iCtx.getParameters().length;i++)
			System.out.println("Parameter: "+iCtx.getParameters()[i].toString());
		System.out.println("********************************************");
		return iCtx.proceed();
	}

}
