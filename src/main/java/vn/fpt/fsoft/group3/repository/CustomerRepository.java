/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.fpt.fsoft.group3.repository;

import vn.fpt.fsoft.group3.entity.Customers;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface CustomerRepository extends JpaRepository<Customers, Long> {
	/*@Query(" select c " + " from Customers c "
			+ " where cast(lower(c.name) as binary) like cast(lower(concat('%', :name, '%')) as binary) and c.status = 1")
	public List<Customers> findByAndSort(@Param("name") String name, Sort sort);*/
	
	
	@Query(" select c " + " from Customers c " 
		+ " where cast(lower(c.name) as binary) like cast(lower(concat('%', :name, '%')) as binary) "
		+ " and c.mode = 1 "
		+ " and c.version = (select max(cc.version) from Customers cc where cc.symbol = c.symbol and cc.serial = c.serial and cc.mode = 1) "
		+ " order by c.lastupdate desc" )
	public List<Customers> getListCustomers(@Param("name") String name);
	

	/*@Query(" select max(c.serial) from Customers c where cast(c.symbol as binary) = cast(:symbol as binary)")
	public Integer getMaxSerialBySymbol(@Param("symbol") String symbol);*/
	
	public Customers findTopBySymbolOrderBySerialDesc(String symbol);
	
	/*@Query("select c from Customers c where c.customercode = ?1")
	public List<Customers> findByAndSort(String customercode, Sort sort);*/
	
	public List<Customers> findByCustomercodeOrderByVersionDesc(String customercode);
	
	public List<Customers> findByMode(@Param("mode") Integer mode);
	
	public Customers findTopByCustomercodeOrderByVersionDesc(String Customercode);

	
	/*public Customers findTopByRequiredBySerialDesc(String required);
	public List<Customers> findByNameIgnoreCaseContaining(String name);
	@Modifying 
	@Transactional
	@Query("delete from Contact c where c.id = :id") public void
	deleteContact(@Param("id") Long id);*/
	 
}
