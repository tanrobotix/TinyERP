package vn.fpt.fsoft.group3.controller;

import vn.fpt.fsoft.group3.entity.Customers;
import vn.fpt.fsoft.group3.entity.Fields;
import vn.fpt.fsoft.group3.entity.Orders;
import vn.fpt.fsoft.group3.entity.Requirements;
import vn.fpt.fsoft.group3.entity.Types;
import vn.fpt.fsoft.group3.repository.CustomerRepository;
import vn.fpt.fsoft.group3.repository.FieldRepository;
import vn.fpt.fsoft.group3.repository.OrderRepository;
import vn.fpt.fsoft.group3.repository.RequirementReponsitory;
import vn.fpt.fsoft.group3.repository.TypeRepository;

import org.joda.time.LocalDate;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author huydh
 * 
 */
@Controller
@SessionAttributes(value = { "customerForm", "orderForm" })
public class CustomerController {

	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private TypeRepository typeRepository;
	@Autowired
	private FieldRepository fieldRepository;
	@Autowired
	private RequirementReponsitory requirementReponsitory;

	@RequestMapping("/")
	public String index() {

		return "redirect:/CustomerManagement";

	}

	@RequestMapping(value = "/CustomerManagement", method = RequestMethod.GET)
	public String customerManagement(Model model) {

		return "CustomerManagement";

	}

	@RequestMapping(value = "/GetListCustomers", method = RequestMethod.GET)
	public @ResponseBody List<Customers> getListCustomers(@RequestParam(value = "name", required = false) String name) {

		name = name.replaceAll("\\s+", " ").trim();
		return customerRepository.getListCustomers(name);

	}

	@RequestMapping(value = "/HistoryCustomer/{customercode}", method = RequestMethod.GET)
	public String historyCustomer(Model model, @PathVariable String customercode) {

		model.addAttribute("customercode", customercode);
		return "HistoryCustomer";

	}

	@RequestMapping(value = "/GetListHistoryCustomer", method = RequestMethod.GET)
	public @ResponseBody List<Customers> getListHistoryCustomer(
			@RequestParam(value = "customercode", required = true) String customercode) {

		return customerRepository.findByCustomercodeOrderByVersionDesc(customercode);

	}

	@RequestMapping(value = "/DeleteCustomer", method = RequestMethod.POST)
	public @ResponseBody void deleteCustomer(@RequestParam(value = "customerid", required = true) Long customerid) {

		Customers customer = customerRepository.findOne(customerid);
		customer.setMode(0);
		customerRepository.save(customer);

	}

	@RequestMapping(value = "/AllInOne", method = RequestMethod.POST)
	public String allInOne(Model model, 
			@RequestParam(value = "request", required = true) Integer request,
			@RequestParam(value = "mode", required = true) Integer mode,
			@RequestParam(value = "id", required = true) Long id, HttpSession session) {
		
		session.invalidate();
		 
		Customers customerForm;
		Orders orderForm;

		switch (request) {
		case 0:
			if (id == null) {
				customerForm = new Customers();
			} else {
				customerForm = customerRepository.findOne(id);
			}
			
			model.addAttribute("customerForm", customerForm);
			break;

		case 1:
			if (id == null) {
				orderForm = new Orders();
				orderForm.setCustomer(new Customers());
				ArrayList<Requirements> arrList = new ArrayList<Requirements>();
				for (int i = 0; i < 10; i++) {
					arrList.add(new Requirements());
				}
				orderForm.setRequirements(arrList);
			} else {
				orderForm = orderRepository.findOne(id);
			}

			customerForm = orderForm.getCustomer();
			model.addAttribute("customerForm", customerForm);
			model.addAttribute("orderForm", orderForm);
			break;

		case 2:
			orderForm = new Orders();
			orderForm.setCustomer(customerRepository.findOne(id));
			customerForm = orderForm.getCustomer();
			ArrayList<Requirements> arrList = new ArrayList<Requirements>();
			for (int i = 0; i < 10; i++) {
				arrList.add(new Requirements());
			}
			orderForm.setRequirements(arrList);
			model.addAttribute("customerForm", customerForm);
			model.addAttribute("orderForm", orderForm);
			break;

		default:
			break;

		}
		
		model.addAttribute("request", request);
		model.addAttribute("mode", mode);
		model.addAttribute("Types", typeRepository.findAll());
		model.addAttribute("Fields", fieldRepository.findAll());

		return "AllInOne";
	}

	@RequestMapping(value = "/SaveCustomer/{typeRequest}", method = RequestMethod.POST)
	public @ResponseBody Customers saveCustomer(@ModelAttribute("customerForm") Customers customerForm,
			@PathVariable Integer typeRequest, HttpSession session) {
		switch (typeRequest) {
		case -1:
			if (customerForm.getCustomerid() == null) {
				customerForm.setVersion(1);
				customerForm.setMode(1);
				customerForm.createCustomercode();
			} else {
				customerForm.createCustomercode();
			}
			break;
		case 0:
			customerForm.setCustomerid(null);
			customerForm.setVersion(1);
			customerForm.createCustomercode();
			break;
		case 1:
			customerForm.setCustomerid(null);
			Customers temp = customerRepository.findTopByCustomercodeOrderByVersionDesc(customerForm.getCustomercode());
			Integer version = temp.getVersion() + 1;
			customerForm.setVersion(version);
			customerForm.setMode(1);
			break;
		case 2:
			break;
		default:
			break;
		}
		if (customerForm.getCustomerid() == null) {
			customerForm.setDatecreated(new DateTime());
			customerForm.setLastupdate(customerForm.getDatecreated());
			customerForm.setOrders(null);
		} else {
			customerForm.setLastupdate(new DateTime());
		}
		
		customerRepository.save(customerForm);
		Orders orderForm = (Orders) session.getAttribute("orderForm");
		if (orderForm != null && orderForm.getOrderid() != null) {
			orderRepository.save(orderForm);
		}
		
		return customerForm;
	}

	@RequestMapping(value = "/SaveOrder", method = RequestMethod.POST)
	public @ResponseBody void saveOrder(@ModelAttribute("orderForm") Orders orderForm) {

		Integer month = orderForm.getStartdate2().getMonthOfYear();
		Integer year = orderForm.getStartdate2().getYear();
		Integer serial = orderRepository.findMaxSerialInMonthAndYear(month, year);
		serial = (serial == null) ? 1 : serial + 1;
		orderForm.setSerial(serial);

		if (orderForm.getOrderid() == null) {
			orderForm.setStatus(false);
			orderForm.setMode(1);
			orderForm.createOrdercode();
		}
		
		List<Requirements> listRequirements = orderForm.getRequirements();
		for(int i = 0; i < listRequirements.size(); i++){
			listRequirements.get(i).setOrder(orderForm);
		}
		orderForm.setRequirements(listRequirements);
		orderRepository.save(orderForm);
	}

	@RequestMapping(value = "/GetMaxSerial", method = RequestMethod.POST)
	public @ResponseBody Integer getMaxSerial(@RequestParam(value = "symbol", required = true) String symbol) {

		Integer serial = 0;
		Customers temp = customerRepository.findTopBySymbolOrderBySerialDesc(symbol);
		if (temp != null) {
			serial = temp.getSerial();
		}

		return serial;
	}

	@RequestMapping(value = "/GetInfoCustomer", method = RequestMethod.GET)
	public @ResponseBody Customers getInfoCustomer(
			@RequestParam(value = "customerid", required = true) Long customerid) {

		return customerRepository.findOne(customerid);

	}

}