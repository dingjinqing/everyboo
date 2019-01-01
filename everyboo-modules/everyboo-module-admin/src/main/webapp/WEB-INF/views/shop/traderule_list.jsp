<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../common/common.jsp" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${menu_name } - ${title }</title>
</head>
<link href="${ctx }/static/plugins/chosen_v1.6.2/chosen.css" rel="stylesheet" />
<body <%@ include file="../common/skin.jsp" %>>
	<%@ include file="../common/head.jsp" %>
    <%@ include file="../common/menu.jsp" %>
    <div class="J_content">
		<div class="mt20 plr20">
		  <form action="${ctx }/traderule/list" id="queryForm" method="post">
	        <div class="J_toolsBar clearfix">
				<div class="t_label">会员等级</div>
					<div class="t_text ml10">
						<select name="vipLevel" 
							value="${queryDTO.vipLevel }">
							<option value="">请选择</option>
							<option value="v0" <c:if test="${'v0' eq queryDTO.vipLevel }">selected</c:if> >普通会员</option>
							<option value="v1" <c:if test="${'v1' eq queryDTO.vipLevel }">selected</c:if> >个人vip</option>
							<option value="v2" <c:if test="${'v2' eq queryDTO.vipLevel }">selected</c:if> >初级代理</option>
							<option value="v3" <c:if test="${'v3' eq queryDTO.vipLevel }">selected</c:if> >中级代理</option>
							<option value="v4" <c:if test="${'v4' eq queryDTO.vipLevel }">selected</c:if> >高级代理</option>
							<option value="v5" <c:if test="${'v5' eq queryDTO.vipLevel }">selected</c:if> >核心代理</option>
							<option value="v6" <c:if test="${'v6' eq queryDTO.vipLevel }">selected</c:if> >运营中心</option>
							<option value="v7" <c:if test="${'v7' eq queryDTO.vipLevel }">selected</c:if> >公司合伙人</option>
						</select>
					</div>
					
                         <div class="t_label"> 复购商品</div>
                             <div class="t_text ml10">
									<select data-placeholder="选择商品" class="chosen-select" name="proId">
										<option value="">请选择</option>
										<c:forEach items="${productList }" var="r">
											<c:set var="selected"/>
											<c:if test="${queryDTO.proId eq r.id }">
												<c:set var="selected" value="selected=\"selected\""/>
											</c:if>
											<option value="${r.id }" ${selected }>${r.proName }</option>
										</c:forEach>
									</select>
                             </div>
					
                <div class="t_button mgl30">
               		<a class="abtn red" href="javascript:myQuery();">
               		   <i class="icon"></i>查询
               		</a>
               	</div>
               	<div class="t_button ml10">
               		<a class="abtn blue" href="javascript:myEdit();">
               		   <i class="icon"></i>新增
               		</a>
               	</div>
               	<div class="t_label ml10">
					记录数：<label style="color: red;" id="total">${page.totalCount }</label>
				</div>
			</div>
			
			<div class="J_table mt20">
                 <div class="t_table">
                     <table>
                         <thead>
                             <tr>
                                 <td>
                                     <span>会员等级</span>
                                 </td>
                                 <td>
                                     <span>商品名称</span>
                                 </td>
                                 <td>
                                     <span>购买返点</span>
                                 </td>
                                 <td>
                                     <span>直推购买返点</span>
                                 </td>
                                 <td>
                                     <span>间推购买返点</span>
                                 </td>
                                 <td>
                                 	 <span>创建时间</span>
                                 </td> 
                                 <td>
                                     <span>操作</span>
                                 </td>
                             </tr>
                         </thead>
                         <tbody>
                            <c:choose>
                              <c:when test="${page.list != null && page.totalCount > 0 }">
                                 <c:forEach items="${page.list }" var="u" >
		                             <tr>
		                                 <td>
		                                     <div class="t_text tc">
		                                        <c:choose>
															<c:when test="${'v1' eq u.vipLevel}">
		                                     			个人vip
		                                     		</c:when>
															<c:when test="${'v2' eq u.vipLevel}">
		                                     			初级代理
		                                     		</c:when>
															<c:when test="${'v3' eq u.vipLevel}">
		                                     			中级代理
		                                     		</c:when>
															<c:when test="${'v4' eq u.vipLevel}">
		                                     			高级代理
		                                     		</c:when>
															<c:when test="${'v5' eq u.vipLevel}">
		                                     			核心代理
		                                     		</c:when>
															<c:when test="${'v6' eq u.vipLevel}">
		                                     			运营中心
		                                     		</c:when>
															<c:when test="${'v7' eq u.vipLevel}">
		                                     			公司合伙人
		                                     		</c:when>
															<c:otherwise>
		                                     			普通会员
		                                     		</c:otherwise>
														</c:choose>
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                        ${u.proName }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                        ${u.fugoufd }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                         ${u.fugouztfd }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                         ${u.fugoujtfd }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                         <fmt:formatDate value="${u.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
		                                     </div>
		                                 </td>
		                                 
		                                 <td>
		                                     <div class="t_link">
		                                         <a href="javascript:myEdit('${u.id }');"><i class="icon"></i>编辑</a>
		                                     </div>
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
                 <%@ include file="../common/pager.jsp"%>
             </div>
            </form>
		</div>
    </div>
<script src="${ctx }/static/plugins/chosen_v1.6.2/chosen.jquery.js"></script>    
<script type="text/javascript">
	function myEdit(id){
		var loadIdx = layer.load();
		var title = '添加规则';
		if(!id){
			id = '';
		}else{
			title = '修改规则';
		}
		$.post('${ctx}/traderule/edit?id='+id, {}, function(str){
			
			layer.close(loadIdx);
			layer.open({
				title : title,
				type : 1,
				area : ['600px', '500px'],
				content : str,
				btn : ['确定', '取消'],
				yes : function(index, layero){
					$('#editForm').submit();
				},
				btn2 : function(index, layero){
				    layer.close(index);
				}
			});
		});
	}
	
	function mySubmit(){
		$('#editForm').submit();
	}
	
	function myQuery(){
		$('#queryForm').submit();
	}
	
</script>
</body>
</html>