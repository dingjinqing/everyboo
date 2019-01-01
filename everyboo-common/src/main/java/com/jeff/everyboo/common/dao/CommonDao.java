package com.jeff.everyboo.common.dao;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * 基础Dao接口定义
 * @author dingjinqing@163.com
 * @since 2015-12-09
 */
@NoRepositoryBean
public interface CommonDao<E,ID extends Serializable>  extends JpaRepository<E,ID>, JpaSpecificationExecutor<E> {

}
