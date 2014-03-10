package com.helezs.action.commonModule;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.appengine.api.datastore.Blob;
import com.helezs.managePojo.ManagePhotoDAO;
import com.helezs.pojo.Photo;
import com.helezs.util.CommentForm;

@Controller("uploadImgAction")
@Scope("prototype")
public class UploadImgAction {

	private static final long serialVersionUID = 1L;
	private Blob img;
	@Resource
	private ManagePhotoDAO managePhotoDAO;

	@RequestMapping("/index")
	public String index(HttpServletResponse response) throws IOException {
		return "test/upload";
	}

	@RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
	@ResponseBody
	public void uploadImg(CommentForm commentForm,HttpServletResponse response) throws IOException {
		MultipartFile[] files = commentForm.getFiles();

		for (int i = 0; i < files.length; i++) {
			// Do stuffs!!!
			Blob image = new Blob(files[i].getBytes());
			Photo photo = new Photo();
			String id = UUID.randomUUID().toString().replace("-", "");
			photo.setId(id);
			photo.setImage(image);
			boolean flag = managePhotoDAO.addPhoto(photo);
			if (flag == true) {
				Photo photo1 = managePhotoDAO.searchById(id);
				System.out.println(photo1.getId());
			}
			JSONObject obj = new JSONObject();
			obj.put("error", 0);
			obj.put("url", "/getImage?id="+id);
			PrintWriter out = response.getWriter();
			out.println(obj.toJSONString());
		}
	}

	public Blob getImg() {
		return img;
	}

	public void setImg(Blob img) {
		this.img = img;
	}

	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
	public void getImage(@RequestParam("id") String id,HttpServletResponse response) throws IOException {
		try {
			Photo photo = managePhotoDAO.searchById(id);
			response.getOutputStream().write(photo.getImage().getBytes());
		    } catch (IOException ex) {
		      throw new RuntimeException("IOError writing file to output stream");
		   }
	}
}