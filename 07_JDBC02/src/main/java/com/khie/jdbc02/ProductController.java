package com.khie.jdbc02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khie.model.CategoryDTO;
import com.khie.model.ProductDAO;
import com.khie.model.ProductDTO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	@RequestMapping("product_list.do")
	public String list(Model model) {
		List<ProductDTO> list = this.dao.getProductList();
		model.addAttribute("List", list);
		return "product_list";
	}
	
	@RequestMapping("product_insert.do")
	public String insert(Model model) {
		List<CategoryDTO> category = this.dao.getCategoryList();
		model.addAttribute("category", category);
		return "product_insert";
	}
	
	@RequestMapping("product_insert_Ok.do")
	public void insert_Ok(ProductDTO dto, HttpServletResponse response) throws IOException {	
		int result = this.dao.insertProduct(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<script> alert('Successfully product registered'); location.href='product_list.do';</script>");
		}else {
			out.println("<script> alert('Product Registration failed'); history.back();</script>");
		}
	}
	
	@RequestMapping("product_content.do")
	public String content(@RequestParam("pnum") int no, Model model) {
		ProductDTO dto = this.dao.getProductCont(no);
		String category_name = this.dao.getCategoryList(dto.getCategory_fk());
		model.addAttribute("category", category_name);
		model.addAttribute("content", dto);
		return "product_content";		
	}
	
	@RequestMapping("product_modify.do")
	public String modify(@RequestParam("pnum") int pnum, Model model) {
		ProductDTO dto = this.dao.getProductCont(pnum);
		List<CategoryDTO> category = this.dao.getCategoryList();
		model.addAttribute("category", category);
		model.addAttribute("content", dto);
		return "product_modify";		
	}
	
	@RequestMapping("product_modify_Ok.do")
	public void modify_Ok(ProductDTO dto, HttpServletResponse response) throws IOException {		
		int result = this.dao.updateProduct(dto);
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<script> alert('Successfully modified'); location.href='product_content.do?pnum="+dto.getPnum()+"'; </script>");
		}else {
			out.println("<script> alert('Modification failed'); history.back(); </script>");
		}
		
	}
	
	@RequestMapping("product_delete.do")
	public void delete(int pnum, HttpServletResponse response) throws IOException {
		int result = this.dao.deleteProduct(pnum);
		this.dao.updateSeq(pnum);
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<script> alert('Successfully deleted'); location.href='product_list.do'; </script>");
		}else {
			out.println("<script> alert('Deletion failed'); history.back(); </script>");
		}
	}

}
