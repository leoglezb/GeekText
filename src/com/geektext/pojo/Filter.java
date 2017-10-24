package com.geektext.pojo;

import java.util.List;

public class Filter {
	private int authorId;
	private Integer[] genres;
    private Integer[] secondArray;
    private Integer[] thirdArray;

    public Filter() {
    	authorId = 0;
    	genres = null;
    	secondArray = null;
    	thirdArray = null;
    }
    
    public Filter(Integer[] genres, Integer[] secondArray, Integer[] thirdArray) {
    	this.genres = genres;
    	this.secondArray = secondArray;
    	this.thirdArray = thirdArray;
    }
    
    public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
    public Integer[] getGenres() {
		return genres;
	}
	public void setGenres(Integer[] genres) {
		this.genres = genres;
	}
	public Integer[] getSecondArray() {
		return secondArray;
	}
	public void setSecondArray(Integer[] secondArray) {
		this.secondArray = secondArray;
	}
	public Integer[] getThirdArray() {
		return thirdArray;
	}
	public void setThirdArray(Integer[] thirdArray) {
		this.thirdArray = thirdArray;
	}
}