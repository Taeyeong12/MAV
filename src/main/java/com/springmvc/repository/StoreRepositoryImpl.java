package com.springmvc.repository;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import java.util.ArrayList;

import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Room;
import com.springmvc.domain.RoomWithCoordinate;
import com.springmvc.domain.Store;

@Repository
public class StoreRepositoryImpl implements StoreRepository {

	private final JdbcTemplate jdbcTemplate;

	private final String client_id = "wj36qxbfxf";
	private final String client_secret = "yfXQIM0fkYEQDoIIDLkNIHs10RHLDa1l8C4rKx42";

	public String[] getxy(Store store) {
		String address = store.getStoreAddr();
		String y = null;
		String x = null;
		try {
			String addr = URLEncoder.encode(address, "UTF-8");
			String reqUrl = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + addr;

			URL url = new URL(reqUrl);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", client_id);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", client_secret);

			BufferedReader br;
			int responseCode = con.getResponseCode();
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String line;
			StringBuffer response = new StringBuffer();
			while ((line = br.readLine()) != null) {
				response.append(line);
			}
			br.close();
			JSONTokener tokener = new JSONTokener(response.toString());
			JSONObject object = new JSONObject(tokener);
			JSONArray arr = object.getJSONArray("addresses");
			for (int i = 0; i < arr.length(); i++) {
				JSONObject temp = (JSONObject) arr.get(i);
				address = (String) temp.get("roadAddress");
				x = (String) temp.get("x");
				y = (String) temp.get("y");
			}
			System.out.println(x + y);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String[] s = new String[2];
		s[0] = x;
		s[1] = y;
		return s;
	}
	
	
	// 스토어 아이디에 맞는 룸 가지고 오기
	@Override
	public List<Room> getRoomsByStoreId(String storeId) {
		String sql = "SELECT * FROM Room WHERE storeId = ?";
		return jdbcTemplate.query(sql, new RoomRowMapper(), storeId);
	}

	// 스토어 아이디에 맞는 정보가지고 가기
	@Override
	public Store getStoreById(String storeId) {
		String sql = "SELECT * FROM Store WHERE storeId = ?";
		try {
			return jdbcTemplate.queryForObject(sql, new StoreRowMapper(), storeId);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	// 업데이트시에 사용
	// 룸 넘버에 맞는 룸정보 들고 오기
	@Override
	public Room getByroomNumAllRooms(int roomNum) {
		String sql = "SELECT * FROM Room WHERE roomNum = ?";
		return jdbcTemplate.queryForObject(sql, new RoomRowMapper(), roomNum);
	}

	// 객체생성
	@Autowired
	public StoreRepositoryImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// 방 만들기
	@Override
	public void createRoom(Room room) {
		String sql = "INSERT INTO Room (storeId, roomName, roomCapacity, roomCount, roomCategory, roomDetail, roomDate, roomTime,matched) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, room.getStoreId(), room.getRoomName(), room.getRoomCapacity(), room.getRoomCount(),
				room.getRoomCategory(), room.getRoomDetail(), room.getRoomDate(), room.getRoomTime(),
				room.getMatched());
	}

	// 방 전체 보여주기
	@Override
	public List<Room> getAllRooms(Room room) {
		String sql = "SELECT * FROM Room";
		return jdbcTemplate.query(sql, new RoomRowMapper());
	}

	// 스토어아이디에 맞는 룸 불러오기
	@Override
	public Room getByRoomNum(int roomNum) {
		String sql = "SELECT * FROM Room WHERE roomNum = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { roomNum }, new RoomRowMapper());
	}

	// 방삭제
	@Override
	public void deleteRoom(int roomNum) {
		String sql = "DELETE FROM Room WHERE roomNum = ?";
		jdbcTemplate.update(sql, roomNum);
	}

	// 방업데이트
	@Override
	public void updateRoom(Room updatedRoom) {
		String sql = "UPDATE Room SET storeId = ?, roomName = ?, roomCapacity = ?, roomCount = ?, roomCategory = ?, "
				+ "roomDetail = ?, roomDate = ?, roomTime = ? WHERE roomNum = ?";
		jdbcTemplate.update(sql, updatedRoom.getStoreId(), updatedRoom.getRoomName(), updatedRoom.getRoomCapacity(),
				updatedRoom.getRoomCount(), updatedRoom.getRoomCategory(), updatedRoom.getRoomDetail(),
				updatedRoom.getRoomDate(), updatedRoom.getRoomTime(), updatedRoom.getRoomNum());
	}

	// 매칭 신청시 매치드 값 바꾸기
	@Override
	public void updateMatchedValue(int roomNum, int matchedValue) {
		String sql = "UPDATE Room SET matched = ? WHERE roomNum = ?";
		jdbcTemplate.update(sql, matchedValue, roomNum);
	}

	  // 업체등록
	   public void CreateStore(Store store) {

	      String[] xy = getxy(store);
	      System.out.println(xy[0] + " xy[0]");	     

	      String SQL = "INSERT INTO Store "
	            + "(storeId,"
	            + "storeName,"
	            + "storeAddr,"
	            + "storeCategory,"
	            + "storePhone01,"
	            + "storePhone02,"
	            + "storePhone03,"
	            + "storeImageName1,"
	            + "storeImageName2,"
	            + "storeImageName3,"
	            + "storeImageName4,"
	            + "storeImageName5,"
	            + "storeInfomation,"
	            + "storeNotice,"
	            + "storeCode,"
	            + "storeApprove,"
	            + "latitude,"
	            + "longitude)"
	            + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	      jdbcTemplate.update(SQL,
	            store.getStoreId(),
	            store.getStoreName(),
	            store.getStoreAddr(), 
	            store.getStoreCategory(),
	            store.getStorePhone01(), 
	            store.getStorePhone02(), 
	            store.getStorePhone03(),
	            store.getStoreImageName1(),
	            store.getStoreImageName2(),
	            store.getStoreImageName3(),
	            store.getStoreImageName4(),
	            store.getStoreImageName5(),
	            store.getStoreInfomation(),
	            store.getStoreNotice(), 
	            store.getStoreCode(), 
	            store.isStoreApprove(), 
	            xy[1], // 위도
	            xy[0]// 경도
	      );

	   }

	   @Override
	   public void UpdateStore(Store store) {
	      // TODO Auto-generated method stub
	      String SQL = "UPDATE " + "Store SET storeName=?,"
	            + "storeAddr=?,"
	            + "storeCategory=?,"
	            + "storePhone01=?,"
	            + "storePhone02=?," 
	            + "storePhone03=?,"
	            + "storeImageName1=?,"
	            + "storeImageName2=?,"
	            + "storeImageName3=?,"
	            + "storeImageName4=?,"
	            + "storeImageName5=?,"
	            + "storeInfomation=?,"
	            + "storeNotice=?," 
	            + "storeCode=?"
	            + "where storeId=?";
	      System.out.println("함수실행");
	      jdbcTemplate.update(SQL, 
	            store.getStoreName(),
	            store.getStoreAddr(),
	            store.getStoreCategory(),
	            store.getStorePhone01(),
	            store.getStorePhone02(),
	            store.getStorePhone03(),
	            store.getStoreImageName1(),
	            store.getStoreImageName2(),
	            store.getStoreImageName3(),
	            store.getStoreImageName4(),
	            store.getStoreImageName5(),
	            store.getStoreInfomation(),
	            store.getStoreNotice(),
	            store.getStoreCode(),
	            store.getStoreId());

	   }

	@Override
	public Store DeleteStore(String storeId) {
		String SQL = "DELETE FROM STORE WHERE storeId=?";
		jdbcTemplate.update(SQL, storeId);

		return null;
	}
	
	
	// 좌표값 가지고 오는 함수
	@Override
	public RoomWithCoordinate getBycoordinate(int roomNum) {

		String SQL = "SELECT R.roomNum, S.latitude, S.longitude FROM Store S JOIN Room R ON S.storeId = R.storeId WHERE R.roomNum = ?";
		RoomWithCoordinate coordinate = jdbcTemplate.queryForObject(SQL, new RoomWithCoordinateRowMapper(), roomNum);
		return coordinate;
	}

	@Override
	public void setApproveStore(String storeId) 
	{
		String SQL = "update store set storeApprove =true where storeId = ?";
		jdbcTemplate.update(SQL, storeId);
		
	}

	@Override
	public List<Store> getAllStore()
	{
		List<Store> storelist = new ArrayList<Store>();
		
		String SQL = "select * from store";
		storelist = jdbcTemplate.query(SQL, new StoreRowMapper());
		
		return storelist;
	}

}