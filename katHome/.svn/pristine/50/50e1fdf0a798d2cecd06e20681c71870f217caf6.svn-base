package com.kat.home.security;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kat.home.dto.UserDTO;


public class SecurityDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public UserDTO getUserInfo(UserDTO dto) {		
		return getSqlSession().selectOne("User.getUserInfo", dto);
	}
}
