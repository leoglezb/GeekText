package com.geektext.form;

import java.util.List;

@SuppressWarnings("rawtypes")
public class MyList<T> {
     

	private List<T> list;
	private Integer count;
	private Integer page;
	private Integer pageStart;
	private Integer pageEnd;
	private Integer pageCount;
	private Integer pagePrev;
	private Integer pageNext;
	private Integer pageSize;
	

	public MyList() {
		super();
		this.list = null;
		this.count = 0;
		this.page = 0;
		this.pageStart = 0;
		this.pageEnd = 0;
		this.pageCount = 0;
		this.pagePrev = null;
		this.pageNext = null;
		this.pageSize = 0;
		this.pageSize = 0;

	}

	public List getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public Number getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getPageStart() {
		return pageStart;
	}

	public void setPageStart(Integer pageStart) {
		this.pageStart = pageStart;
	}

	public Integer getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(Integer pageEnd) {
		this.pageEnd = pageEnd;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Integer getPagePrev() {
		return pagePrev;
	}

	public void setPagePrev(Integer pagePrev) {
		this.pagePrev = pagePrev;
	}

	public Integer getPageNext() {
		return pageNext;
	}

	public void setPageNext(Integer pageNext) {
		this.pageNext = pageNext;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	

}