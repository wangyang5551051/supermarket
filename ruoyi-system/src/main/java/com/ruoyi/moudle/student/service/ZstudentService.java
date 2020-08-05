package com.ruoyi.moudle.student.service;



import com.ruoyi.moudle.student.domain.Zstudent;

import java.util.List;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2020-08-04
 */
public interface ZstudentService
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public Zstudent selectZstudentById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param zstudent 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Zstudent> selectZstudentList(Zstudent zstudent);

    /**
     * 新增【请填写功能名称】
     * 
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    public int insertZstudent(Zstudent zstudent);

    /**
     * 修改【请填写功能名称】
     * 
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    public int updateZstudent(Zstudent zstudent);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteZstudentByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteZstudentById(Long id);
}
