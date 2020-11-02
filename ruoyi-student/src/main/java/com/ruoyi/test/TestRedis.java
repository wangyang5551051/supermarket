package com.ruoyi.test;

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

    @Test
    public void test3 (){
        int[] arr = {10,7,2,4,7,62,3,4,2,1,8,19,9};
        quickSort(arr, 0, arr.length-1);
        for (int i = 0; i < arr.length; i++) {
            System.out.println(arr[i]);
        }
    }


    public static void quickSort(int[] arr,int low,int high){
        int i,j,temp,t;
        if(low>high){
            return;
        }
        i=low;
        j=high;
        //temp就是基准位
        temp = arr[low];

        while (i<j) {
            //先看右边，依次往左递减
            while (temp<=arr[j]&&i<j) {
                j--;
            }
            //再看左边，依次往右递增
            while (temp>=arr[i]&&i<j) {
                i++;
            }
            //如果满足条件则交换
            if (i<j) {
                t = arr[j];
                arr[j] = arr[i];
                arr[i] = t;
            }

        }
        //最后将基准为与i和j相等位置的数字交换
        arr[low] = arr[i];
        arr[i] = temp;
        //递归调用左半数组
        quickSort(arr, low, j-1);
        //递归调用右半数组
        quickSort(arr, j+1, high);
    }
}