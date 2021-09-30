<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/summernote-lite.css"/>
</head>
<body>

	<form>
		<textarea rows="12" cols="50" id="content" name="s_content"></textarea>
	</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="../js/summernote-lite.js"></script>
<script src="../js/lang/summernote-ko-KR.js"></script>
<script>
	$(function(){
		$("#content").summernote({
			lang: "ko-KR",
			callbacks:{
				onImageUpload:function(files,editor){
					// 이미지가 에디터에 추가될 때 마다 수행하는 곳!
					// 이미지를 첨부하면 배열로 인식된다.
					// 이것을 서버로 비동기식 통신을 수행하면
					// 서버에 업로드를 시킬 수 있다.
					for(var i=0;i<files.length; i++)
						alert(files[i]);
					
				}
			} 
		});
	});
</script>
</body>
</html>