package com.jeff.everyboo.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.Model;

import com.jeff.everyboo.org.entity.User;


public class WebHelper {
	
	public static final String SESSION_LOGIN_USER = "session_login_user";

	public static final String SESSION_MENU_RESOURCE = "session_menu_resource";

	public static final String SESSION_NO_IMPORT_SCORE = "session_no_import_score";
	
	public static final String SYS_PARAM_TIXIAN = "SYS_TIXIAN";
	/**
	 * 
	 * @param request
	 * @return
	 */
	public static Integer getCurrentPage(HttpServletRequest request) {

		String currentPage = request.getParameter("currentPage");
		if (StringUtils.isNotBlank(currentPage)
				&& StringUtils.isNumeric(currentPage)) {
			return Integer.parseInt(currentPage);
		}

		return null;
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	public static Integer getPageSize(HttpServletRequest request) {

		String pageSize = request.getParameter("pageSize");
		if (StringUtils.isNotBlank(pageSize) && StringUtils.isNumeric(pageSize)) {
			return Integer.parseInt(pageSize);
		}

		return null;
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	public static User getUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute(SESSION_LOGIN_USER);
	}

	public static String getRemoteHost(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
	}

	public static void setGoBackUrl(HttpServletRequest request, Model model) {
		String fromUrl = request.getHeader("referer");
		model.addAttribute("goBackUrl", fromUrl);
	}
	
	public static String getDayNo() {
		StringBuilder stringBuilder =new StringBuilder("NO");
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
		stringBuilder.append(simpleDateFormat.format(date));
		String verifyCode = String.valueOf(new Random().nextInt(999999));
		stringBuilder.append(verifyCode);
		return stringBuilder.toString();
	}

}
