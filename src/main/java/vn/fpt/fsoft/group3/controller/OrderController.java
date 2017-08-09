package vn.fpt.fsoft.group3.controller;

import vn.fpt.fsoft.group3.entity.Customers;
import vn.fpt.fsoft.group3.entity.Orders;

import vn.fpt.fsoft.group3.repository.OrderRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author huydh
 * 
 */
@Controller
public class OrderController {

	@Autowired
	private OrderRepository orderRepository;

	@RequestMapping(value = "/OrderManagement", method = RequestMethod.GET)
	public String orderManagement(Model model, @RequestParam(value = "ordercode", required = false) String ordercode,
			@RequestParam(value = "customercode", required = false) String customercode) {

		model.addAttribute("orderid", ordercode);
		model.addAttribute("customerid", customercode);
		return "OrderManagement";
	}

	@RequestMapping(value = "/GetListOrders", method = RequestMethod.GET)
	public @ResponseBody List<Orders> getListCustomers(
			@RequestParam(value = "customercode", required = false) String customercode,
			@RequestParam(value = "ordercode", required = false) String ordercode) {

		/*return orderRepository.getListOrders(customercode, ordercode);*/
		return orderRepository.findAll();
	}

}