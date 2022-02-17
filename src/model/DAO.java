package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// �����ͺ��̽� ����
	public void getCon() {
		// Ŀ�ؼ� Ǯ
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//////////////ȸ������
	// ȸ������ ó�� �޼ҵ�
	public void memberJoin(MemberBean bean) {
		getCon();

		try {
			// ���� �غ�
			String sql = "insert into Member values (?, ?, ?, ?, ?)";
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			// ?�� ����
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword1());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getEmail());
			// ���� ����
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ���̵� �ߺ� üũ �޼ҵ�
	public int checkId(String id) {
		int result = 0;

		getCon();

		try {
			// ���� ����
			String sql = "select count(*) from Member where id=?";
			// ���� ������ ��ü ����
			pstmt = con.prepareStatement(sql);
			// ? ����
			pstmt.setString(1, id);
			// ��� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1); // result ���� 0�̶�� �� �����ͺ��̽� �������� �ʴ´ٴ� �� (��� ������ ���̵�)
				System.out.println(id);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//////////////�α���
	// �α��� ó�� �޼ҵ�
	public int getMember(String id, String password1) {
		int result = 0;

		getCon();

		try {
			// ���� ����
			String sql = "select count(*) from Member where id=? and password1=?";
			// ���� ������ ��ü ����
			pstmt = con.prepareStatement(sql);
			// ? ����
			pstmt.setString(1, id);
			pstmt.setString(2, password1);
			// ��� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1); // result ���� 0�̶�� �� �����ͺ��̽� �������� �ʴ� �ٴ� ��
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/////////////////�Խ���
	// ���� ���� �޼ҵ�
	public void writeBoard(BoardBean bean, String id) {
		getCon();

		int ref = 0; // �� �׷�
		int re_step = 1;// �θ��
		int re_level = 1;// �θ��

		try {
			// ���� ū ref���� �о���� ���� �غ�
			String refsql = "select max(ref) from HotelBoard";
			// ���� ����
			pstmt = con.prepareStatement(refsql);
			// ���� ���� �� ��� ����
			rs = pstmt.executeQuery();
			if (rs.next()) { // ���� ��� ���� �ִٸ�
				ref = rs.getInt(1) + 1; // ref �ִ밪�� +1 ���־� �۱׷��� ����
			}
			// �����ۼ�
			String sql = "insert into HotelBoard values(HotelBoard_seq.NEXTVAL, ?, ?, sysdate, ?, ?, ?, 0, ?)";
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			// ?�� ����
			pstmt.setString(1, id);
			pstmt.setString(2, bean.getTitle());
			pstmt.setInt(3, ref);
			pstmt.setInt(4, re_step);
			pstmt.setInt(5, re_level);
			pstmt.setString(6, bean.getContent());
			// ���� ����
			pstmt.executeUpdate();
			// �ڿ� �ݳ�
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ��ü ���� ������ �����ϴ� �޼ҵ�
	public int getAllCount() {
		getCon();
		// �Խñ� ��ü���� �����ϴ� ����
		int count = 0;

		try {
			// �����غ�
			String sql = "select count(*) from HotelBoard";
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			// ���� �����Ͽ� ��� ����
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1); // ��ü �Խñ� ��
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// ��� �Խñ��� �����ϴ� �޼ҵ�
	public Vector<BoardBean> getAllBoard(int startRow, int endRow) {
		Vector<BoardBean> v = new Vector<>();

		getCon();

		try {
			// ���� �غ�
			String sql = "select * from (select A.* ,Rownum Rnum from (select * from HotelBoard "
					+ "order by ref desc, re_step asc, re_level asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			// ?�� ����
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// �����͸� ��Ű¡(���� = BoardBean Ŭ������ �̿�)
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setTitle(rs.getString(3));
				bean.setReg_date(rs.getDate(4).toString());
				bean.setRef(rs.getInt(5));
				bean.setRe_step(rs.getInt(6));
				bean.setRe_level(rs.getInt(7));
				bean.setReadcount(rs.getInt(8));
				bean.setContent(rs.getString(9));
				// ��Ű¡ �� �����͸� ���Ϳ� ����
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// �ϳ��� �Խñ��� �����ϴ� �޼ҵ� �ۼ� (BoardInfo�� �̿�)
	public BoardBean getOneBoard(int num) {
		// ���� Ÿ�� ����
		BoardBean bean = new BoardBean();
		
		getCon();
		
		try {
			// ���� ���� ������ ��ȸ�� ���� ���� �غ�
			String readsql = "update HotelBoard set readcount = readcount + 1 where num=?";
			// ���� ����
			pstmt = con.prepareStatement(readsql);
			// ?�� ����
			pstmt.setInt(1, num);
			// ���� ����
			pstmt.executeUpdate();

			// �Խñ� ��ȸ ���� �غ�
			String sql = "select * from HotelBoard where num=?";
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			// ?�� ����
			pstmt.setInt(1, num);
			// ���� ���� �� ��� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setTitle(rs.getString(3));
				bean.setReg_date(rs.getDate(4).toString());
				bean.setRef(rs.getInt(5));
				bean.setRe_step(rs.getInt(6));
				bean.setRe_level(rs.getInt(7));
				bean.setReadcount(rs.getInt(8));
				bean.setContent(rs.getString(9));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}


	// �亯�� �ۼ��ϴ� �޼ҵ� [������ ����]
	public void reWriteBoard(BoardBean bean, String id) {
		// �θ�� �׷�� �� ���� �� ������ �о� ����
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();

		getCon();
		try {
			// �θ�ۺ��� ū re_level ���� ���� 1�� ������Ŵ
			String levelsql = "update HotelBoard set re_level = re_level+1 where ref=? and re_level > ?";
			// �������� ��ü ����
			pstmt = con.prepareStatement(levelsql);
			// ?�� �� ����
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			// ��������
			pstmt.executeUpdate();
			// �亯�� �����͸� �����ϴ� ����
			String sql = "insert into HotelBoard values(HotelBoard_seq.NEXTVAL, ?, ?, sysdate, ?, ?, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			// ?�� ����
			pstmt.setString(1, id);
			pstmt.setString(2, bean.getTitle());
			pstmt.setInt(3, ref); // �θ��� ref �� �״��
			pstmt.setInt(4, re_step + 1); // �θ��� re_step + 1 (�亯)
			pstmt.setInt(5, re_level + 1); // �θ��� re_level + 1 (�亯)
			pstmt.setString(6, bean.getContent());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �ϳ��� �Խñ��� �����ϴ� �޼ҵ�
	public void updateBoard(BoardBean bean, String id) {
		getCon();

		try {
			// ���� �غ�
			String sql = "update HotelBoard set title=?, content=? where num=?";
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			// ?�� ����
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			// ��������
			pstmt.executeUpdate();
			// �ڿ� �ݳ�
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// �ϳ��� �Խñ��� �����ϴ� �޼ҵ�
	public void deleteBoard(int num) {
		getCon();

		try {
			// ���� �غ�
			String sql = "delete from HotelBoard where num=?";
			pstmt = con.prepareStatement(sql);
			// ?�� ����
			pstmt.setInt(1, num);
			// ��������
			pstmt.executeUpdate();
			// �ڿ��ݳ�
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//////////////���� 
	// �� ȸ���� ���� �����͸� �����ϴ� �޼ҵ�
	public BookingBean makeBooking(BookingBean bean) {
		getCon();

		try {
			// ���� �غ�
			String sql = "insert into Booking values(Booking_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
			// ������ ������ ��ü ����
			pstmt = con.prepareStatement(sql);
			// ?�� ����
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getRoomtype());
			pstmt.setInt(3, bean.getRoomrate());
			pstmt.setInt(4, bean.getPeople());
			pstmt.setString(5, bean.getDay());
			pstmt.setInt(6, bean.getDuration());
			pstmt.setInt(7, bean.getPrice());
			// ���� ����
			pstmt.executeUpdate();
			// �ڿ��ݳ�
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// ��� ���� ������ �����ϴ� �޼ҵ�
	public Vector<BookingBean> getAllBooking() {
		Vector<BookingBean> v = new Vector<>();

		getCon();

		try {
			// ���� �غ�
			String sql = "select * from booking order by bookingno desc";
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// �����͸� ��Ű¡(�� Ŭ������ �̿�)
				BookingBean bean = new BookingBean();
				bean.setBookingNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setRoomtype(rs.getString(3));
				bean.setRoomrate(rs.getInt(4));
				bean.setPeople(rs.getInt(5));
				bean.setDay(rs.getString(6));
				bean.setDuration(rs.getInt(7));
				bean.setPrice(rs.getInt(8));
				// ��Ű¡ �� �����͸� ���Ϳ� ����
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// �� ȸ���� ���� ������ �����ϴ� �޼ҵ�
	public Vector<BookingBean> getAllBookingByCustomer(String id) {
		Vector<BookingBean> v = new Vector<>();
		
		getCon();

		try {
			// ���� �غ�
			String sql = "select * from booking where id = ? order by bookingno desc";
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			//?�� �� ����
			pstmt.setString(1, id);
			//��� ��
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// �����͸� ��Ű¡(�� Ŭ������ �̿�)
				BookingBean bean = new BookingBean();
				bean.setBookingNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setRoomtype(rs.getString(3));
				bean.setRoomrate(rs.getInt(4));
				bean.setPeople(rs.getInt(5));
				bean.setDay(rs.getString(6));
				bean.setDuration(rs.getInt(7));
				bean.setPrice(rs.getInt(8));	
				// ��Ű¡ �� �����͸� ���Ϳ� ����
				v.add(bean);			
			}			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//���� ���� �޼ҵ�
	public void deleteBooking(int bookingNo) {
		getCon();
		
		try {
			//���� �غ�
			String sql = "delete from Booking where bookingno=?";
			//���� ������ ��ü ����
			pstmt = con.prepareStatement(sql);
			//?�� ����
			pstmt.setInt(1, bookingNo);
			//���� ����
			pstmt.executeUpdate();
			//�ڿ� �ݳ�
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
