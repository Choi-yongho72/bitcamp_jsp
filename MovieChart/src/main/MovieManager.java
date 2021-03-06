package main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class MovieManager {
	public static List<MovieVo> getCGVdata() {		// web에서 parsing해
		Document doc;
		
		List<MovieVo> list = new ArrayList<MovieVo>();
		
		try {
			doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			
			// 영화제목
			Elements titles = doc.select("div.box-contents strong.title");		// box-contents안의 타이틀 다 가져와
			/*
			<div class="box-contents">
                        <a href="/movies/detail-view/?midx=82999">
                            <strong class="title">남산의 부장들</strong>
                        </a>
			*/
			
			
			Elements likes = doc.select("div.box-contents span.count strong i");
			/*
			<span class="count"> 
            	<strong><i>6,669</i><span>명이 선택</span></strong>
			*/
			
			
			for(int i = 0; i < 7; i++) {
				Element eTitle = titles.get(i);
				String title = eTitle.text();
				System.out.print("제목은 " + title + ", ");
				
				Element eLike = likes.get(i);
				String slike = eLike.text().replace(",", "");
				System.out.println("좋아요수는 " + slike);
				
				int like = Integer.parseInt(slike);
				
				MovieVo vo = new MovieVo();
				vo.setTitle(title);
				vo.setLike(like);
				
				list.add(vo);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}



























