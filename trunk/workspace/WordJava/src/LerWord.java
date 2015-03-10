import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.imageio.stream.FileImageInputStream;

import org.apache.poi.hssf.util.HSSFColor.GOLD;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;


public class LerWord {

	public static void main(String[] args){
		try {
			poi
			POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream("c:\\teste.docx"));
			
			/*
			HWPFDocument document = new HWPFDocument(fs);
			WordExtractor word = new WordExtractor(document);
			
			String[] paragrafos = word.getParagraphText();
			
			for (String string : paragrafos) {
				System.out.println(string);
			}
			*/
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
