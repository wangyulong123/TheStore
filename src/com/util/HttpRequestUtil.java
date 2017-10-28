/**
  * 鏂囦欢璇存槑
  * @Description:鎵╁睍璇存槑
  * @Copyright: 2018 dreamtech.com.cn Inc. All right reserved
  * @Version: V6.0
  */
package com.util;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;

public class HttpRequestUtil {

	/**
	 * HttpClient 妯℃嫙POST璇锋眰
	 */
	public static String postRequest(String url, Map<String, String> params) {
		//鏋勯�HttpClient鐨勫疄渚�
		HttpClient httpClient = new HttpClient();
		
		//鍒涘缓POST鏂规硶鐨勫疄渚�
		PostMethod postMethod = new PostMethod(url);
		
		//璁剧疆璇锋眰澶翠俊鎭�
		postMethod.setRequestHeader("Connection", "close");
		
		//娣诲姞鍙傛暟
		for (Map.Entry<String, String> entry : params.entrySet()) {
			postMethod.addParameter(entry.getKey(), entry.getValue());
		}
		
		//浣跨敤绯荤粺鎻愪緵鐨勯粯璁ょ殑鎭㈠绛栫暐,璁剧疆璇锋眰閲嶈瘯澶勭悊锛岀敤鐨勬槸榛樿鐨勯噸璇曞鐞嗭細璇锋眰涓夋
		httpClient.getParams().setBooleanParameter("http.protocol.expect-continue", false);
		
		//鎺ユ敹澶勭悊缁撴灉
		String result = null;
		try {
			//鎵цHttp Post璇锋眰
			httpClient.executeMethod(postMethod);
			
			//杩斿洖澶勭悊缁撴灉
			result = postMethod.getResponseBodyAsString();
		} catch (HttpException e) {
			// 鍙戠敓鑷村懡鐨勫紓甯革紝鍙兘鏄崗璁笉瀵规垨鑰呰繑鍥炵殑鍐呭鏈夐棶棰�
		    System.out.println("璇锋鏌ヨ緭鍏ョ殑URL!");
			e.printStackTrace();
		} catch (IOException e) {
			// 鍙戠敓缃戠粶寮傚父
		    System.out.println("鍙戠敓缃戠粶寮傚父!");
			e.printStackTrace();
		} finally {
			//閲婃斁閾炬帴
			postMethod.releaseConnection();
			
			//鍏抽棴HttpClient瀹炰緥
			if (httpClient != null) {
				((SimpleHttpConnectionManager) httpClient.getHttpConnectionManager()).shutdown();
				httpClient = null;
			}
		}
		return result;
	}

	/**
	 *  HttpClient 妯℃嫙GET璇锋眰
	 */
	public static String getRequest(String url, Map<String, String> params) {
		//鏋勯�HttpClient瀹炰緥
		HttpClient client = new HttpClient();
		
		//鎷兼帴鍙傛暟
		String paramStr = "";
		for (String key : params.keySet()) {
			paramStr = paramStr + "&" + key + "=" + params.get(key);
		}
		paramStr = paramStr.substring(1);
		
		//鍒涘缓GET鏂规硶鐨勫疄渚�
		GetMethod method = new GetMethod(url + "?" + paramStr);
		
		//鎺ユ敹杩斿洖缁撴灉
		String result = null;
		try {
			//鎵цHTTP GET鏂规硶璇锋眰
			client.executeMethod(method);
			
			//杩斿洖澶勭悊缁撴灉
			result = method.getResponseBodyAsString();
		} catch (HttpException e) {
			// 鍙戠敓鑷村懡鐨勫紓甯革紝鍙兘鏄崗璁笉瀵规垨鑰呰繑鍥炵殑鍐呭鏈夐棶棰�
		    System.out.println("璇锋鏌ヨ緭鍏ョ殑URL!");
			e.printStackTrace();
		} catch (IOException e) {
			// 鍙戠敓缃戠粶寮傚父
		    System.out.println("鍙戠敓缃戠粶寮傚父!");
			e.printStackTrace();
		} finally {
			//閲婃斁閾炬帴
			method.releaseConnection();
			
			//鍏抽棴HttpClient瀹炰緥
			if (client != null) {
				((SimpleHttpConnectionManager) client.getHttpConnectionManager()).shutdown();
				client = null;
			}
		}
		return result;
	}
}
