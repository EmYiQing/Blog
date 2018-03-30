package web.action;

import java.io.File;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.UserService;

public class UploadAction extends ActionSupport {
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private File file1;
	private String file1FileName;
	private String file1ContentType;
    public void setFile1(File file1) {
        this.file1 = file1;
    }
    public void setFile1FileName(String file1FileName) {
        this.file1FileName = file1FileName;
    }
    public void setFile1ContentType(String file1ContentType) {
        this.file1ContentType = file1ContentType;
    }
	public String avatar() throws Exception{
		String[] u_ids = (String[]) ActionContext.getContext().getParameters().get("user_id");
		String u_id = u_ids[0];
		file1FileName = UUID.randomUUID().toString();
        String path=ServletActionContext.getServletContext().getRealPath("/imgs/avatar");
        File destFile=new File(path,file1FileName+".jpg");
        FileUtils.copyFile(file1, destFile);
        
        userService.setAvatarByUid(u_id,file1FileName);
        
		return "success";
	}

}
