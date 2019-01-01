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
		<form action="${ctx }/shoprule/save" id="editForm" method="post">
		<input type="hidden" name="id" value="${bean.id }"/>
		<input type="hidden" name="createDate" value="${bean.createDate }"/>
		<div class="">
			<div class="J_formTable l_form_table">
				<table class="not_hightlight">
					<tr>
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
                         <td class="l_title w150"><b class="cRed">*</b> 未激活健康值总值</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="bill" data-rule="健康值:required;" value="${bean.bill }" readonly="readonly"/>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="bill" data-rule="健康值:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
                     <tr>
						<td class="l_title w150"><b class="cRed">*</b> 健康值激活数（直推）</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="ztjkljhs" data-rule="健康值激活数（直推）:required;" value="${bean.ztjkljhs }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="ztjkljhs" data-rule="健康值激活数（直推）:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150"><b class="cRed">*</b> 健康值值激活数（间推）</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="jtjkljhs" data-rule="健康值激活数（间推）:required;" value="${bean.jtjkljhs }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="jtjkljhs" data-rule="健康值激活数（间推）:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
                     <tr>
						<td class="l_title w150"><b class="cRed">*</b>直推奖</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="ztj" data-rule="直推奖:required;" value="${bean.ztj }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="ztj" data-rule="直推奖:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150"><b class="cRed">*</b>间推奖</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="jtj" data-rule="间推奖:required;" value="${bean.jtj }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="jtj" data-rule="间推奖:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
                     <tr>
						<td class="l_title w150"><b class="cRed">*</b> 管理奖</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="glj" data-rule="管理奖:required;" value="${bean.glj }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="glj" data-rule="管理奖:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         <td class="l_title w150"><b class="cRed">*</b>股份</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="gufen" data-rule="股份:required;" value="${bean.gufen }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="gufen" data-rule="股份:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     <tr>
						<td class="l_title w150"><b class="cRed">*</b>分红积分</td>
                         <td colspan="3">
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="fenhong" data-rule="分红积分:required;" value="${bean.fenhong }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="fenhong" data-rule="分红积分	:required;" value="" />
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
		</form>
	</div>

</body>
</html>