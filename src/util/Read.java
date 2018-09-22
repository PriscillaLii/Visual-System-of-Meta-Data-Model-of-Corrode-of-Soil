package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.sf.json.JSONObject;
import Model.Process;

public class Read {
	
	public Process readToProcess(CommonsMultipartFile file){
		try {
			File file1 = new File("/Users/Meta/Desktop/temp/01-1.txt");
			file.transferTo(file1);
			//DiskFileItem fi = (DiskFileItem)file.getFileItem(); 
			//File file1 = fi.getStoreLocation();
			String encoding="GBK";
            String lineTxt2 = null;
            String lineTxtO[] = null;
            ArrayList lineTxtObject = new ArrayList();
            if(file1.isFile() && file1.exists()){ //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                new FileInputStream(file1),encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                while((lineTxt2 = bufferedReader.readLine()) != null){
                    lineTxtO = lineTxt2.split(":");
                	System.out.println(lineTxtO[1]);
                	lineTxtObject.add(lineTxtO[1]);
                }
                String[] lineTxt1=new String[lineTxtObject.size()];
                lineTxt1 = (String[]) lineTxtObject.toArray(lineTxt1);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                Process p = new Process(lineTxt1[0],lineTxt1[1],lineTxt1[2],
                		lineTxt1[3],formatter.parse(lineTxt1[4]),lineTxt1[5],lineTxt1[6]);
                //System.out.println("String date="+formatter.format(p.getSetupDate()));//按yyyy-MM-dd的格式把date转为字符串
                read.close(); 
                return p;
            }else{
            	System.out.println("找不到指定的文件");
            	return null;
            }
		} catch (Exception e) {
			System.out.println("读取文件内容出错");
			e.printStackTrace();
		}
		return null;
	}

	public JSONObject readToJson(CommonsMultipartFile file){
		Process p = this.readToProcess(file);
		JSONObject jsonP = JSONObject.fromObject(p);
		return jsonP;
	}
	
	public JSONObject ObjectToJson(Process p){
		JSONObject jsonP = JSONObject.fromObject(p);
		return jsonP;
	}
}
