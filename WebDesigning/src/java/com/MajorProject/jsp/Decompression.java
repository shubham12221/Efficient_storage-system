package com.MajorProject.jsp;
import java.io.FileInputStream; 
import java.io.FileOutputStream; 
import java.io.IOException; 
import java.util.zip.GZIPInputStream; 
  
public class Decompression  
{ 
    //static final String INPUT_FILE = "C:\\Users\\Rakesh\\Desktop\\output.txt"; 
    //static final String OUTPUT_FILE = "C:\\Users\\Rakesh\\Desktop\\input3.txt"; 
      
   public static void dodecompress(String INPUT_FILE) 
    { 
        byte[] buffer = new byte[1024]; 
       String str[]=INPUT_FILE.split("\\.");
        String OUTPUT_FILE=str[0];
        OUTPUT_FILE+="5."+str[1];
        try
        { 
            GZIPInputStream is = new GZIPInputStream(new FileInputStream(INPUT_FILE)); 
                      
            FileOutputStream out = new FileOutputStream(OUTPUT_FILE); 
              
            int totalSize; 
            while((totalSize = is.read(buffer)) > 0 ) 
            { 
                out.write(buffer, 0, totalSize); 
            } 
              
            out.close(); 
            is.close(); 
              
            System.out.println("File Successfully decompressed"); 
        } 
        catch (IOException e) 
        { 
            e.printStackTrace(); 
        } 
          
    } 
} 




