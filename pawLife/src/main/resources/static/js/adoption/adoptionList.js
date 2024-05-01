const writeBtn = document.querySelector("#writeBtn")

writeBtn.addEventListener("click",()=>{

    location.href="adoptionWrite"
})


/* 검색 관련된 요소 */
const searchKey = document.querySelector("#searchKey");
const searchQuery = document.querySelector("#searchQuery");
const options = document.querySelectorAll("#searchKey > option");



// 검색창에 이전 검색 기록을 남겨놓기

// 즉시 실행 함수  (() => {})();
// - 함수가 정의 되자마자 바로 실행

// 장점 1. 변수명 중복 해결
// 장점 2. 조금 더 빠름(속도적 우위)

(()=>{

  // 쿼리스트링 값을 key,value 구분해서 저장하는 객체 반환
  const params = new URL(location.href).searchParams;

  const key = params.get("key"); // t, c, tc, w 중 하나
  const query = params.get("query"); // 검색어

  if(key != null){ // 검색을 했을 때
      searchQuery.value = query; // 검색어를 화면에 출력

      // option태그를 하나씩 순차 접근해서 value가 key랑 같으면
      // selected 속성 추가
      for(let op of options){
          if(op.value == key){
              op.selected = true;
          }
      }
  }
})();