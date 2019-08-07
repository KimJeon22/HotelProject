package net.hb.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.crud.BoardDTO;

@Repository
@Component
public class MainDAO {

	 @Autowired
	 SqlSessionTemplate temp;
	 	
	  public MainDTO dbTselect(String timg) {
	      MainDTO list = (MainDTO) temp.selectOne("tour.search", timg);
	       //System.out.println("tourdao단 첫번째 완료");	
	       //System.out.println("dao에 dbTselect 함수="+list.getT_area());
		   //System.out.println("dao에 dbTselect 함수="+list.getT_image());
		   //System.out.println("dao에 dbTselect 함수="+list.getT_place());
	    return list; 
	  }
	  
	 
	  public List<MainDTO> dbHselect(String area){ 
		  List<MainDTO> hlist =  temp.selectList("tour.hotellist", area); 
	      //System.out.println("hoteldao단 수정한것 완료");
	  return hlist;
	  }
	  
	  public List<MainDTO> dbMselect(String area){
		  List<MainDTO> mlist = temp.selectList("tour.mapslist", area);
		  //System.out.println("mapdao 완료");
		  return mlist;
	  }
	  


	  
	  
	  
	  
 
	  
	  
	  
	
	
}
