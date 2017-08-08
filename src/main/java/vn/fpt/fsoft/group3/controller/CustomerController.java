package vn.fpt.fsoft.group3.controller;

import vn.fpt.fsoft.group3.entity.Customers;
import vn.fpt.fsoft.group3.entity.Fields;
import vn.fpt.fsoft.group3.entity.Orders;
import vn.fpt.fsoft.group3.entity.Types;
import vn.fpt.fsoft.group3.repository.CustomerRepository;
import vn.fpt.fsoft.group3.repository.FieldRepository;
import vn.fpt.fsoft.group3.repository.TypeRepository;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
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

	@RequestMapping("/")
	public String index() {

		return "redirect:/CustomerManagement";

	}

	@RequestMapping(value = "/CustomerManagement", method = RequestMethod.GET)
	public String customerManagement(Model model, @RequestParam(value = "name", required = false) String name) {
		
		model.addAttribute("name", name);
		return "CustomerManagement";

	}

	/*@RequestMapping(value = "/HistoryCustomer", method = RequestMethod.GET)
	public String historyCustomer(Model model, @RequestParam(value = "required", required = true) String required,
			@RequestParam(value = "serial", required = true) Integer serial) {

		model.addAttribute("title", "Lịch sử khách hàng");
		model.addAttribute("customers", customerRepository.findByRequiredAndSerial(required, serial));

		return "CustomerManagement";

	}*/

	@RequestMapping(value = "/GetListCustomers", method = RequestMethod.GET)
	public @ResponseBody List<Customers> getListCustomers(@RequestParam(value = "name", required = false) String name) {
		
		/*return customerRepository.findByAndSort(name, new Sort(Sort.Direction.DESC, "customerid"));*/
		return customerRepository.getListCustomers(name);
	}
	
	@RequestMapping(value = "/DeleteCustomer", method = RequestMethod.POST)
	public @ResponseBody void deleteCustomer(@RequestParam(value = "customerid", required = true) Long customerid) {
		
		Customers customer = customerRepository.findOne(customerid);//Làm như vầy để đỡ phải tạo @Query trong CustomerRepository
		customer.setStatus(false);
		customerRepository.save(customer);
		
	}
	
	

	/*@RequestMapping(value = "/AllInOne", method = RequestMethod.GET)
	public String allInOne(Model model, @RequestParam(value = "customerid", required = false) Long customerid,
			@RequestParam(value = "view", required = false) Boolean view) {

		Customers customerForm;
		Boolean upgradeVersion = false;

		if (customerid == null) {
			customerForm = new Customers();
		} else {
			customerForm = customerRepository.findOne(customerid);
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
		return "AllInOne";
	}*/
	
	@RequestMapping(value = "/AllInOne", method = RequestMethod.GET)
	public String allInOne(Model model, @RequestParam(value = "customerid", required = false) Long customerid) {
		
		Customers customer;
		
		if (customerid == null) {
			customer = new Customers();
		} else {
			customer = customerRepository.findOne(customerid);
		}
			
		model.addAttribute("CustomerForm", customer);	
		model.addAttribute("Types", typeRepository.findAll());
		model.addAttribute("Fields", fieldRepository.findAll());
		
		return "AllInOne";
	}
	
	@RequestMapping(value = "/GetMaxSerial", method = RequestMethod.GET)
	public @ResponseBody Integer getMaxSerial(@RequestParam(value = "symbol", required = true) String symbol) {

		/*
		 * if (customerRepository.getMaxSerial(required) == null) return "0001"; String
		 * serial = Integer.toString(customerRepository.getMaxSerial(required) + 1);
		 * String format = ("0000" + serial).substring(serial.length()); return format;
		 */

		Integer serial = 0;
		if (customerRepository.getMaxSerialBySymbol(symbol) != null) {
			serial = customerRepository.getMaxSerialBySymbol(symbol);
		}
		/*String.format("%04d", serial)*/
		return serial;
	}
	
	@RequestMapping(value = "/GetInfoCustomer", method = RequestMethod.GET)
	public @ResponseBody Customers getInfoCustomer(@RequestParam(value = "customerid", required = true) Long customerid) {
		
		return  customerRepository.findOne(customerid);
		
	}
	
	@RequestMapping(value = "/SaveCustomer", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("CustomerForm") Customers customerForm) {
		
		customerForm.setSomeAttr();
		customerRepository.save(customerForm);

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