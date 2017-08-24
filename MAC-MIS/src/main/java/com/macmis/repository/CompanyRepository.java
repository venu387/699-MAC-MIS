/**
 * 
 */
package com.macmis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.macmis.entity.CompanyEntity;

/**
 * @author Venu S Reddy
 *
 */

@Repository
public interface CompanyRepository extends CrudRepository<CompanyEntity, Integer>{
	
	 @Override
	 public List<CompanyEntity> findAll();

	 public CompanyEntity findOne(@Param("sid") int sid);
}
