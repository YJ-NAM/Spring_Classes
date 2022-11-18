package com.khie.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
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
                if(showCompany == null || showCompany.equals(null) || showCompany == "null" || showCompany.equals("null")){
                	showCompany = "";
                }else {
                	showCompany = rs.getString("company");
                }
                dto.setCompany(showCompany);                
				return dto;
			}			
		});	
	}

	@Override
	public int insertProduct(final ProductDTO dto) {
		// TODO Auto-generated method stub
		final int count = this.template.queryForInt("select max(pnum) from products");
		
		sql = "insert into products values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, count+1);
				ps.setString(2, dto.getCategory_fk());
				ps.setString(3, dto.getProducts_name());
				ps.setString(4, dto.getEp_code_fk());
				ps.setInt(5, dto.getInput_price());
				ps.setInt(6, dto.getOutput_price());
				ps.setInt(7, dto.getTrans_cost());
				ps.setInt(8, dto.getMileage());
				ps.setString(9, dto.getCompany());			
				
			}
		});
	}

	@Override
	public ProductDTO getProductCont(int pnum) {
		// TODO Auto-generated method stub
		sql = "select * from products where pnum = ?";
		return this.template.queryForObject(sql, new RowMapper<ProductDTO>() {

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
                if(showCompany == null || showCompany.equals(null) || showCompany == "null" || showCompany.equals("null")){
                	showCompany = "";
                }else {
                	showCompany = rs.getString("company");
                }                
                dto.setCompany(showCompany);                
				return dto;             
			}			
		}, pnum);
	}

	@Override
	public int updateProduct(final ProductDTO dto) {
		sql = "update products set category_fk = ?, products_name = ?, ep_code_fk = ?, input_price = ?, output_price = ?, trans_cost = ?, mileage = ?, company = ? where pnum = ?";
		return this.template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getCategory_fk());
				ps.setString(2, dto.getProducts_name());
				ps.setString(3, dto.getEp_code_fk());
				ps.setInt(4, dto.getInput_price());
				ps.setInt(5, dto.getOutput_price());
				ps.setInt(6, dto.getTrans_cost());
				ps.setInt(7, dto.getMileage());
				ps.setString(8, dto.getCompany());	
				ps.setInt(9, dto.getPnum());
				System.out.println(sql);
			}
		});
		
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
		List<CategoryDTO> list = null;
		sql = "select * from category order by cnum desc";
		return list = this.template.query(sql, new RowMapper<CategoryDTO>() {

			@Override
			public CategoryDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CategoryDTO dto = new CategoryDTO();
				dto.setCnum(rs.getInt("cnum"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				return dto;
			}			
		});		
	}
	
		
	@Override
	public String getCategoryList(String code) {
		sql = "select category_name from category where category_code = ?";
		String category_name = this.template.queryForObject(sql, String.class, code);
		return category_name;
	}
}
