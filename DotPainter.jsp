<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Table Cell Click</title>
  <style>
    body {
      margin: 0;
      padding: 0;
    }

    table {
      border-collapse: collapse;
      border: 1px solid rgba(0, 0, 0, 0.1);
    }

    td {
      border: 1px solid rgba(0, 0, 0, 0.1);
      padding: 5px;
      cursor: pointer;
    }
  </style>
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      var table = document.getElementById("myTable");
      var colorPicker = document.getElementById("colorPicker");
      var selectedColor = localStorage.getItem("selectedColor") || "black"; // 초기 접속 시 저장된 색상 또는 기본 색상

      //컬러 픽커 색상 변경. 클라이언트가 색상을 변경할 시 selectedColor의 값이 변경됨.
      colorPicker.addEventListener("change", function(event) {
        selectedColor = event.target.value;
        localStorage.setItem("selectedColor", selectedColor); // 선택한 컬러를 저장
      });

      // 테이블 생성. 반복문으로 100 * 100 테이블 생성
      <% for (int i = 0; i < 100; i++) { %>
        var row = table.insertRow(<%= i %>);
        <% for (int j = 0; j < 100; j++) { %>
          var cell = row.insertCell(<%= j %>);
          cell.addEventListener("click", function(event) { //각 셀에 대해 클릭 이벤트 리스너 등록
        	  var loggedIn = "<%= session.getAttribute("loggedIn") %>";
              if (loggedIn != "true") {
                alert("로그인 후 이용해 주세요.");
                return;
              }
        	  
        	  var clickedCell = event.target;
            clickedCell.style.backgroundColor = selectedColor; //클릭된 셀에 배경을 selectedColor의 값으로 변경.
            
            saveCellColor(<%= i %>, <%= j %>, selectedColor); //서버에 셀의 위치와 색상 정보 저장.
          });
        <% } %>
      <% } %>
		
      //컬러 서버에 저장. SaveCellColor.jsp 넘김
      function saveCellColor(rowIndex, cellIndex, color) {
        var xhttp = new XMLHttpRequest();
        xhttp.open("POST", "SaveCellColor.jsp", true); //컨트롤러 서블릿으로 컬러 저장 요청
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        
        var params = "&row=" + rowIndex + "&col=" + cellIndex + "&color=" + color
        
        xhttp.send(params);        
      }
      
      initTable();
      // 10초마다 테이블 업데이트
      setTimeout(updateTable, 10000);

      function initTable() {
          var xhttp = new XMLHttpRequest();
          xhttp.onreadystatechange = function() {
          	  if (this.readyState == 4 && this.status == 200) {	        	
  	        	<% String jsonData = (String) session.getAttribute("jsonData"); %>
  	        	var jsonData = JSON.parse('<%= jsonData%>');

          	    var paintDataList = jsonData.paintDataList;

          	    for (var i = 0; i < paintDataList.length; i++) {
          	      var paintData = paintDataList[i];
          	      var row = paintData.row;
          	      var col = paintData.col;
          	      var color = "rgb(" + paintData.red + "," + paintData.green + "," + paintData.blue + ")"
          	      var cell = table.rows[row].cells[col];
          	      cell.style.backgroundColor = color;
          	    }
          	  }
          };
          xhttp.open("GET", "UpdateTable.jsp", true);
          xhttp.send();
        }
      function updateTable() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
        	  if (this.readyState == 4 && this.status == 200) {	        	
	        	<% jsonData = (String) session.getAttribute("jsonData"); %>
	        	var jsonData = JSON.parse('<%= jsonData%>');

        	    var paintDataList = jsonData.paintDataList;

        	    for (var i = 0; i < paintDataList.length; i++) {
        	      var paintData = paintDataList[i];
        	      var row = paintData.row;
        	      var col = paintData.col;
        	      var color = "rgb(" + paintData.red + "," + paintData.green + "," + paintData.blue + ")";
        	      var cell = table.rows[row].cells[col];
        	      cell.style.backgroundColor = color;
        	    }
        	    localStorage.setItem("selectedColor", selectedColor); // 현재 선택된 컬러를 저장
                location.reload(); // 페이지 리로드
        	  }
        };
        xhttp.open("GET", "UpdateTable.jsp", true);
        xhttp.send();
      }
    });
  </script>
</head>
<body>
  <input type="color" id="colorPicker">
  <table id="myTable"></table>
</body>
</html>
