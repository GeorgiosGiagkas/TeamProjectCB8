package com.game.quizbot.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class PartUtils {

    public static String extractFileExtension(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                String result = clientFileName.substring(i + 1);
                if(result.lastIndexOf(".") < 0){
                    return null;
                }
                return result.substring(result.lastIndexOf("."));
            }
        }
        return null;
    }


}
