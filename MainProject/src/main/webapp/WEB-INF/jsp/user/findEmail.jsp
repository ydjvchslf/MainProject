<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script>
	
	$( function() {
		$("a[href='#']").on("click" , function() {
			self.location = "/user/login"
		});
	});
	
	
	$( function() { 
		
		$("button[name='findEmail']").click(function(){
			
				console.log('잘접근!');
				
				var name = $("#name").val();
				var phone = $("#phone").val();
				
				console.log(name);
				console.log(phone);
			
				$.ajax( 
						{
							url : "/user/json/findEmail",
							method : "POST" ,
							data : JSON.stringify({
								name : name,
								phone: phone,
							}),
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status) {
								
								//alert("성공!");
					    			
								if (JSONData.message == "no") {
									
									var str = '없는 회원정보입니다.';
									
									console.log("없는 정보");
									$('.text_email').append(str).css("color", "red");
									
								} else if (JSONData.message == "ok") {
									
									var dbEmail = JSONData.dbEmail;
									var displayText = '회원님의 email 계정은 "'+dbEmail+'" 입니다!';
									
									alert(dbEmail)
									$('.text_email').append(displayText).css("color", "red");
								}
								
							}
				});
				
			});
			
			
		});
	
	
	

	</script>
    
</head>

<body>

		<div class="col-md-9">
				<div class="jumbotron">
			  		<p>Email찾기 화면</p>
			  	</div>

		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" placeholder="name">
		       <span id="helpBlock" class="help-block">
		      	<strong class="text_findEmail"></strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">전화번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="phone">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" name="findEmail" class="btn btn-primary"  >Email 찾기</button>
			  <a class="btn btn-primary btn" href="#" role="button">로그인하러가기</a>
		    </div>
		  </div>
			
		<span id="helpBlock" class="help-block">
		   <strong class="text_email"></strong>
		 </span>
		  
		</form>
	
</body>

</html>