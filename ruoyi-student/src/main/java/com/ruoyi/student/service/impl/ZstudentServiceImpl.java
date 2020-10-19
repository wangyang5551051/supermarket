package com.ruoyi.student.service.impl;

import com.alibaba.fastjson.JSON;
import com.ruoyi.annotation.CacheFind;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.student.domain.Zstudent;
import com.ruoyi.student.mapper.ZstudentMapper;
import com.ruoyi.student.service.ZstudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2020-08-04
 */
@Service
public class ZstudentServiceImpl implements ZstudentService {
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
    public Zstudent selectZstudentById(Long id) {
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
    public List<Zstudent> selectZstudentList(Zstudent zstudent) {
//        QueryWrapper<Zstudent> queryWrapper4 = new QueryWrapper<>();
//        queryWrapper4.lambda().like(Zstudent::getName,zstudent.getName());
//        List<Zstudent> id = zstudentMapper.selectList(queryWrapper4);
        return zstudentMapper.selectZstudentList(zstudent);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    @Override
    @Transactional
    public int insertZstudent(Zstudent zstudent) {
        jedis.flushDB();
        zstudentMapper.insertZstudent(zstudent);
        return 1;
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param zstudent 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateZstudent(Zstudent zstudent) {
        jedis.flushDB();
        zstudentMapper.updateZstudent(zstudent);
        return 1;
    }

    /**
     * 删除【请填写功能名称】对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteZstudentByIds(String ids) {
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
    public int deleteZstudentById(Long id) {
        jedis.flushDB();
        return zstudentMapper.deleteZstudentById(id);
    }

    @Override
    public Object[] selectWeather(String province, String city, String area, String data) {
        Object[] objects = new Object[4];
        String host = "https://iweather.market.alicloudapi.com";
        String path = "/address";
        String method = "GET";
        String appcode = "b3f02b20f86d4ee0a41167ca372b998c";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<>();
        querys.put("prov", province);
        querys.put("city", city);
        querys.put("area", area);
//        querys.put("date", "202010");
        querys.put("needday", "7");

        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            String string = JSON.toJSONString(querys);
            String buildUrl = HttpUtils.buildUrl(host, path, querys);
            String string1 = "?area=";
            String response = HttpUtils.sendGet(buildUrl,headers);
//            HttpResponse response = HttpUtils.sendGet(host, path, method, headers, querys);

            HashMap hashMap1 = JSON.parseObject(response, HashMap.class);
            Object data1 = hashMap1.get("data");
            HashMap hashMap2 = JSON.parseObject(data1.toString(), HashMap.class);
            Object data2 = hashMap2.get("day7");
            List<HashMap> maps = JSON.parseArray(data2.toString(), HashMap.class);
            List<Object> air = new ArrayList<>();
            List<Object> nightAir = new ArrayList<>();
            List<Object> date = new ArrayList<>();
            maps.forEach(x ->{
                air.add(x.get("day_air_temperature"));
                nightAir.add(x.get("night_air_temperature"));
                date.add("周"+x.get("week").toString());
            });

            objects[0] = date;
            objects[1] = air;
            objects[2] = nightAir;
            objects[3] = data2;
            System.out.println();
            //获取response的body
            //System.out.println(EntityUtils.toString(response.getEntity()));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return objects;
    }
}
