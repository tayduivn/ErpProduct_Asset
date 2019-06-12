/**
 * Copyright &copy; 2014 山东易科德软件有限公司   All rights reserved.
 */
package cn.net.ecode.modules.ass.inout.dao;

import cn.net.ecode.common.persistence.CrudDao;
import cn.net.ecode.common.persistence.annotation.MyBatisDao;
import cn.net.ecode.modules.ass.inout.entity.InoutBills;

import java.util.List;

/**
 * 入库子表DAO接口
 * @version 2015-11-24
 */
@MyBatisDao
public interface InoutBillsDao extends CrudDao<InoutBills> {
	public List<InoutBills> findInoutBillsDtl(InoutBills inoutBills);

}