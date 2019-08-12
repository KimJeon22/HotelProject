package net.hb.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

   private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
   
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	       //������ ã�ƿ´�
			HttpSession session = request.getSession();
			String boxer = (String)session.getAttribute("m_id");
	
			System.out.println("LoginInterceptor�μ� ����boxer=" + boxer);
			//�α����� �ȵ� ���¿��� ��û�� ���� �� �α��� �� �� ��û�� �������� �̵��ϵ��� �ϱ� ���ؼ� ��û�� �ּҸ� ���ǿ� ������ �� �α����� �������� �� �� �ּҷ� �̵��ϵ��� �ϸ� �ȴ�.
			String uri = request.getRequestURI();
			System.out.println("LoginInterceptor�μ�  uri " + uri);
	        
	      //������Ʈ �̸����� ã�ƿ��⶧���� �ּҸ�  http://127.0.0.1:8081/crud/~~.do
			int idx = uri.lastIndexOf("/");
			uri = uri.substring(idx+1);
			
			System.out.println("LoginInterceptor�μ�  uri "+uri);
	        //�Ķ���� ã�ƿ���  ����Ʈ���� ����Ŭ���ϸ� idx������ �������� 
			String query = request.getQueryString();
			System.out.println("LoginInterceptor�μ�  query=" + query);
			
			//�Ķ���Ͱ� ������ ��û �ּҴ� �״�� 
			if(query==null || query.equals("null")){
				query="";
			}
			else{ query="?"+query;}
			uri = uri + query;
		
			boolean adminCheck = false;
			//�α����� �ȵ� ��� �α��� �������� �̵�
			if(boxer!=null){
				adminCheck=true;	
			}else {
				response.setContentType("text/html; charset=utf-8");
				response.getWriter().append("<script>"
								+ "alert('�α������ʿ��մϴ�.');"
					        		 + "history.go(-1);"
								  + "</script>").flush();
				adminCheck=false;
			}
			return adminCheck;
	}//end

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)		throws Exception {
		//��Ʈ�ѷ��� �޼ҵ� ������ , ȭ��ó���� ó�� 
        logger.info("=======================afterCompletion start========================");
		logger.info("=======================afterCompletion end=========================");
	}//end
			
	
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)		throws Exception {
		//��Ʈ�ѷ��� �޼ҵ� ������ ,1ó�� 
	   logger.info("=======================postHandle start======================");
	   logger.info("=======================postHandle end=========================");	
	}//end

}//class LoginInterceptor END