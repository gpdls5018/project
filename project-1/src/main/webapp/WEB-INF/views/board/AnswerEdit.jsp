<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>MEDI Q</title>
    <style>
       .qna_banner{
        	width:75%;
        	height:280px;
        	background-color:#FDCDBC;
            border-radius: 30px;
		}
		.qna_title{
			position:relative;
	     	top:calc(100vh - 96vh);
	     	left:10%;
	     	color:white;
	     	margin:0px;
	     }
	     .qna_img{
	         position:absolute;
	         width: 200px;
	         top:calc(100vh - 85vh);
	         right:20%;
	     }
		.text_1{
			font-size:70px;
			font-weight:bold;
		}
		.text_2{
			font-size:30px;
			font-weight:bold;
		}
		.text_3{
			font-size:20px;
			font-weight:bold;
		}
		.card_deco{
			width: 92%;
		    display: block;
		    background: #FFFFFF;
		    border: 1px solid #E6E9ED;
		    box-shadow: 0px 2px 10px rgba(70, 56, 147, 0.1);
		    border-radius: 20px;
		    text-align: left;
		}
		.card_deco_body{
			padding:0.5rem;
			background-color:#FDCDBC;
			border-radius: 20px;
		}
		.btn_deco{
			background:linear-gradient(180deg,#ff4b09,#ff956c);
		}
		.qna_mascot{
			width:40px;
			position:relative;
			border-radius: 50%;
			background-size:contain;
		}
		.qna_bbs{
			height:90px;
			padding-left:calc(100vw - 1570px);
		}
		.card_font1{
			font-size:26px;
		}
		.card_font2{
			color: #EF605D;
		}
    </style>
</head>
<jsp:include page="/WEB-INF/views/template/Top.jsp"/>
<body>
    <main>
        <div class="d-flex justify-content-center" style="padding-top:120px;">
	        <div class="qna_banner">
	            <div class="qna_title">
	                <p class="text_1 m-0">Q &amp; A</p>
	                <span class="text_2 m-0">답답했던 영양제의 모든 것!</span>
	            	<p class="text_2">전문가에게 물어보세요</p>
	            </div>
	            <img src="<c:url value="/images/qna/pharm.png"/>" class="qna_img">
			</div>
        </div>
        
        <div class="container-fluid pt-3 mt-3">
            <div class="row d-flex flex-wrap align-content-stretch">
                <div class="d-flex col-2">
                </div>
                <div class="d-flex col-8 flex-wrap flex-direction justify-content-center align-content-stretch">
                    <div class="col">
                        <form method="post" action="/board/AnswerEdit.do">
                             <div class="card_deco col-12 p-0 m-0">
	                            <div class="card-body p-2 m-3">
	                                <div class="form-group">
                                		<label for="usr"><h3><kbd class="btn_deco font-weight-bold">제목</kbd></h3></label>
                                		<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
                            		</div>
	                            	<br>
		                            <div class="form-group">
										<label for="comment"><h3><kbd class="btn_deco font-weight-bold">질문 내용</kbd></h3></label>
	                                	<textarea class="form-control" rows="15" name="content">${record.CONTENT }</textarea>
	                            	</div>
	                            </div>
                            </div>
                            <div class="pt-3 pl-4">
	                            <button type="submit" class="btn btn-light text-light text_2 btn_deco" style="font-size:22px;">수정</button>
	                            <input type="hidden" value="${record.ANSWER_NO}" name="answer_no">
	                            <input type="hidden" value="${record.BOARD_NO}" name="no">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="d-flex col-2 flex-wrap align-content-stretch">
                </div>
            </div>
        </div>
    </main>
</body>
<jsp:include page="/WEB-INF/views/template/Footer.jsp"/>