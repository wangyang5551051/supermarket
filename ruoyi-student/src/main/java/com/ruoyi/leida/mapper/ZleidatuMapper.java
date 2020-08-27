package com.ruoyi.leida.mapper;

import com.ruoyi.leida.domain.Zleidatu;

import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2020-08-10
 */
public interface ZleidatuMapper
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public Zleidatu selectZstudentById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param zstudent 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Zleidatu> selectZstudentList(Zleidatu zstudent);

    /**
     * 新增【请填写功能名称】
     * 
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    public int insertZstudent(Zleidatu zstudent);

    /**
     * 修改【请填写功能名称】
     * 
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    public int updateZstudent(Zleidatu zstudent);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteZstudentById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteZstudentByIds(String[] ids);
}
