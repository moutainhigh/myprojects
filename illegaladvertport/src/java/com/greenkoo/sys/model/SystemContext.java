package com.greenkoo.sys.model;

/**
 * 系统上下文
 * 
 * @author QYANZE
 *
 */
public class SystemContext {
	private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();

	private static ThreadLocal<Integer> curPage = new ThreadLocal<Integer>();

	private static ThreadLocal<String> realPath = new ThreadLocal<String>();

	public static Integer getPageSize() {
		return (Integer) pageSize.get();
	}

	public static void setPageSize(Integer _pageSize) {
		pageSize.set(_pageSize);
	}

	public static Integer getCurPage() {
		return (Integer) curPage.get();
	}

	public static void setCurPage(Integer _curPage) {
		curPage.set(_curPage);
	}

	public static void setRealPath(String _realPath) {
		realPath.set(_realPath);
	}

	public static String getRealPath() {
		return (String) realPath.get();
	}

	public static void removePageSize() {
		pageSize.remove();
	}

	public static void removeRealPath() {
		realPath.remove();
	}
	
	public static void removeCurPage() {
		curPage.remove();
	}
}