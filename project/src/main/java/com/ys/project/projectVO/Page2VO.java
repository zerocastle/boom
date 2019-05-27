package com.ys.project.projectVO;

import lombok.Data;

@Data
public class Page2VO {
    private int pageSize;  // 한 페이지에 보여줄 게시글 수
    private int pageBlock; //페이징 네비[블록] 사이즈
    private int pageNo;  // 페이지 번호
    private int startRowNo; //조회 시작 row 번호
    private int endRowNo; //조회 마지막 now 번호
    private int firstPageNo; // 첫 번째 페이지 번호
    private int finalPageNo; // 마지막 페이지 번호
    private int prevPageNo; // 이전 페이지 번호
    private int nextPageNo; // 다음 페이지 번호
    private int startPageNo; // 시작 페이지 (페이징 네비 기준)
    private int endPageNo; // 끝 페이지 (페이징 네비 기준)
    private int totalCount; // 게시 글 전체 수

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.makePaging();
    }

	private void makePaging() {
		// TODO Auto-generated method stub
		 // 기본 값 설정
        if (this.totalCount == 0) return; 
        if (this.pageNo == 0) this.setPageNo(1);   //기본 페이지 번호
        if (this.pageSize == 0) this.setPageSize(8); //기본 페이지 리스트 사이즈
        if (this.pageBlock == 0 ) this.setPageBlock(8); //기본 페이지 네비[블록] 사이즈
        
        //--[첫 페이지], [마지막 페이지] 계산
        int finalPage = (totalCount + (pageSize - 1)) / pageSize; // 마지막 페이지
        this.setFirstPageNo(1);   // 첫 번째 페이지 번호
        this.setFinalPageNo(finalPage); // 마지막 페이지 번호
        
        //-- [이전] , [다음] 페이지 계산
        boolean isNowFirst = pageNo == 1 ? true : false;    // 시작 페이지 (전체)
        boolean isNowFinal = pageNo == finalPage ? true : false;  // 마지막 페이지 (전체)
        if (isNowFirst) {
            this.setPrevPageNo(1); // 이전 페이지 번호
        } else {
            this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // 이전 페이지 번호
        }
        if (isNowFinal) {
            this.setNextPageNo(finalPage); // 다음 페이지 번호
        } else {
            this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // 다음 페이지 번호
        }
                
        //-- 페이징 네비[블록]을 계산
        int startPage = ((pageNo - 1) / pageBlock) * pageBlock + 1; // 시작 페이지 (페이징 네비 기준)
        int endPage = startPage + pageBlock - 1;      // 끝 페이지 (페이징 네비 기준)

        // 페이징 네비가 만약 [20-30] 인데 마지막 페이지가 28 인 경우 
        // [29, 30] 페이지는 페이징 네비에 미노출 해야 한다.
        if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우 
            endPage = finalPage;  
        }
        this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
        this.setEndPageNo(endPage);  // 끝 페이지 (페이징 네비 기준)



        //--조회 시작 row, 조회 마지막 row 계산
        int startRowNo = ( (pageNo-1) * pageSize ) + 1;
        int endRowNo = pageNo * pageSize; 
        setStartRowNo( startRowNo );
        setEndRowNo( endRowNo );

	}
 

}
