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

	// 데이터베이스 연결
	public void getCon() {
		// 커넥션 풀
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//////////////회원가입
	// 회원가입 처리 메소드
	public void memberJoin(MemberBean bean) {
		getCon();

		try {
			// 쿼리 준비
			String sql = "insert into Member values (?, ?, ?, ?, ?)";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			// ?에 맵핑
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword1());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getEmail());
			// 쿼리 실행
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 아이디 중복 체크 메소드
	public int checkId(String id) {
		int result = 0;

		getCon();

		try {
			// 쿼리 선언
			String sql = "select count(*) from Member where id=?";
			// 쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			// ? 맵핑
			pstmt.setString(1, id);
			// 결과 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1); // result 값이 0이라는 건 데이터베이스 존재하지 않는다는 뜻 (사용 가능한 아이디)
				System.out.println(id);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//////////////로그인
	// 로그인 처리 메소드
	public int getMember(String id, String password1) {
		int result = 0;

		getCon();

		try {
			// 쿼리 선언
			String sql = "select count(*) from Member where id=? and password1=?";
			// 쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			// ? 맵핑
			pstmt.setString(1, id);
			pstmt.setString(2, password1);
			// 결과 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1); // result 값이 0이라는 건 데이터베이스 존재하지 않는 다는 뜻
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/////////////////게시판
	// 글을 쓰는 메소드
	public void writeBoard(BoardBean bean, String id) {
		getCon();

		int ref = 0; // 글 그룹
		int re_step = 1;// 부모글
		int re_level = 1;// 부모글

		try {
			// 가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql = "select max(ref) from HotelBoard";
			// 쿼리 실행
			pstmt = con.prepareStatement(refsql);
			// 쿼리 실행 후 결과 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) { // 쿼리 결과 값이 있다면
				ref = rs.getInt(1) + 1; // ref 최대값에 +1 해주어 글그룹을 설정
			}
			// 쿼리작성
			String sql = "insert into HotelBoard values(HotelBoard_seq.NEXTVAL, ?, ?, sysdate, ?, ?, ?, 0, ?)";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			// ?에 맵핑
			pstmt.setString(1, id);
			pstmt.setString(2, bean.getTitle());
			pstmt.setInt(3, ref);
			pstmt.setInt(4, re_step);
			pstmt.setInt(5, re_level);
			pstmt.setString(6, bean.getContent());
			// 쿼리 실행
			pstmt.executeUpdate();
			// 자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 전체 글의 개수를 리턴하는 메소드
	public int getAllCount() {
		getCon();
		// 게시글 전체수를 저장하는 변수
		int count = 0;

		try {
			// 쿼리준비
			String sql = "select count(*) from HotelBoard";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			// 쿼리 실행하여 결과 리턴
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1); // 전체 게시글 수
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// 모든 게시글을 리턴하는 메소드
	public Vector<BoardBean> getAllBoard(int startRow, int endRow) {
		Vector<BoardBean> v = new Vector<>();

		getCon();

		try {
			// 쿼리 준비
			String sql = "select * from (select A.* ,Rownum Rnum from (select * from HotelBoard "
					+ "order by ref desc, re_step asc, re_level asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			// ?에 맵핑
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 데이터를 패키징(가방 = BoardBean 클래스를 이용)
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
				// 패키징 한 데이터를 벡터에 저장
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// 하나의 게시글을 리턴하는 메소드 작성 (BoardInfo에 이용)
	public BoardBean getOneBoard(int num) {
		// 리턴 타입 선언
		BoardBean bean = new BoardBean();
		
		getCon();
		
		try {
			// 글을 읽을 때마다 조회수 증가 쿼리 준비
			String readsql = "update HotelBoard set readcount = readcount + 1 where num=?";
			// 쿼리 실행
			pstmt = con.prepareStatement(readsql);
			// ?에 맵핑
			pstmt.setInt(1, num);
			// 쿼리 실행
			pstmt.executeUpdate();

			// 게시글 조회 쿼리 준비
			String sql = "select * from HotelBoard where num=?";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			// ?에 맵핑
			pstmt.setInt(1, num);
			// 쿼리 실행 후 결과 리턴
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


	// 답변을 작성하는 메소드 [관리자 권한]
	public void reWriteBoard(BoardBean bean, String id) {
		// 부모글 그룹과 글 레벨 글 스텝을 읽어 들임
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();

		getCon();
		try {
			// 부모글보다 큰 re_level 값을 전부 1씩 증가시킴
			String levelsql = "update HotelBoard set re_level = re_level+1 where ref=? and re_level > ?";
			// 쿼리실행 객체 선언
			pstmt = con.prepareStatement(levelsql);
			// ?에 값 맵핑
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			// 쿼리실행
			pstmt.executeUpdate();
			// 답변글 데이터를 저장하는 쿼리
			String sql = "insert into HotelBoard values(HotelBoard_seq.NEXTVAL, ?, ?, sysdate, ?, ?, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			// ?에 맵핑
			pstmt.setString(1, id);
			pstmt.setString(2, bean.getTitle());
			pstmt.setInt(3, ref); // 부모의 ref 값 그대로
			pstmt.setInt(4, re_step + 1); // 부모의 re_step + 1 (답변)
			pstmt.setInt(5, re_level + 1); // 부모의 re_level + 1 (답변)
			pstmt.setString(6, bean.getContent());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 하나의 게시글을 수정하는 메소드
	public void updateBoard(BoardBean bean, String id) {
		getCon();

		try {
			// 쿼리 준비
			String sql = "update HotelBoard set title=?, content=? where num=?";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			// ?에 맵핑
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			// 쿼리실행
			pstmt.executeUpdate();
			// 자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 하나의 게시글을 삭제하는 메소드
	public void deleteBoard(int num) {
		getCon();

		try {
			// 쿼리 준비
			String sql = "delete from HotelBoard where num=?";
			pstmt = con.prepareStatement(sql);
			// ?에 맵핑
			pstmt.setInt(1, num);
			// 쿼리실행
			pstmt.executeUpdate();
			// 자원반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//////////////예약 
	// 한 회원의 예약 데이터를 저장하는 메소드
	public BookingBean makeBooking(BookingBean bean) {
		getCon();

		try {
			// 쿼리 준비
			String sql = "insert into Booking values(Booking_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
			// 쿼리를 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			// ?에 맵핑
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getRoomtype());
			pstmt.setInt(3, bean.getRoomrate());
			pstmt.setInt(4, bean.getPeople());
			pstmt.setString(5, bean.getDay());
			pstmt.setInt(6, bean.getDuration());
			pstmt.setInt(7, bean.getPrice());
			// 쿼리 실행
			pstmt.executeUpdate();
			// 자원반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 모든 예약 내역을 리턴하는 메소드
	public Vector<BookingBean> getAllBooking() {
		Vector<BookingBean> v = new Vector<>();

		getCon();

		try {
			// 쿼리 준비
			String sql = "select * from booking order by bookingno desc";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 데이터를 패키징(빈 클래스를 이용)
				BookingBean bean = new BookingBean();
				bean.setBookingNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setRoomtype(rs.getString(3));
				bean.setRoomrate(rs.getInt(4));
				bean.setPeople(rs.getInt(5));
				bean.setDay(rs.getString(6));
				bean.setDuration(rs.getInt(7));
				bean.setPrice(rs.getInt(8));
				// 패키징 한 데이터를 벡터에 저장
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	// 한 회원의 예약 내역을 리턴하는 메소드
	public Vector<BookingBean> getAllBookingByCustomer(String id) {
		Vector<BookingBean> v = new Vector<>();
		
		getCon();

		try {
			// 쿼리 준비
			String sql = "select * from booking where id = ? order by bookingno desc";
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			//?에 값 매핑
			pstmt.setString(1, id);
			//결과 리
			rs = pstmt.executeQuery();
			while (rs.next()) {
				// 데이터를 패키징(빈 클래스를 이용)
				BookingBean bean = new BookingBean();
				bean.setBookingNo(rs.getInt(1));
				bean.setId(rs.getString(2));
				bean.setRoomtype(rs.getString(3));
				bean.setRoomrate(rs.getInt(4));
				bean.setPeople(rs.getInt(5));
				bean.setDay(rs.getString(6));
				bean.setDuration(rs.getInt(7));
				bean.setPrice(rs.getInt(8));	
				// 패키징 한 데이터를 벡터에 저장
				v.add(bean);			
			}			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//예약 삭제 메소드
	public void deleteBooking(int bookingNo) {
		getCon();
		
		try {
			//쿼리 준비
			String sql = "delete from Booking where bookingno=?";
			//쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			//?에 맵핑
			pstmt.setInt(1, bookingNo);
			//쿼리 실행
			pstmt.executeUpdate();
			//자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
