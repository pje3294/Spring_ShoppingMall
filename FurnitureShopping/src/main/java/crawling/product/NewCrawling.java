package crawling.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.jdbc.core.JdbcTemplate;

import model.product.ProductDAO;
import model.product.ProductServiceImpl;
import model.product.ProductVO;

public class NewCrawling {
	public static void main(String[] args) {

		Document doc = null;

		// 크롤링 데이터 담아서 DB로 저장할 변수들
		String proCate = null; // 카테고리
		String proSubCate = null; // 하위카테고리
		String proName = null; // 상품명
		int proPrice = 0; 		//  VO에 int 타입
		String proKC = null; // 
		String proColor = null; //
		String proCmpt = null; // 
		String proMtrl = null; // 
		String proMnfct = null;
		String proNation = null; // 
		String proSize = null; // 
		String proFee = null; //VO에 int 타입 -> table 태그 값이기 때문에 밑에서 변경  
		String proCerti = null; // 
		String proAS = null; // 
		String proImg = null; // 
		
		
		
		
		String url = "https://ohou.se/productions/354736/selling?affect_type=ProductCategoryIndex&affect_id=";

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Iterator<Element> itr1 = doc.select("li.commerce-category-breadcrumb__entry > a.link").iterator();
		Iterator<Element> itr2 = doc.select("span.production-selling-header__title__name").iterator();
		Iterator<Element> itr3 = doc.select("span.production-selling-header__price__price > span.number").iterator();
		String itr4 = doc.select("img.production-selling-cover-image__entry__image").attr("src");
		Iterator<Element> itr5 = doc.select("table.production-selling-table > tbody > tr > td").iterator();

		List<String> data = new ArrayList<String>(); // 카테고리 관련
		
		

		while (itr1.hasNext()) {

			String str = itr1.next().toString();
			str = str.substring(0, str.lastIndexOf("<"));
			str = str.substring(str.lastIndexOf(">") + 1);
			data.add(str);
			System.out.println("확인" + data);

		}

		System.out.println(data);
		proCate = data.get(1);
		proSubCate = data.get(2);

		
		
		while (itr2.hasNext()) {

			// 상품명
			String str = itr2.next().toString();
			str = str.substring(0, str.lastIndexOf("<"));
			str = str.substring(str.lastIndexOf(">") + 1);
			proName = str;
			
			// 가격 
			str = itr3.next().toString();
			str = str.substring(0, str.lastIndexOf("<"));
			str = str.substring(str.lastIndexOf(">") + 1);
			proPrice = Integer.parseInt(str.replace(",", ""));

			// 이미지
			str = itr4;
			//str = str.substring(0, str.lastIndexOf("<"));
			//str = str.substring(str.lastIndexOf(">") + 1);
			proImg = str;
			
			
			
			
			
		}
		
		
		List<String> tb = new ArrayList<String>(); // 카테고리 관련
		
		while (itr5.hasNext()) {

			String str = itr5.next().toString();
			str = str.substring(0, str.lastIndexOf("<"));
			str = str.substring(str.lastIndexOf(">") + 1);
			tb.add(str);
			System.out.println("표  : " + tb);

		}

		System.out.println("확인");
		proKC = tb.get(1);
		proColor = tb.get(2); 
		proCmpt = tb.get(3);
		proMtrl = tb.get(4);
		proMnfct = tb.get(5);
		proNation = tb.get(6);
		proSize = tb.get(7);
		proFee = tb.get(8);
		proCerti = tb.get(9);
		proAS = tb.get(10);
		
		
		
		
		
		System.out.println("=================================");
		System.out.println("proCate , proSubCate : " + proCate + "  " + proSubCate);
		System.out.println("proName : " + proName);
		System.out.println("proPrice : " + proPrice);
		System.out.println("proImg : " + proImg);
		
		System.out.println("\n[상품 디테일 표 ]");
		System.out.println(proKC);
		System.out.println(proColor);
		System.out.println(proCmpt);
		System.out.println(proMtrl);
		System.out.println(proMnfct);
		System.out.println(proNation);
		System.out.println(proSize);
		System.out.println(proFee);
		System.out.println(proCerti);
		System.out.println(proAS);
		
		
		ProductVO vo = new ProductVO();
		ProductDAO dao = new ProductDAO();
		
		/*"insert into product (proCode, proCate,proSubCate, proName, proPrice, proStock, proKC, "
				+ "proColor, proCmpt, proMtrl, proMnfct, proNation, proSize, proFee, proCerti, proAS, proImg) "
				+ "values((select nvl(max(proCode),0)+1 from product),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";*/
		
		// proStock (기본 재고 설정)
		int proStock = 10;  
		int proFee1 =0;
		
		// 리스트 타입 String으료 VO타입(int)에 맞게 변경 
		if(proFee.contains("무")) { // 배송비가 무룟라면, (원본 데이터는  무료배송이라는 글자로 되어있음)
			proFee = "0";
			proFee1 = Integer.parseInt(proFee);
		}else {
			proFee1 = Integer.parseInt(proFee.replace(",", ""));	
		}
		
		vo.setProCate(proCate);
		vo.setProSubCate(proSubCate);
		vo.setProName(proName);
		vo.setProPrice(proPrice);
		vo.setProStock(proStock);
		vo.setProKC(proKC);
		vo.setProColor(proColor);
		vo.setProCmpt(proCmpt);
		vo.setProMtrl(proMtrl);
		vo.setProMnfct(proMnfct);
		vo.setProNation(proNation);
		vo.setProSize(proSize);
		vo.setProFee(proFee1);
		vo.setProCerti(proCerti);
		vo.setProAS(proAS);
		vo.setProImg(proImg);
		
		ProductServiceImpl productService = null;
		productService.insertProduct(vo);
		

	}
}
