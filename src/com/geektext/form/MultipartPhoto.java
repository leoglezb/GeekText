package com.geektext.form;

import org.springframework.web.multipart.MultipartFile;

public class MultipartPhoto {
	private MultipartFile image_file;

	public MultipartFile getImage_file() {
		return image_file;
	}

	public void setImage_file(MultipartFile image_file) {
		this.image_file = image_file;
	}
}
