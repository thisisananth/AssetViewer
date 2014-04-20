package com.ao.client;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.ao.client.model.AssetInfo;

@Controller
public class AssetViewerController {
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Value("${ao.url}")
	private String aoUrl;
	
	private static Logger log = LoggerFactory.getLogger(AssetViewerController.class);
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String getCategories(Model model){
		
		
		Map categories = restTemplate.getForObject(aoUrl+"assetsvc/category", HashMap.class);
		Map genres = restTemplate.getForObject(aoUrl+"assetsvc/genre", HashMap.class);
		
		 model.addAttribute("categories",categories);
		 model.addAttribute("genres",genres);
		 
		 return "select";
		
	}
	
	@RequestMapping(value="/view",method = RequestMethod.POST)
	public String getVideos(@RequestParam("categoryId") Integer categoryId, @RequestParam("genreId") Integer genreId, Model model){
		
		AssetInfo assets = restTemplate.getForObject(aoUrl+"assetsvc/video/category/"+categoryId+"/genre/"+genreId, AssetInfo.class);
	
		model.addAttribute("assets",assets);
		
		return "show_assets";
	}
	
	
	@RequestMapping(value = "/play", method = RequestMethod.GET)
	public String getVideos(@RequestParam("v") String fileName,Model model){
		model.addAttribute("videoName",fileName);
		log.info("File Name:"+fileName);
		
		String[] fileNames = fileName.split("\\.");
		log.info("FileNames size:"+fileNames.length);
		
		String ext="";
		if(fileNames.length>0){
			ext = fileNames[fileNames.length-1];
			
		}
		log.info("ext:"+ext);
		model.addAttribute("ext", ext);
		return "play_video";
		
	}

}
