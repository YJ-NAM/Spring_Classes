package com.khie.model;

import java.util.List;

public interface ProductDAO {
	
	List<ProductDTO> getProductList();
	int insertProduct(ProductDTO dto);
	ProductDTO getProductCont(int pnum);
	int updateProduct(ProductDTO dto);
	int deleteProduct(int pnum);
	void updateSeq(int pnum);
	List<CategoryDTO> getCategoryList();
	
}
