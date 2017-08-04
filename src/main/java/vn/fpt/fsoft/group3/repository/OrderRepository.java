package vn.fpt.fsoft.group3.repository;

import vn.fpt.fsoft.group3.entity.Orders;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface OrderRepository extends JpaRepository<Orders, String>{
    @Query(" select c "
    		+ " from Customers c "
    		+ " where cast(lower(c.name) as binary) like cast(lower(:name) as binary)")
    public List<Orders> findCustomerByName(@Param("name") String name);
    
    /*@Modifying
    @Transactional
    @Query("delete from Contact c where c.id = :id")
    public void deleteContact(@Param("id") Long id);*/
}
