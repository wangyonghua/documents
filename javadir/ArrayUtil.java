package com.niukaijun.test;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by nkj on 2017/7/28.
 */
public class ArrayUtil {

    @Test
    public void test() {

        int[][] array = {{1,2,6,7},
                {3,5,8,13},
                {4,9,12,14},
                {10,11,15,16}};
        f(array);
        array = new int[][]{{1,2,6},
                {3,5,7},
                {4,8,9}};
        f(array);
        array = new int[][]{{1,2,6,7,15},
                {3,5,8,14,16},
                {4,9,13,17,22},
                {10,12,18,21,23},
                {11,19,20,24,25}};
        f(array);
    }

    private void f(int[][] array) {
        int i = 0;
        int j = 0;
        int orientation = 2; // 0 - right , 1 - left bottom, 2 - right top, 3 - bottom
        int len = array.length;
        System.out.println(array[i][j]);
        while (i < len - 1 || j < len - 1) {
            if (i == 0) {
                if (orientation == 0) {
                    i++;
                    j--;
                    orientation = 1;
                } else if (j < len - 1) {
                    j++;
                    orientation = 0;
                } else {
                    i++;
                    orientation = 3;
                }
            } else if (i == len - 1) {
                j++;
                if (orientation == 0 || orientation == 3) {
                    i--;
                    orientation = 2;
                } else {
                    orientation = 0;
                }
            } else if (j == 0) {
                if (orientation == 3) {
                    i--;
                    j++;
                    orientation = 2;
                } else {
                    i++;
                    orientation = 3;
                }
            } else if (j == len - 1) {
                i++;
                if (orientation == 3) {
                    j--;
                    orientation = 1;
                } else {
                    orientation = 3;
                }
            } else {
                if (orientation == 1) {
                    i++;
                    j--;
                } else {
                    i--;
                    j++;
                }
            }
            System.out.println(array[i][j]);
        }

    }

}
