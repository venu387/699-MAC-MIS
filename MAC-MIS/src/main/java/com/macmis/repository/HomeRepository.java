/**
 * 
 */
package com.macmis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.macmis.entity.CompanyEntity;
import com.macmis.entity.UserEntity;

/**
 * @author Venu S Reddy
 *
 */

@Repository
public interface HomeRepository extends CrudRepository<UserEntity, Integer>{
	
	 @Override
	 public List<UserEntity> findAll();

	 public UserEntity findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
	 //public UserEntity findOne(@Param("username") String username, @Param("password") String password);
}
