<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://bernii.github.io/gauge.js/dist/gauge.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.0/css/all.css"
   integrity="sha384-Mmxa0mLqhmOeaE8vgOSbKacftZcsNYDjQzuCOm6D02luYSzBG8vpaOykv9lFQ51Y" crossorigin="anonymous">   
<link rel="stylesheet" type="text/css" href="/resources/css/productView.css" />
<script src="resources/customJs/productView.js"></script>

            <div class="shCMSshop">
               <div class="shopView">
                  <div class="viewHeader">
                     <!-- 상품이미지 -->
                     <div class="productImg">
                        <div class="mainImg">
                           <img src="http://placehold.it/500x500" alt="">
                        </div>
                        <ul class="subImg">
                           <li><img src="http://placehold.it/85x85"" alt="서브 이미지1"></li>
                           <li><img src="http://placehold.it/85x85"" alt="서브 이미지2"></li>
                           <li><img src="http://placehold.it/85x85"" alt="서브 이미지3"></li>
                           <li><img src="http://placehold.it/85x85"" alt="서브 이미지4"></li>
                        </ul>
                     </div>
                     <!-- 상품 설명 -->
                     <div class="productInfo">
                        <h1>나이키 에어포스</h1>
                        <div class="price">
                           <span class="sale-price">35,000원</span>
                        </div>
                        <div class="manufact">상품상태 <span>미사용(새물품)</span></div>
                        <div class="categori">교환여부 <span>교환 불가능</span></div>
                        <div class="origin">거래지역 <span>대구 광역시 북구 복현동 1동</span></div>
                        <div class="race"> 직플레이스 <span> #복현 1동 다이소</span></div>

                        <div class="manner">
                           <span>
                              <i class="fas fa-user-circle"></i>
                           </span>
                           <div>
                              <label class="nick">샘 오취리</label>
                           </div>

                           <div>
                              <label class="adrs">북구 복현1동</label>
                           </div>
                        
                           <div>
                              <canvas id="foo" height="120px" width="200px" class="foo" ></canvas>
                              <!-- <button id="zero" value="0">Zero</button> -->
                              </div>
                        
                        
                        
                        </div>
                        <div class="btn">
                           <a href="">찜</a>
                           <a href="">연락하기</a>
                        </div>
                     </div>
                  </div>
                  <!-- 하단의 탭부분 시작 -->
                  <div class="viewBody">
                     <ul class="contentNav">
                        <li class="active"><a href="">상품 정보</a></li>
                        <li><a href="">상품 문의<span>(<span class="count">20</span>)</span></a></li>
                        <!-- <li><a href="">Q & A <span></span></a></li>
                           <li><a href="">반품 / 교환</a></li> -->
                     </ul>
                     <!-- 탭부분 끝 -->
                     <!-- 상품정보 -->
                     <div class="info">
                        <div>
                           <span class="infoo">상품정보</span>

                           <hr style="margin-top: 50px; border-color: gray">

                           <div class="cont">
                              <div class="username">
                                 <label>샘오취리</label>
                              </div>

                              <div class="account">
                                 <label class="ac">나이키 공홈에서 산 정품입니다. <br>한번도 신지 않았습니다.<br>쿨거래 합니다 </label>

                              </div>
                           </div>

                              <div class="user" style="z-index: 1; position: relative;">
                                 <div style="display: inline-block; z-index: 2; position: relative;">
                                 <span>
                                    <i class="fas fa-user-circle" style="top:15px;"></i>
                                 </span>
                                 </div>
                                 <div style="display: inline-block; z-index: 3; position: relative;">
                                 <!-- <div class="nick1"> -->
                                    <div>
                                    <label>샘 해밍턴</label>
                                 </div>
                                 <!-- <div class="adrs1"> -->
                                    <div style="display: inline-block; z-index: 4; position: relative;">
                                    <label>대구 북구 복현1동</label>
                                 </div>
                              </div>

                              <!--shit-->
                              <div >
                                 <canvas id="foo2" height="90px" width="150px" class="foo2" ></canvas>
                              </div>
                              </div>
                           
                        </div>
                        
                        <div class="box">
                        
                            <div class="box1">
                        <label>직플레이스 선정</label>
                        
                           </div>
                     
                        <div class="box2">
                           <label>#복현동 다이소<br>
                                 #복현동 봄봄</label>
                           
                        
                        </div>
                     
                     </div>
                     
                     </div>






                     <!-- <table class="tproduct-info active">
                           <tr>
                              <td>제품명</td>
                              <td>장수애 열무김치</td>
                              <td>식품의 유형</td>
                              <td>기타김치/비살균제품</td>
                           </tr>
                           <tr>
                              <td>용량</td>
                              <td>1kg ,3kg, 5kg</td>
                              <td>제조사</td>
                              <td>농업회사법인 움채주식회사</td>
                           </tr>
                           <tr>
                              <td>제조년월일</td>
                              <td>제조일로부터 일주일이내 포장된 제품으로 발송됩니다.</td>
                              <td>품질유지기한</td>
                              <td>제조일로부터 120일</td>
                           </tr>
                           <tr>
                              <td>보관방법</td>
                              <td colspan="3">김치는 숨을 쉬는 발효식품입니다. 받으시면 꼭 김치통에 옮겨서 보관해주세요. 익혀서 드실 경우 포기에 기포가 살짝 생길 때까지 기다리신 후 김치 냉장고에 넣어 드시면 됩니다.</td>
                           </tr>
                           <tr>
                              <td>원재료명 및 함량</td>
                              <td colspan="3">“열무 80.04%[국산], 고춧가루 3.04$[국산]. 열무 80.04%[국산], 고춧가루 3.04$[국산]. 열무 80.04%[국산], 고춧가루 3.04$[국산]. 열무 80.04%[국산], 고춧가루
            3.04$[국산]. 열무 80.04% [국산], 고춧가루 3.04$[국산].  열무 80.04%[국산]</td>
                           </tr>
                        </table> -->
                     <!-- 상품 후기 -->
                     <table class="tproduct-review">
                        <thead>
                           <tr>
                              <td>평점</td>
                              <td>내용</td>
                              <td>작성자</td>
                              <td>작성일</td>
                           </tr>
                        </thead>
                        <tr>
                           <td>별점</td>
                           <td class="tcontent"><img src="" alt=""><span>내용 - 짧은 내용(동해물과 백두산이 마르고 닳도록 하느님이 보우하사
                                 우리나라만세</span></td>
                           <td>rud***</td>
                           <td>2017-09-26 10:20</td>
                        </tr>
                        <tr class="detail-content">
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                        </tr>
                        <tr>
                           <td>별점</td>
                           <td class="tcontent"><img src="" alt=""><span>내용 - 짧ㅁㄴㅇㄻㄴㅇㄻㄴ은 내용(동해물과 백두산이 마르고 닳도록
                                 블라불라블라 </span></td>
                           <td>rud***</td>
                           <td>2017-09-26 10:20</td>
                        </tr>
                        <tr class="detail-content">
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                        </tr>
                        <tr>
                           <td>별점</td>
                           <td class="tcontent"><img src="" alt=""><span>내용 - 짧은 내용(동해물과 백두산이 마르고 닳도록 </span>
                           </td>
                           <td>rud***</td>
                           <td>2017-09-26 10:20</td>
                        </tr>
                        <tr class="detail-content">
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                        </tr>
                     </table>
                     <!-- Q & A  -->
                     <table class="tquestion">
                        <thead>
                           <tr>
                              <td>번호</td>
                              <td colspan="2">내용</td>
                              <td>작성자</td>
                              <td>작성일
                                 <a href="">문의 하기</a>
                              </td>
                           </tr>
                        </thead>
                        <tr>
                           <td>글번호</td>
                           <td class="answer-no">미완료</td>
                           <td class="tcontent">내용 - 문의</td>
                           <td>rud***</td>
                           <td>2017-09-26 10:20</td>
                        </tr>
                        <tr>
                           <td>글번호</td>
                           <td class="answer-ok">답변완료</td>
                           <td class="tcontent">내용 - 문의</td>
                           <td>rud***</td>
                           <td>2017-09-26 10:20</td>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
