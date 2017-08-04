package vn.fpt.fsoft.group3.controller;

import vn.fpt.fsoft.group3.entity.Customers;
import vn.fpt.fsoft.group3.entity.Fields;
import vn.fpt.fsoft.group3.entity.Orders;
import vn.fpt.fsoft.group3.entity.Types;
import vn.fpt.fsoft.group3.repository.CustomerRepository;
import vn.fpt.fsoft.group3.repository.FieldRepository;
import vn.fpt.fsoft.group3.repository.CountryRepository;
import vn.fpt.fsoft.group3.repository.TypeRepository;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author huydh
 * 
 */
@Controller
public class CustomerController {

	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private TypeRepository typeRepository;
	@Autowired
	private FieldRepository fieldRepository;
	@Autowired
	private CountryRepository countryRepository;

	@RequestMapping("/")
	public String index() {

		return "redirect:/CustomerManagement";

	}

	/*@RequestMapping(value = "/CustomerManagement", method = RequestMethod.GET)
	public String customerManagement(Model model) {
		
		model.addAttribute("title", "Quản lý khách hàng");
		model.addAttribute("customers", customerRepository.findByStatus(true));
		
		return "CustomerManagement";

	}*/
	
	@RequestMapping(value = "/CustomerManagement", method = RequestMethod.GET)
	public String customerManagement(Model model, @RequestParam(value = "name", defaultValue = "") String name) {

		model.addAttribute("name", name);

		name = "%" + name + "%";
		model.addAttribute("customers", customerRepository.findByNameUTF8(name));
		model.addAttribute("title", "Quản lý khách hàng");
		return "CustomerManagement";

	}

	@RequestMapping(value = "/HistoryCustomer", method = RequestMethod.GET)
	public String historyCustomer(Model model, @RequestParam(value = "required", required = true) String required,
			@RequestParam(value = "serial", required = true) Integer serial) {

		model.addAttribute("title", "Lịch sử khách hàng");
		model.addAttribute("customers", customerRepository.findByRequiredAndSerial(required, serial));

		return "CustomerManagement";

	}

	/*
	 * @RequestMapping(value = "/SaveCustomer", method = RequestMethod.POST) public
	 * String createCustomer(@ModelAttribute("CustomerForm") Customers CustomerForm,
	 * 
	 * @RequestParam(value = "upgradeVersion", required=false) Boolean
	 * upgradeVersion) {
	 * 
	 * Long cid = CustomerForm.getCid();
	 * 
	 * String typeValue = CustomerForm.getType().getValue(); Types type =
	 * typeRepository.findByValue(typeValue); CustomerForm.setType(type);
	 * 
	 * String fieldValue = CustomerForm.getField().getValue(); Fields field =
	 * fieldRepository.findByValue(fieldValue); CustomerForm.setField(field);
	 * 
	 * CustomerForm.setDate(new Date());
	 * 
	 * if (cid == null) { System.err.println("create new customer");
	 * customerRepository.save(CustomerForm); } else { Integer size =
	 * customerRepository.findOne(cid).getOrders().size(); if(size <= 1) {
	 * System.err.println("Update customer.orders.size <= 1");
	 * System.err.println("Update customer.orders.size = " + size);
	 * customerRepository.save(CustomerForm); } else {
	 * System.err.println("Update customer.orders.size > 1");
	 * System.err.println("Update customer.orders.size = " + size);
	 * System.err.println("Upgrade version = " + upgradeVersion); if
	 * (!upgradeVersion) { customerRepository.save(CustomerForm); } else {
	 * CustomerForm.setStatus(false); customerRepository.save(CustomerForm);
	 * 
	 * Integer curVersion = CustomerForm.getVersion(); CustomerForm.setCid(null);
	 * CustomerForm.setStatus(true); CustomerForm.setVersion(curVersion + 1);
	 * customerRepository.save(CustomerForm); }
	 * 
	 * } }
	 * 
	 * return "redirect:/CustomerManagement"; }
	 */

	@RequestMapping(value = "/AllInOne", method = RequestMethod.GET)
	public String allInOne(Model model, @RequestParam(value = "cid", required = false) Long cid,
			@RequestParam(value = "view", required = false) Boolean view) {

		Customers customerForm;
		Boolean upgradeVersion = false;

		if (cid == null) {
			customerForm = new Customers();
		} else {
			customerForm = customerRepository.findOne(cid);
			Integer sizeOrders = customerForm.getOrders().size();
			if (sizeOrders > 1) {
				upgradeVersion = true;
			}
		}

		model.addAttribute("upgradeVersion", upgradeVersion);
		model.addAttribute("CustomerForm", customerForm);

		model.addAttribute("view", view);
		model.addAttribute("Types", typeRepository.findAll());
		model.addAttribute("Fields", fieldRepository.findAll());
		model.addAttribute("Countries", countryRepository.findAll());
		return "AllInOne";
	}

	@RequestMapping(value = "/DeleteCustomer", method = RequestMethod.POST)
	public @ResponseBody String deleteCustomer(Model model, @RequestParam(value = "cid", defaultValue = "0") Long cid) {
		Customers customer = customerRepository.findOne(cid);
		customer.setStatus(false);
		customerRepository.save(customer);
		return "Success";
	}

	@RequestMapping(value = "/GetSerial", method = RequestMethod.GET)
	public @ResponseBody String getSerial(@RequestParam(value = "required", required = true) String required) {

		/*
		 * if (customerRepository.getMaxSerial(required) == null) return "0001"; String
		 * serial = Integer.toString(customerRepository.getMaxSerial(required) + 1);
		 * String format = ("0000" + serial).substring(serial.length()); return format;
		 */

		Integer serial = 1;
		if (customerRepository.getMaxSerial(required) != null) {
			serial = customerRepository.getMaxSerial(required) + 1;
		}
		return String.format("%04d", serial);
	}

	@RequestMapping(value = "/SaveCustomer", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("CustomerForm") Customers customerForm,
			@RequestParam(value = "upgradeVersion", required = true) Boolean upgradeVersion) {

		String typeValue = customerForm.getType().getValue();
		Types type = typeRepository.findByValue(typeValue);
		customerForm.setType(type);

		String fieldValue = customerForm.getField().getValue();
		Fields field = fieldRepository.findByValue(fieldValue);
		customerForm.setField(field);

		customerForm.setDate(new Date());

		if (!upgradeVersion) {
			System.err.println("Create new customer Or Update customer.orders.size <= 1");
			customerRepository.save(customerForm);
		} else {
			System.err.println("Update customer.orders.size > 1");
			System.err.println("Upgrade version = " + upgradeVersion);
			customerForm.setStatus(false);
			customerRepository.save(customerForm);

			Integer curVersion = customerForm.getVersion();
			customerForm.setCid(null);
			customerForm.setStatus(true);
			customerForm.setVersion(curVersion + 1);
			customerRepository.save(customerForm);
			}

		return "redirect:/CustomerManagement";
	}

	/*
	 * @RequestMapping(value = "/SaveCustomer", method = RequestMethod.POST) public
	 * String AddCustomer(@ModelAttribute("CustomerForm") Customers CustomerForm,
	 * 
	 * @RequestParam(value = "sizeOrders", required=false) Integer sizeOrders,
	 * 
	 * @RequestParam(value = "upgradeVersion", required=false) Boolean
	 * upgradeVersion) {
	 * 
	 * Long cid = CustomerForm.getCid();
	 * 
	 * String typeValue = CustomerForm.getType().getValue(); Types type =
	 * typeRepository.findByValue(typeValue); CustomerForm.setType(type);
	 * 
	 * String fieldValue = CustomerForm.getField().getValue(); Fields field =
	 * fieldRepository.findByValue(fieldValue); CustomerForm.setField(field);
	 * 
	 * CustomerForm.setDate(new Date());
	 * 
	 * if (cid == null) { System.err.println("create new customer");
	 * customerRepository.save(CustomerForm); } else { Integer size =
	 * customerRepository.findOne(cid).getOrders().size(); if(size <= 1) {
	 * System.err.println("Update customer.orders.size <= 1");
	 * System.err.println("Update customer.orders.size = " + size);
	 * customerRepository.save(CustomerForm); } else {
	 * System.err.println("Update customer.orders.size > 1");
	 * System.err.println("Update customer.orders.size = " + size);
	 * System.err.println("Upgrade version = " + upgradeVersion); if
	 * (!upgradeVersion) { customerRepository.save(CustomerForm); } else {
	 * CustomerForm.setStatus(false); customerRepository.save(CustomerForm);
	 * 
	 * Integer curVersion = CustomerForm.getVersion(); CustomerForm.setCid(null);
	 * CustomerForm.setStatus(true); CustomerForm.setVersion(curVersion + 1);
	 * customerRepository.save(CustomerForm); }
	 * 
	 * } }
	 * 
	 * return "redirect:/CustomerManagement"; }
	 */

	/*
	 * @RequestMapping(value = "/AddCustomer", method = RequestMethod.POST) public
	 * String addCustomer(@ModelAttribute("customerForm") Customers customer) { Long
	 * cid = customer.getCid(); // create a new customer or update directly
	 * customer's information (number of orders < 1) if (cid == null ||
	 * customerRepository.findOne(cid).getOrders().size() <= 1) {
	 * customer.setType(typeRepository.findByValue(customer.getType().getValue()));
	 * customer.setField(fieldRepository.findByValue(customer.getField().getValue())
	 * ); customer.setVersion(1); customer.setDate(new Date());
	 * customer.setStatus(true); customerRepository.save(customer); } else { //
	 * create a new customer with new version if
	 * (customerRepository.findOne(cid).getRequired().equals(customer.getRequired())
	 * ) { customer.setCid(null);
	 * customer.setType(typeRepository.findByValue(customer.getType().getValue()));
	 * customer.setField(fieldRepository.findByValue(customer.getField().getValue())
	 * ); customer.setVersion(customerRepository.findOne(cid).getVersion() + 1);
	 * customer.setDate(new Date()); customer.setStatus(true);
	 * customerRepository.save(customer); } else { // create a new customer return
	 * "redirect:/AllInOne"; } } return "redirect:/"; }
	 */

}