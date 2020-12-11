package com.ruoyi.common.utils;

import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.bean.SysUserCommon;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

/**
 * shiro 工具类
 * 
 * @author ruoyi
 */
public class ShiroCommonUtils
{
    public static Subject getSubject()
    {
        return SecurityUtils.getSubject();
    }

    public static Session getSession()
    {
        return SecurityUtils.getSubject().getSession();
    }

    public static void logout()
    {
        getSubject().logout();
    }

    public static SysUserCommon getSysUser()
    {
        SysUserCommon user = new SysUserCommon();
        Object obj = getSubject().getPrincipal();
        if (StringUtils.isNotNull(obj))
        {
            BeanUtils.copyBeanProp(user, obj);
        }
        return user;
    }

}
