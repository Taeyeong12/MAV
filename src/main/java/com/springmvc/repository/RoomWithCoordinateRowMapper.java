package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Room;
import com.springmvc.domain.RoomWithCoordinate;
import com.springmvc.domain.Store;

public class RoomWithCoordinateRowMapper implements RowMapper<RoomWithCoordinate> {

    @Override
    public RoomWithCoordinate mapRow(ResultSet rs, int rowNum) throws SQLException {
        Room room = new Room();
        Store store = new Store();
        RoomWithCoordinate roomWithCoordinate = new RoomWithCoordinate();
        roomWithCoordinate.setRoomNum(rs.getInt("roomNum"));
        roomWithCoordinate.setLatitude(rs.getDouble("latitude"));
        roomWithCoordinate.setLongitude(rs.getDouble("longitude"));

        room.setStore(store);

        return roomWithCoordinate;
    }
}