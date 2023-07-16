<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />
<style>
   	.effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .hr-class {
    	border : solid 3px #ccc;
    }
</style>
<body>
	<div class="container mt-5 effect-custom-font">
		<div class="jumbotron" style="margin-top:100px;font-size:30px;">
			<kbd>${userId}</kbd>님의 건강정보
		</div> 
		<div class="hr-class mt-5"></div>
		<div class="load-way d-flex justify-content-around mt-5">
			<div id="LoadhealthInfoByOCRBtn"><input type="file" name="files" class="btn btn-info"/></div>
			<div class="btn btn-warning">건강검진 API로 불러오기</div>
		</div>
		<div class="hr-class mt-5 mb-5"></div>
		<div>&#x1F601; 올바르게 불러왔는지 값을 확인한 후 저장을 눌러주세요!</div>
		<div class="health-info-table effect-custom-font row">
			<table class="table table-bordered col-8">
				<form action="<c:url value="/saveHealthData.do"/>" method="POST" onsubmit="preventSubmit(event)" id="sendHealthData">
					<input type="hidden" name="userId" value="${userId}"/>
			        <colgroup>
			            <col width=10%>
			            <col width=20%>
			            <col width=40%>
			        </colgroup>
			        <tr class="table-primary">
			            <th>목표 질환</th>
			            <th>검사항목</th>
			            <th>결과</th>
			        </tr>
			        <tr>
			            <th rowspan="4">비만</th>
			            <td>신장</td>
			            <td><input class="inputValue" type="text" value="0" name="height">cm</td>
			     
			        </tr>
			        <tr>
			            <td>체중</td>
			            <td><input class="inputValue" type="text" value="0" name="weight">kg</td>
			     
			        </tr>
			        <tr>
			            <td>허리둘레</td>
			            <td><input class="inputValue" type="text" value="0" name="waistline">cm</td>
			         
			        </tr>
			        <tr>
			            <td>체질량지수</td>
			            <td><input class="inputValue" type="text" value="0" name="bmi">kg/m2</td>
			        </tr>
			        <tr>
			    		<th>시각 이상</th>
			            <td>시력(좌/우)</td>
			            <td><input class="inputValue" type="text" value="0" name="vision"></td>
			        </tr>
			        <tr>
			    		<th>청각 이상</th>
			            <td>청력(좌/우)</td>
			            <td><input class="inputValue" type="text" value="0" name="listen"></td>
			        </tr>
	      		    <tr>
			    		<th>고혈압</th>
			            <td>혈압(최고/최저)</td>
			            <td><input class="inputValue" type="text" value="0" name="bloodPressure_high"> / <input class="inputValue" type="text" value="0" name="bloodPressure_low">mmHg</td>
			        </tr>
	           		<tr>
			    		<th>신장질환</th>
			            <td>요단백</td>
			            <td><input class="inputValue" type="text" value="0" name="proteinuria"></td>
			        </tr>
			   		<tr>
			    		<th>빈혈 등</th>
			            <td>혈색소</td>
			            <td><input class="inputValue" type="text" value="0" name="hemoglobin">g/dL</td>
			        </tr>
			        <tr>
			    		<th>당뇨병</th>
			            <td>식전혈당</td>
			            <td><input class="inputValue" type="text" value="0" name="bloodSugar">mg/dL</td>
			        </tr>
			        <tr>
			    		<th rowspan="4">고혈압</th>
			            <td>총 콜레스테롤</td>
			            <td><input class="inputValue" type="text" value="0" name="total_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			            <td>HDL - 콜레스테롤</td>
			            <td><input class="inputValue" type="text" value="0" name="HDL_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			            <td>트리글리세라이드</td>
			            <td><input class="inputValue" type="text" value="0" name="triglyceride">mg/dL</td>
			        </tr>
			        <tr>
			            <td>(LDL - 콜레스테롤)</td>
			            <td><input class="inputValue" type="text" value="0" name="LDL_cholesterol">mg/dL</td>
			        </tr>
			        <tr>
			        	<th>만성신장질환</th>
			            <td>혈청크레아타닌</td>
			            <td><input class="inputValue" type="text" value="1" name="serum_creatinine">mg/dL</td>
			        </tr>	
			        <tr>
			        	<th rowspan="3">간장질환</th>
			        	<td>AST(SGOT)</td>
			        	<td><input class="inputValue" type="text" value="20" name="ast">U/L</td>
			        </tr>	     
			        <tr>
			        	<td>ALT(SGPT)</td>
			        	<td><input class="inputValue" type="text" value="20" name="alt">U/L</td>
			        </tr>  
			        <tr>
			        	<td>감마지피티(a - GPT)</td>
			        	<td><input class="inputValue" type="text" value="40" name="gpt">U/L</td>
			        </tr> 
		        </form>
		    </table>
		    <div class="col-4"><canvas id="canvas"></canvas></div>
		</div>
		<button class="btn btn-warning mb-5" style="width:100%;" id="sendHealthDataBtn">저장하기</button>
	</div>
</body>
<script>
	$("input[name=files]").change(function(e) {
		 var fileInput = document.querySelector('input[name=files]');
		  var file = fileInput.files[0];
		  var reader = new FileReader();
		  reader.onload = function(e) {
		    var base64Result = e.target.result.split(",")[1];
		    // 변환된 Base64 데이터를 사용하여 필요한 작업을 수행
		    console.log(base64Result);
		    $.ajax({
		    	url: '<c:url value="/loadHealthInfoByOCR.do"/>',
		    	method : "post",
	          	data : "base64="+ encodeURIComponent(base64Result),
	          	dataType : 'json'
		    })
		    .done(function(data) {
		    	var array;
		    	var healthArray =Array();
		    	var string_health = data['responses'][0]['fullTextAnnotation']['text'];
		    	array = string_health.split('\n');
		    	var flag = false;
	          	for(var str of array) {
	              var juminRule=/^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-8][0-9]{6}$/;
	              if(juminRule.test(str)) {flag=false;}
	              if(flag) {healthArray.push(str);}
	              if(str === '결과') {flag = true;}
	          	}
	          	console.log(healthArray);
	          	var values = [];
	          	healthArray.forEach(function(item) {
          	  		item = item.replace('m2','m');
          	  		var numbers = item.match(/\d+(\.\d+)?/g);
          	 		if (numbers) {
          	    		values = values.concat(numbers);
          	  		}
          		});
	          	var inputItems = document.querySelectorAll(".inputValue");
	          	inputItems.forEach(function(item,index) {
	          		item.value = values[index];
	          	});
	          	
	          	//이미지에 그림 그리기
	          	var point = data['responses'][0]['fullTextAnnotation']['pages'][0]['blocks'];
				
				var canvas = document. getElementById ( "canvas" );
				var context = canvas.getContext( "2d" );
				var img = new Image (); //이미지 객체 생성
				img.src = e.target.result; //code.jpg라는 이미지 파일을 로딩 시작
				img.onload = function () {
					//(20,20)을 중심으로 100*100의 사이즈로 이미지를 그림 
					canvas.width = img.width;
					canvas.height = img.height;
					context.drawImage(img,0,0);
					point.forEach(function(item) {
						context.strokeStyle = '#00ff00';
						context.lineWidth = 3;
						var paragraph =  '';
						item['paragraphs'].forEach(function(code) {
							code['words'].forEach(function(text) {
								text['symbols'].forEach(function(last) {
									paragraph += last['text'];
								});
							});
						});
						let reg = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
						let reg2 = /[a-zA-Z0-9]/gim;
						let resultData = paragraph.replace(reg, "");
						resultData = resultData.replace(reg2,"");
						console.log("resultData",resultData);
						
						var start_x = item['boundingBox']['vertices'][0]['x'];
						var start_y = item['boundingBox']['vertices'][0]['y'];
						var end_x = item['boundingBox']['vertices'][2]['x'] - item['boundingBox']['vertices'][0]['x'];
						var end_y =  item['boundingBox']['vertices'][3]['y']- item['boundingBox']['vertices'][0]['y'];
						context.strokeRect(start_x,start_y,end_x,end_y);
					});
				}
	          	
	          	
		    })
		  };
		  reader.readAsDataURL(file);
	});
  function preventSubmit(event) {
	    event.preventDefault(); // 전송을 막는 메소드
	  }
  $("#sendHealthDataBtn").click(function() {
	  Swal.fire({
		  icon: 'success',
		  title: '저장되었습니다!',
		  showConfirmButton: false,
		  timer: 1500
	    }).then((result) => {
	        document.querySelector("#sendHealthData").submit();
	    })
  });
</script>
<jsp:include page="/WEB-INF/views/template/Footer.jsp" />