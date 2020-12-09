package com.ruoyi.student.mapper;

import com.ruoyi.student.domain.Zstudent;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2020-08-04
 */
public interface ZstudentMapper
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

    void insertZstudentList(List<Zstudent> list);

    void updateZstudentList(List<Zstudent> list);

    void updateZstudentListById(@Param("list") List<Long> list,@Param("age") long age,@Param("jisha") BigDecimal jisha,@Param("mofa") BigDecimal mofa);
}
