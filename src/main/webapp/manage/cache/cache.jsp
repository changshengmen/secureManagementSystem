<%@page import="net.jeeshop.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/common.jsp"%>
</head>

<body>
	<table class="table table-bordered">
		<tr>
			<td colspan="8">
				<a href="cacheImpl.jsp" target="_blank"
				class="btn btn-primary"> <i class="icon-refresh icon-white"></i>
					加载后台缓存
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<a href="frontCacheImpl.jsp" target="_blank"
				class="btn btn-success"><i class="icon-refresh icon-white"></i>
					加载前台缓存
				</a>
			</td>
		</tr>
	</table>
</body>
</html>
