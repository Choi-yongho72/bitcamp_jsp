package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CustUserDto;

public class CustUserDao {
	
	private static CustUserDao dao = new CustUserDao();
	
	private CustUserDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static CustUserDao getInstance() {
		return dao;
	}
	
	public List<CustUserDto> getCustUserList() {
		String sql = " SELECT ID, NAME, ADDRESS "
				   + " FROM CUSTUSER "
				   + " ORDER BY ID DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CustUserDto> list = new ArrayList<CustUserDto>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String address = rs.getString("ADDRESS");
				
				list.add(new CustUserDto(id, name, address));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, rs);
		}
		return list;
	}
	//TODO add
	public boolean addCustUser(String id, String name, String address) {
		String sql = " INSERT INTO CUSTUSER(ID, NAME, ADDRESS) "
				   + " VALUES(?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, address);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, null);
		}
		
		
		return count>0?true:false;
	}
	//TODO detail
	public CustUserDto getDetail(String id) {
		String sql = " SELECT ID, NAME, ADDRESS "
				   + " FROM CUSTUSER "
				   + " WHERE ID = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		CustUserDto dto = new CustUserDto();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String _id = rs.getString("ID");
				String _name = rs.getString("NAME");
				String _address = rs.getString("ADDRESS");
				
				dto.setId(_id);
				dto.setName(_name);
				dto.setAddress(_address);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, rs);
		}
		return dto;
	}
	//TODO update
	public boolean updateCustUser(String id, String address) {
		String sql = " UPDATE CUSTUSER "
				   + " SET ADDRESS = ? "
				   + " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, address);
			psmt.setString(2, id);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, null);
		}
		
		
		return count>0?true:false;
	}
	//TODO delete
	public boolean deleteCustUser(String id) {
		String sql = " DELETE FROM CUSTUSER "
				   + " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, null);
		}
		
		
		return count>0?true:false;
	}
	
	//TODO multi del
		public boolean deleteCustUsers(String ids[]) {
			String sql = " DELETE FROM CUSTUSER "
					   + " WHERE ID=? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			int count[] = new int[ids.length];	// 다수가 파라미터로 들어오므로 배열로 받음
			
			try {
				conn = getConnection();
				conn.setAutoCommit(false); // 모든 데이터를 안전하게 처리하기위해 자동 커밋을 꺼줌
				
				psmt = conn.prepareStatement(sql);
				
				for (int i = 0; i < ids.length; i++) {
					psmt.setString(1, ids[i]);
					psmt.addBatch();	// 같은 쿼리문을 여러번 반복
					
				}
				count = psmt.executeBatch();	// 여러쿼리문 수행하기 때문에 배열로 리턴
				
				conn.commit();		// 중간에 문제가 없는경우 commit
				
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}	// Exception 발생한 경우 rollback
			} finally {
				try {
					conn.setAutoCommit(true);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				close(conn, psmt, null);
			}
			boolean isS = true;
			for (int i = 0; i < count.length; i++) {
				if(count[i] != -2) {	// -2 == 정상종료
					isS = false;
					break;
				}
			}
			return isS;
		}
	
	
		//TODO search
		public List<CustUserDto> searchCustUsers(String selType, String fword){
			String sql =  " SELECT ID, NAME, ADDRESS "
					+ " FROM CUSTUSER "
					+ " WHERE 1=1 ";
		if(selType.equals("id")) {
			sql = sql + " AND ID = ? ";  
		}else if(selType.equals("name")){
			sql = sql + " AND NAME = ? ";
		}
		sql = sql + " ORDER BY ID DESC ";
		List<CustUserDto> list = new ArrayList<CustUserDto>();
		Connection conn=null;
		PreparedStatement psmt=null;
		ResultSet rs=null;
		
		try {
			conn = getConnection();		
			psmt = conn.prepareStatement(sql);
			if(selType.equals("id") || selType.equals("name")) {
				psmt.setString(1, fword);				
			}
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String address = rs.getString("ADDRESS");
				
				list.add(new CustUserDto(id, name, address));
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(conn, psmt, rs);			
		}
		return list;
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Connection getConnection() throws SQLException{
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "hr";

		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
	
	public void close(Connection conn, PreparedStatement psmt, ResultSet rs) {
			try {
				if(conn != null) {
					conn.close();
				}
				if(psmt != null) {
					psmt.close();
				}
				if(rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
