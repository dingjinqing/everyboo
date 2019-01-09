<%@ page language="java" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<%@ include file="../common/common.jsp"%>


<head>
<link rel="stylesheet" href="${ctx }/static/js/uploadify/uploadify.css">

</head>

<body <%@ include file="../common/skin.jsp" %>>
	<%@ include file="../common/head.jsp"%>
	<%@ include file="../common/menu.jsp"%>
	<div class="J_content">
		<div id="addForm" class="mgt20">
			<form action="${ctx }/shopproduct/save" id="editForm" method="post">
				<input type="hidden" name="id" value="${bean.id }" />
				<input type="hidden" name="type" value="1" /> <input
					type="hidden" name="createBy" value="${bean.createBy }" /> <input
					type="hidden" name="createDate" value="${bean.createDate }" /> <input
					type="hidden" name="proLogoImg" id="proLogoImg"
					value="${bean.proLogoImg }" /> <input type="hidden"
					name="picture1" id="picture1" value="${bean.picture1 }" /> <input
					type="hidden" name="picture2" id="picture2"
					value="${bean.picture2 }" /> <input type="hidden" name="picture3"
					id="picture3" value="${bean.picture3 }" /> <input type="hidden"
					name="picture4" id="picture4" value="${bean.picture4 }" /> <input
					type="hidden" name="picture5" id="picture5"
					value="${bean.picture5 }" />
				<div class="">
					<div class="J_formTable l_form_table">
						<table class="not_hightlight">
							<tr>
								<td class="l_title w150"><b class="cRed">*</b> 商品名称</td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_text w200 ml10">
											<label> <c:choose>
													<c:when test="${not empty bean }">
														<input type="text" name="proName"
															data-rule="商品名称:required;" value="${bean.proName }" />
													</c:when>
													<c:otherwise>
														<input type="text" name="proName"
															data-rule="商品名称:required;" value="" />
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</div>
								</td>
								<td class="l_title w150"><b class="cRed">*</b>库存数量</td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_text w200 ml10">
											<label> <c:choose>
													<c:when test="${not empty bean }">
														<input type="text" name="proCount"
															data-rule="库存数量:required;" value="${bean.proCount }" />
													</c:when>
													<c:otherwise>
														<input type="text" name="proCount"
															data-rule="库存数量:required;" value="" />
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="l_title w150">赠送积分</td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_text w200 ml10">
											<label> <c:choose>
													<c:when test="${not empty bean }">
														<input type="text" name="incomeCredits"
															placeholder="购买商品赠送会员的积分，没有为0"
															value="${bean.incomeCredits }" />
													</c:when>
													<c:otherwise>
														<input type="text" name="incomeCredits"
															placeholder="购买商品赠送会员的积分，没有为0" value="" />
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</div>
								</td>
								<td class="l_title w150">消费积分</td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_text w200 ml10">
											<label> <c:choose>
													<c:when test="${not empty bean }">
														<input type="text" name="consumeCredits"
															placeholder="购买商品最高消费积分，没有为0"
															value="${bean.consumeCredits }" />
													</c:when>
													<c:otherwise>
														<input type="text" name="consumeCredits"
															placeholder="购买商品最高消费积分，没有为0" value="" />
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="l_title w150"><b class="cRed">*</b>兑换积分</td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_text w200 ml10">
											<label> <c:choose>
													<c:when test="${not empty bean }">
														<input type="text" name="price1"
															data-rule="兑换积分:required;" value="${bean.price1 }" />
													</c:when>
													<c:otherwise>
														<input type="text" name="price1"
															data-rule="兑换积分:required;" />
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</div>
								</td>
								<%-- <td class="l_title w150"><b class="cRed">*</b>商品价格2</td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_text w200 ml10">
											<label> <c:choose>
													<c:when test="${not empty bean }">
														<input type="text" name="price2"
															data-rule="商品价格:required;" placeholder="三级加盟店、四级加盟店的价格"
															value="${bean.price2 }" />
													</c:when>
													<c:otherwise>
														<input type="text" name="price2"
															data-rule="商品价格:required;" placeholder="三级加盟店、四级加盟店的价格" />
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</div>
								</td> 
							</tr>
							<tr>
								<td class="l_title w150"><b class="cRed">*</b>商品价格3</td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_text w200 ml10">
											<label> <c:choose>
													<c:when test="${not empty bean }">
														<input type="text" name="price3"
															data-rule="商品价格:required;" placeholder="五级加盟店、六级加盟店的价格"
															value="${bean.price3 }" />
													</c:when>
													<c:otherwise>
														<input type="text" name="price3"
															data-rule="商品价格:required;" placeholder="五级加盟店、六级加盟店的价格" />
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</div>
								</td> --%>
								<td class="l_title w150"><b class="cRed">*</b>状态</td>
								<td>
									<div class="J_toolsBar fl">
										<label><input name="status" type="radio" value="1"
											<c:if test="${bean.status == null || bean.status == 1 }">checked="checked"</c:if> />上架</label>
										<label><input name="status" type="radio" value="2"
											<c:if test="${bean.status == 2 }">checked="checked"</c:if> />下架</label>
									</div>
								</td>
							</tr>
								<tr>
									<td class="l_title w150">原来价格</td>
									<td>
										<div class="J_toolsBar fl">
											<label> <c:choose>
													<c:when test="${not empty bean }">
														<input type="text" name="oldPrice"
															value="${bean.oldPrice }" />
													</c:when>
													<c:otherwise>
														<input type="text" name="oldPrice" />
													</c:otherwise>
												</c:choose>
											</label>
										</div>
									</td>
									<td class="l_title w150">是否热门</td>
									<td>
										<div class="J_toolsBar fl">
											<label><input name="hot" type="radio" value="1"
												<c:if test="${bean.hot == null || bean.hot == 1 }">checked="checked"</c:if> />热门</label>
											<label><input name="hot" type="radio" value="2"
												<c:if test="${bean.hot == 2 }">checked="checked"</c:if> />普通</label>
										</div>
									</td>
								</tr>

							<tr>
								<td class="l_title w150">商品简介</td>
								<td colspan="3">
									<div class="J_toolsBar fl">
										<label> <c:choose>
												<c:when test="${not empty bean }">
													<textarea name="introduction" rows="3" maxlength="128"
														cols="70">${bean.introduction } </textarea>
												</c:when>
												<c:otherwise>
													<textarea name="introduction" rows="3" maxlength="128"
														cols="70"></textarea>
												</c:otherwise>
											</c:choose>
										</label>
									</div>
								</td>
							</tr>

							<tr id="contentTr">
								<td class="l_title w150">内容：</td>
								<td colspan="3">
									<div class="J_toolsBar fl">
										<label> <script type="text/plain" id="detail"
												name="detail">${bean.detail}</script>
										</label>
									</div>
								</td>
							</tr>

							<tr>
								<td class="l_title w150">封面图片：<a
									href="${ctx }/cms/article/flashView" target="_blank"><font
										color="red">无法上传？</font></a></td>
								<td>
									<div class="J_toolsBar fl">
										<div class=" w200 ml10">
											<label> <input type="file" id="attachImage" />
											</label>
										</div>
									</div>
								</td>
								<td class="l_title w150">图片1：</td>
								<td>
									<div class="J_toolsBar fl">
										<div class=" w200 ml10">
											<label> <input type="file" id="attachImage1" />
											</label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="l_title"></td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_img w100 ml10">
											<c:choose>
												<c:when
													test="${bean.proLogoImg != null && bean.proLogoImg != ''}">
													<img src="${ctx }${bean.proLogoImg}" id="attachURL"
														name="proLogoImg" width="100px" height="100px" />
												</c:when>
												<c:otherwise>
													<img src="${ctx }/static/images/J_null.png" id="attachURL"
														name="proLogoImg" width="100px" height="100px" />
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</td>
								<td class="l_title"></td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_img w100 ml10">
											<c:choose>
												<c:when
													test="${bean.picture1 != null && bean.picture1 != ''}">
													<img src="${ctx }${bean.picture1}" id="pic1" width="100px"
														height="100px" />
												</c:when>
												<c:otherwise>
													<img src="${ctx }/static/images/J_null.png" id="pic1"
														width="100px" height="100px" />
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="l_title w150">图片2：</td>
								<td>
									<div class="J_toolsBar fl">
										<div class=" w200 ml10">
											<label> <input type="file" id="attachImage2" />
											</label>
										</div>
									</div>
								</td>
								<td class="l_title w150">图片3：</td>
								<td>
									<div class="J_toolsBar fl">
										<div class=" w200 ml10">
											<label> <input type="file" id="attachImage3" />
											</label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="l_title"></td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_img w100 ml10">
											<c:choose>
												<c:when
													test="${bean.picture2 != null && bean.picture2 != ''}">
													<img src="${ctx }${bean.picture2}" id="pic2" width="100px"
														height="100px" />
												</c:when>
												<c:otherwise>
													<img src="${ctx }/static/images/J_null.png" id="pic2"
														width="100px" height="100px" />
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</td>
								<td class="l_title"></td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_img w100 ml10">
											<c:choose>
												<c:when
													test="${bean.picture3 != null && bean.picture3 != ''}">
													<img src="${ctx }${bean.picture3}" id="pic3" width="100px"
														height="100px" />
												</c:when>
												<c:otherwise>
													<img src="${ctx }/static/images/J_null.png" id="pic3"
														width="100px" height="100px" />
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="l_title w150">图片4：</td>
								<td>
									<div class="J_toolsBar fl">
										<div class=" w200 ml10">
											<label> <input type="file" id="attachImage4" />
											</label>
										</div>
									</div>
								</td>
								<td class="l_title w150">图片4：</td>
								<td>
									<div class="J_toolsBar fl">
										<div class=" w200 ml10">
											<label> <input type="file" id="attachImage5" />
											</label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="l_title"></td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_img w100 ml10">
											<c:choose>
												<c:when
													test="${bean.picture4 != null && bean.picture4 != ''}">
													<img src="${ctx }${bean.picture4}" id="pic4" width="100px"
														height="100px" />
												</c:when>
												<c:otherwise>
													<img src="${ctx }/static/images/J_null.png" id="pic4"
														width="100px" height="100px" />
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</td>
								<td class="l_title"></td>
								<td>
									<div class="J_toolsBar fl">
										<div class="t_img w100 ml10">
											<c:choose>
												<c:when
													test="${bean.picture5 != null && bean.picture5 != ''}">
													<img src="${ctx }${bean.picture5}" id="pic5" width="100px"
														height="100px" />
												</c:when>
												<c:otherwise>
													<img src="${ctx }/static/images/J_null.png" id="pic5"
														width="100px" height="100px" />
												</c:otherwise>
											</c:choose>

										</div>
									</div>
								</td>
							</tr>


							<tr>
								<td colspan="4">
									<div class="J_toolsBar mgt40">
										<div class="t_buttonGroup">
											<a class="abtn red" href="javascript:mySubmit();"> <i
												class="icon"></i>保存
											</a> <a class="abtn gray" href="javascript:myBack();"> <i
												class="icon"></i>返回
											</a>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${ctx }/ueditor/editor_config.js"></script>
	<script type="text/javascript" src="${ctx }/ueditor/editor_all.js"></script>
	<script src="${ctx }/static/js/uploadify/jquery.uploadify.js"></script>
	<script type="text/javascript">
		UE.getEditor('detail', {
			initialFrameWidth : 700,
			initialFrameHeight : 350
		});

		//表单验证
		$(function() {
			$('#editForm').validator({
				fields : {
					name : '角色名称:required;length[~50]'
				},
				valid : function(form) {
					var laodIdx = layer.load();

					$('#editForm').ajaxSubmit({
						data : {},
						traditional : true,
						success : function(result) {
							layer.close(laodIdx);
							if (result.success) {
								layer.alert('保存成功', function() {
									window.location.reload();
								});
							} else {
								layer.alert(result.msg);
							}
						}
					});
				}
			});

		});

		function myBack() {
			window.location.href = "${ctx}/shopproduct/list";
		}

		function mySubmit() {
			$('#editForm').submit();
		}

		$("#attachImage")
				.uploadify(
						{
							'swf' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify.swf',
							'uploader' : '${pageContext.request.contextPath}/upload/uploadAttach',
							'cancelImg' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify-cancel.png',
							'queueID' : 'fileQueue',
							'auto' : true,
							'multi' : false,
							'simUploadLimit' : 1,
							'buttonText' : '上传图片',
							'fileObjName' : 'fileData',
							'width' : 70,
							'height' : 20,
							'queueSizeLimit' : 6,
							'onUploadSuccess' : function(file, data, response) {
								if (data != null) {
									var attachUrl = '${pageContext.request.contextPath}'
											+ data;
									$("#attachURL").attr('src', attachUrl);
									$("#proLogoImg").val(data);
								}
							}
						});
		$("#attachImage1")
				.uploadify(
						{
							'swf' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify.swf',
							'uploader' : '${pageContext.request.contextPath}/upload/uploadAttach',
							'cancelImg' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify-cancel.png',
							'queueID' : 'fileQueue',
							'auto' : true,
							'multi' : false,
							'simUploadLimit' : 1,
							'buttonText' : '上传图片',
							'fileSizeLimit' : '512kb',
							'fileObjName' : 'fileData',
							'width' : 70,
							'height' : 20,
							'queueSizeLimit' : 6,
							'onUploadSuccess' : function(file, data, response) {
								if (data != null) {
									var attachUrl = '${pageContext.request.contextPath}'
											+ data;
									//var num = file.index + 1;
									$("#pic1").attr('src', attachUrl);
									$("#picture1").val(data);
								}
							}
						});
		$("#attachImage2")
				.uploadify(
						{
							'swf' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify.swf',
							'uploader' : '${pageContext.request.contextPath}/upload/uploadAttach',
							'cancelImg' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify-cancel.png',
							'queueID' : 'fileQueue',
							'auto' : true,
							'multi' : false,
							'simUploadLimit' : 1,
							'buttonText' : '上传图片',
							'fileSizeLimit' : '512kb',
							'fileObjName' : 'fileData',
							'width' : 70,
							'height' : 20,
							'queueSizeLimit' : 6,
							'onUploadSuccess' : function(file, data, response) {
								if (data != null) {
									var attachUrl = '${pageContext.request.contextPath}'
											+ data;
									//var num = file.index + 1;
									$("#pic2").attr('src', attachUrl);
									$("#picture2").val(data);
								}
							}
						});
		$("#attachImage3")
				.uploadify(
						{
							'swf' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify.swf',
							'uploader' : '${pageContext.request.contextPath}/upload/uploadAttach',
							'cancelImg' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify-cancel.png',
							'queueID' : 'fileQueue',
							'auto' : true,
							'multi' : false,
							'simUploadLimit' : 1,
							'buttonText' : '上传图片',
							'fileSizeLimit' : '512kb',
							'fileObjName' : 'fileData',
							'width' : 70,
							'height' : 20,
							'queueSizeLimit' : 6,
							'onUploadSuccess' : function(file, data, response) {
								if (data != null) {
									var attachUrl = '${pageContext.request.contextPath}'
											+ data;
									//var num = file.index + 1;
									$("#pic3").attr('src', attachUrl);
									$("#picture3").val(data);
								}
							}
						});
		$("#attachImage4")
				.uploadify(
						{
							'swf' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify.swf',
							'uploader' : '${pageContext.request.contextPath}/upload/uploadAttach',
							'cancelImg' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify-cancel.png',
							'queueID' : 'fileQueue',
							'auto' : true,
							'multi' : false,
							'simUploadLimit' : 1,
							'buttonText' : '上传图片',
							'fileSizeLimit' : '512kb',
							'fileObjName' : 'fileData',
							'width' : 70,
							'height' : 20,
							'queueSizeLimit' : 6,
							'onUploadSuccess' : function(file, data, response) {
								if (data != null) {
									var attachUrl = '${pageContext.request.contextPath}'
											+ data;
									//var num = file.index + 1;
									$("#pic4").attr('src', attachUrl);
									$("#picture4").val(data);
								}
							}
						});
		$("#attachImage5")
				.uploadify(
						{
							'swf' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify.swf',
							'uploader' : '${pageContext.request.contextPath}/upload/uploadAttach',
							'cancelImg' : '${pageContext.request.contextPath}/static/js/uploadify/uploadify-cancel.png',
							'queueID' : 'fileQueue',
							'auto' : true,
							'multi' : false,
							'simUploadLimit' : 1,
							'buttonText' : '上传图片',
							'fileSizeLimit' : '512kb',
							'fileObjName' : 'fileData',
							'width' : 70,
							'height' : 20,
							'queueSizeLimit' : 6,
							'onUploadSuccess' : function(file, data, response) {
								if (data != null) {
									var attachUrl = '${pageContext.request.contextPath}'
											+ data;
									//var num = file.index + 1;
									$("#pic5").attr('src', attachUrl);
									$("#picture5").val(data);
								}
							}
						});
	</script>
</body>
</html>