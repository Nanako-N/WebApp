package model;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class ReadFile {
	//読みたいファイルのパスとファイル内のデータ数(カンマ区切り)からファイル内の全データを格納した配列を返す
    public String[] readFile(String path, int numOfData) {
        String[] data = new String[numOfData];
        try {
            FileInputStream fis = new FileInputStream(path);
            InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
            BufferedReader bur = new BufferedReader(isr);
            
            int i=0;
            for(String line; (line = bur.readLine()) != null;) {
                String[] strs = line.split(",", 0);
                for(String str: strs) {
                    data[i++] = str;
                }
            }
            bur.close();
            isr.close();
            fis.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return data;
    }
}
