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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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

		model.addAttribute("ordercode", ordercode);
		model.addAttribute("customercode", customercode);
		return "OrderManagement";
	}

	@RequestMapping(value = "/GetListOrders", method = RequestMethod.GET)
	public @ResponseBody List<Orders> getListCustomers(
			@RequestParam(value = "ordercode", defaultValue = "%") String ordercode,
			@RequestParam(value = "customercode", defaultValue = "%") String customercode) {

		return orderRepository.findByOrdercodeLikeAndCustomerCustomercodeLikeAndModeAndCustomerMode(ordercode,
				customercode, 1, 1);
	}

	@RequestMapping(value = "/DeleteOrder", method = RequestMethod.POST)
	public @ResponseBody void deleteOrder(@RequestParam(value = "orderid", required = true) Long orderid) {

		Orders order = orderRepository.findOne(orderid);
		order.setMode(0);
		orderRepository.save(order);

	}
}