package hygge.ejb.interceptors;

import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;

public class DefaultInterceptor {
	@AroundInvoke
	public Object defaultLogg(InvocationContext iCtx) throws Exception{
		System.out.println("*** Default Interceptor: "+iCtx.getMethod().getName());
		return iCtx.proceed();
	}
}
