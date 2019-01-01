<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../common/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${menu_name }-${title }</title>
</head>
<link href="${ctx }/static/plugins/chosen_v1.6.2/chosen.css"
	rel="stylesheet" />
<body <%@ include file="../common/skin.jsp" %>>
	<%@ include file="../common/head.jsp"%>
	<%@ include file="../common/menu.jsp"%>
	<div class="J_content">
		<div class="mt20 plr20">
			<form action="${ctx }/shopuser/total" id="queryForm" method="post">
				<div class="J_toolsBar clearfix">
					<div class="t_label">开始时间</div>
					<div class="t_text ml10">
						<input type="text" name="startTime" value="${queryDTO.startTime }"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />
					</div>
					<div class="t_label mgl30">结束时间</div>
					<div class="t_text ml10">
						<input type="text" name="endTime" value="${queryDTO.endTime }"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />
					</div>

					<div class="t_button mgl30">
						<a class="abtn red" href="javascript:myQuery();"> <i
							class="icon"></i>查询
						</a>
					</div>
				</div>

				<div class="J_formTable l_form_table mgt40">
					<table class="not_hightlight">
						<c:choose>
							<c:when test="${list != null }">
								<c:forEach items="${list }" var="u" begin='0' step='1'
									varStatus="status">
									<c:if test="${status.index%2==0}">
										<tr>
									</c:if>
									<td class="l_title w150">${u.typeName }:</td>
									<td>
										<div class="J_toolsBar fl">
											<div class="t_text w300 ml10">
												<label> <c:choose>
														<c:when test="${not empty u }">
                                     			${u.income }
                                     		</c:when>
														<c:otherwise>
                                     			0
                                     		</c:otherwise>
													</c:choose>
												</label>
											</div>
										</div>
									</td>
									<c:if test="${status.count%2==0}">
										</tr>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">
										<div class="J_null mt40">
											<img src="${ctx }/static/images/null.png">
											<p>暂无相关数据</p>
										</div>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</form>
		</div>
	</div>
	<script src="${ctx }/static/plugins/chosen_v1.6.2/chosen.jquery.js"></script>
	<script type="text/javascript">
		function myQuery() {
			$('#queryForm').submit();
		}
	</script>
</body>
</html>