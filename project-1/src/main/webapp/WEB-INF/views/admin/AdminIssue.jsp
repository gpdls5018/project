<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<!-- 예시로 Chart.js 라이브러리를 사용하여 막대 그래프 생성하는 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script><!-- jquery.slim.min에서 slim뺌 -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<!-- Plotly.js -->
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>


<style>

	body {
        background-color: #f5f5f0;
	}

    /* 사이드바 */
    #admin_sidebar {
        width: 290px;
        height: 835px;
        margin: 10px 5px 20px 40px;
        padding: 30px 30px;
        border: 1px solid #ccc;
        background-color: white; 
        
    }
    
    #admin_sidebar h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    #admin_sidebar ul {
        list-style: none;
        padding: 0;
    }

    #admin_sidebar li {
        margin-bottom: 10px;
    }

    #admin_sidebar a {
        display: block;
        padding: 5px 10px;
        text-decoration: none;
        color: #333;
        margin-top: 28px;
        margin-bottom: 28px;
        font-size: 14px;
    }

    #admin_sidebar a:hover {
        background-color: #f0f0f0;
    }
    
    /* 사이드바 이모티콘 */
    i {
	  display: inline-block;
	  width: 27px; /* 원형의 지름 설정 */
	  height: 27px; /* 원형의 지름 설정 */
	  border-radius: 50%; /* 원형으로 만들기 위해 50%로 설정 */
	  background-color: #EF605D; /* 원하는 색상을 지정합니다. */
	  color: white;
	}
    
    /* 컨텐츠 전체 */
    #admin_content {
    	width: 1600px;
    	height: 835px;
        padding: 30px 10px;
        margin: 10px 40px 20px 5px;
        border: 1px solid #ccc;
        background-color: white; 
    }
    
    /* 4분할 */
    .each-container {
    	padding: 10px;
    	margin: 20px 15px;
    	
    }
    
    /* 컨텐츠 내 차트 */
    .chart-container {
    	width: 670px; 
    	height: 300px; 
    	margin: 5px;
    	padding: 20px 30px;
    	border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f7f7f7;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    

    /* 예시 테이블 스타일 */
    table {
        border-collapse: collapse;
        width: 100%;
        font-size: 12px;
        overflow: auto; /* 스크롤이 가능하도록 하기 위해 추가 */
        
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: center;
        padding: 8px;
    }

    th {
        background-color: rgba(75, 192, 192, 0.6);
        height: 40px;
    }

    tr:nth-child(odd) {
        background-color: #f2f2f2;
    }

    tbody tr:hover {
        background-color: #ddd;
    }
    
    /* 테이블 헤더 고정 */
	thead {
	    position: sticky;
	    top: 0;
	    background-color: #EF605D;
	}

	
    /* 버튼 스타일링 */
    .button-wrapper {
        display: flex;
        justify-content: center;
    }

    .button {
        border-radius: 4px;
        background-color: rgba(255, 206, 86, 1);
        border: none;
        color: white;
        text-align: center;
        cursor: pointer;
        margin: 2px;
        font-size: 9px;
    }
    
    .button:hover {
	    background-color: rgb(255,151,0); /* 버튼 호버 시 배경색이 더 진한 색으로 변경 */
    }

    .button span {
        cursor: pointer;
        display: inline-block;
    }
    
    /* 스크롤바 색상, 위치 설정 */
    .table-wrapper {
    }
    
	.table-wrapper::-webkit-scrollbar {
	  width: 10px; /* 스크롤바 너비 조절 */
	}
	
	.table-wrapper::-webkit-scrollbar-thumb {
	  background-color: #ccc; /* 스크롤바 색상 */
	  border-radius: 5px; /* 스크롤바 모서리 둥글게 설정 */
	}
	
	.table-wrapper::-webkit-scrollbar-thumb:hover {
	  background-color: #999; /* 스크롤바 호버시 색상 */
	}

	/* 모달 스타일 */
	.modal {
	    display: none; /* 초기에는 모달을 보이지 않도록 설정합니다. */
	    position: fixed; /* 고정된 위치에 배치하기 위해 position 속성을 fixed로 설정합니다. */
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.4); /* 반투명한 배경을 위해 rgba 색상 사용 */
	}
	
	/* 모달 컨텐츠 스타일 */
	.modal-content {
	    position: absolute;
	    top: 48%;
	    left: 50%;
	    transform: translate(-50%, -50%); /* 가로, 세로 기준 중앙에 배치하기 위해 transform 사용 */
	    background-color: #fefefe;
	    padding: 20px;
	    border-radius: 15px;
	    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	    width: 40%;
	}
	
	/* 모달 창 닫기 버튼 스타일 */
	.close {
	    position: absolute;
	    top: 20px;
	    right: 40px;
	    font-size: 30px;
	    cursor: pointer;
	}
	
	/* input 태그 스타일 */
	.modal input {
	    padding: 8px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    width: 40%;
	    box-sizing: border-box;
	    margin-top: 20px;
	    text-align: center;
	}
	
	/* label 태그 스타일 */
	.modal label {
	    display: inline-block;
	    width: 140px; /* 원하는 너비로 설정해주세요 */
	    font-weight: bold;
	    margin-right: 25px;
	    margin-left: 135px;
	    margin-top: 20px;
	    
	}
	
	/* button 태그 스타일 */
	.modal button {
	    padding: 10px 15px;
	    border: none;
	    background-color: #007bff;
	    color: white;
	    border-radius: 5px;
	    cursor: pointer;
	}
	
	/* 두 번째 버튼(Modal 취소 버튼) 스타일 */
	.modal button:last-child {
	    background-color: #dc3545; /* 취소 버튼 색상을 빨간색으로 설정합니다. */
	}
	 
	
	
	
	
</style>
</head>
<body>

	<div class="d-flex" style="margin-top: 75px;">
		
		<!-- 관리자 사이드바 -->
		<div id="admin_sidebar">
	        <h4 class="text-center" style="padding-bottom: 12px;"><b>관리자 메뉴</b></h4>
	        <ul>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-home" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;관리자 메인
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMember.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-users" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;회원 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminDB.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-table" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;데이터베이스 통계
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminIssue.do"/>" style="display: flex; align-items: center;">
						<i class="fas fa-medkit" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;영양제 분석 통계
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-server" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;머신러닝 모델 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-heartbeat" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;질병예측 결과 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-comment" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;피드백 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-chart-bar" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;서비스 통계 및 분석
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-file-alt" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;시스템 로그 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-shield-alt" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;보안 관리
	        		</a>
	        	</li>
	        	<li>
	        		<a href="<c:url value="/AdminMain.do"/>" style="display: flex; align-items: center;">
	        			<i class="fas fa-cog" style="font-size:16px; color:white; display: flex; align-items: center; justify-content: center;"></i>
	        			&nbsp;&nbsp;서비스 설정 관리
	        		</a>
	        	</li>
	        </ul>
	    </div><!-- 관리자 사이드바 -->
	    
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->	

		<!-- 전체 내용 -->
	    <div id="admin_content" style="display: flex; justify-content:center; flex-wrap: wrap;">
			
			<h4 class="text-center" style="width:95%; padding-bottom: 20px; border-bottom: 1px solid #ccc;"><b>영양제 분석 통계</b></h4>
	    
	    	<!-- 1번 div -->
	        <div class="each-container">
		        <!-- 도표1: 라인 차트 -->
				<div class="chart-container" style="margin-bottom: 50px; height: 650px;">
					<p class="text-center" style="font-size: 16px;"><b>연령대별 건강고민 통계</b></p>
					<div id="myDiv" style="height: 550px; width: 570px; margin-left: 19px;"></div>
				</div>
			</div>
	    	
	        <!-- 2번 div -->
			<div class="each-container">
				<!-- 회원테이블 -->
		        <div class="chart-container table-wrapper" style="height: 650px;">
		        	<p class="text-center" style="font-size: 16px;"><b>분석결과 목록</b></p>
		        	<div class="table-wrapper" style="height: 531px; overflow-y: auto; padding-right: 5px;">
					    <table>
					        <thead>
				                <tr>
				                	<th style="width:40px;">번호</th>
				                    <th style="width:100px;">아이디</th>
				                    <th style="width:65px;">연령대</th>
				                    <th style="width:200px;">선택 건강고민</th>
				                    <th style="width:40px;">점수</th>
				                    <th style="width:75px;">분석일</th>
				                </tr>
				            </thead>
				            <tbody>
						        <c:forEach var="info" items="${analyzeInfo }" varStatus="loop">
							        <tr>
							        	<td>${loop.count}</td>
							            <td>${info.USERID}</td>
							            <td>${info.AGE_RANGE}</td>
							            <td>${info.TAKEPURPOSES}</td>
							            <td>${info.SCORE}</td>
							            <td>${info.ANALYZEDATE}</td>
							        </tr>
						        </c:forEach>
					        </tbody>
					    </table>
			    	</div>
				</div>
			</div>
	    </div><!-- 전체 내용 -->
	    
	</div><!-- 컨테이너 -->
	
    <script>
	    
    	const labels = ["20대 미만", "20대", "30대", "40대", "50대", "60대 이상"];

    	const healthIssues = [
    		  "피로감", "스트레스 & 수면", "노화 & 항산화", "면역 기능", "빈혈", "눈 건강", "갑상선 건강", "호흡기 건강",
    		  "소화 & 위식도 건강", "간 건강", "장 건강", "뼈 건강", "관절 건강", "탈모 & 손톱 건강", "피부 건강",
    		  "두뇌활동", "운동 능력 & 근육량", "혈압", "혈당", "혈관 & 혈액순환", "혈중 중성지방", "혈중 콜레스테롤",
    		  "체지방", "치아 & 잇몸", "남성 건강", "여성 건강", "임산부 & 태아 건강", "여성 갱년기"
    		];
    	
    	// pChart
    	Plotly.d3.csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv', function (err, data) {
		
			var lookup = {};
			function getData(year, continent) {
				var byYear, trace;
				if (!(byYear = lookup[year])) {;
				  	byYear = lookup[year] = {};
				}
				if (!(trace = byYear[continent])) {
	    			trace = byYear[continent] = {
	      				x: [],
					    y: [],
						id: [],
						text: [],
						marker: {size: []}
	   				};
				}
				return trace;
			}
		
			for (var i = 0; i < data.length; i++) {
				var datum = data[i];
				var trace = getData(datum.year, datum.continent);
				trace.text.push(datum.country);
				trace.id.push(datum.country);
				trace.x.push(datum.lifeExp);
				trace.y.push(datum.gdpPercap);
				trace.marker.size.push(datum.pop);
			}

			var years = Object.keys(lookup);
			var firstYear = lookup[years[0]];
			var continents = Object.keys(firstYear);
			
			var traces = [];
			for (i = 0; i < continents.length; i++) {
	  			var data = firstYear[continents[i]];
	  			traces.push({
	    			name: continents[i],
				    x: labels, // 수정된 부분: x축에 labels 변수의 리스트 값을 사용
				    y: healthIssues,
				    id: data.id.slice(),
				    text: data.text.slice(),
				    mode: 'markers',
				    marker: {
				        size: data.marker.size.slice(),
				        sizemode: 'area',
				        sizeref: 200000
	    			}
	  			});
			}

    		var frames = [];
    		for (i = 0; i < years.length; i++) {
      			frames.push({
      				name: years[i],
      				data: continents.map(function (continent) {
        				return getData(years[i], continent);
      				})
    			})
  			}
  
  			var sliderSteps = [];
 			for (i = 0; i < years.length; i++) {
    			sliderSteps.push({
      				method: 'animate',
					label: years[i],
					args: [[years[i]], {
        				mode: 'immediate',
				        transition: {duration: 300},
				        frame: {duration: 300, redraw: false},
      				}]
    			});
  			}
  
			var layout = {
			    hovermode: 'closest',
			    updatemenus: [{
					x: 0,
					y: 0,
					yanchor: 'top',
					xanchor: 'left',
					showactive: false,
					direction: 'left',
					type: 'buttons',
					pad: {t: 87, r: 10},
					buttons: [{
				        method: 'animate',
				        args: [null, {
							mode: 'immediate',
							fromcurrent: true,
							transition: {duration: 300},
							frame: {duration: 500, redraw: false}
				        }],
				        label: '시작'
      				}, {
				        method: 'animate',
				        args: [[null], {
							mode: 'immediate',
							transition: {duration: 0},
							frame: {duration: 0, redraw: false}
				        }],
				        label: '정지'
      				}]
			}],
    		sliders: [{
				pad: {l: 130, t: 55},
				currentvalue: {
			        visible: true,
			        prefix: '분석일:',
			        xanchor: 'right',
			        font: {size: 20, color: '#666'}
				},
				steps: sliderSteps
    		}]
  		};
			
  		Plotly.plot('myDiv', {
		    data: traces,
		    layout: layout,
		    config: {showSendToCloud:true},
		    frames: frames,
  		});
	});
    	
    	
    	
    	
    	
    	
  	
  	
  	
  	
  	
  	
  	
  	
    	
    	
    	
    	
    	
    	
    	
    	
        
        
    </script>
</body>
</html>