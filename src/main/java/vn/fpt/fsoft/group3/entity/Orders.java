package vn.fpt.fsoft.group3.entity;

import java.io.Serializable;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Orders")
public class Orders implements Serializable {

	private static final long serialVersionUID = 2L;
	@Id
	@Column(name = "orderid", length = 17, nullable = false)
	private String orderid;
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	@Temporal(TemporalType.DATE)
	@Column(name = "startdate", nullable = false)
	private Date sdate;
	@Temporal(TemporalType.DATE)
	@Column(name = "finishdate")
	private Date fdate;
	@Column(name = "status", nullable = false)
	private Boolean status;
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "customerid", nullable = true)
	private Customers customer;
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public Customers getCustomer() {
		return customer;
	}
	public void setCustomer(Customers customer) {
		this.customer = customer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
