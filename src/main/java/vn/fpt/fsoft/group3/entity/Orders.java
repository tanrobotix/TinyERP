package vn.fpt.fsoft.group3.entity;

import java.io.Serializable;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.jadira.usertype.dateandtime.joda.PersistentDateTime;
@Entity
@Table(name = "Orders")
public class Orders implements Serializable {

	private static final long serialVersionUID = 2L;
	@Id
	@Column(name = "orderid", nullable = false)
	private Long orderid;
	@Column(name = "ordercode", nullable = false)
	private String ordercode;
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	@Column(name = "startdate", nullable = false)
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime startdate;
	@Column(name = "finishdate")
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime finishdate;
	@Column(name = "serial", length = 4,  nullable = false)
	private Integer serial;
	@Column(name = "status", nullable = false)
	private Boolean status;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customerid", nullable = false)
	private Customers customer;
	
	public Long getOrderid() {
		return orderid;
	}
	public void setOrderid(Long orderid) {
		this.orderid = orderid;
	}
	public String getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public DateTime getStartdate() {
		return startdate;
	}
	public void setStartdate(DateTime startdate) {
		this.startdate = startdate;
	}
	public DateTime getFinishdate() {
		return finishdate;
	}
	public void setFinishdate(DateTime finishdate) {
		this.finishdate = finishdate;
	}
	public Integer getSerial() {
		return serial;
	}
	public void setSerial(Integer serial) {
		this.serial = serial;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public Customers getCustomer() {
		return customer;
	}
	public void setCustomer(Customers customer) {
		this.customer = customer;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
