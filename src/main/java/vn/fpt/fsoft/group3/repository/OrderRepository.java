package vn.fpt.fsoft.group3.repository;

import vn.fpt.fsoft.group3.entity.Customers;
import vn.fpt.fsoft.group3.entity.Orders;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

public interface OrderRepository extends JpaRepository<Orders, Long>{
/*    @Query(" select c "
    		+ " from Customers c "
    		+ " where cast(lower(c.name) as binary) like cast(lower(:name) as binary)")
    public List<Orders> findCustomerByName(@Param("name") String name);
    
    @Query(" select o " + " from Orders o " 
    		+ " where cast(o.ordercode as binary) = cast(:symbol as binary) as binary) "
    		+ " and c.mode = 1 "
    		+ " and c.version = (select max(cc.version) from Customers cc where cc.symbol = c.symbol and cc.serial = c.serial and cc.mode = 1) "
    		+ " order by c.lastupdate desc" )
	public List<Orders> getListOrders(@Param("customercode") String customercode,@Param("ordercode") String ordercode);
    */
    /*@Modifying
    @Transactional
    @Query("delete from Contact c where c.id = :id")
    public void deleteContact(@Param("id") Long id);*/
	
	/*@Query(" select o " + " from Orders o " 
    		+ " where o.ordercode like ?1 "
    		+ " and o.customer.customercode like ?2 " )*/
	public List<Orders> findByOrdercodeLikeAndCustomerCustomercodeLikeAndModeAndCustomerMode(String ordercode, String customercode, Integer mode, Integer customermode);
	
	@Query(" select max(o.serial) " + " from Orders o " 
	+ " where MONTH(o.startdate) = ?1 "
	+ " and YEAR(o.startdate) = ?2 " )
	public Integer findMaxSerialInMonthAndYear(Integer month, Integer year);
}
