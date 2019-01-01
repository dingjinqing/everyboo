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
		<form action="${ctx }/sysParam/save" id="editForm" method="post">
		<input type="hidden" name="id" value="${bean.id }"/>
		<input type="hidden" name="createDate" value="${bean.createDate }"/>
		<div class="">
			<div class="J_formTable l_form_table">
				<table class="not_hightlight">
					<tr>
						<td class="l_title w150"><b class="cRed">*</b> 参数编码</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     <c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="sysCode" data-rule="参数编码:required;" value="${bean.sysCode }" readonly="readonly"/>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="sysCode" data-rule="参数编码:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
					<tr>
					<td class="l_title w150"><b class="cRed">*</b>参数类型</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="sysType" data-rule="参数类型:required;" value="${bean.sysType }" readonly="readonly"/>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="sysType" data-rule="参数类型:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     
					<tr>
					<td class="l_title w150"><b class="cRed">*</b>参数值</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="sysValue" data-rule="参数值:required;" value="${bean.sysValue }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="sysValue" data-rule="参数值:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                     </tr>
					<tr>
					<td class="l_title w150">备注</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="sysDesc"  value="${bean.sysDesc }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="sysDesc"  value="" />
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