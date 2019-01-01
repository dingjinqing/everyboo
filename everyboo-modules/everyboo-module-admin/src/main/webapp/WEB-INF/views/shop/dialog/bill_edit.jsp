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
		<form action="${ctx }/shopbilltrade/save" id="editForm" method="post">
		<input type="hidden" name="id" value="${bean.id }"/>
		<input type="hidden" name="createDate" value="${bean.createDate }"/>
		<div class="">
			<div class="J_formTable l_form_table">
				<table class="not_hightlight">
					<tr>
					<td class="l_title w150"><b class="cRed">*</b>用户id</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="userId" data-rule="用户id:required;" value="${bean.userId }" readonly="readonly"/>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="userId" data-rule="用户id:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
						<td class="l_title w150"><b class="cRed">*</b> 操作类型</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<select name="type" data-rule="操作类型:required;" value="${bean.type }">
                                     				<option value="1" <c:if test="${'1' eq bean.type }">selected</c:if> >提现</option>
                                     				<option value="2" <c:if test="${'2' eq bean.type }">selected</c:if> >转让</option>
                                     				<option value="3" <c:if test="${'3' eq bean.type }">selected</c:if> >捐赠</option>
                                     			</select>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<select name="type" data-rule="操作类型:required;" >
                                     				<option value="">请选择</option>
                                     				<option value="1">提现</option>
                                     				<option value="2" >转让</option>
                                     				<option value="3" >捐赠</option>
                                     			</select>
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         
                     </tr>
					<tr>
					<td class="l_title w150"><b class="cRed">*</b>数量</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="count" data-rule="数量:required;" value="${bean.count }" readonly="readonly"/>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="count" data-rule="数量:required;" value="" />
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
						<td class="l_title w150"><b class="cRed">*</b>交易状态</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<select name="tradeStatus" data-rule="交易状态:required;" >
                                     				<option value="1" <c:if test="${'1' eq bean.tradeStatus }">selected</c:if> >待审核</option>
                                     				<option value="2" <c:if test="${'2' eq bean.tradeStatus }">selected</c:if> >已完成</option>
                                     			</select>
                                     		</c:when>
                                     		<c:otherwise>
                                     			<select name="tradeStatus" data-rule="交易状态:required;" >
                                     				<option value="1">待审核</option>
                                     				<option value="2" selected>已完成</option>
                                     			</select>
                                     		</c:otherwise>
                                     	</c:choose>
                                     </label>
                                 </div>
                             </div>
                         </td>
                         
                     </tr>
                     
                     <tr>
						<td class="l_title w150">受让人手机号</td>
                         <td>
                             <div class="J_toolsBar fl">
                                 <div class="t_text w200 ml10">
                                     <label>
                                     	<c:choose>
                                     		<c:when test="${not empty bean }">
                                     			<input type="text" name="tradePhone"  value="${bean.tradePhone }" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="tradePhone"  value="" />
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
                                     			<input type="text" name="createDate" value="${bean.createDate }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />
                                     		</c:when>
                                     		<c:otherwise>
                                     			<input type="text" name="createDate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"/>
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