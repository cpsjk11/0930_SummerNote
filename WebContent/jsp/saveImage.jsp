<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.sun.xml.internal.ws.encoding.xml.XMLMessage.XMLMultiPart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 첨부파일은 MultipartRequest라는 객체를 생성하면 업로드가 된다.
	// 그렇다면 우린 MultipartRequest를 어떻게 만드는지만 알고 있으면 된다.
	// 이때 인자 4개를 사용하여 생성하는 법을 알고 있다.
	// 저장되는 경로를 절대경로로 만들자!
	
 	// 이미지를 업로드를 해야한다.- 비동기 통신을 이용
	
	// 요청시 한글처리
	//request.setCharacterEncoding("utf-8");

	// 경로를 지정하기 위해 절대경로 생성
	String path = application.getRealPath("/upload_img");

	// 이미지를 받기 위해 Multpart생성
	MultipartRequest mr = new MultipartRequest(request,path,1024*1024*10, "utf-8", new DefaultFileRenamePolicy());
	// 받은 인자를 한글처리를 해야한다면 MultipartRequest생성자 안에 4번째의 "utf-8"을 지정해주면 된다.
	
	// 저장된 정확한 경로와 파일명을 반환해야 하므로 파일명을 얻어내야 한다.
	
	// 이제 받은 경로를 에디터에 보내주기 위해서 출력문 사용!
	File f = mr.getFile("upload"); // 저장된 파일객체 얻기
	String f_name = null;
	
	if(f != null)
	// 현재파일 이름 가져오기
	f_name = f.getName(); // 저장된 파일명

%>
{
   "img_url" : "<%=request.getContextPath()%>/upload_img/<%=f_name%>"
}
