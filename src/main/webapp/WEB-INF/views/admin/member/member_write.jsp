<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

  <!-- 대시보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">회원상세보기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원등록</li>
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
              <form emcType="multipart/form-data" name="write_form" action="/admin/member/member_write" method="post">
			<div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">CREATE Member</h3>
              </div>
              <!-- /.card-header -->
         
                <div class="card-body">
                  <div class="form-group">
                    <label for="user_id">user_id</label>
                    <input type="text" class="form-control" name="user_id" id="user_id" placeholder="ID를 입력해 주세요." required>
                  </div>
                  <div class="form-group">
                    <label for="user_pw">Password</label>
                    <input type="password" class="form-control" name="user_pw" id="user_pw" placeholder="암호를 입력해주세요" required>
                  </div>
                  <div class="form-group">
                  <label for="user_name">user_name</label>
                  <input type="text" class="form-control" name="user_name" id="user_name"  placeholder="암호를 입력해주세요" required>
                  </div>
                  <div class="form group">
                  <label for="email">email</label>
                  <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력해 주세요" required>
                  </div>
                  <div class="form group">
                  <label for="point">point</label>
                  <input type="digits" class="form-control" name="point" id="point" placeholder="포인트를 입력해 주세요" required>
                  </div>
                  <div class="form-group">
                  <label for="enabled">enabled</label>
                  <select class="form-control" name="enabled" id="enabled">
                  	<option value="0">false</option>
                  	<option value="1"selected>true</option>
                  </select>
                  </div>
                      <div class="form-group">
                  <label for="levels">leveLs</label>
                  <select class="form-control" name="levels" id="levels">
                  	<option value="ROLE_ADMIN">ROLE_ADMIN</option>
                  	<option value="ROLE_ADMIN"selected>ROLE_USER</option>
                  </select>
                  </div>
                </div>
                <!-- /.card-body -->

             
 
            </div>
          <!-- 버튼영역 시작 -->
            <div class="card-body">
            	<a href="/admin/member/member_list" class="btn btn-primary float-right mr-1">LIST ALL</a>
              	<button type="submit" class="btn btn-danger float-right mr-1" disabled >SUBMIT</button>              	
              	<!-- a태그는 링크이동은 되지만, post값을 전송하지는 못합니다. 그래서, button태그를 사용. -->
            </div>
          <!-- 버튼영역 끝 -->
          
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
<!-- 첨부파일 부트스트랩 디자인 JS -->
<script src="/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<!-- 첨부파일 선택한 내용 출력 실행 -->
<script>
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>
<script>
$(document).ready(function(){
	$("#user_id").bind("blur",function(){
		//디버그용 alert("여기까지");
		var P_user_id = $(this).val();
		$.ajax({
			type:'get',
			url:'/id_check?user)id='+p_user_id,
			dataType:'text',
			success:function(result){
				alert('디버그' + result);
				if(result == '0'){
					alert('사용 가능한 아이디 입니다.');
					$(".btn-danger").attr("disabled",false);
				}else if(result == '1') {
					alert('중복 아이디가 존재 합니다.');
					$(".btn-danger").attr("disabled",true);
				}else{
					//에러메세지출력
					alert('API서버에 문제가 발생했습니다. 나중에 이용해 주세요');
				}
			}
		});
	});	
});
</script>