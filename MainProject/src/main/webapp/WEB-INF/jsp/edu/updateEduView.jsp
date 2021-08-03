<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>��������</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/style.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript">
	
 	$(function() {
		 
		$( "button.btn.btn-primary" ).on("click" , function() {
			
			fncUpdateEdu();
			
		});
		
		$("input:radio[name='eduGrade']:radio[value='${edu.eduGrade}']").prop('checked', true);
		$("input:radio[name='eduSubject']:radio[value='${edu.eduSubject}']").prop('checked', true);
		
	});	
	
	$(function() {
		
		$("a[href='#' ]").on("click" , function() {
			window.history.back();
		});
	});
	
	$( function() {
		
		   $('#eduStartDate').datepicker( { dateFormat : "yy-mm-dd" } );
		   
		   $('#eduEndDate').datepicker( { dateFormat : "yy-mm-dd" } );
		   
	})
	
	function fncUpdateEdu() {
			
		$("form").attr("method" , "POST").attr("action" , "/edu/updateEdu").submit();
	}
	
	function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
        }
	}
		
	</script>
	
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch" style="background-color:#ECECEC; ">
		
		<!-- left -->
		<jsp:include page="../common/left.jsp"></jsp:include>
		
        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5">
	        
	        <div class="container-fluid"  >
	        
	        	<jsp:include page="../common/toolbar2.jsp"></jsp:include> 
	        
				<!-- ���� ���� ������ �̻ڰ� -->
				<div style="background-color:white; border:3px solid white; border-radius:10px; position:relative; padding-top: 30px; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
					
						<div class="page-header text-center">
					       <h3 id="titlef" class=" text-info">������������</h3>
					       <h5 id="titlef" class="text-muted">���� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
					    </div>
					    
					    <!-- form Start /////////////////////////////////////-->
						<form class="form-horizontal">
						
						  <input type="hidden" name="eduNo" value="${edu.eduNo}"/>
						
						  <div class="form-group">
						    <label for="eduName" class="col-sm-offset-1 col-sm-3 control-label">������</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduName" name="eduName" value="${edu.eduName}">
						      <c:if test="${edu.eduState == 0}">
						      	<input type="radio" name="eduState" value="1"> �Ǹ���
						      </c:if>
						      <c:if test="${edu.eduState == 1}">
						      	<input type="radio" name="eduState" value="1" checked="checked"> �Ǹ���
						      </c:if>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduTeacher" class="col-sm-offset-1 col-sm-3 control-label">�����</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduTeacher" name="eduTeacher" value="${edu.eduTeacher}" placeholder="����ȸ���̸�">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduPrice" class="col-sm-offset-1 col-sm-3 control-label">������</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduPrice" name="eduPrice"  value="${edu.eduPrice}" placeholder="�����޴�����ȣ" onkeypress="inNumber();"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduStartDate" class="col-sm-offset-1 col-sm-3 control-label">���� ���� ��¥</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduStartDate" name="eduStartDate"  value="${edu.eduStartDate}" />
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduEndDate" class="col-sm-offset-1 col-sm-3 control-label">���� ���� ��¥</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduEndDate" name="eduEndDate"  value="${edu.eduEndDate}" />
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduDay" class="col-sm-offset-1 col-sm-3 control-label">���� ��¥</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduDay" name="eduDay" value="${edu.eduDay}"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduMember" class="col-sm-offset-1 col-sm-3 control-label">���� �� �ο�</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduMember" name="eduMember" value="${edu.eduMember}" onkeypress="inNumber();"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduStartTime" class="col-sm-offset-1 col-sm-3 control-label">���� ���� �ð�</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduStartTime" name="eduStartTime" value="${edu.eduStartTime}"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduEndTime" class="col-sm-offset-1 col-sm-3 control-label">���� ���� �ð�</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduEndTime" name="eduEndTime" value="${edu.eduEndTime}"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="eduIntro" class="col-sm-offset-1 col-sm-3 control-label">���� ������</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" id="eduIntro" name="eduIntro" value="${edu.eduIntro}"/>
						    </div>
						  </div>
						  
						  <div class="form-group">
						    &nbsp;&nbsp;&nbsp;<label for="eduGrade" class="col-sm-offset-1 col-sm-3 control-label">���� ����г�</label>
						    <label class="btn btn-default">
							 	<input type="radio" name="eduGrade" value="�ʵ�">�ʵ�
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduGrade" value="�ߵ�">�ߵ�
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduGrade" value="���">���
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduGrade" value="��3">��3
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduGrade" value="N��">N��
							 </label>
						  </div>
						  
						  <div class="form-group">
						  &nbsp;&nbsp;&nbsp;<label for="eduSubject" class="col-sm-offset-1 col-sm-3 control-label">���� ����</label>
						     <label class="btn btn-default">
							 	<input type="radio" name="eduSubject" value="����">����
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduSubject" value="����">����
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduSubject" value="����">����
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduSubject" value="��ȸ">��ȸ
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduSubject" value="����">����
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduSubject" value="�� 2�ܱ���">�� 2�ܱ���
							 </label>
							 <label class="btn btn-default">
							 	<input type="radio" name="eduSubject" value="��ü��">��ü��
							 </label>
						  </div>
						  
						  <div class="form-group">
						    <div class="col-sm-offset-4  col-sm-4 text-center">
						      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
							  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
						    </div>
						  </div>
						</form>
						      	
				</div>
	        </div>
	        
	        <!-- footer �ڸ� -->
       		<jsp:include page="../common/footer.jsp"></jsp:include>
					
		</div>
      		
        </div>
      	
    <!-- <script src="/js/jquery.min.js"></script> -->
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>