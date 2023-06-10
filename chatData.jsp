<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
  // XMLHttpRequest를 이용하여 서버로부터 채팅 내용을 받아옵니다.
  function fetchChatData() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
      if (this.readyState == XMLHttpRequest.DONE && this.status == 200) {
         updateChatData(); // 받은 채팅 내용을 업데이트하는 함수 호출
         location.reload(); // 페이지 리로드
      }
    };
    xhr.open('GET', 'updateChatSend.jsp', true);
   	xhr.send();
  }
  function initChatData() {
	    var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function() {
	      if (this.readyState == XMLHttpRequest.DONE && this.status == 200) {
	         updateChatData(); // 받은 채팅 내용을 업데이트하는 함수 호출
	      }
	    };
	    xhr.open('GET', 'updateChatSend.jsp', true);
	   	xhr.send();
	  }
  // 채팅 내용을 업데이트하는 함수
  function updateChatData() {
	  <% String chatDataList = (String) session.getAttribute("chatDataList"); %>
    	if (<%= chatDataList%> != null) {
		  	var chatDataJSON = JSON.parse('<%= chatDataList%>');
	
	    	var chatContainer = document.getElementById("chatContainer");
			
	    	var chat = "";

	    	var chatDataList = chatDataJSON.chatDataList;
	        for (var i = 0; i < chatDataList.length; i++) {
	          var chatMessage = chatDataList[i].chatData;
	          var userName = chatDataList[i].userName; 
	          
	          chat += userName + ": " + chatMessage + "<br>";
	        }
	        chatContainer.innerHTML = chat;
    	}
  }

  initChatData();
  // 일정 시간마다 채팅 내용을 업데이트하기 위해 setInterval을 사용합니다.
  setTimeout(fetchChatData, 1000); // 1초(1000ms)마다 호출

</script>
<body>
	<div id="chatContainer">
	
	</div>
</body>
</html>