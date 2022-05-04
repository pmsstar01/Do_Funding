(function(win, $) {  // 자동 실행 함수 : 브라우저가 표시되면 실행된다.
	var $html = $("html");
	var deviceSize = {  // 반응형 웹으로 동작하기 위한 미디어 쿼리 값을 설정
		pc:1009,
		tablet:768,
		mobile:767
	};

	function scrollShowHide(status) {  // overflow-y의 값을 status로 설정
		$html.css({"overflow-y":status});  // status : hidden, scroll
		return $html.width();    
	}

	var sc_w1 = scrollShowHide("hidden"),
					sc_w2 = scrollShowHide("scroll"),
					sc_w3 = sc_w1 - sc_w2;  // scroll 부분의 길이

	if(sc_w3 > 0) {  // 스크롤 바가 표시되면 그만큼 폭을 감소시킨다.
					deviceSize.pc = deviceSize.pc -  sc_w3;
					deviceSize.tablet = deviceSize.tablet -  sc_w3;
					deviceSize.mobile = deviceSize.mobile -  sc_w3;
	}
	console.log(deviceSize.pc);
	
    // 브라우저의 크기가 변경되면 실행된다.
	$(win).on("resize", function() {  // 브라우저의 크기에 따라 CSS(PC, 태블릿, 모바일)를 적용
		var w_size = $(win).width();
		if(w_size >= deviceSize.pc 
		&& !$("html").hasClass("pc")) {
			$html.removeClass("mobile tablet").addClass("pc");
			scrollShowHide("scroll");
		} else if(w_size < deviceSize.pc 
		&& w_size >= deviceSize.tablet 
		&& !$("html").hasClass("tablet")) {
			$html.removeClass("mobile pc").addClass("tablet");
			scrollShowHide("scroll");
		} else if(w_size <= deviceSize.mobile 
		&& !$html.hasClass("mobile")) {
			$html.removeClass("pc tablet").addClass("mobile");
			var menu_pos = parseInt($(".mobile-menu-wrap").css("left"));
			if(menu_pos >= 0) {
				scrollShowHide("hidden");
			}
		}
	});
	
	$(function(){  // HTML 코드가 로딩되면 실행된다.
		$(win).trigger("resize");

		$(document).on("mouseover focus",  // 1단 메뉴가 선택되면 gnbPlay() 실행된다.
			".pc #gnb>ul>li>a, .tablet #gnb>ul>li>a", 
			gnbPlay);

		$(document).on("click",  // 모바일에서 1단 메뉴가 선택되면 실행된다.
			".mobile #gnb>ul>li:not(.no-sub)>a", 
			gnbPlay);
					
		function gnbPlay() {
			var $ts = $(this);
			if($("html").hasClass("mobile")) {
				$(".mobile #gnb>ul>li>a").removeClass("on");
				$("#gnb ul ul:visible").slideUp(300);
				if($ts.next().is(":hidden")) {
					$ts.addClass("on");
					$ts.next().stop(true, true).slideDown(300);
				}
			} else {  // 태블릿 PC 또는 PC
				$("#gnb ul .secMenu:visible").slideUp(300);  // 기존에 보이던 것을 감춘다.
				$ts.next().stop(true, true).slideDown(300);   // 2단 메뉴를 보여준다.
			}
		} 

		$(document).on("mouseleave",  // 메뉴 영역을 벗어나면 gnbleave() 실행
			".pc #gnb, .tablet #gnb", gnbleave);

        $(document).on("focusout",    // 키보드를 사용했을 때 마지막 메뉴를 벗어나면 gnbleave() 실행
			".pc .secMenu3 li:last-child a, .secMenu3 li:last-child a", gnbleave);

		function gnbleave() {  // 2단 메뉴를 감춘다.
			$ts = $(this);
			$("#gnb ul .secMenu:visible").slideUp(300);
			$("#gnb>ul>li>a").removeClass("on");
		}
		
		$(".mobile-menu-open button").on("click", function() {
			$(".mobile-menu-wrap").animate({"left":0}, 200);
			scrollShowHide("hidden");
		});

		$(".mobile-menu-close button").on("click", function() {
			$(".mobile-menu-wrap").animate({"left":"-1000px"}, 200);
			scrollShowHide("scroll");
			gnbleave();
		});
	});
}(window, jQuery));
