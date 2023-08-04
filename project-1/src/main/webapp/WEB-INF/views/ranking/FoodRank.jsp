<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<jsp:include page="/WEB-INF/views/template/SelectFoodListStyleScript.jsp"/>

<script src="https://kit.fontawesome.com/0b4621b427.js" crossorigin="anonymous"></script>
     <style>
body{
	background-color: white;
}
#contentInfoCon {
    position: relative;
    height: 383px;
    display: flex;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
#contentInfoCon .content-sub-tit {
    font-size: 16px;
    color: #222;
    overflow: hidden;
}
#contentInfoCon .content-tit {
    color: #222;
    font-size: 45px;
    font-weight: 700;
    line-height: 1.36;
    letter-spacing: -0.02em;
    margin-top: 37px;
}
.visual-img-con {
	position:absolute;
	width:100%;
	height:100%;
    background: url("https://www.hectohealthcare.com/resources/images/layout/sub_visual_company.jpg") no-repeat;
    background-color: #fff;
    z-index: 1;
    top:70px;
	border:none;
}
.tsarea {
	position: absolute;
	width: 1000px;
	height: 250px;
	top:170px;
	left:50px;
	border:none;
	z-index: 2;
	text-align: center;
	box-shadow: 0px 0px 0px white;
	align-items: center;
}

.loading{      
  display: inline-flex;    
  width:150px;
  justify-content:center;
  align-items: center;
}
.item{
  width:20px;
  height:20px;
  background-color: rgb(247, 40, 4);
  border-radius: 50%;
  animation: loading 2s infinite;
}
@keyframes loading {
    50%{
        transform: scale(0.5);
        background-color: rgb(203, 138, 127);
    }
    100%{
        transform: scale(1);
        background-color: rgb(247, 40, 4);
    }
}
.item:nth-child(2){
    animation-delay: 0.2s;
}
.item:nth-child(3){
    animation-delay: 0.4s;
}
.item:nth-child(4){
    animation-delay: 0.6s;
}
.item:nth-child(5){
    animation-delay: 0.8s;
}
.item:nth-child(6){
    animation-delay: 1s;
}
#startBtn, #startTtsBtn, #stopTtsBtn{
     background-color: transparent; 
     border: none; 
     cursor: pointer; 
     transition-property: outline-offset, outline-color, background-color; /* 트랜지션 설정 */
     transition-duration: .3s; /* 애니메이션 .3s 만큼 진행 */
 }

 #startBtn:hover, #startTtsBtn:hover, #stopTtsBtn:hover{
     outline-offset: 4px; /* 마우스 오버시 테두리 외곽 4px 이동 */
 }
 #startBtn:hover img, #startTtsBtn:hover img, #stopTtsBtn:hover img{
     animation: shake .3s; /* 마우스 오버시 아이콘 .3s 동안 흔듦 */
     margin-left: 10px;
 }
 #startBtn:hover, #startTtsBtn:hover,  #stopTtsBtn:hover  { /* 블로그 아이콘 마우스 오버시 배경색, 테두리 색상 변경 */
     background-color: #FFECE5;
     outline-color: red;
     padding: 10px;
 }
 @keyframes shake { /* @keyframes를 이용해 shake의 각도를 좌우 15deg로 조정 */
     10%{transform: rotate(10deg);}
     20%{transform: rotate(-10deg);}
     30%{transform: rotate(10deg);}
     40%{transform: rotate(-10deg);}
 }
     </style>

	<!-- 상단배너 div -->
	<aside id="contentInfoCon" class="area animated">
        <!-- 각각 대메뉴 마다 이미지 다르게 들어갑니다. -->
                <!-- 브랜드 스토리 -->
                <div class="visual-img-con animatedleft"></div>	

        <div class="tsarea">
            <h3 class="content-tit" style="text-align:left; margin-left: 150px;">
                <span><span style="color:#EF605D;">MEDI-Q</span> 영양제 인기순위</span>
                <p style="font-weight: 500; font-size: 23px; margin-top: 20px; color:gray">실제 섭취하는 유저들의 리뷰와 피드백으로 만든<br/> 가장 믿을만한 영양제 랭킹을 만나보세요</p>
            </h3>
        </div>
    </aside>
    
<div class="all-wrap">
	<div class="all-wrap-in all-wrap-in-070">
		<div class="ingredient-search-top">
			<div class="content" style="background-color:#fdfbf6; padding-bottom: 20px;">
			<!-- 건기식 또는 회사이름을 적었을 경우 -->
			<c:if test="${not empty foodname}">
				<div class="top-wrap-070">
					<h1 class="txt2 text-center" style="margin-bottom: 30px; font-size: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;<span>💡 ${foodname}</span>에 대한 <br class="u680">제품 검색 결과 <span>${listData.size() + listData2.size()}</span>건</h1>
				</div>
				<div class="ipt-main-wrap">
				<c:if test="${casesel == 1 }">
					<form action="/functionfood/select.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct1" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct1()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/select.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 2}">
					<form action="/functionfood/selectnutrient.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct2" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct2()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectnutrient.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 3}">
					<form action="/functionfood/selectcompany.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct3" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
				<div class="search-etc">
					<span class="s-txt1">인기 검색어</span>
					<div class="search-keywords">
						<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<a tabindex="0" class="search-keyword" href="/functionfood/selectcompany.do?foodname=${Keyword }">${Keyword }</a>
						</c:forEach>
					</div>
				</div>
				</c:if>
				
			</div>
		</div>
		<div class="new-wide-wrap new-wide-wrap-070">
			<div class="left-wing  ">
			    <ul class="sm-menu-wrap">
			        
			    </ul>
			</div>
			<div class="new-wide-main new-wide-main-070 product-result">
				<div id="itemList" class="item-cards">
					<c:forEach items="${listData}" var="item">
						<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
						<c:if test="${not empty item.imgURL}">
							<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
						</c:if>
          				<c:if test="${empty item.imgURL}">	
							<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
						</c:if>
							<span class="txt1">${item.company}</span>
							<span class="txt2">${item.productName}</span>
							<div class="review">
								<span class="star-point">&nbsp;<fmt:formatNumber value="${item.AVG_Score }" pattern=".00"  var="AVG"/>${AVG }</span>
								<span class="txt3">(${item.REVIEW_Count }개)</span>
							</div>
							<div class="card-tags">
							<c:set var="materialList" value="${fn:split(item.material, '$')}" />
								<c:forEach items="${materialList}" var="mater">
									<div class="card-tag">${mater }</div>
								</c:forEach>
							</div>
						</a>
					</c:forEach>
					
					<c:forEach items="${listData2}" var="item">
					<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
					<c:if test="${not empty item.imgURL}">
						<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
					</c:if>
         			<c:if test="${empty item.imgURL}">	
						<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
					</c:if>
						<span class="txt1">${item.company}</span>
						<span class="txt2">${item.productName}</span>
						<div class="review">
							<span class="star-point">&nbsp;0</span>
							<span class="txt3">(0개)</span>
						</div>
						<div class="card-tags">
						<c:set var="materialList" value="${fn:split(item.material, '$')}" />
							<c:forEach items="${materialList}" var="mater">
								<div class="card-tag">${mater }</div>
							</c:forEach>
						</div>
					</a>
				</c:forEach>
				</div><!-- item-cards의 끝 -->
			</c:if>
<!-- 여기서 ttt테스트 시작 -->
<!-- 				
				<div class="container">
			        <h3 class="text-dark">텍스트 챗봇<small class="text-secondary">ChatGPT API</small></h3>          
			        <div class="form-group mt-1">                    
			            <label for="chat-gpt">여기에 응답이 표시됩니다</label>  
			            <textarea placeholder="여기에 응답이 표시됩니다" class="form-control mb-1" rows="4" id="chat-gpt"></textarea>
			        </div>    
			            
			        <div class="form-group "> 
			            <label for="result">질의어를 입력하세요</label>  
			            <input type="text" class="form-control" id="result" placeholder="질의어를 입력하세요">
			        </div>
			    </div> -->
				<!-- 로딩 모달 -->
<!-- 			    <div id="loadingModal" class="modal fade" tabindex="-1" role="dialog" >
			        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
			                <div class="modal-content">
			                    <div class="modal-body text-center">
			                        <div class="loading">
			                            <div class="font-weight-bolder text-black-50 mx-2">
			                            LOADING
			                            </div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                            <div class="item"></div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
<!-- 테스트 끝 -->
<!-- stt시작 -->
			<div class="container">
		        <h3 class="text-dark">Q-Bot</h3>          
		            <!-- stt를 지원하는지 안하는지 input태그 -->
	                <div class="form-group "> 
	                    <label for="result"><i class='fas fa-microphone' style='font-size:24px;color:red'></i> <span id="stt-msg"></span></label>  
	                    <input type="text" class="form-control my-2" id="result" placeholder="아래 버튼 클릭후 말씀해 주세요">
	                </div>
	                
	                <!-- 음성으로 텍스트 출력 -->
	                <button id="startBtn"> <img src="<c:url value='/images/chatbot/mike.png'/>" style="width: 45px;height: 42px; border-radius: 35%;"></button>   
	                
	                <!-- 답변 출력부분  -->
	                <div class="form-group mt-1">
	                    <br/>
	                    <label for="chat-gpt"><i class='fas fa-microphone-alt' style='font-size:24px;color:red'></i> <span id="tts-msg"></span></label>  
	                    <textarea placeholder="여기에 응답이 표시됩니다" class="form-control mb-1" rows="4" id="chat-gpt"></textarea>
	                </div>
	                
	                <!-- 음성 선택버튼 부분 -->
	                <div class="form-group">
	                    <label for="voice">음성을 선택하세요</label>
	                    <select class="form-control" id="voice">                   
	                    </select>
	                </div>
	                
	                <!-- 텍스트를 음성으로 시작,중단 버튼 -->
                 	<button id="startTtsBtn"><img src="<c:url value='/images/chatbot/mikeON.png'/>" style="width: 45px;height: 42px; border-radius: 35%;"></button>
           			<button id="stopTtsBtn" ><img src="<c:url value='/images/chatbot/mikeStop.png'/>" style="width: 45px;height: 42px; border-radius: 35%;"></button>    
             
		    </div>
			<!-- 로딩 모달 -->
		    <div id="loadingModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="loadingModalLabel" aria-hidden="true">
		        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
			        <div class="modal-content">
			            <div class="modal-body text-center">
			                <div class="loading">
			                    <div class="font-weight-bolder text-black-50 mx-2">
			                    LOADING
			                    </div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                    <div class="item"></div>
			                </div>
			            </div>
			        </div>
		        </div>
		    </div>
<!-- stt끝 -->		
				<!-- 화면을 처음들어 갔을 경우 건기식 또는 회사이름을 안적었을 경우 -->
				<c:if test="${empty foodname}">
				<c:if test="${casesel == 1 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b>💊 현재 인기있는 <span> 건강기능식품</span></b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/select.do">
						<!-- 
<!-- 임시마이크버튼          <button id="startBtn" class="btn-lg btn-dark"><i class='fas fa-microphone' id='icon' style="color:red"></i></button>
	  					<div class="form-group mt-1">
		                   <label for="chat-gpt"><i class='fas fa-microphone-alt' style='font-size:24px;color:red'></i> <span id="tts-msg"></span></label>  
		                   <textarea placeholder="여기에 응답이 표시됩니다" class="form-control mb-1" rows="4" id="chat-gpt"></textarea>
             		    </div>
<!-- 여기까지-->
						<div class="ipt-main-wrap-in">
							<input id="searchProduct1" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct1()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/select.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 2 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b>💊 현재 인기있는 <span> 영양소</span>로 검색해 보세요</b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/selectnutrient.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct2" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct2()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectnutrient.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test="${casesel == 3 }">
					<div class="top-wrap-070">
						<h1 class="txt2" style="margin-bottom: 30px; text-align: center; font-size: 30px;"><b><span> 제품명</span>과<span> 회사명</span>으로 검색해 보세요</b></h1>
					</div>
					<div class="ipt-main-wrap">
					<form action="/functionfood/selectcompany.do">
						<div class="ipt-main-wrap-in">
							<input id="searchProduct3" type="text" name="foodname" class="ipt-main" autocomplete="off" title="제품명, 브랜드명 검색" value="${foodname}" required minlength="1" placeholder="찾으시는 제품을 검색해보세요!">
							<button tabindex="0" title="검색" class="btn-search" onclick="searchProduct3()"></button>
						</div>
					</form>
					</div><!-- ipt-main-wrap : 끝 -->
					<div class="search-etc">
						<span class="s-txt1">인기 검색어</span>
						<div class="search-keywords">
							<c:forEach items="${RankingKeyWord }" var="Keyword" varStatus="status">
								<c:if test="${status.index < 5}">
									<a tabindex="0" class="search-keyword" href="/functionfood/selectcompany.do?foodname=${Keyword }">${Keyword }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<div class="new-wide-wrap new-wide-wrap-070">
			<div class="left-wing  ">
			    <ul class="sm-menu-wrap">
			        
			    </ul>
			</div>
			<div class="new-wide-main new-wide-main-070 product-result">
				<div id="itemList" class="item-cards">
					<c:forEach items="${listData}" var="item">
						<a id="${item.no}" href="/detail.do?no=${item.no}" tabindex="0" class="item-card" title="${item.productName} 자세히 보기" data-href="/products/1/비타민C-1000" data-product-id="1">
						<c:if test="${not empty item.imgURL}">
							<img src="${item.imgURL }" class="item-img" alt="${item.productName}">
						</c:if>
          				<c:if test="${empty item.imgURL}">	
							<img src="<c:url value="/images/thumbnail_img/No_IMG.jpeg"/>" class="item-img" alt="${item.productName}">
						</c:if>
							<span class="txt1">${item.company}</span>
							<span class="txt2">${item.productName}</span>
							<div class="review">
								<span class="star-point">&nbsp;<fmt:formatNumber value="${item.AVG_Score }" pattern=".00"  var="AVG"/>${AVG }</span>
								<span class="txt3">(${item.REVIEW_Count }개)</span>
							</div>
							<div class="card-tags">
								<c:set var="materialList" value="${fn:split(item.material, '$')}" />
								<c:forEach items="${materialList}" var="mater">
									<div class="card-tag">${mater }</div>
								</c:forEach>
							</div>
						</a>
					</c:forEach>
				</div><!-- item-cards의 끝 -->
				
				</c:if>
				<!--<button id="moreBtn" tabindex="0" class="item-more" onclick="searchMore()">30개 더 보기</button>  -->
			</div>
		</div>
	</div>
	<a id="goto_top" href="#" title="맨 위로"></a><!-- 위로가기 -->
</div><!-- all-wrap의 끝 -->
<script>
        if ($(this).scrollTop() > 20) {
            $('#goto_top').fadeIn();
            $('.f-footer-row1').addClass('active');
            $('.h-header').addClass('scroll');
            $('.all-wrap-in').addClass('scroll');
        } else {
            $('#goto_top').fadeOut();
            $('.h-header').removeClass('scroll');
            $('.all-wrap-in').removeClass('scroll');
        }

        /*화면 스크롤에 따른 조건부 노출 : 최하단 고정 행, 위로가기 버튼 */
        $(window).scroll(function() {
            if ($(this).scrollTop() > 20) {
                $('#goto_top').fadeIn();
                $('.f-footer-row1').addClass('active');
                $('.h-header').addClass('scroll');
                $('.all-wrap-in').addClass('scroll');
            } else {
                $('#goto_top').fadeOut();
                $('.h-header').removeClass('scroll');
                $('.all-wrap-in').removeClass('scroll');
            }

            /*우측 플로팅 영역관련*/
            var height1 = $(window).scrollTop();
            /*var rfixed = $('.r-fixed-area');
            var section1 = rfixed.offset().top;*/

            if(height1 > 200){
                $('.height1.active').addClass('fixed');
            }else{
                $('.height1.active').removeClass('fixed');
            }

            if(height1 > 6){
                $('.height2.active').addClass('fixed');
            }else{
                $('.height2.active').removeClass('fixed');
            }
        });

        $('#goto_top').click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
        /*ttt*/
        /*
        $(document).ready(function(){
            var chatgpt = document.querySelector('#chat-gpt');
            var modal = document.querySelector('#loadingModal');

            // AJAX를 사용하여 API 키 가져오기
            $.get("/config/apiKey", function(data) {
                // data is the apiKey
                var apiKey = data;
                console.log('API Key:', apiKey);
             	// API 키를 가져온 후에 이벤트 리스너를 설정합니다.
                document.querySelector('#result').onkeypress=function(e){
                    if(e.keyCode === 13){
                    	console.log('api는 들어와?:',apiKey);
                        console.log(e.target.value);
                        $('#loadingModal').modal('show');
                        sendToChatGPT(e.target.value);
                    }
                };
                function sendToChatGPT(content){
                    console.log('chatGPT에 전송한 content:',content);
                    console.log('apikey체크:',apiKey);//키값 맞음
                    fetch('https://api.openai.com/v1/chat/completions', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Authorization': 'Bearer ' + apiKey
                        },
                        body: JSON.stringify({
                            model: 'gpt-3.5-turbo',
                            messages: [{ role: 'user', content: content }],
                            temperature: 0
                        })
                    })
                    .then(response => {
                        if (!response.ok) {
                            return response.text().then(text => Promise.reject(text));
                        }
                        return response.json();
                    })
                    .then(data => {
                        // Handle the response data
                        console.log('Response:', data); // Add this line
                        console.log(data["choices"][0]["message"]["content"]);
                        //ChatGPT 응답결과 텍스트 에리어에 뿌려주기
                        chatgpt.value=data["choices"][0]["message"]["content"];
                        //ChatGPT응답받기 완료
                        $('#loadingModal').modal('hide');
                    })
                    .catch(error => {
                        // Handle any errors
                        console.error(error);
                    });
                }

                
            });
        });
		*/
        /*stt,tts시작  */
        $(document).ready(function () {
        	
		    var startBtn = document.querySelector('#startBtn');//마이크 버튼 태그
		    var startTtsBtn = document.querySelector('#startTtsBtn');//tts 마이크버튼 태그
		    var stopTtsBtn = document.querySelector('#stopTtsBtn');//tts 멈추는 버튼 태그
		
		    var sttMsg = document.querySelector('#stt-msg');//당신의 브라우저는 stt를 지원합니다 한줄나오는 태그
		    var ttsMsg = document.querySelector('#tts-msg');//당신의 브라우저는 tts를 지원합니다 한줄나오는 태그
		    var result = document.querySelector('#result');
		    var chatGpt = document.querySelector('#chat-gpt');//출력되는 곳
		    var voiceSelect = document.querySelector('#voice');
		
		    var isRecognizing = false;
		    var recognition;
		
		    $.get("/config/apiKey", function (data) {
		    	
		        var apiKey = data;
		        
		        if (!('webkitSpeechRecognition' in window)) {
		            sttMsg.innerHTML = '당신의 브라우저는 <strong>STT</strong>를 지원하지 않습니다.';
		            startBtn.disabled = true;
		            result.placeholder = '음성인식이 안되는 브라우저입니다.아래 버튼이 비활성화 되었습니다'
		        } else {
		            sttMsg.innerHTML = '당신의 브라우저는 <strong>STT</strong>를 지원합니다.';
		            startBtn.addEventListener('click', startRecognition);//음성인식 시작 음성초기화
		            initRecognition();//음성인식 설정 및 인식결과를 넣어줌
		        }//////else
		
		        if ('speechSynthesis' in window) {
		            ttsMsg.innerHTML = '당신의 브라우저는 <strong>TTS</strong>를 지원합니다.';
		            loadVoices();
		            window.speechSynthesis.onvoiceschanged = function (e) {
		                loadVoices();
		            };
		            startTtsBtn.addEventListener('click', startSynthesis);
		            stopTtsBtn.addEventListener('click', stopSynthesis);
		        } else {
		            ttsMsg.innerHTML = '당신의 브라우저는 <strong>TTS</strong>를 지원하지 않습니다.<br/><a href="http://www.google.co.uk/intl/en/chrome/browser/canary.html">다운로드</a>.';
		        }///////else
		        	
		        
		        function sendToChatGPT(content) {
		            fetch('https://api.openai.com/v1/chat/completions', {
		                method: 'POST',
		                headers: {
		                    'Content-Type': 'application/json',
		                    'Authorization': 'Bearer ' + apiKey
		                },
		                body: JSON.stringify({
		                    model: 'gpt-3.5-turbo',
		                    messages: [{ role: 'user', content: content }],
		                    temperature: 0
		                })
		            })
		                .then(response => {
		                    if (!response.ok) return response.text().then(text => Promise.reject(text));
		                    return response.json();
		                })
		                .then(data => chatGpt.value = data["choices"][0]["message"]["content"])
		                .catch(error => console.error(error));
		        }///////////sendToChatGPT(content)
		        
		        function initRecognition() {//음성 인식을 초기화 및 인식결과를 넣어줌
		        	//recognition: 여러 브라우저에서 작동하도록 설정
		            recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition || window.mozSpeechRecognition || window.msSpeechRecognition)();
		            recognition.lang = 'ko-KR';
		            recognition.maxAlternatives = 30000;//음성에 대한 결과의 최대 수 설정
		            recognition.interimResults = true;//출력되는 중간결과를 반환
		            recognition.onspeechstart = () => console.log('Recognition Start!');//인식 start
		            recognition.onspeechend = stopRecognition;//stopRecognition을 이벤트 핸들러로 등록
		            recognition.onresult = function (event) {//음성인식 결과 도착시 onresult이벤트 핸들러 설정
		            	//인식 결과(event.results)를 배열로 변환,각 결과의 첫번째 대안(results[0].transcript)을 추출한 후,합침(.join("")이게 배열의 모든 요소를 연결하여 문자열을 만듬,즉 하나의 문자열로 변환됨)
		                var transcript = Array.from(event.results).map(results => results[0].transcript).join("");
		                result.value = transcript;//합쳐진 텍스트(transcript)를 result.value에 저장
		                //새롭게 추가된 결과들만을 처리하는 for문
		                for (let i = event.resultIndex; i < event.results.length; ++i) {
		                	//event.results[i].isFinal는 최종적으로 인식된 텍스트를 뜻함.따라서 합쳐진 텍스트(transcript)를 GPT로 보냄
		                    if (event.results[i].isFinal) sendToChatGPT(transcript);//sendToChatGPT땜에 들어가야됨 자스는 동기
		                }
		            };
		            recognition.onerror = function (event) {
		                console.error('음성 인식 오류가 발생했습니다: ' + event.error);
		            };
		        }////////initRecognition()
		        
		        
		    });/////$.get("/config/apiKey", function (data)
		
		    function startRecognition() {
		    	console.log('음성인식 중1')
		        startBtn.innerHTML = "음성인식 중입니다. <i class='fas fa-microphone' style='color:red'></i>";
		        result.value = '';
		        recognition.start();
		        isRecognizing = true;
		    }//////startRecognition()
		
		    function stopRecognition() {
		    	console.log("음성인식 멈춤")
		        startBtn.innerHTML = "SpeechToText Start <i class='fas fa-microphone' style='color:red'></i>"
		        recognition.stop();
		        isRecognizing = false;
		    }//////stopRecognition()
		
		    
		    function startSynthesis() {//text를 음성으로(음성으로 합성하고 출력하는 함수)
		    	
		    	//chatGPT가 보여주는 텍스트를 utterance에 저장
		        var utterance = new SpeechSynthesisUtterance(chatGpt.value);
		        
		        if (voiceSelect.value) {//국어언어가 선택된다면
		            var selectedVoice = speechSynthesis.getVoices().filter(function (voice) {//텍스트를 선택한 음성으로 변환
		                return voice.voiceURI == voiceSelect.value;//선택한 국가언어가 voiceURI로 저장됨
		            })[0];
		            utterance.voiceURI = selectedVoice.voiceURI;//선택된 국가언어는
		            utterance.lang = selectedVoice.lang;//음성으로 합성하고 출력함
		        }
		        window.speechSynthesis.speak(utterance);////////
		    }/////startSynthesis()
			
		    function stopSynthesis() {//text를 음성으로(출력하고 있는 걸 멈춤)
		        if (window.speechSynthesis.speaking) window.speechSynthesis.cancel();
		    }////stopSynthesis()
		
		    function loadVoices() {//다양한 언어를 선택하는 함수
		        var voices = window.speechSynthesis.getVoices();//현재 브라우저에서 사용 가능한 음성 목록을 반환
		        voices.forEach(function (voice, i) {
		            var option = document.createElement('option');//각 나라 언어 선택 태그
		            option.value = voice.voiceURI;
		            option.dataset.lang = voice.lang;
		            option.innerHTML = voice.name;
		            voiceSelect.appendChild(option);
		        });
		    }//////loadVoices()
		    
		    
		
		});/////////$(document).ready(function ()

</script>
</body>
</html>