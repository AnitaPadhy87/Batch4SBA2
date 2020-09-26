package com.eval.coronakit.controller;



import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	ProductService productService;
	@GetMapping("/home")
	public String home() {
		return "admin-home";
	}
	
	@GetMapping("/product-entry")
	public String productEntry(Model model) {
		
		  ProductMaster product=new ProductMaster(); 
		  model.addAttribute("product",product);
		 
		  return "add-new-item";
	}
	
	
	
	  @PostMapping("/product-save")
	  public String	 productSave(@Valid @ModelAttribute("product") ProductMaster product, BindingResult result) 
	  { 
		  if(result.hasErrors())
		  { 
			  return "add-new-item";
		  }
		  
		  this.productService.addNewProduct(product);
		    
		  return "redirect:product-list";
		   
	  }
	 
	

	@GetMapping("/product-list")
	public String productList(Model model) {
		List<ProductMaster> products =this.productService.getAllProducts();
		model.addAttribute("products", products);
		return "show-all-item-admin";
	}
	
	@GetMapping("/product-delete/{productId}")
	public String productDelete(Model model,@PathVariable("productId") int productId) {
		 this.productService.deleteProduct(productId);
		 List<ProductMaster> products =this.productService.getAllProducts();
		 model.addAttribute("products", products);
		 return "show-all-item-admin";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// define rules to customize data
		// auto trim the leading and trailing spacee
		StringTrimmerEditor trimmer = 
				new StringTrimmerEditor(true);
		// true : empty string will be converted to null
		binder.registerCustomEditor(String.class, trimmer);
		
		
	}
	
}
