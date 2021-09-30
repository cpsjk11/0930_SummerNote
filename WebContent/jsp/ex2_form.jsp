<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/summernote-lite.css"/>
<style>
	table caption{
		text-indent: -9999px;
		height: 0;
	}
	.btn{
		width: 70px;
		height: 20px;
		text-align: center;
		padding: 0;
		float: right;
	}
	.btn a{
		display: block;
		width: 100%;
		padding: 4px;
		height: 20px;
		line-height: 20px;
		background: #27a;
		color: #fff;
		border-radius: 3px;
		text-decoration: none;
		font-weight: bold;
		font-size: 12px;
	}
	.btn a:hover{
		background: #fff;
		color: #27a;
		border: 1px solid #27a;
	}
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<h1>SummerNote Editor연습</h1>
		</header>
		<article>
			<form action="" method="post" name="frm">
				<table>
					<caption>폼 테이블</caption>
					<colgroup>
						<col width="100px"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<th><label for="title">제목:</label></th>
							<td>
								<input type="text" id="title" name="title"/>
							</td>
						</tr>
						<tr>
							<th><label for="part">구분:</label></th>
							<td>
								<select id="parh" name="parh">
									<option> 선택하세요 </option>
									<option value="language"> 프로그래밍 </option>
									<option value="db"> 데이터베이스</option>
									<option value="os"> 운영체제</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="plat">플렛폼:</label></th>
							<td>
								<input type="radio" id="plat" name="plat" value="mobile"/>모바일&nbsp;&nbsp;
								<input type="radio" id="plat2" name="plat" value="desktop"/>데스크탑&nbsp;&nbsp;
								<input type="radio" id="plat3" name="plat" value="tablet"/>테블릿&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th><label for="interest">관심분야:</label></th>
							<td>
								<input type="checkbox" id="interest" name="interest" value="blockchain"/>블록체인&nbsp;&nbsp;
								<input type="checkbox" id="interest2" name="interest" value="iot"/>사물인터넷&nbsp;&nbsp;
								<input type="checkbox" id="interest3" name="interest" value="car"/>자동차&nbsp;&nbsp;
								<input type="checkbox" id="interest4" name="interest" value="metacerse"/>메타버스&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th><label for="content">내용:</label></th>
							<td>
								<textarea rows="12" cols="50" id="content" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:right">
								<p class="btn">
									<a href="javascript:exe()">
										보내기
									</a>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</article>
	</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="../js/summernote-lite.js"></script>
<script src="../js/lang/summernote-ko-KR.js"></script>
<script>
	$(function(){
		$("#content").summernote({
			lang: "ko-KR",
			width: 750,
			height: 300,
			maxHeight: 400,
			minHeight: 200,
			
			callbacks:{
				onImageUpload:function(files,editor){
					// 이미지가 에디터에 추가될 때 마다 수행하는 곳!
					// 이미지를 첨부하면 배열로 인식된다.
					// 이것을 서버로 비동기식 통신을 수행하면
					// 서버에 업로드를 시킬 수 있다.
					for(var i=0;i<files.length; i++)
						sendImg(files[i],editor);// 이미지를 서버에 업로드
					
				}
			} 
		});
		$("#content").summernote("lineHeight",0.7); // 라인 높이 지정은 아직 따로 만들어 지정해줘야 한다.
	});
	
	function sendImg(file,editor){
		// 서버로 이미지 파일을 보내기 위해 폼 객체 준비!
		var frm = new FormData(); // <form></form>이렇게 만든것과 같다 내장 함수이다.
		
		// 보내고자 하는 자원을 (form에)파라미터 값으로 등록
		frm.append("upload",file); // 폼객체 안에 "upload"라는 이름으로 파일이 등록 되었다.
		
		// 비동기식 통신
		$.ajax({
			url: "saveImage.jsp",
			data: frm, // 전달하고자 하는 파라미터
			type:"post", // 전송방식
			contentType: false,
			processData: false, // 위의 내용을 지정해야 일반적인 데이터 전송이 아님을 증명한다.(파일첨부시 반드시 해야한다.)
			dataType: "json", // 반환 받는 값이 JSON표기법으로 받는다.
		}).done(function(data){
			// 이미지가 서버의 upload_img폴더에 저장 성공시
			// 이미지 경로를 "img_url"이라는 이름으로 data에 저장되어 넘어온다.
			// 받은 이미지 경로를 가지고 img태그를 만든 후 
			// 그것을 에디터에 넣어주면 된다.
			//var image = $("<img>").attr("src",data.img_url);
			// <img src="/upload_img/test.jpg"/>
			//alert(data);
			//$("#content").summernote("insertNode",image[0]);
			
			
			// 또 다른 방법
			$("#content").summernote("editor.insertImage",data.img_url);
		});
	}
</script>
</body>
</html>











