# iumui
<p>이으미(iumui)</p>
자바63기 프로젝트과제<br>
 -> 인원을 모집하여 그룹을 만드는 시작일과 종료일이 있는 Grouping Service입니다.<br>
 -> Gradle로 build하고 Spring MVC framework로 구축하였습니다.<br>
 -> jsp를 사용하지 않았으며, html페이지에서 ajax, handlebars JS, require JS, text.js를 사용하여 비동기방식으로<br>
   Web Asset(script, data 등)교체됩니다.<br>
 -> 로그인시 session으로 로그인 정보를 넘기고, 로그아웃시 session을 종료시킵니다.<br>
 -> 유효성검사는 focus가 이동할 때, 또는 Key Up이벤트가 발생하였을때 실시간으로 database에서 조회를 합니다.<br>
 <br>
 -> Database는 MySql을 사용하고있습니다.<br>
 -> GlobalInitBinder 클래스에서는 요청되는 Date.Class값을 메서드와 바인딩하여, yy-MM-dd식으로 표현하게 했습니다.<br>
  <br>
 -> Servlet의 이름은 학습을 조건으로 하여 'dispatcher'라는 이름으로 하나만 사용하고 있습니다.(mapping은 *.do)<br>
 -> 현재 jsp를 사용하지 않고 html페이지로 사용하기 때문에, ViewResolver는 주석처리 해놓았습니다.<br>
<br>
  1) data-base mysql로 교체<br>
      &nbsp; ㄴ xml문 oracle 쿼리에서 mysql 쿼리로 교체 진행중<br>
  2) 스캐닝이 긴 SQL문 교체 진행중<br>
  3) 불필요한 maven repository source 제거<br>
  4) 주석 제거<br>
  5) 불필요한 Object들 제거중<br>
  6) 서버사이드의 폴더 구조 및 객체명 재구성<br>
      &nbsp;  ㄴ 불필요한 폴더 삭제<br>
      &nbsp;  ㄴ 잘못된 파일, 폴더명 교체<br>
      &nbsp;  ㄴ 불필요한 camelCase, underbar(_) 제거<br>
      &nbsp;  ㄴ 중복되는 jquery문 제거중<br>
  
