package com.jeff.everyboo.cms.dao;

import com.jeff.everyboo.common.entity.PageModel;
import java.util.List;
import com.jeff.everyboo.cms.entity.ColumnInfo;
import com.jeff.everyboo.cms.dto.ColumnInfoQueryDTO;
/**
 * @author xujianfang
 * @desc ColumnInfoDaoCustom接口 
 * @date 2017-03-16
 */
public interface ColumnInfoDaoCustom {

      PageModel<ColumnInfo> queryColumnInfoPage(ColumnInfoQueryDTO columnInfoQueryDTO);

      List<ColumnInfo> queryColumnInfoList(ColumnInfoQueryDTO columnInfoQueryDTO);



}