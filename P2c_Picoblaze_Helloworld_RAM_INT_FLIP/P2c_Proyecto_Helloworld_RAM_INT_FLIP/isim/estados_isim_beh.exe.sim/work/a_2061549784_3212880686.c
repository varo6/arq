/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/DETCP/Downloads/arq-main/arq-main/P2c_Picoblaze_Helloworld_RAM_INT_FLIP/P2c_Proyecto_Helloworld_RAM_INT_FLIP/modulo_estados.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

unsigned char ieee_p_1242562249_sub_1781471956_1035706684(char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_2110375371_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2061549784_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4928);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 5040);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 2312U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t2 = (t0 + 5040);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

}

static void work_a_2061549784_3212880686_p_1(char *t0)
{
    char t14[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;

LAB0:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4944);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t1 = xsi_get_transient_memory(26U);
    memset(t1, 0, 26U);
    t5 = t1;
    memset(t5, (unsigned char)2, 26U);
    t6 = (t0 + 5104);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 26U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(46, ng0);
    t1 = xsi_get_transient_memory(3U);
    memset(t1, 0, 3U);
    t2 = t1;
    memset(t2, (unsigned char)2, 3U);
    t5 = (t0 + 5168);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 5232);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2152U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t11 = (t4 == (unsigned char)0);
    if (t11 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 5232);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(69, ng0);
    t1 = xsi_get_transient_memory(26U);
    memset(t1, 0, 26U);
    t2 = t1;
    memset(t2, (unsigned char)2, 26U);
    t5 = (t0 + 5104);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 26U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(70, ng0);
    t1 = xsi_get_transient_memory(3U);
    memset(t1, 0, 3U);
    t2 = t1;
    memset(t2, (unsigned char)2, 3U);
    t5 = (t0 + 5168);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);

LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2632U);
    t6 = *((char **)t2);
    t2 = (t0 + 9748U);
    t12 = ieee_p_1242562249_sub_1781471956_1035706684(IEEE_P_1242562249, t6, t2, 5);
    if (t12 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 5232);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(62, ng0);
    t1 = xsi_get_transient_memory(3U);
    memset(t1, 0, 3U);
    t2 = t1;
    memset(t2, (unsigned char)2, 3U);
    t5 = (t0 + 5168);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(63, ng0);
    t1 = xsi_get_transient_memory(26U);
    memset(t1, 0, 26U);
    t2 = t1;
    memset(t2, (unsigned char)2, 26U);
    t5 = (t0 + 5104);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 26U);
    xsi_driver_first_trans_fast(t5);

LAB11:    goto LAB8;

LAB10:    xsi_set_current_line(52, ng0);
    t7 = (t0 + 5232);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t13 = *((char **)t10);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9732U);
    t5 = (t0 + 9842);
    t7 = (t14 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 25;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t15 = (25 - 0);
    t16 = (t15 * 1);
    t16 = (t16 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t16;
    t3 = ieee_p_1242562249_sub_2110375371_1035706684(IEEE_P_1242562249, t2, t1, t5, t14);
    if (t3 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 9732U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t14, t2, t1, 1);
    t6 = (t14 + 12U);
    t16 = *((unsigned int *)t6);
    t20 = (1U * t16);
    t3 = (26U != t20);
    if (t3 == 1)
        goto LAB18;

LAB19:    t7 = (t0 + 5104);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t13 = *((char **)t10);
    memcpy(t13, t5, 26U);
    xsi_driver_first_trans_fast(t7);

LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(55, ng0);
    t8 = xsi_get_transient_memory(26U);
    memset(t8, 0, 26U);
    t9 = t8;
    memset(t9, (unsigned char)2, 26U);
    t10 = (t0 + 5104);
    t13 = (t10 + 56U);
    t17 = *((char **)t13);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t8, 26U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 9748U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t14, t2, t1, 1);
    t6 = (t14 + 12U);
    t16 = *((unsigned int *)t6);
    t20 = (1U * t16);
    t3 = (3U != t20);
    if (t3 == 1)
        goto LAB16;

LAB17:    t7 = (t0 + 5168);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t13 = *((char **)t10);
    memcpy(t13, t5, 3U);
    xsi_driver_first_trans_fast(t7);
    goto LAB14;

LAB16:    xsi_size_not_matching(3U, t20, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(26U, t20, 0);
    goto LAB19;

}

static void work_a_2061549784_3212880686_p_2(char *t0)
{
    char t9[16];
    char t10[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned char t21;
    unsigned char t22;
    unsigned char t23;
    unsigned int t24;
    char *t25;
    char *t26;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5, &&LAB6, &&LAB7, &&LAB8};

LAB0:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5296);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 9868);
    t4 = (t0 + 5360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 9876);
    t4 = (t0 + 5424);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 4960);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(84, ng0);
    t4 = (t0 + 9878);
    t6 = (t0 + 2792U);
    t7 = *((char **)t6);
    t8 = ((IEEE_P_2592010699) + 4024);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 5;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t13 = (5 - 0);
    t14 = (t13 * 1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t0 + 9764U);
    t6 = xsi_base_array_concat(t6, t9, t8, (char)97, t4, t10, (char)97, t7, t12, (char)101);
    t14 = (6U + 2U);
    t15 = (8U != t14);
    if (t15 == 1)
        goto LAB9;

LAB10:    t16 = (t0 + 5360);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t6, 8U);
    xsi_driver_first_trans_fast_port(t16);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t15 = (t3 == (unsigned char)3);
    if (t15 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 5296);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB12:    goto LAB2;

LAB4:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 9884);
    t4 = (t0 + 5360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t15 = *((unsigned char *)t2);
    t21 = (t15 == (unsigned char)3);
    if (t21 == 1)
        goto LAB17;

LAB18:    t3 = (unsigned char)0;

LAB19:    if (t3 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB2;

LAB5:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 9916);
    t4 = (t0 + 5424);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 9918);
    t4 = (t0 + 5360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t15 = *((unsigned char *)t2);
    t21 = (t15 == (unsigned char)3);
    if (t21 == 1)
        goto LAB46;

LAB47:    t3 = (unsigned char)0;

LAB48:    if (t3 != 0)
        goto LAB43;

LAB45:
LAB44:    goto LAB2;

LAB6:    xsi_set_current_line(119, ng0);
    t1 = (t0 + 9950);
    t4 = (t0 + 5424);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(120, ng0);
    t1 = (t0 + 9952);
    t4 = (t0 + 5360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(122, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t15 = *((unsigned char *)t2);
    t21 = (t15 == (unsigned char)3);
    if (t21 == 1)
        goto LAB75;

LAB76:    t3 = (unsigned char)0;

LAB77:    if (t3 != 0)
        goto LAB72;

LAB74:
LAB73:    goto LAB2;

LAB7:    xsi_set_current_line(132, ng0);
    t1 = (t0 + 9984);
    t4 = (t0 + 5424);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(133, ng0);
    t1 = (t0 + 9986);
    t4 = (t0 + 5360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(135, ng0);
    t1 = (t0 + 5296);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB8:    xsi_set_current_line(139, ng0);
    t1 = (t0 + 9994);
    t4 = (t0 + 5424);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(140, ng0);
    t1 = (t0 + 9996);
    t4 = (t0 + 5360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 8U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(142, ng0);
    t1 = (t0 + 5296);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB9:    xsi_size_not_matching(8U, t14, 0);
    goto LAB10;

LAB11:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 5296);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB12;

LAB14:    xsi_set_current_line(97, ng0);
    t8 = (t0 + 1832U);
    t11 = *((char **)t8);
    t8 = (t0 + 9900);
    t23 = 1;
    if (8U == 8U)
        goto LAB29;

LAB30:    t23 = 0;

LAB31:    if (t23 != 0)
        goto LAB26;

LAB28:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 9908);
    t3 = 1;
    if (8U == 8U)
        goto LAB37;

LAB38:    t3 = 0;

LAB39:    if (t3 != 0)
        goto LAB35;

LAB36:
LAB27:    goto LAB15;

LAB17:    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 9892);
    t22 = 1;
    if (8U == 8U)
        goto LAB20;

LAB21:    t22 = 0;

LAB22:    t3 = t22;
    goto LAB19;

LAB20:    t14 = 0;

LAB23:    if (t14 < 8U)
        goto LAB24;
    else
        goto LAB22;

LAB24:    t6 = (t4 + t14);
    t7 = (t1 + t14);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB21;

LAB25:    t14 = (t14 + 1);
    goto LAB23;

LAB26:    xsi_set_current_line(98, ng0);
    t18 = (t0 + 5296);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t25 = (t20 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = (unsigned char)5;
    xsi_driver_first_trans_fast(t18);
    goto LAB27;

LAB29:    t24 = 0;

LAB32:    if (t24 < 8U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t16 = (t11 + t24);
    t17 = (t8 + t24);
    if (*((unsigned char *)t16) != *((unsigned char *)t17))
        goto LAB30;

LAB34:    t24 = (t24 + 1);
    goto LAB32;

LAB35:    xsi_set_current_line(100, ng0);
    t7 = (t0 + 5296);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t16 = *((char **)t12);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast(t7);
    goto LAB27;

LAB37:    t14 = 0;

LAB40:    if (t14 < 8U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t5 = (t2 + t14);
    t6 = (t1 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB38;

LAB42:    t14 = (t14 + 1);
    goto LAB40;

LAB43:    xsi_set_current_line(110, ng0);
    t8 = (t0 + 1832U);
    t11 = *((char **)t8);
    t8 = (t0 + 9934);
    t23 = 1;
    if (8U == 8U)
        goto LAB58;

LAB59:    t23 = 0;

LAB60:    if (t23 != 0)
        goto LAB55;

LAB57:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 9942);
    t3 = 1;
    if (8U == 8U)
        goto LAB66;

LAB67:    t3 = 0;

LAB68:    if (t3 != 0)
        goto LAB64;

LAB65:
LAB56:    goto LAB44;

LAB46:    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 9926);
    t22 = 1;
    if (8U == 8U)
        goto LAB49;

LAB50:    t22 = 0;

LAB51:    t3 = t22;
    goto LAB48;

LAB49:    t14 = 0;

LAB52:    if (t14 < 8U)
        goto LAB53;
    else
        goto LAB51;

LAB53:    t6 = (t4 + t14);
    t7 = (t1 + t14);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB50;

LAB54:    t14 = (t14 + 1);
    goto LAB52;

LAB55:    xsi_set_current_line(111, ng0);
    t18 = (t0 + 5296);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t25 = (t20 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = (unsigned char)5;
    xsi_driver_first_trans_fast(t18);
    goto LAB56;

LAB58:    t24 = 0;

LAB61:    if (t24 < 8U)
        goto LAB62;
    else
        goto LAB60;

LAB62:    t16 = (t11 + t24);
    t17 = (t8 + t24);
    if (*((unsigned char *)t16) != *((unsigned char *)t17))
        goto LAB59;

LAB63:    t24 = (t24 + 1);
    goto LAB61;

LAB64:    xsi_set_current_line(113, ng0);
    t7 = (t0 + 5296);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t16 = *((char **)t12);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    goto LAB56;

LAB66:    t14 = 0;

LAB69:    if (t14 < 8U)
        goto LAB70;
    else
        goto LAB68;

LAB70:    t5 = (t2 + t14);
    t6 = (t1 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB67;

LAB71:    t14 = (t14 + 1);
    goto LAB69;

LAB72:    xsi_set_current_line(123, ng0);
    t8 = (t0 + 1832U);
    t11 = *((char **)t8);
    t8 = (t0 + 9968);
    t23 = 1;
    if (8U == 8U)
        goto LAB87;

LAB88:    t23 = 0;

LAB89:    if (t23 != 0)
        goto LAB84;

LAB86:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 9976);
    t3 = 1;
    if (8U == 8U)
        goto LAB95;

LAB96:    t3 = 0;

LAB97:    if (t3 != 0)
        goto LAB93;

LAB94:
LAB85:    goto LAB73;

LAB75:    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t1 = (t0 + 9960);
    t22 = 1;
    if (8U == 8U)
        goto LAB78;

LAB79:    t22 = 0;

LAB80:    t3 = t22;
    goto LAB77;

LAB78:    t14 = 0;

LAB81:    if (t14 < 8U)
        goto LAB82;
    else
        goto LAB80;

LAB82:    t6 = (t4 + t14);
    t7 = (t1 + t14);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB79;

LAB83:    t14 = (t14 + 1);
    goto LAB81;

LAB84:    xsi_set_current_line(124, ng0);
    t18 = (t0 + 5296);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t25 = (t20 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = (unsigned char)5;
    xsi_driver_first_trans_fast(t18);
    goto LAB85;

LAB87:    t24 = 0;

LAB90:    if (t24 < 8U)
        goto LAB91;
    else
        goto LAB89;

LAB91:    t16 = (t11 + t24);
    t17 = (t8 + t24);
    if (*((unsigned char *)t16) != *((unsigned char *)t17))
        goto LAB88;

LAB92:    t24 = (t24 + 1);
    goto LAB90;

LAB93:    xsi_set_current_line(126, ng0);
    t7 = (t0 + 5296);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t16 = *((char **)t12);
    *((unsigned char *)t16) = (unsigned char)4;
    xsi_driver_first_trans_fast(t7);
    goto LAB85;

LAB95:    t14 = 0;

LAB98:    if (t14 < 8U)
        goto LAB99;
    else
        goto LAB97;

LAB99:    t5 = (t2 + t14);
    t6 = (t1 + t14);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB96;

LAB100:    t14 = (t14 + 1);
    goto LAB98;

}


extern void work_a_2061549784_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2061549784_3212880686_p_0,(void *)work_a_2061549784_3212880686_p_1,(void *)work_a_2061549784_3212880686_p_2};
	xsi_register_didat("work_a_2061549784_3212880686", "isim/estados_isim_beh.exe.sim/work/a_2061549784_3212880686.didat");
	xsi_register_executes(pe);
}
