<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>Academy Info</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>	
	
	<style>
	
	@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'ChosunGu';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
    
    		body{
				overflow-x:hidden; overflow-y:visible;
				font-family: 'ChosunGu';
			}
	
			@font-face {
			    font-family: 'TmonMonsori';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			
			#deleteButtonImage{
				position : relative;
				top: 0%;
				right: -40%;
			}
			
			#deleteButtonVideo{
				position : relative;
				top: 0%;
				right: -40%;
			}
	
		
 	</style>
	

  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5"> 
	        
	        <div class="container-fluid"  >
	        	 
	        	 <jsp:include page="../common/toolbar.jsp"></jsp:include> 
	        
				<!-- 내용 때려 박으삼 이쁘게 -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
					<div class="row">
					
					<div class="col-sm-3"> <!-- 3 부분 -->
					</div>
					<div class="col-sm-6"> <!-- 본문 부분 -->
					
						<!-- 학원 이름, 전화번호 -->
						<div id="academytitle" class="row"></div>
						<br>
						<!-- 중간 소제목 시작-->
						<div class="col-sm-12" align="center">
							<h4><strong><span><span >멀티미디어 정보</span></strong></h4>
						</div><br>
						<br>
						<!-- 중간 소제목 끝-->
						<div class="card">
	                            <div class="card-body">
	                            
	                            <c:if test="${imgcount+vidcount < 1}">
					        	
					        	<img alt="noImage" src="/image/BuyEdyLogo.png">
					        	
					        	
					        	<c:if test="${user.role == 'academy' }">
					        		<br>
					        		--이미지를 등록해 주세요!
					        	</c:if>
					        	
					        	</c:if> 
	                            
	                            
	                            <c:if test="${imgcount+vidcount > 0}">        
								<!--  Image-->
			                    <div class="row">
							
			           		    <c:set var="i" value="0" />
								<c:forEach var="academy" items="${listfile}">
										<c:set var="i" value="${ i+1 }" />
								
								<c:if test="${academy.multimediarole == 'I'}">
								<div class="col-md-4">
										<img style=" margin-bottom: 10px; " height="450" width="450" src="/uploadImages/${academy.multimedia}"/>
										</br>
										<c:if test="${user.role == 'academy' }">
										<span id=deleteButtonImage><a class="btn btn-primary" style="color: white;" onclick="deleteMultimedia('${academy.multimediano}')">삭제</a></span>
										</br>
										</c:if>
								</div>
								</c:if>
					        	</c:forEach>	
					        	
					        	</div>
					        	
					        	</br></br></br></br>
	<!--  				        			Media-->
					        	</br>	
					        	
					        	
					        	
					        	
					        	<div class="row">
					        	
					        	<c:set var="i" value="0" />
								<c:forEach var="academy" items="${listfile}">
										<c:set var="i" value="${ i+1 }" />
								<c:if test="${academy.multimediarole == 'V'}">
								<div class="col-md-4">
										<video height="450" width="450" style="margin-bottom: 10px; " controls>
											<source src="/uploadImages/${academy.multimedia}">
										</video>
										<c:if test="${user.role == 'academy' }">
										</br>
										<span id="deleteButtonVideo" > <a class="btn btn-primary" style="color: white;" onclick="deleteMultimedia('${academy.multimediano}')"> 삭제</a></span>
										</br>
										</c:if>
								</div>
								</c:if>
					        	</c:forEach>
			        	
			        			</div>
			        			</c:if>
			        	
			        	
	                            </div>
	
	                        </div>
						
	
						
							  </br></br></br>
							<c:if test="${user.role == 'academy'}">
							 <c:if test="${imgcount+vidcount < 5}"> 
							  
							  <form name="dataForm" id="dataForm" onsubmit="return registerAction()">
							  	<button class="btn btn-primary" id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">Upload</button>
							  	<input id="input_file" multiple="multiple" type="file" style="display:none;">
							  	<span style="font-size:15px; color: gray;">※첨부파일은 최대 5개까지 등록이 가능합니다.</span>
							  	<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
									<span>첨부 파일 목록</span>
									<br />
									<div id="articlefileChange">
									</div>
								</div>
							  	<button class="btn btn-primary" type="submit" style="border: 1px solid #ddd; outline: none;">Save</button>
							  </form>
							 </c:if>
							</c:if>
						
	 
							    
					</div>
		      	</div>
	      	
	       </div>
	      </div>
		</div>
	</div>
	
	<div class="col-sm-3"> <!-- 3 부분 -->
	</div>
					
					
	
	<script >
	
	var academyCode = '${academy.academyCode}';
	var academyName = '${academy.academyName}';
	var count = '${imgcount+vidcount}';
	var imgcount = '${imgcount}';
	var vidcount = '${vidcount}';
	
	$(document).ready(function()
	// input file 파일 첨부시 fileCheck 함수 실행
	{
		$("#input_file").on("change", fileCheck);
	});

	 // 첨부파일로직
	$(function () {
	    $('#btn-upload').click(function (e) {
	        e.preventDefault();
	        $('#input_file').click();
	    });
	});

	// 파일 현재 필드 숫자 totalCount랑 비교값
	var fileCount = count;
	// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
	var totalCount = 5;
	// 파일 고유넘버
	var fileNum = 0;
	// 첨부파일 배열
	var content_files = new Array();

	function fileCheck(e) {
	    var files = e.target.files;
	    
	    // 파일 배열 담기
	    var filesArr = Array.prototype.slice.call(files);
	    
	    // 파일 개수 확인 및 제한
	    if ((Number(fileCount)+filesArr.length) > totalCount) {
	      alert('파일갯수 = '+((Number(fileCount)+filesArr.length))+' \n파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
	      return;
	    } else {
	    	 fileCount = fileCount + filesArr.length;
	    	 alert("업로드 할 파일 갯수 = "+filesArr.length+"개")
	    }
	    
	    // 각각의 파일 배열담기 및 기타
	    filesArr.forEach(function (f) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        content_files.push(f);
	        $('#articlefileChange').append(
	       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
	       		+ '<font style="font-size:12px">' + f.name + '</font>'  
	       		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
	       		+ '<div/>'
			);
	        fileNum ++;
	      };
	      reader.readAsDataURL(f);
	    });
	    console.log(content_files);
	    //초기화 한다.
	    $("#input_file").val("");
	  }

	// 파일 부분 삭제 함수
	function fileDelete(fileNum){
	    var no = fileNum.replace(/[^0-9]/g, "");
	    content_files[no].is_delete = true;
		$('#' + fileNum).remove();
		fileCount --;
	    console.log(content_files);
	}
	
	 // 폼 submit 로직
		function registerAction(){
			
		var form = $("form")[0];        
	 	var formData = new FormData(form);
			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if(!content_files[x].is_delete){
					 formData.append("article_file", content_files[x]);
				}
			}		
			
	   // 파일업로드 multiple ajax처리
		$.ajax({
	   	      type: "POST",
	   	   	  enctype: "multipart/form-data",
	   	      url: "/academy/file-upload/${academy.academyCode}",
	       	  data : formData,
	       	  processData: false,
	   	      contentType: false,
	   	      success: function (data) {
	   	    	if(JSON.parse(data)['result'] == "OK"){
	   	    		alert("파일업로드 성공");
				} else{
					alert("파일업로드 실패");
				}
	   	    	
	   	    	location.reload();
	   	      },
	   	      error: function (xhr, status, error) {
	   	    	alert("에러 났음 ㅠㅠ");
	   	     return false;
	   	      }
	   	    });
	   	    return false;
		}
	 
		//  파일 삭제 
		function deleteMultimedia(multimediano){
			if(confirm('삭제하시겠습니까?')){
				
			    $.ajax({
			        url : '/academy/json/deleteMultimedia/'+multimediano,
			        type : 'post',
			        success : function(data){
			            alert("삭제 완료!")
			        }
			    });
			}
			
			location.reload();
		}
		
		function getAcademyInfo(){
			$.ajax({
				 url : '/academy/json/getacademyInfo/'+academyCode,
			     method : 'GET',
			     dataType : "json",
				 success : function(data){
					 console.log(data);
					 academyInfo = data;
						 
					var b = '';
						b += '<div id="titlef" class="col-md-12" style="font-size: 45px;" align="center">'+data.academyName+'</div>'
					
					$("#academytitle").html(b);
						 
				 }							
			});		
		}
		
		
		
		$(document).ready(function(){
			getAcademyInfo(); 
		});
	
			
	</script>
	<!-- <script src="/js/jquery.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>