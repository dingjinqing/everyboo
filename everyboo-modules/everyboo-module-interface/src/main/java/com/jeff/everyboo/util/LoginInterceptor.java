package com.jeff.everyboo.util;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.jeff.everyboo.cms.entity.ShopUser;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ShopUser user = (ShopUser) session.getAttribute("userInfo");
		
		response.setContentType("application/json;charset=utf-8");
//        ServletContext application = session.getServletContext();
		if (user==null || "".equals(user)){    //未登录
			System.out.println("session不存在");
			PrintWriter out = null ;
			JSONObject res = new JSONObject();
		    res.put("success","false");
		    res.put("msg","login first");
		    out = response.getWriter();
		    out.append(res.toJSONString());
            return false;
        }else{    //已经登录
        	
        	StringBuffer stringBuffer = new StringBuffer();
    		Map maps=request.getParameterMap();
    		  Set sets=maps.keySet();
    		  Iterator it=sets.iterator();
    		  while(it.hasNext()){
    		   String strName=it.next().toString();
    		   stringBuffer.append(strName);
    		   Object objs=maps.get(strName);
    		   if(objs instanceof String[]){
    		    String[] strs=(String[])objs;
    		    stringBuffer.append(Arrays.toString(strs));
    		   }
    		   stringBuffer.append("<br>");
    		  }
    		System.out.println("时间："+new Date().toLocaleString()+"\t 当前用户id:"+user.getId()+"\t"+this.getIpAddress(request)+"\t参数:"+stringBuffer.toString());
    		
            return true;
        }
	}
	
	 public String getIpAddress(HttpServletRequest request) {  
         String ip = request.getHeader("x-forwarded-for");  
       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
           ip = request.getHeader("Proxy-Client-IP");  
       }  
       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
           ip = request.getHeader("WL-Proxy-Client-IP");  
       }  
       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
           ip = request.getHeader("HTTP_CLIENT_IP");  
       }  
       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
           ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
       }  
       if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
           ip = request.getRemoteAddr();  
       }  
       return ip;  
   } 

}
