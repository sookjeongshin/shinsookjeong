<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp"%>

  <!-- 대시보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">회원수정</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원수정</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
     
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- 본문내용 -->
    
    <!-- 본문내용 Main content -->
    <section class="content">
      <div class="container-fluid">
    
   	   <div class="row">
          <div class="col-12"><!-- 부트스트랩의 디자인 클래스 row -->
    		 <!-- form start -->
              <form name="update_form" action="/admin/member/member_update" method="post">
              
			<div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">UPDATE Member</h3>
              </div>
              <!-- /.card-header -->
         
                <div class="card-body">
                  <div class="form-group">
                    <label for="user_id">user_id</label>
                    <input value="${memberVO.user_id}" type="text" class="form-control" name="user_id" id="user_id" placeholder="ID를 입력해 주세요." required readonly>
                  </div>
                  <div class="form-group">
                    <label for="user_pw">Password</label>
                    <!-- html5에서 지원되는 유효성 검사 maxlength, minlength, required, type="email" -->
                  	<!-- html5지원 브라우저에서만 사용가능 그래서, jquery.validator라는 자바스크립트를 사용. -->
                    <input maxlength="10" minlength="5" type="password" class="form-control" name="user_pw" id="user_pw" placeholder="암호를 입력해주세요" required>
                  </div>
                  <div class="form-group">
                  <label for="user_name">user_name</label>
                  <input value="" type="text" class="form-control" name="user_name" id="user_name"  placeholder="암호를 입력해주세요" required>
                  </div>
                  <div class="form group">
                  <label for="email">email</label>
                  <input value="${memberVO.user_email}" type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력해 주세요" required>
                  </div>
                  <div class="form group">
                  <label for="point">point</label>
                  <input value="${memberVO.user_point}" type="text" class="form-control" name="point" id="point" placeholder="포인트를 입력해 주세요" required>
                  </div>
                  <div class="form-group">
                  <label for="enabled">enabled</label>
                  <select class="form-control" name="enabled" id="enabled">
                  <option value="0" <c:out value="${(memberVO.enabled=='false')?'selected':''}" /> >false</option>
                  <option value="1" <c:out value="${(memberVO.enabled=='true')?'selected':''}" /> >true</option>
                  </select>
                  </div>
                      <div class="form-group">
                  <label for="levels">leveLs</label>
                  <select class="form-control" name="levels" id="levels">
                  	<option value="ROLE_ADMIN"<c:out value="${(memberVO.levels=='ROLE_ADMIN')?'selected':''}"/>>ROLE_ADMIN</option>
                  	<option value="ROLE_ADMIN"<c:out value="${(memberVO.levels=='ROLE_USER')?'selected':''}"/>>ROLE_USER</option>
                  </select>
                  </div>
                </div>
                <!-- /.card-body -->

             
 
            </div>
          <!-- 버튼영역 시작 -->
            <div class="card-body">
            	<a href="/admin/member/member_list?page=${pageVO.page}" class="btn btn-primary float-right mr-1">LIST ALL</a>
            	<a href="/admin/member/member_view?page=${pageVO.page}&user_id=${memberVO.user_id}" class="btn btn-info float-right mr-1">뒤로가기</a>
              	<button type="submit" class="btn btn-danger float-right mr-1">수정</button>              	
              	<!-- a태그는 링크이동은 되지만, post값을 전송하지는 못합니다. 그래서, button태그를 사용. -->
            </div>
          <!-- 버튼영역 끝 -->
          <input name="page" type="hidden" value="${pageVO.page}"/>
          
          </form>
          <!-- 폼내부에 버튼이 있어야지만, 전송버튼이 작동 됩니다. -->
          
          </div>
        </div>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp"%>