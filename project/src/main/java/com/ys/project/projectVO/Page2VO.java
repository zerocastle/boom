package com.ys.project.projectVO;

import lombok.Data;

@Data
public class Page2VO {
    private int pageSize;  // �� �������� ������ �Խñ� ��
    private int pageBlock; //����¡ �׺�[����] ������
    private int pageNo;  // ������ ��ȣ
    private int startRowNo; //��ȸ ���� row ��ȣ
    private int endRowNo; //��ȸ ������ now ��ȣ
    private int firstPageNo; // ù ��° ������ ��ȣ
    private int finalPageNo; // ������ ������ ��ȣ
    private int prevPageNo; // ���� ������ ��ȣ
    private int nextPageNo; // ���� ������ ��ȣ
    private int startPageNo; // ���� ������ (����¡ �׺� ����)
    private int endPageNo; // �� ������ (����¡ �׺� ����)
    private int totalCount; // �Խ� �� ��ü ��

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.makePaging();
    }

	private void makePaging() {
		// TODO Auto-generated method stub
		 // �⺻ �� ����
        if (this.totalCount == 0) return; 
        if (this.pageNo == 0) this.setPageNo(1);   //�⺻ ������ ��ȣ
        if (this.pageSize == 0) this.setPageSize(8); //�⺻ ������ ����Ʈ ������
        if (this.pageBlock == 0 ) this.setPageBlock(8); //�⺻ ������ �׺�[����] ������
        
        //--[ù ������], [������ ������] ���
        int finalPage = (totalCount + (pageSize - 1)) / pageSize; // ������ ������
        this.setFirstPageNo(1);   // ù ��° ������ ��ȣ
        this.setFinalPageNo(finalPage); // ������ ������ ��ȣ
        
        //-- [����] , [����] ������ ���
        boolean isNowFirst = pageNo == 1 ? true : false;    // ���� ������ (��ü)
        boolean isNowFinal = pageNo == finalPage ? true : false;  // ������ ������ (��ü)
        if (isNowFirst) {
            this.setPrevPageNo(1); // ���� ������ ��ȣ
        } else {
            this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // ���� ������ ��ȣ
        }
        if (isNowFinal) {
            this.setNextPageNo(finalPage); // ���� ������ ��ȣ
        } else {
            this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // ���� ������ ��ȣ
        }
                
        //-- ����¡ �׺�[����]�� ���
        int startPage = ((pageNo - 1) / pageBlock) * pageBlock + 1; // ���� ������ (����¡ �׺� ����)
        int endPage = startPage + pageBlock - 1;      // �� ������ (����¡ �׺� ����)

        // ����¡ �׺� ���� [20-30] �ε� ������ �������� 28 �� ��� 
        // [29, 30] �������� ����¡ �׺� �̳��� �ؾ� �Ѵ�.
        if (endPage > finalPage) { // [������ ������ (����¡ �׺� ����) > ������ ������] ���� ū ��� 
            endPage = finalPage;  
        }
        this.setStartPageNo(startPage); // ���� ������ (����¡ �׺� ����)
        this.setEndPageNo(endPage);  // �� ������ (����¡ �׺� ����)



        //--��ȸ ���� row, ��ȸ ������ row ���
        int startRowNo = ( (pageNo-1) * pageSize ) + 1;
        int endRowNo = pageNo * pageSize; 
        setStartRowNo( startRowNo );
        setEndRowNo( endRowNo );

	}
 

}
