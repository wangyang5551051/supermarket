package com.ruoyi.moudle.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import redis.clients.jedis.Jedis;

@SpringBootTest //需要依赖spring容器,从容器中动态的获取对象
public class TestRedis {

    @Autowired
    private Jedis jedis;
    /**
     * 完成Redis入门案例测试
     * 报错说明:
     *      1.检查Linux防火墙
     *      2.检查Redis3项配置
     *      3.重启redis.
     */
    @Test
    public void test01(){
        //1.向redis中保存数据
        jedis.set("2004", "哈哈哈 今天下雨了 不负众望");
        //2.从redis中获取数据
        String value = jedis.get("2004");
        System.out.println(value);
    }
}