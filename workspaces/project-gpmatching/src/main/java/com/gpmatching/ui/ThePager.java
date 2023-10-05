package com.gpmatching.ui;

public class ThePager {
	
	private int pageSize;//한 페이지당 데이터 개수
	private int pagerSize;//번호로 보여주는 페이지 Link 개수
	private int dataCount;//총 데이터 수
	
	private int pageNo;//현재 페이지 번호
	private int pageCount;//총 페이지 수
	
	private String linkUrl;//페이저가 포함되는 페이지의 주소
	
	
	public ThePager(int dataCount, int pageNo, 
		int pageSize, int pagerSize, String linkUrl) {
		
		this.linkUrl = linkUrl;
		
		this.dataCount = dataCount;
		this.pageSize = pageSize;
		this.pagerSize = pagerSize;
		this.pageNo = pageNo;		
		pageCount = 
			(dataCount / pageSize) + ((dataCount % pageSize) > 0 ? 1 : 0); 
	}
	
	public String toString(){
		StringBuffer linkString = new StringBuffer(2048);
		
		//1. 처음, 이전 항목 만들기
		if (pageNo > 1) {
			linkString.append(
				String.format("<li class='page-item'> "
						+ "      <a class='page-link' href='%s?pageNo=1' aria-label='Previous'> "
						+ "        <span aria-hidden='true'><i class='mdi mdi-chevron-double-left'></i></span> "
						+ "      </a> "
						+ "     </li>", linkUrl));
			linkString.append(
				String.format("<li class='page-item'> "
					+ "          <a class='page-link' href='%s?pageNo=%d' aria-label='Previous'> "
					+ "            <span aria-hidden='true'><i class='mdi mdi-chevron-left'></i></span> "
					+ "          </a> "
					+ "        </li>", linkUrl, pageNo - 1));
			
		} else {
			linkString.append("<li class='page-item disabled'> "
					+ "          <a class='page-link'' aria-label='Previous'> "
					+ "            <span aria-hidden='true'><i class='mdi mdi-chevron-double-left'></i></span> "
					+ "          </a> "
					+ "        </li>");
			linkString.append("<li class='page-item disabled'> "
					+ "          <a class='page-link'' aria-label='Previous'> "
					+ "            <span aria-hidden='true'><i class='mdi mdi-chevron-left'></i></span> "
					+ "          </a> "
					+ "        </li>");

		}
		
		//2. 페이지 번호 Link 만들기
		int pagerBlock = (pageNo - 1) / pagerSize;
		int start = (pagerBlock * pagerSize) + 1;
		int end = start + pagerSize;
		for (int i = start; i < end; i++) {
			if (i > pageCount) break;
			if(i == pageNo) {
				linkString.append(String.format("<li class='page-item active' aria-current='page'> "
						+ "                        <a class='page-link' href='%s?pageNo=%d'> "
						+ "						     <span class='sr-only'> %d </span> "
						+ "						   </a> "
						+ "                      </li>", linkUrl, i, i));
			} else { 
				linkString.append(String.format(
					"<li class='page-item'><a class='page-link' href='%s?pageNo=%d'>%d</a></li>", linkUrl, i, i));
			}
		}
		
		//3. 다음, 마지막 항목 만들기
		if (pageNo < pageCount) {
			linkString.append(String.format("<li class='page-item'> "
				+ "                            <a class='page-link' href='%s?pageNo=%d' aria-label='Next'> "
				+ "                              <span aria-hidden='true'><i class='mdi mdi-chevron-right'></i></span> "
				+ "                            </a> "
				+ "                          </li>",linkUrl, pageNo + 1));
			linkString.append(String.format("<li class='page-item'> "
			    + "                            <a class='page-link' href='%s?pageNo=%d' aria-label='Next'> "
				+ "                              <span aria-hidden='true'><i class='mdi mdi-chevron-double-right'></i></span> "
				+ "                            </a> "
				+ "                          </li>", linkUrl, pageCount));
		} else {
			linkString.append(String.format("<li class='page-item disabled'> "
				+ "                            <a class='page-link' href='%s?pageNo=%d' aria-label='Next'> "
				+ "                              <span aria-hidden='true'><i class='mdi mdi-chevron-right'></i></span> "
				+ "                            </a> "
				+ "                          </li>",linkUrl, pageNo + 1));

			linkString.append(String.format("<li class='page-item disabled'> "
				+ "                            <a class='page-link' href='%s?pageNo=%d' aria-label='Next'> "
				+ "                              <span aria-hidden='true'><i class='mdi mdi-chevron-double-right'></i></span> "
				+ "                            </a> "
				+ "                          </li>",linkUrl, pageNo + 1));

		}
		
		return linkString.toString();
	}

}













