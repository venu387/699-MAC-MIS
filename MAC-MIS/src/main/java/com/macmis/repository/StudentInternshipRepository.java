/**
 * 
 */
package com.macmis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.macmis.entity.StudentInternshipEntity;

/**
 * @author Venu S Reddy
 *
 */
@Repository
public interface StudentInternshipRepository extends CrudRepository<StudentInternshipEntity, Integer> {

	@Override
	public List<StudentInternshipEntity> findAll();

	public List<StudentInternshipEntity> findByMemberId(int memberId);

	public List<StudentInternshipEntity> findByStudentId(String studentId);

}
