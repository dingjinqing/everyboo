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
		<form action="${ctx }/sysProfit/save" id="editForm" method="post">
		<input type="hidden" name="id" value="${bean.id }"/>
		<input type="hidden" name="createDate" value="${bean.createDate }"/>
		<div class="">
			<div class="J_formTable l_form_table">
				<table class="not_hightlight">
					<tr>
						<td class="l_title w150"><b class="cRed">*</b> 类型</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w300 ml10">
                                     <label>
                                     <c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<select name="type" data-rule="类型:required;" value="${bean.type }">
                                     				<option value="1" <c:if test="${'1' eq bean.type }">selected</c:if> >日利润</option>
                                     				<option value="2" <c:if test="${'2' eq bean.type }">selected</c:if> >月利润</option>
                                     			</select>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<select name="type" data-rule="会员等级:required;" >
                                     				<option value="1">日利润</option>
                                     				<option value="2">月利润</option>
                                     			</select>
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
					<tr>
					<td class="l_title w150"><b class="cRed">*</b>利润</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w300 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="profit" data-rule="利润:required;" value="${bean.profit }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="profit" data-rule="利润:required;"  />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
					<tr>
					<td class="l_title w150"><b class="cRed">*</b>利润日期</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w300 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="dateString" data-rule="利润日期:required;" value="${bean.dateString }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="dateString" data-rule="利润日期:required;" value="" />
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