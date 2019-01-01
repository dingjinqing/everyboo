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
		  <form action="${ctx }/user/list" id="queryForm" method="post">
	        <div class="J_toolsBar clearfix">
				<%-- <div class="t_label">会员等级</div>
				<div class="t_text ml10">
                	<input placeholder="请输入会员等级" type="text" name="userName" id="userName" value="${userQueryDTO.userName }"/>
                </div>
                <div class="t_button mgl30">
               		<a class="abtn red" href="javascript:myQuery();">
               		   <i class="icon"></i>查询
               		</a>
               	</div> --%>
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
                                     <span>健康值激活数（直推）</span>
                                 </td>
                                 <td>
                                     <span>健康值激活数（间推）</span>
                                 </td>
                                 <td>
                                     <span>直推奖</span>
                                 </td>
                                 <td>
                                     <span>间推奖</span>
                                 </td>
                                 <td>
                                     <span>管理奖</span>
                                 </td>
                                 <td>
                                     <span>未激活总值健康值</span>
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
		                                        ${u.ztjkljhs }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                        ${u.jtjkljhs }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                         ${u.ztj }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                         ${u.jtj }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                        ${u.glj }
		                                     </div>
		                                 </td>
		                                 <td>
		                                     <div class="t_text tc">
		                                        ${u.bill }
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
		$.post('${ctx}/shoprule/edit?id='+id, {}, function(str){
			
			layer.close(loadIdx);
			layer.open({
				title : title,
				type : 1,
				area : ['860px', '500px'],
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