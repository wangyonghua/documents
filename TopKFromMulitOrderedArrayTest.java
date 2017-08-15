package com.niukaijun.test;

import org.junit.Test;

import java.util.*;

/**
 * Created by nkj on 2017/8/11.
 */
public class TopKFromMulitOrderedArrayTest {

    private Random random = new Random(System.currentTimeMillis());

    @Test
    public void test() {
        List<int[]> list = new ArrayList<>();
        int n = 20, m = 10, k = 30;
        for (int i = 0; i < n; i++) {
            int[] mArray = new int[m];
            for (int j = 0; j < m; j++) {
                mArray[j] = random.nextInt(30000);
            }
            Arrays.sort(mArray);
            list.add(mArray);
        }

        for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < list.get(i).length; j++) {
                System.out.print(list.get(i)[j] + " ");
            }
            System.out.println();
        }

        // 测试数据准备完毕，开始算法
        int[] indexArray = new int[n];
        int[] result = new int[k + 1];
        result[0] = Integer.MIN_VALUE;
        int length = 1;

//        // 把第一列全部插入结果集
//        for (int i = 0; i < indexArray.length; i++) {
//            if (list.get(i).length > 0) {
//                indexArray[i] = 1;
//                insert(result, length, list.get(i)[0]);
//                length ++;
//            }
//        }

        boolean finish = false;
        while (length < result.length && !finish) {
            finish = true;
            for (int i = 0; i < indexArray.length; i++) {
                while (indexArray[i] < list.get(i).length) {
                    if (list.get(i)[indexArray[i]] < result[length - 1]) {
                        // 待插入值小于结果集中的最大值
                        insert(result, length - 1, list.get(i)[indexArray[i]++]);
                    } else if (length < result.length) {
                        // 结果集未满
                        insert(result, length++, list.get(i)[indexArray[i]++]);
                    }else {
                        break;
                    }
                }
                if (indexArray[i] < list.get(i).length) {
                    finish = false;
                }
            }
        }

        // 输出结果
        System.out.println();
        for (int i = 1; i < result.length; i++) {
            System.out.print(result[i] + " ");
        }

        // 通过系统计算结果并输出，目测结果是否一致
        List<Integer> list1 = new ArrayList<>();
        list.forEach(a -> {
            for (int i=0;i<a.length;i++){
                list1.add(a[i]);
            }
        });

        Collections.sort(list1);
        int[] result1 = new int[k+1];
        result1[0] = Integer.MIN_VALUE;
        for (int i=1;i<=k;i++){
            if (i <= list1.size()){
                result1[i] = list1.get(i-1);
            }
        }

        System.out.println();
        for (int i = 1; i < result1.length; i++) {
            System.out.print(result1[i] + " ");
        }

    }

    private void insert(final int[] array, int len, final int n) {
//        int len = length;
//        if (len == array.length){
//            if (array[len -1] > n){
//                len --;
//                length --;
//            }else{
//                return length;
//            }
//        }

        while (array[len - 1] > n) {
            array[len] = array[len - 1];
            len--;
        }
        array[len] = n;
//        length++;
//
//        return length;
    }
}
