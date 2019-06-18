package com.nkt.shop.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop/cart/*")	// 공통적인 url mapping
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	CartService cartService;
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute CartDTO dto, HttpSession session) {
		// 로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		String id = (String)session.getAttribute("id");
		if(id==null) { // 로그인 안된 상태면 로그인 화면으로 이동
			return "redirect:/member/login.do";
		}
		dto.setId(id);	// CartDTO 틀에 id 입력
		cartService.insert(dto);	// 장바구니 테이블에 저장됨
		return "redirect:/shop/cart/list.do";	// 장바구니 목록으로 이동
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		String id = (String)session.getAttribute("id");
		if(id!=null) {
			List<CartDTO> list = cartService.listCart(id);	// 장바구니 목록
			int sumMoney = cartService.sumMoney(id);	// 금액 합계
			int fee = sumMoney >= 30000 ? 0 : 2500;		// 배송료 계산
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);	// 배송료
			map.put("sum", sumMoney+fee);	// 전체 금액
			map.put("list", list);	// 장바구니 목록
			map.put("count", list.size());	// 레코드 갯수
			mav.setViewName("shop/cart_list");	// 이동할 페이지 이름
			mav.addObject("map", map);	// 데이터 저장
			return mav;
		} else {
			return new ModelAndView("home", "", null);
		}
		
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cart_id) {
		cartService.delete(cart_id);
		return "redirect:/shop/cart/list.do";
	}
	
	@RequestMapping("deleteAll.do")
	public String deleteAll(HttpSession session) {
		String id=(String)session.getAttribute("id");
		if(id != null) {
			cartService.deleteAll(id);
		}
		return "redirect:/shop/cart/list.do";
	}
	
	@RequestMapping("update.do")
	public String update(int[] amount, int[] cart_id, HttpSession session) {
		String id = (String)session.getAttribute("id");
		for (int i = 0; i < cart_id.length; i++) {
			if (amount[i]==0) {
				cartService.delete(cart_id[i]);
			}else {
				CartDTO dto = new CartDTO();
				dto.setId(id);
				dto.setCart_id(cart_id[i]);
				dto.setAmount(amount[i]);
				cartService.modifyCart(dto);
			}
		}
		return "redirect:/shop/cart/list.do";
	}
	
}

