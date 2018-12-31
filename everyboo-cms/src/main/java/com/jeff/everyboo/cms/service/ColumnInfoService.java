package com.jeff.everyboo.cms.service;

import com.jeff.everyboo.cms.entity.ColumnInfo;
import com.jeff.everyboo.cms.dao.ColumnInfoDao;
import com.jeff.everyboo.cms.dto.ColumnInfoQueryDTO;
import com.jeff.everyboo.common.service.CommonService;
import com.jeff.everyboo.common.entity.PageModel;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * @author xujianfang
 * @desc ColumnInfoService类 
 * @date 2017-03-16
 */
@Service
public class ColumnInfoService extends CommonService< ColumnInfo,String >  {

    @Autowired
    private ColumnInfoDao columnInfoDao;

    @Autowired
    public void setColumnInfoDao(ColumnInfoDao columnInfoDao){
      super.setCommonDao(columnInfoDao);
    }

    public PageModel<ColumnInfo> queryColumnInfoPage(ColumnInfoQueryDTO columnInfoQueryDTO){
           return this.columnInfoDao.queryColumnInfoPage(columnInfoQueryDTO);
    }

    public List<ColumnInfo> queryColumnInfoList(ColumnInfoQueryDTO columnInfoQueryDTO){
           return this.columnInfoDao.queryColumnInfoList(columnInfoQueryDTO);
    }


}