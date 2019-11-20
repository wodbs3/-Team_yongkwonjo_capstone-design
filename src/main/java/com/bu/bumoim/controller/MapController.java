package com.bu.bumoim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("map")
public class MapController {
	//
	
	@RequestMapping(value="map.do", method=RequestMethod.GET)
	public String mapView() {
		//
		return "map/mapView";
	}
}