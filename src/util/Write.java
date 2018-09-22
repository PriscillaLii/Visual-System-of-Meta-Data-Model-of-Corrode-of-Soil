package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;

public class Write {
	
	public void write(String url){
		File file = new File(url); 
		String encoding="UTF8";
		try {  
			
			FileWriter writer = new FileWriter(file, true);
			writer.write("-06");
		    writer.close();  
		} catch (FileNotFoundException e) {  
		    e.printStackTrace();  
		} catch (IOException e) {  
		    e.printStackTrace();  
		}
	}

}
