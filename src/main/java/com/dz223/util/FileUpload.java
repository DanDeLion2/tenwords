package com.dz223.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 文件上传
 */
public class FileUpload {
    /**
     * 文件上传
     * @param path  存放路径
     * @param multipartFile  文件
     * @return
     */
    public final static Map<String,Object> FileUploads(String path, MultipartFile multipartFile, HttpServletRequest request)
            throws IOException {
        Map<String,Object> map=new HashMap<String,Object>();
        if(multipartFile!=null){
            //更新用户头像
            System.out.println("用户头像更新上传...");
            String fileName = SpecialCharacters(multipartFile.getOriginalFilename());
            System.out.println(path);
            File targetFile = new File(path);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            File file = new File(path, fileName);
            if (!file.exists()) {
                file.createNewFile();
            }
            // 保存
            multipartFile.transferTo(file);
            if (file.exists()) {
                map.put("result","true");/*map.put("path",request.getContextPath() + "/upload/" + fileName);*/
                map.put("path",path+ fileName);
                map.put("fileName",fileName);
            }else {
                map.put("result","false");
            }
        }else {
            map.put("result","false");
        }
        return map;
    }

    /**
     * 处理文件名特殊字符(包括中文汉字)
     * @param str
     * @return
     */
    public final static String SpecialCharacters(String str){
        String regEx = "[`~!！@#$%^&*()\\-+={}':;,\\[\\]<>/?￥%…（）_+|【】‘；：”“’。，、？\\s]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        System.out.println("去掉特殊字符："+m.replaceAll(""));

        String reg = "[\u4e00-\u9fa5]";
        Pattern pat = Pattern.compile(reg);
        Matcher mat=pat.matcher(m.replaceAll(""));
        String repickStr = mat.replaceAll("");
        System.out.println("去中文后:"+repickStr);
        return repickStr;
    }


}
