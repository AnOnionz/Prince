package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Random;

import com.google.gson.Gson;

import beans.PostDAO;
import beans.TiGia;
import beans.item;

public class Utils {
	private static final char[] symbols;

	static {
		StringBuilder tmp = new StringBuilder();
		for (char ch = '0'; ch <= '9'; ++ch)
			tmp.append(ch);
		for (char ch = 'a'; ch <= 'z'; ++ch)
			tmp.append(ch);
		symbols = tmp.toString().toCharArray();
	}

	private static final Random random = new Random();

	public static String prepareRandomString(int len) {
		char[] buf = new char[len];
		for (int idx = 0; idx < buf.length; ++idx)
			buf[idx] = symbols[random.nextInt(symbols.length)];
		return new String(buf);
	}

	public static int getRateUSD() throws Exception {
		URL obj = new URL("http://dongabank.com.vn/exchange/export");
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String s = in.readLine();
		in.close();
		s = s.replace("(", "");
		s = s.replace(")", "");
		Gson gs = new Gson();
		TiGia dstg = gs.fromJson(s, TiGia.class);
		for (item list : dstg.items) {
			if (list.getType().equalsIgnoreCase("USD")) {
				return Integer.parseInt(list.getMuack());
			}

		}
		return 23000;

	}

	public static void deleteOldFile() {
		ArrayList<String> listURL = PostDAO.selectFileUrl();
		boolean delete = true;
		String uploadPath = "E:\\e-commerce\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Prince\\upload";
		// creates the directory if it does not exist
		File uploadDir = new File(uploadPath);
		File[] listFile = uploadDir.listFiles();
		for (File file : listFile) {
			for (String url : listURL) {
				if(!url.isEmpty()) {
					if (file.getName().equalsIgnoreCase(url.substring(7))) {
						delete = false;
						break;
					}
				}
			}
			if(delete) {
				file.delete();
			}
			delete = true;
		}
	}

	public static void main(String args[]) throws Exception {
		// System.out.println(BCrypt.gensalt());
		System.out.println(getRateUSD());
		deleteOldFile();
	}
}