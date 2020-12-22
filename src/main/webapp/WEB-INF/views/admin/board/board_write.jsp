<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

  <!-- 대시보드 본문 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- 본문헤더 Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">게시글등록</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">게시글등록</li>
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
              <form name="write_form" action="/admin/board/board_write" method="post" encType="mulipart/form-data">
              
			<div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">CREATE Board</h3>
              </div>
              <!-- /.card-header -->
         
                <div class="card-body">
                  <div class="form-group">
                    <label for="title">title</label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요." required>
                  </div>
                  <div class="form-group">
                  <label for="content">content</label>
				  <textarea rows="5" name="content" id="content" class="form-control"></textarea>
                  </div>
                  <div class="form group">
                  <label for="writer">writer</label>
                  <input type="text" class="form-control" name="writer" id="writer" placeholder="작성자를 입력해 주세요" required>
                  </div>
                  <div class="form-group" style="margin-bottom:0px;">
                  <label>attach</label>
                  </div>
           		  <div class="custom-file">
                  <input type="file" name="file" class="custom-file-input" id="customFile">
                  <label class="custom-file-label" for="customFile" style="color:#999;">파일첨부</label>
                    </div>
                </div>
                <!-- /.card-body -->

             
 
            </div>
              <!-- /.버튼영역시작 -->
      
  			    <!-- 버튼영역 -->
  		       <div class="card-body">
           	   <a href="/admin/board/board_list" class="btn btn-primary float-right mr-1">LIST-ALL</a>
       	       <button type="submit" class="btn btn-danger float-right mr-1 ">SUBMIT</button>
       	       <!-- 부트스트랩 디자인 버튼클래스를 이용해서 a태그를 버튼모양 만들기(위) -->
       	       <!-- btn클래스명이 버튼모양으로 변경, btn-primary클래스명은 버튼색상을 변경하는 역할 -->
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

<!-- 첨부파일 부트스트랩 디자인 JS-->
<script src="resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script>
$(document).ready(function () {
  bsCustomFileInput.init();
});
</script>