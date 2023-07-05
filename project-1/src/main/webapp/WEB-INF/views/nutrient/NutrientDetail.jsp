<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<style>
        .container {
            margin-top: 80px;
        }
        
        .nav {
            display: flex;
            justify-content: space-between; 
            list-style: none;
        }
        
        .nav-item {
            padding-left: 2px;
            padding-right: 2px;
        }
        
        .nav-link {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 10px;
            flex-grow: 1;
            text-align: center;
        }
        
        .nav-link:hover {
            color: inherit;
            background-color: inherit;
        }
        
        .nav-link:hover::before {
            color: inherit;
            background-color: inherit;
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #f04d24;
            
        }
       
        .nav-link.active::before {
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #f04d24;
        }
    
        .tab {
            display: none;
            padding: 20px;
            border: 1px solid #ddd;
            border-top: none;
        }
        
        .tab.active {
            display: block;
        }

        .box-container {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .box {
            width: 110px;
            height: 110px;
            background-color: #eee;
            transition: background-color 0.3s;
            border: 1px solid #ddd;
            border-radius: 10px 10px 10px 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 10px;
            margin-bottom: 10px;
            cursor: pointer;
            position: relative;
        }

        .box a {
            color: black;
            text-decoration: none;
        }

        .box:hover {
            background-color: #ddd;
            font-weight: bold;
        }

        .box.active {
            background-color: #bbb;
        }

        h2, p {
            text-align: center;
        }
        
        /*성민이 테이블*/
        table.type09 {
            border-collapse: collapse;
            text-align: left;
            line-height: 1.5;

        }
        table.type09 thead th {
            padding: 10px;
            vertical-align: top;
            border-bottom: 3px solid rgb(253, 186, 41);
        }
        table.type09 tbody th {
            width: 150px;
            padding: 10px;
            font-weight: bold;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
            background: #f3f6f7;
        }
        table.type09 td {
            width: 850px;
            padding: 30px;
            vertical-align: top;
            border-bottom: 1px solid #ccc;
        }
        .tab-content {
            height : 800px;
        }
        .content-link {
            width: 40%;
            background-color : #9fcaff;
            border-radius : 5%;
        }
        
        .bi-star-fill{
            font-size: 30px;
            line-height: 30px;
            color: #fff236;;
        }
        .bi-star {
            font-size: 30px;
            line-height: 30px;
        }
        .bi-star,.bi-star-fill:hover {
            font-size: 35px;      
        }

        th {
            text-align: center;
        }

        
        /*프로그레스 바*/
        .progress {
            margin-top: 5px;
            width: 100%;
            height: 30px;
            background-color: #f2f2f2;
            position: relative;
            overflow: hidden;
        }

        .progress-bar-inner {
            position: absolute;
            top: 0;
            left: 0;
            width: 0%;
            height: 100%;
            background-color: rgb(253, 186, 41);
            animation: fillProgress 1.5s linear forwards;
        }
        .progress-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: black;
            font-weight: bold;
        }

        @keyframes fillProgress {
            0% {
                width: 0%;
            }
            100% {
                width: 50%; /* 성분에 따라 맞춰야함 */
            }
        }


    </style>
</head>
<body>
    <div class="container" style="margin-top: 80px;">
        <div>
            <ul class="nav">
                <li class="nav-item col-3">
                    <a class="nav-link active" href="Nutrient.html" onclick="openTab(event, 'popular')">인기 영양소</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'vitamin')">비타민</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'mineral')">미네랄</a>
                </li>
                <li class="nav-item col-3">
                    <a class="nav-link" href="#" onclick="openTab(event, 'functional')">기능성 원료</a>
                </li>
            </ul>
        </div>
        <div class="pt-2">
            <div id="popular" class="tab active border-0">
                <!-- 비타민에 해당하는 상자 내용 -->
                <h2>비타민 A</h2>
                <div class="row no-gutters">
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="detailTable">
                            <div>
                                <table class="type09">
                                    <thead>
                                        <tr>
                                            <th scope="cols"></th>
                                            <th scope="cols"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row" style="vertical-align: middle;">관련 건강고민</th>
                                            <td>노화 & 항산화, 눈 건강, 간 건강, 장 건강, 탈모 & 손톱 건강, 피부 건강</td>
                                        </tr>
                                    
                                        <tr>
                                            <th scope="row" style="vertical-align: middle;">상세설명</th>
                                            <td>· 세포의 성장과 재생에 꼭 필요한 영양소에요.<br/>
                                                · 피부와 점막을 건강하게 유지하는데 중요해요.<br/>
                                                · 눈에서 빛을 흡수하는 세포를 만드는데 필요해요.</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" style="vertical-align: middle;">섭취량</th>
                                            <td>
                                                남성 권장/상한 섭취량<br/>
                                                <div class="progress w-75 progress-bar text-danger mt-3" > 
                                                    <div class="progress-bar-inner"></div>
                                                    <div class="progress-text"></div>
                                                </div>


                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <th scope="row" style="vertical-align: middle;">결핍시 증상</th>
                                            <td>야맹증, 성장장애, 피부건조증 등</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" style="vertical-align: middle;">주의사항</th>
                                            <td>· 장기간 고용량 복용시 흡연자 폐암 위험이 증가할 수 있음<br/>
                                                · 임신 중 과다 복용시 기형 발생 위험 있음<br/>
                                                · 고용량 섭취하면 간 기능에 영향을 줄 수 있으므로 전문가와 상담 필요</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" style="vertical-align: middle;">섭취 음식</th>
                                            <td>토마토, 당근, 호박 등에서 섭취할 수 있음</td>
                                        </tr>
                                        <tr>
                                            <th scope="row" style="vertical-align: middle;">추천 영양제</th>
                                            <td>
                                                <div>영양제1, 영양제2, 영양제3</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <script>

        function fade(element) {
        var op = 0;  // 초기 투명도
        var timer = setInterval(function () {
            if (op >= 1) {
            clearInterval(timer);  // 애니메이션 종료
            }
            element.style.opacity = op;  // 투명도 설정
            element.style.filter = 'alpha(opacity=' + op * 100 + ')';  // IE8 이하 대응
            op += 0.1;  // 투명도 증가량
        }, 50);  // 간격(ms)
        }

        function fadeInTab(tabElement) {
        tabElement.style.display = "block";  // 탭 컨텐츠 보이기
        fade(tabElement);  // 페이드인 효과 적용
        }

        function openTab(evt, tabName) {
        var i, tabContent, tabLinks;

        tabContent = document.getElementsByClassName("tab");
        for (i = 0; i < tabContent.length; i++) {
            tabContent[i].style.display = "none";  // 모든 탭 컨텐츠 숨기기
        }

        tabLinks = document.getElementsByClassName("nav-link");
        for (i = 0; i < tabLinks.length; i++) {
            tabLinks[i].classList.remove("active");  // 모든 탭 링크에서 'active' 클래스 제거
        }

        var currentTab = document.getElementById(tabName);
        // Remove immediate display and directly apply fade-in effect
        currentTab.style.opacity = 0;
        currentTab.style.filter = 'alpha(opacity=0)';
        currentTab.style.border = 0;
        fadeInTab(currentTab);  // 선택한 탭 컨텐츠를 페이드인으로 보이게 함

        evt.currentTarget.classList.add("active");  // 선택한 탭 링크에 'active' 클래스 추가
        }
        
        // 진행바
        
        const progressElement = document.querySelector('.progress-bar-inner');
        const textElement = document.querySelector('.progress-text');

        const animationDuration = 1500; // 애니메이션 지속 시간 (밀리초)
        const targetValue = 50; // 목표 값 (%)
        const updateInterval = 20; // 업데이트 간격 (밀리초)

        let progressValue = 0;
        let currentValue = 0;

        const increment = targetValue / (animationDuration / updateInterval);

        function updateProgress() {
            progressValue += increment;
            currentValue = Math.min(Math.round(progressValue), targetValue);
            
            progressElement.style.width = `${currentValue}%`;
            textElement.textContent = `${currentValue}%`;

            if (currentValue >= targetValue) {
                clearInterval(progressInterval);
            }
        }

        const progressInterval = setInterval(updateProgress, updateInterval);

    </script>
</body>
</html>

</body>
</html>