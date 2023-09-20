package com.gpmatching.common;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Set;
import java.util.UUID;

import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpServletRequest;

public class Util {
	
	/**
	 * 지정된 암호화 알고리즘에 따라 문자열 데이터를 암호화 처리
	 * 
	 * @param source 암호화 대상 문자열
	 * @param algorithm 암호화 알고리즘 문자열 (SHA-1, MD5, SHA-256 ...)
	 * @return 암호화된 데이터
	 */
	public static byte[] getHashedData(String source, String algorithm) {
		
		byte[] hashedData = null;
		
		try {
			//암호화 처리 인스턴스 생성
			MessageDigest md = MessageDigest.getInstance(algorithm);

			hashedData = md.digest(source.getBytes());//평문을 지정된 알고리즘으로 암호화( 결과 : byte[] )

		} catch (NoSuchAlgorithmException ex) {	
			hashedData = null;
		}
		
		return hashedData;
	}
	
	/**
	 * 문자열을 암호화 알고리즘에 따라 암호화 하고 결과를 문자열로 변환
	 * @param source
	 * @param algorithm
	 * @return
	 */
	public static String getHashedString(String source, String algorithm) {
		
		byte[] hashedData = getHashedData(source, algorithm);
		
		if (hashedData == null) return null;
		 
		String hashedString = "";
		for (int i = 0; i < hashedData.length; i++) {
			String hexString = 
				Integer.toHexString((int)hashedData[i] & 0x000000ff);
			if (hexString.length() < 2)
				hexString = "0" + hexString;
			
			hashedString += hexString;
		}
		
		return hashedString;
	}
	
	//////////////////////////////////////////////////////////////////
	/**
	 * 특정 폴더에서 고유한 파일 이름을 만드는 메서드 <br> 
	 * 파일이름이 중복되면 뒤에 .1, .2와 같은 접미사 추가
	 * @param path
	 * @param fileName
	 * @return
	 */
	public static String makeUniqueFileName(String path, String fileName)
    {	
        String name = fileName.substring(0, fileName.lastIndexOf("."));
        String ext = fileName.substring(fileName.lastIndexOf("."));
        
        int index = 1;
        while (true) {
        	File file = new File(path + "\\" + name + "_" + index + ext);
        	if (file.exists())
        		index++;
        	else
        		break;
        }

        return name + "_" + index + ext;
    }
	
	/**
	 * 고유한 파일 이름을 만드는 메서드
	 * @param fileName
	 * @return
	 */
	public static String makeUniqueFileName(String fileName)
    {   
        String ext = fileName.substring(fileName.lastIndexOf("."));
        
        String name = UUID.randomUUID().toString();

        return name + ext;
    }
	
	///////////////////////////////////////////////////
	
	public static String makeQueryString(
		String queryString, String toAdd, String[] toRemove, String encoding)
		throws UnsupportedEncodingException {
		
		if (queryString == null || queryString.length() == 0) {
			return null;
		}
		if (encoding == null || encoding.length() == 0) {
			encoding = "utf-8";
		}
		queryString = queryString.replace("?", "");
		String[] ar = queryString.split("&");
		HashMap<String, String> result = new HashMap<>();
		for (String q : ar) {
			String[] ar2 = q.split("=");
			if (ar2.length != 2) {
				throw new RuntimeException("Invalid Format");
			}
			result.put(ar2[0], 
				new String(ar2[1].getBytes(encoding), "ISO-8859-1"));
		}
		
		if(toRemove != null && toRemove.length > 0) {
			for (String d : toRemove) {
				result.remove(d);
			}
		}
		
		if (toAdd != null && toAdd.length() > 0) {
			ar = toAdd.trim().split("&");
			for (String a : ar) {
				String[] ar2 = a.split("=");
				if (ar2.length != 2) {
					throw new RuntimeException("Invalid Format");
				}
				result.replace(ar2[0], 
					new String(ar2[1].getBytes(encoding), "ISO-8859-1"));
			}
		}
		
		Set<String> keys = result.keySet();
		StringBuilder sb = new StringBuilder();
		for (String key : keys) {
			sb.append(String.format("&%s=%s", key, result.get(key)));
		}
		sb = sb.replace(0, 1, "?");
		
		return sb.toString();
	}

}
