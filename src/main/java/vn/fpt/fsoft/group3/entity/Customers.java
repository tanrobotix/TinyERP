package vn.fpt.fsoft.group3.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.joda.time.DateTime;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Type;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;

@Entity
@Table(name = "Customers", uniqueConstraints = { @UniqueConstraint(columnNames = { "customercode", "version" }) })
@DynamicUpdate(value=true)
public class Customers implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "customerid")
	private Long customerid;
	@Column(name = "customercode", nullable = false)
	private String customercode;
	@Column(name = "symbol", length = 4, nullable = false)
	private String symbol;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "typeid", nullable = false)
	private Types type;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fieldid", nullable = false)
	private Fields field;
	@Column(name = "serial", length = 4, nullable = false)
	private Integer serial;
	@Column(name = "version", nullable = false)
	private Integer version;
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	@Column(name = "address", length = 200, nullable = false)
	private String address;
	@Column(name = "representatives", length = 100, nullable = false)
	private String representatives;
	@Column(name = "title", length = 50, nullable = false)
	private String title;
	@Column(name = "tax", length = 13, nullable = false)
	private String tax;
	@Column(name = "phone", length = 20, nullable = false)
	private String phone;
	@Column(name = "email", length = 100, nullable = false)
	private String email;
	@Column(name = "mode", nullable = false)
	private Integer mode;
	@Column(name = "datecreated", nullable = false)
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime datecreated;
	@Column(name = "lastupdate", nullable = false)
	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime lastupdate;
	@Column(name = "website", length = 100, nullable = true)
	private String website;
	@Column(name = "mobile", length = 20, nullable = true)
	private String mobile;
	@Column(name = "fax", length = 20, nullable = true)
	private String fax;
	@JsonIgnore
	@OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<Orders> orders;

	public void createCustomercode() {
		this.customercode = this.symbol + this.type.getTypeid() + this.field.getFieldid() + String.format("%04d", this.serial);
	}

	public String getCustomercode() {
		return customercode;
	}

	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}

	public Long getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Long customerid) {
		this.customerid = customerid;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public Types getType() {
		return type;
	}

	public void setType(Types type) {
		this.type = type;
	}

	public Fields getField() {
		return field;
	}

	public void setField(Fields field) {
		this.field = field;
	}

	public Integer getSerial() {
		return serial;
	}

	public void setSerial(Integer serial) {
		this.serial = serial;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRepresentatives() {
		return representatives;
	}

	public void setRepresentatives(String representatives) {
		this.representatives = representatives;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getMode() {
		return mode;
	}

	public void setMode(Integer mode) {
		this.mode = mode;
	}

	public DateTime getDatecreated() {
		return datecreated;
	}

	public void setDatecreated(DateTime datecreated) {
		this.datecreated = datecreated;
	}

	public DateTime getLastupdate() {
		return lastupdate;
	}

	public void setLastupdate(DateTime lastupdate) {
		this.lastupdate = lastupdate;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public Set<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}