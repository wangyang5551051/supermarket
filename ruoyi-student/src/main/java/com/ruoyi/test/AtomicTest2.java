package com.ruoyi.test;

import java.util.concurrent.CountDownLatch;

/**
 * Created by WangYangfan on 2020/10/12 14:08
 * 俩猴子抢香蕉
 */
public class AtomicTest2 {

    public static void main(String[] args) throws InterruptedException {
        final CountDownLatch latch = new CountDownLatch(1);
        new Thread(new Monkey(2, latch)).start();
        new Thread(new Monkey(3, latch)).start();
        latch.countDown();
    }

}

class Monkey implements Runnable {
    private boolean flag = true;
    private int a;
    private CountDownLatch latch;
    private static int b = 10;

    Monkey(int a,CountDownLatch latch) {
        this.a = a;
        this.latch = latch;
    }

    @Override
    public void run() {
        try {
            latch.await();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        while (flag) {
            synchronized (AtomicTest2.class) {
                if(b >= a){
                    b = b - a;
                    System.out.println("拿到" + a + "个香蕉");
                }else {
                    flag = false;
                }
            }
        }
        System.out.println("停止拿香蕉,剩余" + b+"个香蕉");
    }
}

