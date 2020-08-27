package com.ruoyi.student.service.impl;

import com.ruoyi.annotation.CacheFind;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.student.domain.Zstudent;
import com.ruoyi.student.mapper.ZstudentMapper;
import com.ruoyi.student.service.ZstudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;

import java.util.List;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-08-04
 */
@Service
public class ZstudentServiceImpl implements ZstudentService
{
    @Autowired
    private ZstudentMapper zstudentMapper;
    @Autowired
    private Jedis jedis;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public Zstudent selectZstudentById(Long id)
    {
        return zstudentMapper.selectZstudentById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param zstudent 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    @CacheFind(key = "STU_LIST")
    public List<Zstudent> selectZstudentList(Zstudent zstudent)
    {
        return zstudentMapper.selectZstudentList(zstudent);
    }

//    /**
//     * 查询【请填写功能名称】列表
//     *
//     * @param zstudent 【请填写功能名称】
//     * @return 【请填写功能名称】
//     */
//    @Override
//    public List<Zstudent> selectZstudentList(Zstudent zstudent)
//    {
//        if(jedis.exists(zstudent.getName())){
//            String value = jedis.get(zstudent.getName());
//            List<Zstudent> zstudents = JsonListUtil.jsonToList(value, Zstudent.class);
//            return zstudents;
//        }else {
//            List<Zstudent> zstudents = zstudentMapper.selectZstudentList(zstudent);
//            if(StringUtils.isNotEmpty(zstudent.getName())){
//                jedis.set(zstudent.getName(),JsonListUtil.listToJson(zstudents));
//            }
//            return zstudents;
//        }
//    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    @Override
    @Transactional
    public int insertZstudent(Zstudent zstudent)
    {
        jedis.flushDB();
        zstudentMapper.insertZstudent(zstudent);
//        if(true){
//            throw new RuntimeException("测试");
//        }
        return 1;
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateZstudent(Zstudent zstudent)
    {
        jedis.flushDB();
        return zstudentMapper.updateZstudent(zstudent);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteZstudentByIds(String ids)
    {
        jedis.flushDB();
        return zstudentMapper.deleteZstudentByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteZstudentById(Long id)
    {
        jedis.flushDB();
        return zstudentMapper.deleteZstudentById(id);
    }
}
