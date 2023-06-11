# 웹 페인터 프로젝트
세종대학교_소프트웨어학과_19011625_허진수
2023-1학기 SM-소셜웹프로그래밍 개인기말프로젝트

## 시연영상

[![Video Label](https://img.youtube.com/vi/GcajhBmWpvQ/0.jpg)](https://youtu.be/GcajhBmWpvQ)

## Feature
- 웹에서 다른 사람들과 같이 화면에 도트를 찍으며 즐길 수 있습니다.
- 다른 사람이 찍은 도트도 자신의 화면에 같이 공유되기 때문에 서로 원하는 그림을 그리기 위해 경쟁 해야합니다.
- 도트 그림판은 10초마다 화면이 업데이트 됩니다. 서버에는 10초마다 도트를 찍은 로그와 도트 데이터가 따로 저장됩니다.
- 도트를 찍으면 서버에 로그가 남고, 최종 적으로 그림판에 적용된 도트들의 정보도 따로 저장됩니다.
- 도트 그림판 옆에는 채팅창이 있습니다.
- 채팅창은 1초마다 서버로부터 채팅을 가져와 업데이트 합니다.
- 채팅 기록은 서버내 메모리에 20개씩 저장되었다가 20개를 넘어가면 10개식 데이터에 저장합니다.
- 로그인 시스템은 SQL을 이용하여 계정 생성 및 로그인 기능을 구현하였습니다.
- 채팅 및 그림판을 사용하기 위해서는 로그인을 필수적으로 해야합니다. 그러나 화면 업데이트는 로그인을 하지 않아도 진행되어 웹에 접속한 모든 클라이언트는 항상 최신 화면을 공유할 수 있습니다.


## Develop

### JSP 페이지
#### Main.jsp
- 웹 메인 페이지 입니다.
- menu.jsp는 include하였고, DotPainter.jsp와 chat.jsp는 iframe으로 화면을 분리하였습니다.

#### menu.jsp
- 메뉴 화면입니다.
- 비로그인 상태일 시 로그인 버튼이 생기고, 로그인 상태일 시 로그아웃 버튼이 생깁니다.

#### loginForm.jsp
- 로그인 화면입니다.
- 아이디, 비밀번호를 입력하지 않으면 화면이 넘어가지 않습니다.
- 아이디, 비밀번호를 입력한 후 로그인 버튼을 누르면 checking.jsp로 parameter가 넘어간 후, checking.jsp에서 session에 정보를 담아 login.do로 LoginHandler에 넘깁니다.
- LoginHandler에서 로그인 성공 여부를 판단한 후 loggedIn.jsp로 넘겨 클라이언트에게 로그인 성공 여부를 알려줍니다. 로그인 실패 시 다시 loginForm.jsp로 넘어가고 로그인 성공 시 Main.jsp로 넘어갑니다.

#### signUp.jsp
- 계정 등록 화면입니다.
- 아이디, 비밀번호, 닉네임, 이메일을 입력한 후 계정 생성 버튼을 눌러야 다음 페이지로 넘어갑니다.
- 계정 생성 버튼을 누르면 signUpChecking.jsp로 parameter가 넘어간 후, signUpChecking.jsp에서 session에 정보를 담아 signUp.do로 SignUpHandler에 넘깁니다.
- SignUpHandler에서 계정 생성 성공 여부를 판단한 후 signUpSucess.jsp로 넘겨 클라이언트에게 계정 생성 성공 여부를 알려줍니다. 계정 등록 성공 시 loginForm.jsp로 넘어가고 계정 등록 실패 시 signUp.jsp로 넘어갑니다.

### DotPainter.jsp
- 도트 그림판 화면입니다.
- Http 프로토콜을 이용해 비동기식으로 클라이언트가 도트를 찍은 정보를 저장하거나 10초마다 그림판 화면을 최신화합니다.
- 로그인 상태일 시에만 도트를 찍을 수 있습니다.
- 로그인 상태일 경우 EventListener에서 클라이언트가 클릭한 도트의 좌표를 확인한 후 saveCellColor 함수로 좌표와 컬러 픽커에서 선택한 색상을 넘깁니다.
- saveCellColor는 좌표와 색상을 인자로 받고, http프로토콜을 이용해 비동기식으로 SaveCellColor.jsp로 parameter를 넙깁니다.
- SaveCellColor.jsp에서 parameter를 session에 저장하고 paint.do로 PaintHandler에 넘깁니다.
- PaintHandler에서 정보를 저장하고 DotPainter.jsp로 다시 넘깁니다.
- initTable 함수는 클라이언트가 처음 화면을 로딩했을 때 Http 프로토콜을 이용해 비동기식으로 UpdateTable.jsp로 넘어가 UpdatePainterHandler를 실행하여 화면을 업데이트 합니다.
- updateTable은 initTable과 거의 기능적으로 유사하나 클라이언트가 화면에 접속한 10초 후에 실행되며 UpdatePaintHandler를 실행하여 컬러 색상을 최신화하고 화면을 reload합니다.

### chat.jsp
- 채팅 화면입니다.
- chatData.jsp는 iframe으로 구성되어 실시간 채팅을 보여줍니다.
- text로 chatMessage를 입력받아 전송을 누르면 chatchecking.jsp로 parameter가 넘어가고 chatChecking.jsp에서 session에 정보를 담아 chat.do로 ChatHandler에 넘깁니다.
- ChatHandler에서 채팅 정보를 저장한 후, chatSubmited.jsp로 넘깁니다. chatSubmited.jsp는 chat.jsp로 넘깁니다.

### chatData.jsp
- 실제 채팅이 보여지는 화면입니다.
- 처음 화면으로 접속하면 initChatdata 함수를 통해 현재 서버에 저장된 채팅 데이터를 가져옵니다. Http 프로토콜을 통해 비동기식으로 updateChatSend.jsp로 넘어가 updateChat.do로 UpdateChatHandler를 실행하여 채팅 데이터를 가져옵니다.
- 그 후 10초 후에 fetchChatData를 호출하여 다시 해당 작업을 수행한 후 reload합니다.
- updateChatData 함수는 session에 JSON형태로 저장된 채팅 데이터를 읽어 HTML div에 chatContainer에 MTML문을 작성합니다.

### Data Struct
#### ChatData.java
- 채팅 데이터 구조입니다.
- `String chatData, String userName, Date date, String chatId`를 저장합니다.
- equals를 override하여 chatId가 같을 경우 같은 채팅 데이터라고 판단합니다.

#### PaintData.jsp
- 페인트 데이터 구조입니다.
- `Integer row, Integer colum, Color color, Date time`을 저장합니다.
- equals를 override하여 row와 colum이 같을 경우 같은 페인트 데이터라고 판단합니다.
- hashCode를 override하여 row와 colum에 대한 해쉬값을 반환합니다.
 
#### UserData.java
- 유저 데이터 구조입니다.
- `String id, String password, String userName, String email, Integer dotNum, Calendar lastAccessTime`을 저장합니다.

#### PaintDataReader.java
- 페인터 데이터를 읽어 Set 형태로 반환합니다.

### Servlet & Handler
#### ControllerServlet.java
- 컨트롤러 서블릿입니다.
- commandHandler.properties 파일을 읽어 핸들러 실행 명령어들을 확인합니다.

#### ChatHandler.java
- 채팅 데이터를 입력받고 서버 메모리에 저장했다가 일정 개수가 차면 chatData.txt에 채팅 기록을 저장합니다.
- 핸들러 내에서 ConcurrentLinkedDeque에 채팅 데이터를 저장합니다.
- 만약 chatDataStack에 저장된 채팅 데이터가 `MAX_CHAT_MEMORY_SIZE: 20`을 넘어가면 `SAVE_SIZE_AT_ONCE: 10` 만큼 메모리에 있는 가장 처음 채팅 기록부터 chatData.txt에 저장합니다.
- 새로운 채팅이 들어오면 userName, chatMessage, 입력 시간, chatId를 생성하여 채팅 데이터를 만들고 ConcurrentLinkedDeque chatDataStack에 저장합니다.
- chatData.txt에 기록된 채팅 로그는 다음과 같은 규격입니다. `[Time](chatId)(userName)(chatMessage)`

#### LoginHandler.java
- 클라이언트로부터 ID, password를 입력 받고, accountSQL에서 데이터를 확인하여 로그인 성공 여부를 반환합니다.
- 만약 accountSQL에 등록된 ID, password가 없을 경우 로그인 실패를 반환합니다.
- 로그인 성공 시 lastAccessTime을 업데이트 합니다.
- 접속에 성공한 userName과 loggedIn=true값을 parameter에 담아 반환합니다.

#### SignUpHandler.java
- 클라이언트로부터 id, password, userName, email을 입력 받고 계정을 생성합니다.
- 만약 이미 해당 정보로 등록된 계정이 accountSQL에 있을 경우 계정 생성을 하지 않고 계정 등록 실패를 반환합니다.
- dotNum=1, lastAccessTime=계정 생성 시간으로 등록합니다.

#### PaintHandler.java
- 클라이언트로부터 좌표, 색상 정보를 입력받고, `ConcurrentLinkedQueue paintDataQueue`에 저장합니다.
- 10초마다 paintDataQueue에 저장된 정보를 `Collections.synchronizedSet(new HashSet<>()) paintdataSet`에 반영하고 paintDataQueue에 저장된 정보는 paintLog.txt에, paintDataSet에 저장된 정보는 paintData.txt에 저장합니다.
- paintDataSet은 최종적으로 클라이언트에게 보여지는 도트 화면으로 paintDataQueue에 저장된 정보를 총집합하여 중복된 도트를 가장 최신 도트로 교체하여 저장합니다.
- paintLog.txt에 저장된 페인트 로그의 규격은 다음과 같습니다. 

  `[Sun Jun 11 08:32:42 KST 2023](11,40)(java.awt.Color[r=225,g=14,b=14])`
- paintData.txt에 저장된 페인트 데이터의 규격은 다음과 같습니다. `(12,11)(java.awt.Color[r=219,g=0,b=0])`

※ 주의: Timer를 이용해 10초마다 메모리에 있는 정보를 .txt파일에 저장하고 메모리에서 저장된 정보를 지우는 방식인데, 현재 서버를 종료할 시 Timer가 같이 종료되지 않습니다.

#### UpdatePaintHandler.java
- 클라이언트로부터 그림판 화면 업데이트를 요청받고, paintData.txt 저장된 페인트 정보를 읽어 JSON형태로 session에 저장하여 클라이언트에게 전달합니다.

#### UpdateChatHandler.java
- 클라이언트로부터 채팅 화면 업데이트를 요청받고, ChatHandler의 chatDataStack의 저장된 모든 채팅 데이터를 JSON형태로 session에 저장하여 클라이언트에게 전달합니다.
