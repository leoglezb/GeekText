package com.geektext.pojo;

public class Filter {
	private int authorId;
	private Integer[] genres;
	private Integer[] secondArray;
	private Integer[] thirdArray;
	private String sortBy;
	private String order;

	public Filter() {
		authorId = 0;
		genres = null;
		secondArray = null;
		thirdArray = null;
		sortBy = "";
		order = "";
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
		/*
		String allGenre = "";
		if(genres != null && genres.length > 0 && !(genres.length == 1 && genres[0] == 0)) {
			allGenre = "(";
			for(int i = 0; i < genres.length; i++) {
				allGenre += genres[i] + ",";
			}
			allGenre = allGenre.substring(0, allGenre.length()-1) + ")";
		}
		*/
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

	public String getSortBy() {
		return sortBy;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
}