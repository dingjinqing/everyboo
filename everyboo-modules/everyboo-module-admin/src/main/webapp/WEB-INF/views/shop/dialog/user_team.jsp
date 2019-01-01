<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<html>

<%@ include file="../../common/jstl.jsp"%>

<head>
</head>

<body>

	
	<div id="addForm" class="mgt20">
	<div class="J_formTable l_form_table">
				<table class="not_hightlight">
					<tr>
						<td class="l_title w150"> 会员账号</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="account" value="${bean.account }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="account"  value="" data-rule="手机号:required;account;remote[${ctx }/shopuser/validator/account]"/>
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150"><b class="cRed">*</b>手机号</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="phone" data-rule="手机号:required;" value="${bean.phone }" readonly="readonly" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="phone" data-rule="手机号:required;phone;remote[${ctx }/shopuser/validator/phone]" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
                     <tr>
						<td class="l_title w150">推荐人手机号</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="refPhone" value="${bean.refPhone }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="refPhone" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150"><b class="cRed">*</b> 会员等级</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<select name="vipLevel" data-rule="会员等级:required;" value="${bean.vipLevel }">
                                     				<option value="v0" <c:if test="${'v0' eq bean.vipLevel }">selected</c:if> >普通会员</option>
                                     				<option value="v1" <c:if test="${'v1' eq bean.vipLevel }">selected</c:if> >个人vip</option>
                                     				<option value="v2" <c:if test="${'v2' eq bean.vipLevel }">selected</c:if> >初级代理</option>
                                     				<option value="v3" <c:if test="${'v3' eq bean.vipLevel }">selected</c:if> >中级代理</option>
                                     				<option value="v4" <c:if test="${'v4' eq bean.vipLevel }">selected</c:if> >高级代理</option>
                                     				<option value="v5" <c:if test="${'v5' eq bean.vipLevel }">selected</c:if> >核心代理</option>
                                     				<option value="v6" <c:if test="${'v6' eq bean.vipLevel }">selected</c:if> >运营中心</option>
                                     				<option value="v7" <c:if test="${'v7' eq bean.vipLevel }">selected</c:if> >公司合伙人</option>
                                     			</select>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<select name="vipLevel" data-rule="会员等级:required;" >
                                     				<option value="v0">普通会员</option>
                                     				<option value="v1" selected>个人vip</option>
                                     				<option value="v2">初级代理</option>
                                     				<option value="v3">中级代理</option>
                                     				<option value="v4">高级代理</option>
                                     				<option value="v5">核心代理</option>
                                     				<option value="v6">运营中心</option>
                                     				<option value="v7">公司合伙人</option>
                                     			</select>
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
                     <tr>
						<td class="l_title w150">地址</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="address" value="${bean.address }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="address" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                        <td class="l_title w150"><b class="cRed">*</b>状态</td>
                         <td>
                             <div class="J_toolsBar fl">
								     <label><input name="status" type="radio" value="1" <c:if test="${bean.status == null || bean.status == 1 }">checked="checked"</c:if> />有效</label> 
									 <label><input name="status" type="radio" value="2" <c:if test="${bean.status == 2 }">checked="checked"</c:if>/>无效</label> 
                             </div>
                         </td> 
                     </tr>
                  </table>
                  </div>
	
	
	<!--  直推团队成员-->
		<%-- <c:if test="${not empty zhitui}"> --%>
		<div class="J_table mt20">
					<div class="t_table">
						<table>
							<thead>
								<tr><td colspan="4"><span> 直推团队</span></td></tr>
								<tr>
									<td><span>姓名</span></td>
									<td><span>手机号</span></td>
									<td><span>等级</span></td>
									<td><span>昵称</span></td>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${zhitui != null }">
										<c:forEach items="${zhitui }" var="u">
											<tr>
												<td>
													<div class="t_text tc">${u.account }</div>
												</td>
												<td>
													<div class="t_text tc">${u.phone }</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${'v0' eq u.viplevel}">
		                                     			普通会员
		                                     		</c:when>
															<c:when test="${'v1' eq u.viplevel}">
		                                     			个人vip
		                                     		</c:when>
															<c:when test="${'v2' eq u.viplevel}">
		                                     			初级代理
		                                     		</c:when>
															<c:when test="${'v3' eq u.viplevel}">
		                                     			中级代理
		                                     		</c:when>
															<c:when test="${'v4' eq u.viplevel}">
		                                     			高级代理
		                                     		</c:when>
															<c:when test="${'v5' eq u.viplevel}">
		                                     			核心代理
		                                     		</c:when>
															<c:when test="${'v6' eq u.viplevel}">
		                                     			运营中心
		                                     		</c:when>
															<c:when test="${'v7' eq u.viplevel}">
		                                     			公司合伙人
		                                     		</c:when>
															<c:otherwise>
		                                     			普通会员
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">${u.nickName }</div>
												</td>
												
											</tr>
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
							</tbody>
						</table>
					</div>
					
				</div>
				
				
		<div class="J_table mt20">
					<div class="t_table">
						<table>
							<thead>
								<tr><td colspan="4"><span>间推团队 </span></td></tr>
								<tr>
									<td><span>姓名</span></td>
									<td><span>手机号</span></td>
									<td><span>等级</span></td>
									<td><span>昵称</span></td>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${jiantui != null }">
										<c:forEach items="${jiantui }" var="u">
											<tr>
												<td>
													<div class="t_text tc">${u.account }</div>
												</td>
												<td>
													<div class="t_text tc">${u.phone }</div>
												</td>
												<td>
													<div class="t_text tc">
														<c:choose>
															<c:when test="${'v1' eq u.viplevel}">
		                                     			普通会员
		                                     		</c:when>
															<c:when test="${'v2' eq u.viplevel}">
		                                     			个人vip
		                                     		</c:when>
															<c:when test="${'v3' eq u.viplevel}">
		                                     			初级代理
		                                     		</c:when>
															<c:when test="${'v4' eq u.viplevel}">
		                                     			高级代理
		                                     		</c:when>
															<c:when test="${'v5' eq u.viplevel}">
		                                     			核心代理
		                                     		</c:when>
															<c:when test="${'v6' eq u.viplevel}">
		                                     			运营中心
		                                     		</c:when>
															<c:when test="${'v7' eq u.viplevel}">
		                                     			公司合伙人
		                                     		</c:when>
															<c:otherwise>
		                                     			普通会员
		                                     		</c:otherwise>
														</c:choose>
													</div>
												</td>
												<td>
													<div class="t_text tc">${u.nickName }</div>
												</td>
												
											</tr>
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
							</tbody>
						</table>
					</div>
					
				</div>
				<%-- </c:if> --%>
				<!-- 订单明细结束 -->
		
		
		
	</div>

</body>
</html>