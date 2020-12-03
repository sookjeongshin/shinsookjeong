<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- jstl은 jsp의 표준태그 라이브러리 입니다. jaca standard tag library -->

<!DOCTYPE html><!-- 현재문서의 형태선언 -->
<html><!-- html문서는 태그열고 ~ 태그닫고 하는 영역확인 중요 -->
<head><!-- 문서내용과는 관계없는 문서정보=메타데이터(데이터의데이터)가 존재 -->
<meta charset="UTF-8"><!-- 문서의 언어 인코딩설정  지금은 유니코드로 됨 -->
<!-- 반응형을 작동하기 위해서 사용하는 메타태그 뷰포트는 모니터,모바일액정,프린터 -->
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1">
<title>반응형홈페이지</title><!-- 문서의 제목을 브라우저상단왼쪽에 표시 -->
<!-- 외부 자바스크립트 불러오는 태그(아래) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script><!-- J쿼리코어 -->
<script src="/resources/sample/js/user.js"></script>
<!-- 외부 css파일 불러오는 태그(아래) -->

<link rel="stylesheet" href="/resources/sample/css/reset.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/mobile.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/tablet.css" type="text/css">
<link rel="stylesheet" href="/resources/sample/css/pc.css" type="text/css">
<!-- span태그 자리를 차지하지 않는 영역 = 한뼘 , px 픽셀 화면에 표시되는 크기의 단위 -->
<!-- :콜론(속성:값, Key:Value), ;세미콜론(문장의 끝) -->
<style>
/*@미디어쿼리사용-메타태그viewport값필수*/
/*PC용 스타일시작*/
/*미디어쿼리:미디어의 가로크기가 1132px 이상이면 아래 스타일 적용*/
@media all and (min-width:1132px) {
}
/*PC용 스타일 끝*/
</style>
<script>
/* 자바스크립트 시작 */
$(document).ready(function(){
	$(".carousel").carousel({
		interval:1000,//이미지가 좌우로 움직이는 대기시간 지정. 1초, 크롬,IE작동OK, 파이어폭스X
		pause:false
	});
});
/* 자바스크립트 끝 */
</script>
</head>
<body><!-- 문서내용이 들어가는 영역 -->
<div id="wrap"><!-- 랩핑시킨 영역 -->
<header class="header">
<!-- 상단 로고와 햄버거 메뉴영역 시작 -->
<h1 class="logo">
<a href="/">LOGO</a><!-- a태그는 페이지이동역할, href헤르프 속성값에 URL을 입력해서 이동 -->
</h1><!-- 헤드라인 글자를 표시 h1~h6 -->
<div class="menu-toggle-btn">
<span></span>
<span></span>
<span></span>
</div>

<!-- html5 시만텍 웹 = 의미가 있는 태그를 사용하게 해서 AI가 인식하게 됩니다. nav태그 -->
<nav class="gnb"><!-- gnb:글로벌네이게이션:전체영역메뉴  Global Navigagion -->
<!-- 리스트를 모여주는 태그 ul(UnOrdered List *.~, *.~ ) , ol(Ordered List 1.~, 2.~ ) -->
<ul>
<li><a href="/">HOME</a></li>
<li><a href="/weare">WE ARE</a></li>
<li><a href="/work">WORK</a></li>
<li><a href="/blog">BLOG</a></li>
<li><a href="/contact">CONTACT US</a></li>
<li><a href="/admin">AdminLTE</a></li>
</ul>
</nav>
<!-- 상단 로고와 햄버거 메뉴영역 끝 -->
</header>
<!-- 관리자단 헤더 시작 header.jsp -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 | Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/resources/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!--관리자화면 최상단 아이콘2개 Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- 관리자화면 왼쪽메뉴 부분Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    <!-- 관리자화면 오른쪽메뉴 부분Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/admin" class="brand-link">
      <img src="/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Spring 프로젝트</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
    <!-- 로그인한 사용자표시 sidebar user panel (optional) -->
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/resources/dist/img/boxed-bg.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">관리자</a>
        </div>
      </div>

      <!-- 검색폼 SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- 사용자 홈과 대시보드 메뉴 Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                  <li class="nav-item">
            <a href="/" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                사용자홈 
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
        
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
              <a href="/admin/member/member_list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>관리자 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/admin/board/board_list" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>게시물 관리</p>
                </a>
              </li>
            </ul>
          </li>
          
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
<!-- 관리자단 헤더 끝-->