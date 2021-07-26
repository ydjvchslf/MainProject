<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>userMain</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
		
        
        
        </script>
	
		
		
		
		<script type="text/javascript">
		
		var duplicationCheck = false;
				
		//가입버튼 눌렀을때 모든 true 값 체크 메서드
		function fncCheckAll() {
			
			var valid = false;
			
			if( fncCheckName() && fncCheckPhone ){
				valid = true;
			}
			
			return valid;
		}
		
		
		$(function() {
			
			//수정하기 event
			$("#update").on("click" , events.click.update);
			
			//뒤로가기 event 
			$("#back").on("click" , events.click.back);
			
			//이름 변화 event
			$("#name").on("change", events.change.name);
			
			//핸드폰 변화 event
			$("#phone").on("change", events.change.phone);
			
		});	
		
		
	
		var events = {
				
				click : {
					
					update : function() {
						if(fncCheckAll()){
							
							fncUpdateUser();
						}
					},
					
					back : function() {
						window.history.back();
					}
				},
			
				change : {
	
					name : function(){
						fncCheckName();
					},
					
					phone : function(){
						fncCheckPhone();
					}
				}
			}
		
		
		
		//이름 체크 함수
	    function fncCheckName() {
			
			var name = $("#name").val();
			
	        if(name){
	        	var nameRegExp = /^[가-힣]{2,20}$/;
	        	
	        	if(nameRegExp.test(name)){
	        		$(".text_name").text("올바른 이름 형식입니다.");
					$(".text_name").css("color", "blue");
	        		return true;
	        	}else{
	        		$(".text_name").text("올바른 이름 형식이 아닙니다");
					$(".text_name").css("color", "red");
	        	}
	        } else{
	        	$(".text_name").text("이름을 필수로 입력하세요!");
				$(".text_name").css("color", "red");
	        }
	        return false; 
	    }
		
		

		//핸드폰 체크 함수 
	    function fncCheckPhone(){
	    	
	    	var phone = $("#phone").val();
	    	
	    	if(phone){
	    		
	    		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
	    		
	    		if(regExp.test(phone)){
	    			
	    			$(".text_phone").text("올바른 휴대폰 형식입니다.");
					$(".text_phone").css("color", "blue");
					
					return true;
					
	    		}else{
	    			
	    			$(".text_phone").text("올바르지 않은 휴대폰 형식입니다.");
					$(".text_phone").css("color", "red");
	    			
	    		}
	    	}else{
	    		
	    		$(".text_phone").text("휴대폰번호를 필수로 적어주세요!");
				$(".text_phone").css("color", "red");
	    		
	    	}
	    	return false;
	    }
		
		
		
		//수정하기 함수
		function fncUpdateUser() {
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
		
		
		
		</script>
		
	<div class="container-fluid">
			<h1 class="h3 mb-1 text-gray-800">내 정보 수정</h1>
	                    <p class="mb-4">정보를 최신으로 업데이트 해주세요!</p>
		
		
		<div class="row">
		  <div class="col-sm-4">
		  </div>
		   <div class="col-sm-4">
			   <div class="input-group">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="">First and last name</span>
				  </div>
				  	<input type="text" class="form-control">
			  </div>
			  <div class="input-group">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="">First and last name</span>
				  </div>
				  	<input type="text" class="form-control">
			  </div>
			  <div class="input-group">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="">First and last name</span>
				  </div>
				  	<input type="text" class="form-control">
			  </div>
		  </div>
		   <div class="col-sm-4">
		  </div>
		</div>
	</div>	 
    