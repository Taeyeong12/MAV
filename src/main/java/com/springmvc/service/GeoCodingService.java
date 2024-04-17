package com.springmvc.service;

import java.util.Collections;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.springmvc.domain.GeoLocation;


@Service
public class GeoCodingService {

    private static final String API_URL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=";

    private static final String clientId = "wj36qxbfxf"; // 네이버 API 사용자 등록을 통해 발급받은 ID
    private static final String clientSecret = "yfXQIM0fkYEQDoIIDLkNIHs10RHLDa1l8C4rKx42"; // 네이버 API 사용자 등록을 통해 발급받은 Secret

	
    public static GeoLocation getGeoLocation(String address) {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("X-NCP-APIGW-API-KEY-ID", clientId);
        headers.add("X-NCP-APIGW-API-KEY", clientSecret);

        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

        ResponseEntity<String> response = restTemplate.exchange(API_URL + address, HttpMethod.GET, entity, String.class);

        // JSON 파싱하여 위도와 경도를 추출
        JSONObject responseObject = new JSONObject(response.getBody());
        JSONArray addresses = responseObject.getJSONArray("addresses");
        double latitude = 0.0;
        double longitude = 0.0;
        if (addresses.length() > 0) {
            JSONObject firstAddress = addresses.getJSONObject(0);
            latitude = firstAddress.getDouble("y"); // 네이버 API에서는 위도가 'y'로 표시됩니다.
            longitude = firstAddress.getDouble("x"); // 네이버 API에서는 경도가 'x'로 표시됩니다.
        }

        return new GeoLocation(latitude, longitude);
    }
}
