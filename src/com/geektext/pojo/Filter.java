package com.geektext.pojo;

public class Filter {
	private int authorId;
	private Integer[] genres;
	private int minRating;
	private String sortBy;
	private String order;

	public Filter() {
		authorId = 0;
		genres = null;
		minRating = 0;
		sortBy = "";
		order = "";
	}

	public Filter(Integer[] genres, int minRating) {
		this.genres = genres;
		this.minRating = minRating;
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

	public int getMinRating() {
		return minRating;
	}

	public void setMinRating(int minRating) {
		this.minRating = minRating;
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