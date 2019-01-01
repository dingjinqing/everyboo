<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<html>

<%@ include file="../../common/jstl.jsp"%>

<script type="text/javascript">


//表单验证
$(function(){
	$('#editForm').validator({
		fields : {
			name : '角色名称:required;length[~50]'
		},
		valid : function(form){
			var laodIdx = layer.load();
			
			$('#editForm').ajaxSubmit({
				data : {
				},
				traditional : true,
				success : function(result){
					layer.close(laodIdx);
					if(result.success){
						layer.alert('保存成功', function(){
							window.location.reload();
						});
					}else{
						layer.alert(result.msg);
					}
				}
			});
		}
	});
	
});


</script>

<head>
</head>

<body>

	
	<div id="addForm" class="mgt20">
		<form action="${ctx }/shoptrade/save" id="editForm" method="post">
		<input type="hidden" name="id" value="${bean.id }"/>
		<input type="hidden" name="userId" value="${bean.userId }"/>
		<div class="">
			<div class="J_formTable l_form_table">
				<table class="not_hightlight">
					<tr>
						<td class="l_title w150"><b class="cRed">*</b> 订单编号</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="tradeNo" data-rule="订单编号:required;" value="${bean.tradeNo }" readonly="readonly"/>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="tradeNo" data-rule="订单编号:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150"><b class="cRed">*</b>价格</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="price" data-rule="价格:required;" value="${bean.price }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="price" data-rule="价格:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
                     <tr>
						<td class="l_title w150"><b class="cRed">*</b>订单状态</td>
                         <td>
                             <div class="J_toolsBar fl">
								     <label><input name="status" type="radio" value=1 <c:if test="${bean.status == null || bean.status == 1 }">checked="checked"</c:if> />待审核</label> 
									 <label><input name="status" type="radio" value=2 <c:if test="${bean.status == 2 }">checked="checked"</c:if>/>审核通过</label> 
									 <label><input name="status" type="radio" value=3 <c:if test="${bean.status == 3 }">checked="checked"</c:if>/>已完成</label> 
                             </div>
                         </td>
                         <td class="l_title w150"><b class="cRed">*</b> 交易类型</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<select name="jtype" data-rule="交易类型:required;" >
                                     				<option value=14 <c:if test="${14 eq bean.jtype }">selected</c:if> >提现余额</option>
                                     				<option value=15 <c:if test="${15 eq bean.jtype }">selected</c:if> >充值</option>
                                     			</select>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<select name="jtype" data-rule="交易类型:required;" >
													<option value=14 >提现余额</option>
													<option value=15 >充值</option>
                                     			</select>
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
                     <tr>
						<td class="l_title w150">使用积分总数</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="credits" value="${bean.credits }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="credits" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150"><b class="cRed">*</b>订单时间</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="createDate"  value="${bean.createDate }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="createDate"   onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"/>
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
                     
                     <tr>
						<td class="l_title w150">手机号</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text"  value="${user.phone }"  readonly="readonly" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text"  value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150">账户名</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text"   value="${user.account }" readonly="readonly"/>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text"  value="" />
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
                                     			<input type="text"  value="${user.address }"  readonly="readonly" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text"  value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150">会员等级</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<select  value="${user.vipLevel }" readonly="readonly" >
                                     				<option value="v0" <c:if test="${'v0' eq user.vipLevel }">selected</c:if> >普通会员</option>
                                     				<option value="v1" <c:if test="${'v1' eq user.vipLevel }">selected</c:if> >个人vip</option>
                                     				<option value="v2" <c:if test="${'v2' eq user.vipLevel }">selected</c:if> >初级代理</option>
                                     				<option value="v3" <c:if test="${'v3' eq user.vipLevel }">selected</c:if> >中级代理</option>
                                     				<option value="v4" <c:if test="${'v4' eq user.vipLevel }">selected</c:if> >高级代理</option>
                                     				<option value="v5" <c:if test="${'v5' eq user.vipLevel }">selected</c:if> >核心代理</option>
                                     				<option value="v6" <c:if test="${'v6' eq user.vipLevel }">selected</c:if> >运营中心</option>
                                     				<option value="v7" <c:if test="${'v7' eq user.vipLevel }">selected</c:if> >公司合伙人</option>
                                     			</select>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<select  >
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
				</table>
			</div>
		</div>
		
		<!-- 订单明细开始 -->
		<c:if test="${(bean.jtype == 1) || (bean.jtype == 2)|| (bean.jtype == 13)}">
		<div class="J_table mt20">
					<div class="t_table">
						<table>
							<thead>
								<tr>
									<td><span>商品logo图片</span></td>
									<td><span>商品名称</span></td>
									<td><span>商品个数</span></td>
									<td><span>实际付款价格</span></td>
									<td><span>使用积分</span></td>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${bean.shopTradeDetails != null }">
										<c:forEach items="${bean.shopTradeDetails }" var="u">
											<tr>
												<td>
													<img src="${ctx }${u.proLogoImg }">
												</td>
												<td>
													<div class="t_text tc">${u.proName }</div>
												</td>
												<td>
													<div class="t_text tc">${u.count }</div>
												</td>
												<td>
													<div class="t_text tc">${u.price }</div>
												</td>
												<td>
													<div class="t_text tc">${u.credits }</div>
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
				</c:if>
				<!-- 订单明细结束 -->
				
		</form>
	</div>

</body>
</html>