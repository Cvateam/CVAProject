package first.cva.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class CompressSource {
 //zip파일 생성 메서드
 public static void zipDirectory(String dir, String zipfile) throws IOException, IllegalArgumentException {
 
  File d = new File(dir);//디렉토리 존재 유무 체크 및 해당 파일 리스트를 가져오기 위하여 객체 생성
  
  if (!d.isDirectory())//디렉토리 존재 유무 체크
   throw new IllegalArgumentException("Not a directory:  " + dir);
  
  String[] entries = d.list(); //해당 경로의 파일을 배열로 가져옴
  
  byte[] buffer = new byte[4096];//파일 복사를 위한 버퍼 
  int bytesRead; //zip파일을 생성하기 위한 객체 생성
  ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipfile));//해당경로의 파일들을 루프
  for (int i = 0; i < entries.length; i++) {
   File f = new File(d, entries[i]);
   if (f.isDirectory())
    continue;// Ignore directory
   
   FileInputStream in = new FileInputStream(f); // Stream to read file
   
   ZipEntry entry = new ZipEntry(f.getPath()); // Make a ZipEntry//zip파일을 만들기 위하여 out객체에 write하여 zip파일 생성
      System.out.println("압축 대상 파일 : " + entry);
   out.putNextEntry(entry); // Store entry
   while ((bytesRead = in.read(buffer)) != -1)
    out.write(buffer, 0, bytesRead);
   in.close();
  }
  out.close();
 }
}
