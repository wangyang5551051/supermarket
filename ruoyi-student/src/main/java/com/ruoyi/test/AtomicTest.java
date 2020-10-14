package com.ruoyi.test;

import java.util.concurrent.atomic.AtomicReference;

/**
 * 自旋锁实例
 */
class SpinLock {
    //java中原子（CAS）操作
    AtomicReference<Thread> owner = new AtomicReference<Thread>();//持有自旋锁的线程对象
    private int count;

    //lock函数将owner设置为当前线程，并且预测原来的值为空。unlock函数将owner设置为null，并且预测值为当前线程。
    // 当有第二个线程调用lock操作时由于owner值不为空，导致循环
    public void lock() {
        Thread cur = Thread.currentThread();
        System.out.println(cur.getName());
        //一直被执行，直至第一个线程调用unlock函数将owner设置为null，第二个线程才能进入临界区。
        while (!owner.compareAndSet(null, cur)) {

        }
    }

    public void unLock() {
        Thread cur = Thread.currentThread();
        owner.compareAndSet(cur, null);

    }


    public static class AtomicTest implements Runnable {
        static int sum;
        private SpinLock lock;

        public AtomicTest(SpinLock lock) {
            this.lock = lock;
        }

        public static void main(String[] args) throws InterruptedException {
            SpinLock lock = new SpinLock();
            for (int i = 0; i < 100; i++) {
                AtomicTest test = new AtomicTest(lock);
                Thread t = new Thread(test);
                t.start();
            }

            Thread.currentThread().sleep(1000);
            System.out.println(sum);
        }

        @Override
        public void run() {
            this.lock.lock();
            sum++;
            this.lock.unLock();
        }
    }
}