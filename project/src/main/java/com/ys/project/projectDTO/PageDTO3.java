package com.ys.project.projectDTO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO3 {
	// noticeBoard 처리
	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int total;
	private Criteria3 cri3;

	public PageDTO3(Criteria3 cri3, int total) {
		this.cri3 = cri3;
		this.total = total;

		// 현제 페이지가 11 페이지라고 한다면 2 * 6 = 12이 마지막 페이지에 개수가 된다
		this.endPage = (int) (Math.ceil(cri3.getPageNum() / 10.0)) * 10;

		this.startPage = this.endPage - 9; // 여기는 11 이 되고

		// 총 112 페이가 있다고 한다면 12페이지 실제 마지막 페이지라고 알수 있다.
		int realEnd = (int) (Math.ceil((total * 1.0) / cri3.getAmount()));

		// 계산된 마지막 페이지는 20 인데 만약 마지막 페이지가 작다면 그 새끼를 대입해준다.
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		// 시작 페이가 1 이상 첫페이가 아니라면 모두 앞으로 갈수 있다는 것이다. true
		this.prev = this.startPage > 1;

		// 계산된 마지막 페이지가 안온다면 다음으로 넘길수 있다. true
		this.next = this.endPage < realEnd;

	}
}
