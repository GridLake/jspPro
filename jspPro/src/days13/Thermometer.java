package days13;

import java.util.HashMap;
import java.util.Map;

//                  온도계 클래스
public class Thermometer {
	// 맵              지역         온도
	private Map<String, Double> locationCelsiusMap =
			new HashMap<>();
	//                     섭씨
	public void setCelsius(String location, Double value) {
		locationCelsiusMap.put(location, value);
	}
	public Double getCelsius(String location) {
		return this.locationCelsiusMap.get(location);
	}
	//                        섭씨 -> 화씨
	public Double getFahrenheit(String location) {
		Double celsius = getCelsius(location);
		if( celsius == null) return null;
		return celsius * 1.9 + 32.0;
	}	
	// 온도계 버젼 정보
	public String getInfo() {
		return "온도계 변환기 1.1";
	}

}
