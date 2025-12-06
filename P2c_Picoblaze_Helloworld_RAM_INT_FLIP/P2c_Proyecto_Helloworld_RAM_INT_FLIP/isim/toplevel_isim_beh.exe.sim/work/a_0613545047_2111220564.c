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
static const char *ng0 = "D:/PRAC_carmenvaroandre/P2c_Picoblaze_Helloworld_RAM_INT_FLIP/P2c_Proyecto_Helloworld_RAM_INT_FLIP/stack_ram.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_0613545047_2111220564_p_0(char *t0)
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

LAB0:    xsi_set_current_line(41, ng0);

LAB3:    t1 = (t0 + 3624U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 8976);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 8768);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0613545047_2111220564_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3744U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8784);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3944U);
    t8 = *((char **)t4);
    t4 = (t0 + 4640U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t4 = (t8 + t14);
    t15 = *((unsigned char *)t4);
    t16 = (t0 + 9040);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_delta(t16, 7U, 1, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 3784U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}

static void work_a_0613545047_2111220564_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3744U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8800);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3944U);
    t8 = *((char **)t4);
    t4 = (t0 + 4760U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t4 = (t8 + t14);
    t15 = *((unsigned char *)t4);
    t16 = (t0 + 9104);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_delta(t16, 6U, 1, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 3784U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}

static void work_a_0613545047_2111220564_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3744U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8816);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3944U);
    t8 = *((char **)t4);
    t4 = (t0 + 4880U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t4 = (t8 + t14);
    t15 = *((unsigned char *)t4);
    t16 = (t0 + 9168);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_delta(t16, 5U, 1, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 3784U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}

static void work_a_0613545047_2111220564_p_4(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3744U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8832);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3944U);
    t8 = *((char **)t4);
    t4 = (t0 + 5000U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t4 = (t8 + t14);
    t15 = *((unsigned char *)t4);
    t16 = (t0 + 9232);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_delta(t16, 4U, 1, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 3784U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}

static void work_a_0613545047_2111220564_p_5(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3744U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8848);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3944U);
    t8 = *((char **)t4);
    t4 = (t0 + 5120U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t4 = (t8 + t14);
    t15 = *((unsigned char *)t4);
    t16 = (t0 + 9296);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_delta(t16, 3U, 1, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 3784U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}

static void work_a_0613545047_2111220564_p_6(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3744U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8864);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3944U);
    t8 = *((char **)t4);
    t4 = (t0 + 5240U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t4 = (t8 + t14);
    t15 = *((unsigned char *)t4);
    t16 = (t0 + 9360);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_delta(t16, 2U, 1, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 3784U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}

static void work_a_0613545047_2111220564_p_7(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3744U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8880);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3944U);
    t8 = *((char **)t4);
    t4 = (t0 + 5360U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t4 = (t8 + t14);
    t15 = *((unsigned char *)t4);
    t16 = (t0 + 9424);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_delta(t16, 1U, 1, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 3784U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}

static void work_a_0613545047_2111220564_p_8(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3744U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 8896);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3944U);
    t8 = *((char **)t4);
    t4 = (t0 + 5480U);
    t9 = *((char **)t4);
    t10 = *((int *)t9);
    t11 = (t10 - 7);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t4 = (t8 + t14);
    t15 = *((unsigned char *)t4);
    t16 = (t0 + 9488);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t15;
    xsi_driver_first_trans_delta(t16, 0U, 1, 0LL);
    goto LAB3;

LAB5:    t4 = (t0 + 3784U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

}


extern void work_a_0613545047_2111220564_init()
{
	static char *pe[] = {(void *)work_a_0613545047_2111220564_p_0,(void *)work_a_0613545047_2111220564_p_1,(void *)work_a_0613545047_2111220564_p_2,(void *)work_a_0613545047_2111220564_p_3,(void *)work_a_0613545047_2111220564_p_4,(void *)work_a_0613545047_2111220564_p_5,(void *)work_a_0613545047_2111220564_p_6,(void *)work_a_0613545047_2111220564_p_7,(void *)work_a_0613545047_2111220564_p_8};
	xsi_register_didat("work_a_0613545047_2111220564", "isim/toplevel_isim_beh.exe.sim/work/a_0613545047_2111220564.didat");
	xsi_register_executes(pe);
}
