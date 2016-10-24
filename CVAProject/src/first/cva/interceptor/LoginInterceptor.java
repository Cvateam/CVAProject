package first.cva.interceptor;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
 
/**
 * 사용자 로그인 확인 인터셉터 
 */
public class LoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		Map<String, Object> session = invocation.getInvocationContext().getSession();
		String loginId = (String) session.get("loginId");
		
		if (loginId == null) {		//세션에 로그인 정보가 없으면 로그인 페이지로.
			return Action.LOGIN;
		}
		return invocation.invoke();
	}

}
