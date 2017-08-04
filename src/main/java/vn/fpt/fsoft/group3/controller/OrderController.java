package vn.fpt.fsoft.group3.controller;

import vn.fpt.fsoft.group3.entity.Orders;

import vn.fpt.fsoft.group3.repository.OrderRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String orderManagement(Model model, @RequestParam(value = "oid", defaultValue = "") String oid,
			@RequestParam(value = "ccode", defaultValue = "") String ccode) {
		model.addAttribute("oid", oid);
		model.addAttribute("ccode", ccode);
		model.addAttribute("orders", orderRepository.findAll());
		return "OrderManagement";
	}

}