<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
  <head>
  	<title>�п����</title>
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
						        <form>
						            
						            <div class="row">
									  
									  <div class="col-xs-12 col-md-8">
									  	<input type="text" name="academyName" placeholder="�п��� �Է�" class="form-control"> <br/><br/>
									  </div>
									  
									  <div class="col-xs-6 col-md-4">
									  	<input type="text" name="academyPhone" placeholder="�п���ȭ��ȣ �Է�" class="form-control"> <br/><br/>
									  </div>
								
									</div>
									
									<div class="row">
									  
									  <div class="col-xs-12 col-md-12">
									  	<input class="form-control" type="text" onclick="sample5_execDaumPostcode()" id="sample5_address" name="academyAddr"  placeholder="�ּ�" readonly/> <br/><br/>
									  </div>

								
									</div>
									
									<div class="row">
									  
									  <div class="col-xs-12 col-md-12">
									  	<div id="map" style="width:auto;height:300px;margin-top:10px;margin-bottom:30px; "></div>
									  </div>

								
									</div>
						            
									<div class="row">
									  <div class="col-md-8"></div>
									  <div class="col-md-1"></div>
									  <div class="col-md-1"></div>
									  <div class="col-md-1"><button type="button" id="ok" class="btn btn-primary"  >���</button></div>
									  <div class="col-md-1"><button type="button" id="cancle" class="btn btn-primary"  >���</button></div>
									</div>
						
										<input type="hidden" class="form-control" type="text" id="sample5_address_extra" name="academyArea" placeholder="���̸�" readonly/>
										<input  type="hidden"  id="lat" name="academyLat"  placeholder="����" readonly/>
										<input type="hidden" id="lng" name="academyLng"  placeholder="�浵" readonly/>

								</form>	
				</div>
	      	</div>
      	
       </div>
      
	</div>
	
	<script>
	
			$(function(){
				$("#ok").on('click',function(){
					
					alert("��Ϲ�ư Ŭ��")
					
					var acaname=$("input[name='academyName']").val();
					var acaadde=$("input[name='academyAddr']").val();
					var acaphone=$("input[name='academyPhone']").val();
					
					if(acaname == null || acaname.length <1){
						alert("�п� �̸��� �ݵ�� �Է��ϼž� �մϴ�.");
						return;
					}
					if(acaadde == null || acaadde.length <1){
						alert("�п� �ּҴ�  �ݵ�� �Է��ϼž� �մϴ�.");
						return;
					}
					
					$("form").attr("method" , "POST").attr("action" , "/academy/addAcademy?userNo=${user.userNo}").submit();
		
				});
			});
	

		    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
		        mapOption = {
		            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
		            level: 5 // ������ Ȯ�� ����
		        };
		
		    //������ �̸� ����
		    var map = new daum.maps.Map(mapContainer, mapOption);
		    //�ּ�-��ǥ ��ȯ ��ü�� ����
		    var geocoder = new daum.maps.services.Geocoder();
		    //��Ŀ�� �̸� ����
		    var marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(37.537187, 127.005476),
		        map: map
		    });
		
		    function sample5_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // ���� �ּ� ����
						var extra = data.sigungu; // ��, �� �̸�
		                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
		                document.getElementById("sample5_address").value = addr;
		                document.getElementById("sample5_address_extra").value = extra;
		                // �ּҷ� �� ������ �˻�
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // ���������� �˻��� �Ϸ������
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //ù��° ����� ���� Ȱ��
		
		                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
		                        var coords = new daum.maps.LatLng(result.y, result.x);
		                        // ������ �����ش�.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // ���� �߽��� �����Ѵ�.
		                        map.setCenter(coords);
		                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
		                        marker.setPosition(coords)
		                        document.getElementById("lat").value = result.y
		    	                document.getElementById("lng").value = result.x
		                    }
		                });
		            }
		        }).open();
		    }
	</script>
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>