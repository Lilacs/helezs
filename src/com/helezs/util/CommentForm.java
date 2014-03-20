package com.helezs.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CommentForm {
	private String comment;
	private MultipartFile imgFile;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public void setimgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	public void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}

	public void setFile5(MultipartFile file5) {
		this.file5 = file5;
	}

	public MultipartFile[] getFiles() {
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		if (imgFile != null) {
			files.add(imgFile);
		}
		if (file2 != null) {
			files.add(file2);
		}
		if (file3 != null) {
			files.add(file3);
		}
		if (file4 != null) {
			files.add(file4);
		}
		if (file5 != null) {
			files.add(file5);
		}
		return files.toArray(new MultipartFile[files.size()]);
	}
}
