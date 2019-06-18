package com.nkt.shop.member;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import com.kbkb.mypackage.member.MemberDTO;
//import com.kbkb.mypackage.member.MemberService;
//import com.kbkb.mypackage.member.Page;

//import com.nkt.shop.HomeController;

@Controller
//@Controller는 클래스 경로의 스캐닝을 통해 구현 클래스를 자동 감지 할 수 있다. 빼먹지않고 넣기!!
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
//	@Autowired
//	MemberService ms;
//	MemberService.java를 자동연결 시켜줌
	
	@Autowired
	SqlSession sqlsession;
//	sqlsession은 MemberMappers 데이터와 연결해서 컨트롤러에서 사용가능
	
	@RequestMapping(value = "/member/login.do")
	public String login() {
		return "home";
	}
	
	@RequestMapping(value = "/member/login")
//	/member/login 페이지는 로그인 했을때 연결되는 일종의 가상(?)페이지. return의 값과 다르면 가상(?)페이지인 경우를 많이 봄.
	public String login(Model model, 
//					HttpServletRequest request,
//					String email,
//					String password,
//					String emailsave,
					MemberDTO param_md,
					HttpSession session) {
//		Model 파라미터는 주로 model에 속성을 추가하기 위해 설계됨. 다른 화면출력 명령어 써줄 필요없이 model에 담아 버리면 화면에 출력 시켜줌.
//		HttpSession 파라미터는 둘 이상의 페이지 요청에서 사용자를 식별하거나 웹 사이트를 방문하고 해당 사용자에 대한 정보를 저장하는 방법을 제공.
		
//		ms.doinsert();
		
//		logger.info("password = "+password);
//		logger.info("emailsave = "+emailsave);
//		logger.info("md = "+md);
		
		
		MemberDTO db_md 
			= (MemberDTO) sqlsession.selectOne("members.selectlogin", param_md);
//		param_md(MemberDTO 자료형의 파라미터)로 members.selectlogin(Mappers의 변수명으로 로그인할때 검색해주는 명령)을 실행시킨다.
//		selectOne은 단일 행을 검색하는 메소드. selectList는 여러 행을 검색하는 메소드.
//		param_md 를 넣어주는 이유는 Mappers 의 members.selectlogin 에 parameterType(#{})이 존재하기 때문이다.
		
		session.setAttribute("id", db_md.getId());
		
		if( param_md != null && db_md != null) {
//				param_md(MemberDTO의 저장값)과 db_md(로그인할때 쳐넣은 값)이 모두 널값이 아니면
			if( param_md.getId().equals( db_md.getId() ) ) {
				session.setAttribute("db_md", db_md);
//				param_md(MemberDTO의 저장값)의 이메일과 db_md(로그인할때 쳐넣은 값)의 이메일이 같으면
//				db_md(로그인할때 쳐넣은 값(key))의 값을 db_md(변수명)에 입력해서 session에 저장
//				db_md 는 home.jsp의 로그인 성공과 실패화면 노출시 사용하는 변수.
			}
		}else {
			model.addAttribute("logininfo",
				"<span style='color:red;'>아이디나 비밀번호 확인하세요.</span>");
//			로그인 실패하면 ${logininfo} 로 home.jsp에 연결시켜줌.
//			span은 많은 css속성
//			(display,width,height,background-color,color,font-style,margin,padding,border)을
//			활용할 수 있는 태그다.
		}
		
//		logger.info(md.toString());
/*		
 * 		파라메타 확인하기 위해서 출력		
 * 		String email1 = request.getParameter("email");
 *		logger.info("email = "+email);
 *		logger.info("email1 = "+email1);
 */	
		model.addAttribute("/shop/cart_list", "home");
//		home.jsp의 값을 menu.jsp에 넣는다.
//		오른쪽 파라미터가 " " 안에 담겨져 있으면 (1.키값)임과 동시에 (2. .jsp페이지 안에 들어있는 키값)을 의미함.
//		태그를 넣기위한 예외도 존재함
		
		List<MemberDTO> al = sqlsession.selectList("members.selectAll");
//		selectList(여러행을 받아오는 메소드)에 sqlsession(Mappers의 값을 받아오는 변수)을 연결해 Mappers의 members.selectAll의 값을 담는다.
//		MemberDTO 자료형을 제네릭 타입으로 오른쪽 값을 al에 넣는다.
		model.addAttribute("memberList", al);
//		al의 값을 memberList 변수에 담는다.
		return "home";
//		home.jsp에 출력될 값들을 잘 생각해보시오.
	}
	
	@RequestMapping(value = "/member/join")
//	이렇게 value 값이 return 값과 같으면 실제 물리적으로 저장된 페이지이다.
	public String join(Model model, HttpSession session) {
//		Model 파라미터는 주로 model에 속성을 추가하기 위해 설계됨. 다른 화면출력 명령어 써줄 필요없이 model에 담아 버리면 화면에 출력 시켜줌.
//		home.jsp의 join을 클릭하면 이 페이지로 이동.
		return "member/join";
	}
	
	@RequestMapping(value = "/member/joinProc")
//	joinProc은 회원가입 후에 연결할 페이지. 회원가입성공시에 home.jsp로 이동하고 회원가입실패시에 다시 join페이지로 이동하기 때문에 독립적인 페이지는 없음.
//	일종의 다른 페이지로 연결하는 가상(?)연결 매체(?).
	public String joinProc(Model model, HttpSession session,
				MemberDTO mdto	) {
//		Model 파라미터는 주로 model에 속성을 추가하기 위해 설계됨. 다른 화면출력 명령어 써줄 필요없이 model에 담아 버리면 화면에 출력 시켜줌.
//		HttpSession 파라미터는 둘 이상의 페이지 요청에서 사용자를 식별하거나 웹 사이트를 방문하고 해당 사용자에 대한 정보를 저장하는 방법을 제공.
//		MemberDTO의 자료형을 mdto라는 이름의 변수로 지정.
		int temp = sqlsession.insert("members.insertmember",mdto);
//		sqlsession 연결 후 mdto(MemberDTO 자료형의 파라미터)로 Mappers의 members.insertmember 명령 실행후 insert 시켜준다.
//		그 값을 temp에 담는다. 회원가입 성공시 temp에 1의 값이 들어가면서 아래의 if문의 값을 처리하고 회원가입 실패시 temp는 0이 되면서 else문을 실행한다.
//		mdto 를 넣어주는 이유는 Mappers 의 members.insertmember 에 parameterType(#{})이 존재하기 때문이다.
		if( temp ==1 ) {
//			System.out.println("insert 성공");
			session.setAttribute("db_md", mdto);
//			회원가입하면 저장되는 mdto 값을 db_md 변수에 저장. 
//			db_md 는 home.jsp의 로그인 성공과 실패화면 노출시 사용하는 변수.
//			db_md 는 (1.로그인시 사용되는 경우)와 (2.회원가입 직후 자동로그인 되는 경우)로 분류됨.
			List<MemberDTO> al = sqlsession.selectList("members.selectAll");
//			Mappers의 members.selectAll 변수에 sqlsession 연결 후 selectList(여러행을 받아오는 메소드)에 담는다.
//			MemberDTO 자료형을 제네릭 타입으로 오른쪽 값을 al에 넣는다.
			model.addAttribute("memberList", al);
//			al의 값을 memberList 변수에 담는다.
			return "home";
//			home.jsp에 출력될 값들을 잘 생각해보시오.
		}else {
//			System.out.println("insert 실패");
			model.addAttribute("joininfo","피치못할사정에 insert실패했어요..");
//			피치못할.. 이 값을 join.jsp 페이지에 위치하는 ${joininfo} 변수에 넣는다.
			return "member/join";
//			회원가입에 실패했기 때문에 join.jsp 페이지에 그대로 있는 상태가 된다.
		}
	}
	
	@RequestMapping(value = "/member/logout")
//	logout시 home.jsp 페이지로 가지만 주소링크는 /member/logout 이 된다.
//	로그아웃 페이지의 특성을 생각해보기.
	public String logout(Model model, HttpSession session) {
//		Model 파라미터는 주로 model에 속성을 추가하기 위해 설계됨. 다른 화면출력 명령어 써줄 필요없이 model에 담아 버리면 화면에 출력 시켜줌.
		session.invalidate();
//		invalidate는 지금의 세션을 무효로하고, 바인드(묶인)된 모든 객체의 바인드를 해제한다.
		return "home";
	}
	
	@RequestMapping(value = "/member")
//	홈페이지의 사이드바에서 MEMBER 버튼을 누르면 member/index 페이지로 연결이 되지만 주소링크는 /member 로 표시된다.
	public String home(Locale locale, Model model) {
//		Model 파라미터는 주로 model에 속성을 추가하기 위해 설계됨. 다른 화면출력 명령어 써줄 필요없이 model에 담아 버리면 화면에 출력 시켜줌.
//		locale 파라미터는 기본 home 컨트롤러에서 메소드의 시간표시를 위해 사용한다.
		List<MemberDTO> list = sqlsession.selectList("members.selectpage", new Page(1, 10));
//		다른 클래스인 page.java의 startrow와 endrow 각각의 값인 1,10을 Mappers의 members.selectpage 변수에 넣고
//		sqlsession 연결 후 selectList(여러행을 받아오는 메소드)에 담는다.
//		MemberDTO 자료형을 제네릭 타입으로 오른쪽 값을 list에 넣는다.
//		new Page(1, 10) 를 넣어주는 이유는 Mappers 의 members.selectpage 에 Page.java의 parameterType(#{})이 존재하기 때문이다.
		int pageCnt = sqlsession.selectOne("members.selectcount");
//		회원목록 페이지의 페이지카운트를 받아오기 위한 Mappers의 members.selectcount 변수에
//		sqlsession 연결 후 selectOne(단일행을 받아오는 메소드)에 넣는다.
//		int 자료형인 pageCnt에 오른쪽 값을 담는다.
//		logger.info("pageCnt = "+pageCnt);
		
		model.addAttribute("memberListPage", list);
//		list 값을 memberListPage 변수에 담아 member/index.jsp의 ${memberListPage} 변수에 출력한다.
		model.addAttribute("memberListCount", pageCnt);
//		pageCnt 값을 memberListCount 변수에 담아 member/index.jsp의 ${memberListCount} 변수에 출력한다.
		model.addAttribute("menu", "member");
		model.addAttribute("page", 1);
//		member의 값을 menu.jsp에 넣는다.
//		오른쪽 파라미터가 " " 안에 담겨져 있으면 (1.키값)임과 동시에 (2. .jsp페이지 안에 들어있는 키값)을 의미함.
		return "member/index";
//		홈페이지의 사이드바에서 MEMBER 버튼을 누르면 member/index 페이지로 연결이 되지만 주소링크는 /member 로 표시된다.
	}

	@RequestMapping(value = "/member/{page}")
//	member/index.jsp 페이지의 각각 페이지 값이 유동적이라서 아래의 @PathVariable 를 이용해 {} 안에 변수명을 넣는다.
//	member/index.jsp 페이지 뿐만 아니라 각각의 페이지를 클릭해도 멤버정보가 나와야 하므로 만들어야 하는 매핑이다.
	public String home(Locale locale, Model model, 
			@PathVariable(value = "page") int pages) {
//		ms.Test();
//		Model 파라미터는 주로 model에 속성을 추가하기 위해 설계됨. 다른 화면출력 명령어 써줄 필요없이 model에 담아 버리면 화면에 출력 시켜줌.
//		locale 파라미터는 기본 home 컨트롤러에서 메소드의 시간표시를 위해 사용한다.
//		@PathVariable 사용시 자료형 넣고 변수명을 넣는다. (value = "") 여기 안에 들어가는 변수는 @RequestMapping에 들어갈 변수명을 적는다.
//		@PathVariable 특성은 정확하지는 않지만 페이지경로를 int 자료형으로 할 경우 숫자 1부터 순서대로 설정해주는듯 하다.
//		logger.info("page = " + page);
		
		int pageCount = 10;
		
		Page pageobj = new Page(1, 10);
//		Page.java는 다른 클래스에서 만든 클래스이기 때문에 new 를 붙여서 적어준다.
//		Page 클래스 자료형으로 pageobj 변수를 만들어 1,10 값을 담는다.
		
		if(pages == 1) {
			pageobj.setStartrow(1);
//			pageobj 변수의 Startrow에 1 입력
			pageobj.setEndrow(10);
//			pageobj 변수의 Endrow에 10 입력
		}
		else {
//			else문은 2페이지부터 사용된다.
			pageobj.setStartrow( ( (pages-1) * pageCount ) +1 );
//			page가 2일경우 ( ( (2-1) * 10 ) + 1 ) 의 값(11)을 입력
			pageobj.setEndrow( pages * pageCount);
//			page가 2일경우 ( 2 * 10 ) 의 값(20)을 입력
		}
		
		List<MemberDTO> list = sqlsession.selectList("members.selectpage", pageobj);
//		pageobj(Page 자료형의 파라미터)로 Mappers 의 members.selectpage 명령을 실행하고
//		sqlsession 연결 후 selectList(여러행을 받아오는 메소드)에 담는다.
//		MemberDTO 자료형을 제네릭 타입으로 오른쪽 값을 list에 넣는다.
//		pageobj 를 넣어주는 이유는 Mappers 의 members.selectpage 에 parameterType(#{})이 존재하기 때문이다.
		int pageCnt = sqlsession.selectOne("members.selectcount");
//		int allCnt = sqlsession.selectOne("members.selectallnum");
//		Mappers 의 members.selectcount 변수를 실행해서 
//		sqlsession 연결 후 selectOne(단일행을 받아오는 메소드)에 넣는다.
//		int 자료형인 pageCnt에 오른쪽 값을 담는다.
//		logger.info("pageCnt = "+pageCnt);
		
		int prePage = pages - 1;
		int nextPage = pages + 1;
		
		model.addAttribute("page", pages);
//		pages 값을 @RequestMapping(value = "/member/{page}") 이 안의 page 변수에 담는다.
//		page가 1일 경우 member/1 페이지가 출력된다.
		
		model.addAttribute("pre", prePage);
		model.addAttribute("next", nextPage);
		
		model.addAttribute("memberListPage", list);
//		list 값을 memberListPage 변수에 담아 member/index.jsp의 ${memberListPage} 변수에 출력한다.
		model.addAttribute("memberListCount", pageCnt);
//		pageCnt 값을 memberListCount 변수에 담아 member/index.jsp의 ${memberListCount} 변수에 출력한다.
		model.addAttribute("menu", "member");
//		member의 값을 menu.jsp에 넣는다.
//		오른쪽 파라미터가 " " 안에 담겨져 있으면 (1.키값)임과 동시에 (2. .jsp페이지 안에 들어있는 키값)을 의미함.
		return "member/index";
	}
}
