package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Store;

public class StoreRowMapper implements RowMapper<Store> {

   @Override
   public Store mapRow(ResultSet rs, int rowNum) throws SQLException {
      Store store = new Store();
      store.setStoreAddr(rs.getString("storeAddr"));
      store.setStoreApprove(rs.getBoolean("storeApprove"));
      store.setStoreCategory(rs.getString("storeCategory"));
      store.setStoreId(rs.getString("storeId"));
      store.setStoreInfomation(rs.getString("storeInfomation"));
      store.setStoreName(rs.getString("storeName"));
      store.setStoreNotice(rs.getString("storeNotice"));
      store.setStorePhone01(rs.getString("storePhone01"));
      store.setStorePhone02(rs.getString("storePhone02"));
      store.setStorePhone03(rs.getString("storePhone03"));
      store.setStoreCode(rs.getString("storeCode"));
      store.setStoreImageName1(rs.getString("storeImageName1"));
      store.setStoreImageName2(rs.getString("storeImageName2"));
      store.setStoreImageName3(rs.getString("storeImageName3"));
      store.setStoreImageName4(rs.getString("storeImageName4"));
      store.setStoreImageName5(rs.getString("storeImageName5"));

       return store;
   }

}