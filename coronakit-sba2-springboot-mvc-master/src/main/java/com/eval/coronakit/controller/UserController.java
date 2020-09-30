package com.eval.coronakit.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eval.coronakit.entity.CoronaKit;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.CoronaKitService;
import com.eval.coronakit.service.KitDetailService;
import com.eval.coronakit.service.ProductService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CoronaKitService coronaKitService;
	
	@Autowired
	KitDetailService kitDetailService;
	
	@RequestMapping("/home")
	public String home() {
		return "user-home";
	}
	
	@RequestMapping("/show-kit")
	public String showKit(Model model) {
		return "show-cart";
	}

	@RequestMapping("/show-list")
	public String showList(Model model) {
		List<ProductMaster> products =this.productService.getAllProducts();
		model.addAttribute("products", products);
		return "show-all-item-user";
	}
	
	@RequestMapping("/add-to-cart/{productId}")
	public String showKit(@PathVariable("productId") int productId,HttpSession session) {
		
	ProductMaster product=productService.getProductById(productId);
	if(product!=null)	
	{
		if(session.getAttribute("ShoppingCart")==null)
		{
			KitDetail kit=new KitDetail();
			List<KitDetail>  kits=new ArrayList<KitDetail>();
			kit.setProductId(product.getId());
			kit.setAmount(product.getCost());
			kit.setQuantity(1);
			kit.setProductName(product.getProductName());
			kits.add(kit);
			
			session.setAttribute("ShoppingCart", kits);
			
		}
		else
		{
			List<KitDetail>  existingKits=(List<KitDetail>)session.getAttribute("ShoppingCart");
			
			int alreadyExists= isAlreadyExistsinCart(productId,existingKits);
			if(alreadyExists==-1)
			{
				KitDetail kit=new KitDetail();
				kit.setProductId(productId);
				kit.setAmount(product.getCost());
				kit.setQuantity(1);
				kit.setProductName(product.getProductName());
				existingKits.add(kit);
			}
			else
			{
				int quantity=existingKits.get(alreadyExists).getQuantity()+1;
				existingKits.get(alreadyExists).setQuantity(quantity);
				existingKits.get(alreadyExists).setAmount(quantity*product.getCost());
			}
			session.setAttribute("ShoppingCart", existingKits);
		
		}
	}
		
		return "show-cart";
	}
	
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		
		CoronaKit coronaKit=new CoronaKit();
		ProductMaster product=new ProductMaster();
		model.addAttribute("coronaKit",coronaKit);
		model.addAttribute("product",product);
		return "checkout-address";
	}
	
	@RequestMapping("/finalize")
	//public String finalizeOrder(String address,Model model) {
		public String finalizeOrder(@Valid @ModelAttribute("coronaKit") CoronaKit coronaKit,BindingResult result, HttpSession session) {
		
		 if(result.hasErrors())
		  { 
			  return "checkout-address";
		  }
		
		List<KitDetail> Kits=(List<KitDetail>) session.getAttribute("ShoppingCart");
		coronaKit.setOrderDate(LocalDateTime.now().toString());
		coronaKit.setTotalAmount(Kits.stream().mapToInt(i->i.getAmount()).sum());
		coronaKitService.saveKit(coronaKit);
		
		List<KitDetail> KitDetails=new ArrayList<KitDetail>();
		for (int i=0;i<Kits.size();i++)
		{
			KitDetail kitItem=Kits.get(i);
			kitItem.setCoronaKitId(coronaKit.getId());
			kitItem.setAmount(kitItem.getAmount() * kitItem.getQuantity());
			KitDetails.add(kitDetailService.addKitItem(kitItem));
		}	
		session.invalidate();
		return "show-summary";
	}
	
	@RequestMapping("/delete/{itemId}")
	public String deleteItem(@PathVariable("itemId") int itemId, HttpSession session) {
		

		ProductMaster product=this.productService.getProductById(itemId);
		
		if(session.getAttribute("ShoppingCart")==null)
		{
			return "redirect:show-list";
			
		}
		else
		{
			List<KitDetail>  existingKits=(List<KitDetail>)session.getAttribute("ShoppingCart");
			int alreadyExists= isAlreadyExistsinCart(itemId,existingKits);
			if(alreadyExists==-1)
			{
				return "redirect:show-list";
				
			}
			else
			{
				int quantity=existingKits.get(alreadyExists).getQuantity()-1;
				existingKits.get(alreadyExists).setQuantity(quantity);
				existingKits.get(alreadyExists).setAmount(quantity*product.getCost());
				if(quantity==0)
					existingKits.remove(alreadyExists);
			}
			
			if(existingKits.size()>0)
				session.setAttribute("ShoppingCart", existingKits);
			
			
			  else { 
				  
				  //session.invalidate(); 
				  return "redirect:/user/show-list";
				  }
			 
			 
		
		}
		
		return "show-cart";
	}
	
	private int isAlreadyExistsinCart(int productId, List<KitDetail> existingKits)
	{
	  int i=-1;	
	  for(int k=0;k<existingKits.size();k++)
	  {
		  if(existingKits.get(k).getProductId()==productId)
			  return k;
	  }
	  return i;
	}
}
