package com.khie.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	// @Autowired 써도 됨!
	@Inject
	private JdbcTemplate template;
	String sql = null;

	@Override
	public List<ProductDTO> getProductList() {
		List<ProductDTO> list = null;
		sql = "select * from products order by pnum desc";
		return list = this.template.query(sql, new RowMapper<ProductDTO>() {

			@Override
			public ProductDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
                dto.setCategory_fk(rs.getString("category_fk"));
                dto.setProducts_name(rs.getString("products_name"));
                dto.setEp_code_fk(rs.getString("ep_code_fk"));
                dto.setInput_price(rs.getInt("input_price"));
                dto.setOutput_price(rs.getInt("output_price"));
                dto.setTrans_cost(rs.getInt("trans_cost"));
                dto.setMileage(rs.getInt("mileage"));     
                
                String showCompany = rs.getString("company");          
                if(showCompany == null){
                	showCompany = "여기오냐고";
                }else {
                	showCompany = rs.getString("company");
                }
                System.out.println("showCompany > "+showCompany);
                dto.setCompany(showCompany);                
				return dto;
			}			
		});	
	}

	@Override
	public int insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProductDTO getProductCont(int pnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(int pnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSeq(int pnum) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CategoryDTO> getCategoryList() {
		// TODO Auto-generated method stub
		return null;
	}

}
