package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Room;
import com.springmvc.domain.RoomWithCoordinate;
import com.springmvc.domain.Store;

public interface StoreService {
   void createRoom(Room room);
   void updateMatchedValue(int roomNum, int matchedValue);
   List<Room> getAllRooms(Room room);
   void deleteRoom(int roomNum);
   Room getByroomNumAllRooms(int roomNum);
   void updateRoom(Room updateRoom);
   Store getStoreById(String storeId);
   List<Room> getRoomsByStoreId(String storeId);
   void CreateStore(Store store);
   void UpdateStore(Store store);
   Store DeleteStore(String storeId);
   RoomWithCoordinate getBycoordinate(int roomNum);
   void setApproveStore(String storeId);
   List<Store> getAllStore();

}
//List<Room> getAllRoomsByStoreId(String storeId);