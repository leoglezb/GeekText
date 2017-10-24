package com.geektext.pojo;

import java.util.List;

public class Filter {
    private Integer[] firstArray;
    private Integer[] secondArray;
    private Integer[] thirdArray;

    public Filter() {
    	firstArray = null;
    	secondArray = null;
    	thirdArray = null;
    }
    
    public Filter(Integer[] firstArray, Integer[] secondArray, Integer[] thirdArray) {
    	this.firstArray = firstArray;
    	this.secondArray = secondArray;
    	this.thirdArray = thirdArray;
    }
    
    public Integer[] getFirstArray() {
		return firstArray;
	}
	public void setFirstArray(Integer[] firstArray) {
		this.firstArray = firstArray;
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