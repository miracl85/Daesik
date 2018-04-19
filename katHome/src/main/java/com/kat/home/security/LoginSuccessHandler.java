package com.kat.home.security;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.kat.home.dto.UserDTO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request
										,HttpServletResponse response
										,Authentication authentication)
										throws IOException, ServletException {

		ObjectMapper om = new ObjectMapper();
		HttpSession session = request.getSession();
		
		Map<String, Object> map = new HashMap<String, Object>();

		UserDTO userInfo = new UserDTO();
		
		userInfo = (UserDTO)SecurityContextHolder.getContext().getAuthentication().getDetails(); 

		logger.info("LoginSuccessHandler userInfo : " + userInfo.toString());
		
		session.setAttribute("userId", userInfo.getUserId());
		session.setAttribute("userName", userInfo.getUserName());
		
		OutputStream out = response.getOutputStream();
		
		map.put("result", true);
		
		String jsonString = om.writeValueAsString(map);
		out.write(jsonString.getBytes());
	}
}