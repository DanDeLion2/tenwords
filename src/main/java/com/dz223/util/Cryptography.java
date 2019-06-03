package com.dz223.util;


import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 加密工具类
 * @author Administrator
 *
 */
public class Cryptography {
	private static final String MD5_SALF="dz223";
	/*
	 * 使用MD5加密
	 */
	public static String getMd5String(String str){
		return new Md5Hash(str, MD5_SALF).toString();
	}
	/*
	 * 使用MD5加密+盐
	 */
	public static String getMd5String(String str,String salt){
		return new Md5Hash(str, salt).toString();
	}
	/**
	 * Base64加密
	 * @param
	 * @return
	 */
	public static String encBase64(String str){
		return Base64.encodeToString(str.getBytes());
	}
	/*
	 * Base64位解密
	 */
	public static String decBase64(String str){
		return Base64.decodeToString(str);
	}
	public static void main(String[] args) {
		System.out.println("64加密："+Cryptography.encBase64("123456"));
		System.out.println("64解密："+Cryptography.decBase64(Cryptography.encBase64("123456")));
		System.out.println("MD5加密："+Cryptography.getMd5String("123456"));
		System.out.println("MD5加密："+Cryptography.getMd5String("admin","1130"));
	}
}
