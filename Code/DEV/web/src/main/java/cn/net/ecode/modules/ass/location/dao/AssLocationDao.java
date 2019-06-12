/**
 * Copyright &copy; 2013-2016 山东易科德软件有限公司   All rights reserved.
 */
package cn.net.ecode.modules.ass.location.dao;

import cn.net.ecode.common.persistence.CrudDao;
import cn.net.ecode.common.persistence.annotation.MyBatisDao;
import cn.net.ecode.modules.ass.location.entity.AssLocation;

/**
 * 存放地点DAO接口
 * @author yangjianjun
 * @version 2018-09-29
 */
@MyBatisDao
public interface AssLocationDao extends CrudDao<AssLocation> {

    AssLocation getLocalCodeSql(AssLocation assLocation);
}