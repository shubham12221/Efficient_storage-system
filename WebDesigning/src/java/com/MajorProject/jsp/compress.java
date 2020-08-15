/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.MajorProject.jsp;

/**
 *
 * @author Rakesh
 */

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;

public class compress
{

    public void doCompress(String INPUT_FILE,String username)
    {
        byte[] buffer = new byte[1024];
        try
        {
            String str[]=INPUT_FILE.split("\\\\");
            String OUTPUT_FILE="C:\\Users\\Rakesh\\Documents\\NetBeansProjects\\WebDesigning\\uploadedfiles\\";
            String split=str[str.length-1];
            OUTPUT_FILE+=split;
            GZIPOutputStream os =
                    new GZIPOutputStream(new FileOutputStream(OUTPUT_FILE));

            FileInputStream in =
                    new FileInputStream(INPUT_FILE);

            int totalSize;
            while((totalSize = in.read(buffer)) > 0 )
            {
                os.write(buffer, 0, totalSize);
            }

            in.close();
            os.finish();
            os.close();

            System.out.println("File Successfully compressed");
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

    }

}