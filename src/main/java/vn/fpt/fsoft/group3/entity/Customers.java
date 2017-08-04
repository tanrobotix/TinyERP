package vn.fpt.fsoft.group3.entity;

import java.io.Serializable;
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
import javax.persistence.CascadeType;
import javax.persistence.FetchType;

@Entity
@Table(name = "Customers", uniqueConstraints = {@UniqueConstraint(columnNames = {"required", "serial", "version"})})
public class Customers implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cid")
	private Long cid;
	@Column(name = "required", length = 4, nullable = false)
	private String required;
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "type", nullable = false)
	private Types type;
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "field", nullable = false)
	private Fields field;
	@Column(name = "serial", length = 4, nullable = false)
	private Integer serial;
	@Column(name = "name", length = 100, nullable = false)
	private String name;
	@Column(name = "address", length = 200, nullable = true)
	private String address;
	@Column(name = "representative", length = 100, nullable = true)
	private String representative;
	@Column(name = "tax", length = 14, nullable = true)
	private String tax;
	@Column(name = "title", length = 50, nullable = true)
	private String title;
	@Column(name = "phone", length = 20, nullable = true)
	private String phone;
	@Column(name = "email", length = 100, nullable = true)
	private String email;
	@Column(name = "mobile", length = 20, nullable = true)
	private String mobile;
	@Column(name = "website", length = 100, nullable = true)
	private String website;
	@Column(name = "fax", length = 20, nullable = true)
	private String fax;
	@Column(name = "date", nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	@Column(name = "version", nullable = false)
	private Integer version;
	@Column(name = "status", nullable = false)
	private Boolean status;
	@OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<Orders> orders;

	public Customers() {
		super();
		this.serial = 1;
		this.version = 1;
		this.status = true;
		this.date = new Date(0);
	}

	public Long getCid() {
		return cid;
	}

	public void setCid(Long i) {
		this.cid = i;
	}

	public String getRequired() {
		return required;
	}

	public void setRequired(String required) {
		this.required = required;
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

	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
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