/**
 * 
 */
package com.macmis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.macmis.entity.CompanyEntity;
import com.macmis.entity.MemberEntity;
import com.macmis.models.MemberModel;

/**
 * @author Venu S Reddy
 *
 */

@Repository
public interface MemberRepository extends CrudRepository<MemberEntity, Integer>{
	
	 @Override
	 public List<MemberEntity> findAll();
	 
	 public MemberEntity findByUsernameAndPassword(@Param(value="username") String username, @Param(value="password") String password);
	 
	 public MemberEntity findByStudentId(@Param(value="studentId") String studentId);
}
