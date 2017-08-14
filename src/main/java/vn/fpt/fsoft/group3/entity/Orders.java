package vn.fpt.fsoft.group3.entity;

import java.io.Serializable;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.FetchMode;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Orders")
@DynamicUpdate(value=true)
public class Orders implements Serializable {

	private static final long serialVersionUID = 2L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderid")
	private Long orderid;
	@Column(name = "ordercode", nullable = false)
	private String ordercode;
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	@Column(name = "startdate", nullable = false)
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate startdate;
	@Column(name = "finishdate", nullable = true)
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
	private LocalDate finishdate;
	@Column(name = "serial",  nullable = false)
	private Integer serial;
	@Column(name = "status", nullable = false)
	private Boolean status;
	@Column(name = "note", nullable = true)
	private String note;
	@Column(name = "unit", nullable = true)
	private String unit;
	@Column(name = "number", nullable = true)
	private Integer number;
	@Column(name = "content", nullable = true)
	private String content;
	@Column(name = "mode", nullable = false)
	private Integer mode;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customerid", nullable = false)
	private Customers customer;
	@JsonIgnore
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<Requirements> requirements;
	@JsonIgnore
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<Files> files;
	
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
	public String getStartdate() {
		if (startdate == null)
			return "";
		String date = String.format("%02d", this.startdate.getDayOfMonth()) + "/"
				+ String.format("%02d",this.startdate.getMonthOfYear()) + "/" 
				+ String.format("%04d", this.startdate.getYear());
		return date;
	}
	public LocalDate getStartdate2() {
		return this.startdate;
	}
	public void setStartdate(String startdate) {
		DateTimeFormatter dtf = DateTimeFormat.forPattern("d/M/Y");
		this.startdate = dtf.parseLocalDate(startdate);
	}
	
	public String getFinishdate() {
		if (finishdate == null)
			return "";
		String date = String.format("%02d", this.finishdate.getDayOfMonth()) + "/"
				+ String.format("%02d",this.finishdate.getMonthOfYear()) + "/" 
				+ String.format("%04d", this.finishdate.getYear());
		return date;
	}
	public void setFinishdate(String finishdate) {
		DateTimeFormatter dtf = DateTimeFormat.forPattern("d/M/Y");
		this.finishdate = dtf.parseLocalDate(finishdate);
	}
	public LocalDate getFinishdate2() {
		return this.finishdate;
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
	public Integer getMode() {
		return mode;
	}
	public void setMode(Integer mode) {
		this.mode = mode;
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
	public void createOrdercode() {
		this.ordercode = "N" + String.format("%02d",this.startdate.getMonthOfYear()) 
							+ String.format("%02d",this.startdate.getYear()) 
							+ String.format("%04d", this.serial);	
	}
	public Set<Requirements> getRequirements() {
		return requirements;
	}
	public void setRequirements(Set<Requirements> requirements) {
		this.requirements = requirements;
	}
	public Set<Files> getFiles() {
		return files;
	}
	public void setFiles(Set<Files> files) {
		this.files = files;
	}
	
}
