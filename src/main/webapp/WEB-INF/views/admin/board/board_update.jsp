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
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">게시글등록</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->
	<!-- 본문내용 -->

	<!-- 본문내용 Main content -->
	<section class="content">
		<div class="container-fluid">

			<div class="row">
				<div class="col-12">
					<!-- 부트스트랩의 디자인 클래스 row -->
					<!-- form start -->
					<form name="write_form" action="/admin/board/board_write"
						method="post" encType="mulipart/form-data">

						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">CREATE Board</h3>
							</div>
							<!-- /.card-header -->

							<div class="card-body">
								<div class="form-group">
									<label for="title">title</label> <input type="text"
										value="${boardVO.title}" class="form-control" name="title"
										id="title" placeholder="제목을 입력해 주세요." required>
								</div>
								<div class="form-group">
									<label for="content">content</label>
									<textarea rows="5" name="content" id="content"
										class="form-control"><c:out
											value="${boardVO.content}" /></textarea>
								</div>
								<div class="form group">
									<label for="writer">writer</label> <input type="text"
										value="${boardVO.writer}" class="form-control" name="writer"
										id="writer" placeholder="작성자를 입력해 주세요" required>
								</div>
								<div class="form-group" style="margin-bottom: 0px;">
									<label>attach</label>
								</div>
								<c:forEach var="index" begin="0" end="1">
									<div class="div_file_delete">
									<div class="custom-file">
										<input type="file" name="file" class="custom-file-input"
											id="customFile_${index}"> <label class="custom-file-label"
											for="customFile" style="color: #999;">파일첨부${index}</label>
									</div>
									<c:if test="${boardVO.save_file_names[index] !=null}">
										<strong> <i class="far fa-save mr-1"></i>첨부파일</strong>
										<p class="text-muted">
											<a href="/download?save_file_name=${boardV0.save_file_names[index]}&real_file_name=${boardVO.real_file_name[index]}">
												${boardVO.real_file_names[index]}-파일다운로드- </a>
												&nbsp;
												<input type="hidden" name="save_file_name" value="${boardVO.save_file_names[index]}">
												<button class="btn btn-info btn_field_del">삭제</button>
									</p>	
									</c:if>
									<hr>
									</div>
									</c:forEach>
									</div>
							<!-- /.card-body -->



						</div>
						<!-- /.버튼영역시작 -->

						<!-- 버튼영역 -->
						<div class="card-body">
							<a
								href="/admin/board/board_view?page=${pageVO.page}&bno=${boardVO.bno}"
								class="btn btn-primary float-right mr-1">뷰화면이동</a>
							<button type="submit" class="btn btn-danger float-right mr-1 ">SUBMIT</button>
							<!-- 부트스트랩 디자인 버튼클래스를 이용해서 a태그를 버튼모양 만들기(위) -->
							<!-- btn클래스명이 버튼모양으로 변경, btn-primary클래스명은 버튼색상을 변경하는 역할 -->
						</div>
						<!-- 버튼영역 끝 -->
						<input type="hidden" name="bno" value="${boardVO.bno}"> <input
							type="hidden" name="page" value="${pageVO.page}">
					</form>
					<!-- 폼내부에 버튼이 있어야지만, 전송버튼이 작동 됩니다. -->

				</div>
			</div>

		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp"%>

<!-- 첨부파일 부트스트랩 디자인 JS-->
<script
	src="resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script>
	$(document).ready(function() {
		bsCustomFileInput.init();
	});
</script>
<link rel="stylesheet"
	href="/resources/plugins/summernote/summernote.css">
<style>
.note-editor.note-frame.fullscreen {
	background: white;
}
</style>

<script src="/resources/plugins/summernote/summernote.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('#content')
								.summernote(
										{
											height : 150,
											lang : "ko-KR",
											placeholer : '글 내용을 입력해 주세요',
											toolbar : [
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[ 'insert',
															[ 'link', 'video' ] ],//'picture',
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											fontNames : [ 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', '맑은 고딕',
													'궁서', '굴림체', '굴림', '돋음체',
													'바탕체' ],
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ]
										});
					});

	//textarea 중 content아이디영역을 섬머노트에디터로 변경처리 함수실행
</script>
<script>
$_document.ready(function(){
	$(".btn_file_delete").on {"click",function(){
		if(confirm("선택한 첨부파일을 삭제 하시겠습니까?")){
			//alert('디버그');
			var click = $(this); //클릭한 현재 엘리먼트(삭제버튼)
			var save_file_name = click_element.parent().find('input[name=save_file_name]').val()
			alert("디버그: 삭제할 파일명은" + save_file_name);return false; //자바에서 진도x
			$ajax({
				type:"post",//get방식으로 지우면 누구나 ur입력시 지우기 쉬움
				url:"/file_delete?save_file_name="+save_file_name,//RestAPI컨트롤러 호출
				dataType:"text",
				success:function(result){
					if(result\\"success") {//실제파일+DB테이블 삭제 후 화면에서도 삭제처리 (아래)
						click_element.parent().find(".div_file_delete").remove();
					}
				},
				error:function(result){
					alert("RestAPI접근에 실패했습니다.");
					//click_element.parent().find(".div_file_delete").remove(); //디버그
				}
			});	
		}
	
	});

});
</script>

