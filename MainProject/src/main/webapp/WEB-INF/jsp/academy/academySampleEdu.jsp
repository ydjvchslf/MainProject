<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/css/style.css">
		<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		</script>
		
	<title>Academy SampleEdu</title>

    </head>
    <body>
        
        <div id="layoutSidenav" class="wrapper d-flex align-items-stretch">
            
            <jsp:include page="../common/left.jsp"></jsp:include>
            
            <div id="layoutSidenav_content" class="p-4 p-md-5">
            
            <div id="academytitle">
            	<h1 class="mt-4">${academy.academyName }</h1>
            </div>
            
            <jsp:include page="../common/toolbar.jsp"></jsp:include>  
            
            
            <!-- 여기가 가운데 들어갈 화면 (바뀌는 곳) -->
                <main>
                    <div class="container-fluid px-4">
                        
                        <div class="card mb-4">
                            <div class="card-body">
                                <p class="mb-0">
                                    학원 번호	: ${academy.academyPhone}<br/>
                                    
                                    학원 이미지 :
                    <div class="card-image">
				
           		    <c:set var="i" value="0" />
					<c:forEach var="academy" items="${listfile}">
							<c:set var="i" value="${ i+1 }" />
					
					<c:if test="${academy.multimediarole == 'I'}">
							<img height="200" src="/uploadImages/${academy.multimedia}"/>
							<a onclick="deleteMultimedia('${academy.multimediano}')">삭제</a>
					</c:if>
		        	</c:forEach>	
		        	
		        	</div>
		        	
		        	<br/><br/><br/>
		        					샘플 영상 : 
		        	
		        	<c:set var="i" value="0" />
					<c:forEach var="academy" items="${listfile}">
							<c:set var="i" value="${ i+1 }" />
					<c:if test="${academy.multimediarole == 'V'}">
							<video controls>
								<source src="/uploadImages/${academy.multimedia}">
							</video>
							<a onclick="deleteMultimedia('${academy.multimediano}')"> 삭제</a>
					</c:if>
		        	</c:forEach>
		        	
                            </div>

                        </div>
            
            <div class="container">
            
  <h2>파일업로드</h2>
  <form name="dataForm" id="dataForm" onsubmit="return registerAction()">
  	<button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>
  	<input id="input_file" multiple="multiple" type="file" style="display:none;">
  	<span style="font-size:10px; color: gray;">※첨부파일은 최대 5개까지 등록이 가능합니다.</span>
  	<div class="data_file_txt" id="data_file_txt" style="margin:40px;">
		<span>첨부 파일</span>
		<br />
		<div id="articlefileChange">
		</div>
	</div>
  	<button type="submit" style="border: 1px solid #ddd; outline: none;">전송</button>
  </form>
</div>
            
                        <div style="height: 100vh"></div>
                        <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
                    </div>
                </main>
            
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="/js/scripts.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        	
    	<script>
		
		var academyCode = '${academy.academyCode}';
		var academyName = '${academy.academyName}';
		var count = '${imgcount+vidcount}';
		var imgcount = '${imgcount}';
		var vidcount = '${vidcount}';
		
		alert("학원 코드 = " + academyCode + " 학원 이름 = " + academyName + " \n이미지 파일 갯수 = " + imgcount + " 비디오 파일 갯수 = " + vidcount
				+"\n총 갯수 = " + count);
		
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

		
		</script>
    	
    </body>
</html>
    