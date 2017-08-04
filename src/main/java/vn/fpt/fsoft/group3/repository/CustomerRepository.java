/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.fpt.fsoft.group3.repository;

import vn.fpt.fsoft.group3.entity.Customers;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface CustomerRepository extends JpaRepository<Customers, Long> {
	@Query(" select c " + " from Customers c "
			+ " where cast(lower(c.name) as binary) like cast(lower(:name) as binary) and status = 1")
	public List<Customers> findByNameUTF8(@Param("name") String name);

	@Query(" select max(c.serial) from Customers c where c.required = :required")
	public Integer getMaxSerial(@Param("required") String required);
	
	public List<Customers> findByRequiredAndSerial(@Param("required") String required, @Param("serial") Integer serial);
	
	public List<Customers> findByStatus(@Param("status") Boolean status);
	/*public Customers findTopByRequiredBySerialDesc(String required);*/
	/* public List<Customers> findByNameIgnoreCaseContaining(String name); */

	/*
	 * @Modifying
	 * 
	 * @Transactional
	 * 
	 * @Query("delete from Contact c where c.id = :id") public void
	 * deleteContact(@Param("id") Long id);
	 */
}
