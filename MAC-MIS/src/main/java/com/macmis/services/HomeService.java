/**
 * 
 */
package com.macmis.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macmis.entity.MemberEntity;
import com.macmis.entity.UserEntity;
import com.macmis.models.LoginModel;
import com.macmis.models.MemberModel;
import com.macmis.repository.MemberRepository;

/**
 * @author Venu S Reddy
 *
 */
@Service
public class HomeService {

	@Autowired
	private MemberRepository memberRepository;

	public void login(HttpSession session, MemberModel login) {

		MemberEntity memberEntity = memberRepository.findByUsernameAndPassword(login.getUsername(),
				login.getPassword());

		UserEntity userEntity = new UserEntity();
		if (memberEntity != null) {

			userEntity.setUsername(memberEntity.getUsername());
			userEntity.setPassword(memberEntity.getPassword());
			userEntity.setType(memberEntity.getType());
			userEntity.setSid(memberEntity.getSid());
		}

		if (userEntity != null && userEntity.getUsername() != null && userEntity.getUsername() != "") {

			// HttpSession session = Request.getSession();
			// String username = (String)request.getAttribute("un");
			session.setAttribute("username", userEntity.getUsername());
			session.setAttribute("type", userEntity.getType());
			session.setAttribute("isAuth", true);
		} else {
			session.setAttribute("isAuth", false);
		}
	}

	public void logout(HttpSession session) {
		// List<Login> tempList = new ArrayList<Login>();
		// tempList.add(login);
		// List<UserEntity> userEntityList = loginModelToEntity(tempList);
		// Save the object in the database
		// homeRepository.save(userEntity);
		// UserEntity userEntity =
		// homeRepository.findByUsernameAndPassword(login.getUsername(),
		// login.getPassword());

		session.removeAttribute("username");
		session.removeAttribute("type");
		session.removeAttribute("isAuth");

		//session = null;
	}

	/*
	 * Convert the list of model objects to list of entity objects
	 */
	@SuppressWarnings("unused")
	private List<UserEntity> loginModelToEntity(List<LoginModel> tempList) {
		List<UserEntity> userEntityList = new ArrayList<UserEntity>();
		if (tempList != null) {

			for (LoginModel login : tempList) {

				UserEntity userEntity = new UserEntity();
				userEntity.setSid(login.getSid());
				userEntity.setUsername(login.getUsername());
				userEntity.setPassword(login.getPassword());
				userEntity.setType(login.getType());

				userEntityList.add(userEntity);
			}
		}
		return userEntityList;
	}

	/*
	 * Convert the list of entity objects to list of model objects
	 */
	@SuppressWarnings("unused")
	private List<LoginModel> loginEntityToModel(List<UserEntity> tempList) {
		List<LoginModel> loginList = new ArrayList<LoginModel>();
		if (tempList != null) {

			for (UserEntity user : tempList) {

				LoginModel login = new LoginModel();
				login.setSid(user.getSid());
				login.setUsername(user.getUsername());
				login.setPassword(user.getPassword());
				login.setType(user.getType());

				loginList.add(login);
			}
		}
		return loginList;
	}
}
