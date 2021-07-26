<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<link href="/css/styles.css" rel="stylesheet" />
    <!-- Custom fonts for this template-->
    <link href="/sbadmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript-->
    <script src="/sbadmin/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b7bd68bba98dd72e7204e4be68eaab0&libraries=services">
	</script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- 템플릿 CSS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<!-- 각자 jsp에서 필요한 CDN 넣어주세요 ////////////////////////////-->
	
  </head>
   <body  id="page-top">
	<div id="wrapper">
		<tiles:insertAttribute name="left"/>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<tiles:insertAttribute name="header"/> <!--  /WEB-INF/views/common/layout/header.jsp -->
				
				<div class="container-fluid">
					<tiles:insertAttribute name="title"/> <!-- body -->
					<tiles:insertAttribute name="body"/>
				</div>
			</div>
			<tiles:insertAttribute name="footer"/> <!-- /WEB-INF/views/common/layout/footer.jsp -->
		</div>
		
    </div>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" name="allLogout" href="#" onclick="return false;">Logout</a>
                </div>
            </div>
        </div>
    </div>

	<!-- 여기에 각자 jsp에서 필요한 CDN 넣어주세요! -->
    <script src="/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/sbadmin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/sbadmin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- sweet alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
   
  </body>
</html>