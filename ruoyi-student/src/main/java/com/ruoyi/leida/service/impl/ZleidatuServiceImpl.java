package com.ruoyi.leida.service.impl;

import com.ruoyi.annotation.CacheFind;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.leida.domain.Zleidatu;
import com.ruoyi.leida.mapper.ZleidatuMapper;
import com.ruoyi.leida.service.IZleidatu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;
import java.util.Set;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-08-10
 */
@Service
public class ZleidatuServiceImpl implements IZleidatu
{
    @Autowired
    private ZleidatuMapper zstudentMapper;
    @Autowired
    private JedisPool jedisPool;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public Zleidatu selectZstudentById(Long id)
    {
        return zstudentMapper.selectZstudentById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param zstudent 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @CacheFind(key = "LEIDA_LIST")
    @Override
    public List<Zleidatu> selectZstudentList(Zleidatu zstudent)
    {
        return zstudentMapper.selectZstudentList(zstudent);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertZstudent(Zleidatu zstudent)
    {
        Jedis jedis = jedisPool.getResource();
        jedis.flushDB();
        jedis.close();
        return zstudentMapper.insertZstudent(zstudent);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateZstudent(Zleidatu zstudent)
    {
        Jedis jedis = jedisPool.getResource();
        jedis.flushDB();
        jedis.close();
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
        Jedis jedis = jedisPool.getResource();
        jedis.flushDB();
        jedis.close();
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
        Jedis jedis = jedisPool.getResource();
        jedis.flushDB();
        jedis.close();
        return zstudentMapper.deleteZstudentById(id);
    }
}
