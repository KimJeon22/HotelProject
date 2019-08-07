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
	       //System.out.println("tourdao�� ù��° �Ϸ�");	
	       //System.out.println("dao�� dbTselect �Լ�="+list.getT_area());
		   //System.out.println("dao�� dbTselect �Լ�="+list.getT_image());
		   //System.out.println("dao�� dbTselect �Լ�="+list.getT_place());
	    return list; 
	  }
	  
	 
	  public List<MainDTO> dbHselect(String area){ 
		  List<MainDTO> hlist =  temp.selectList("tour.hotellist", area); 
	      //System.out.println("hoteldao�� �����Ѱ� �Ϸ�");
	  return hlist;
	  }
	  
	  public List<MainDTO> dbMselect(String area){
		  List<MainDTO> mlist = temp.selectList("tour.mapslist", area);
		  //System.out.println("mapdao �Ϸ�");
		  return mlist;
	  }
	  


	  
	  
	  
	  
 
	  
	  
	  
	
	
}
