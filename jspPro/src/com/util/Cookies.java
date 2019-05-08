package com.util;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

// 쿠키 클래스
public class Cookies {

	// HashMap 선언 
	public Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();

	// Constructor
	public Cookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				// HashMap에 쿠키이름과 쿠키객체를 각각 key, value로 저장
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
    public String getValue(String name) throws IOException {
    	Cookie cookie = cookieMap.get(name);
    	if (cookie == null) {
			return null;
		}
    	return URLDecoder.decode(cookie.getValue(), "utf-8");
    }
    
    public boolean exists(String name) {
    	return cookieMap.get(name) != null;
    }
    
    public static Cookie createCookie(String name, String value) throws IOException {
    	return new Cookie(name, URLEncoder.encode(value, "utf-8"));
    }
    
    public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException {
    	Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
    	cookie.setPath(path);
    	cookie.setMaxAge(maxAge);
    	return cookie;
    }
    
    public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) throws IOException {
    	Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
    	cookie.setDomain(domain);
    	cookie.setPath(path);
    	cookie.setMaxAge(maxAge);
    	return cookie;
    }
}
