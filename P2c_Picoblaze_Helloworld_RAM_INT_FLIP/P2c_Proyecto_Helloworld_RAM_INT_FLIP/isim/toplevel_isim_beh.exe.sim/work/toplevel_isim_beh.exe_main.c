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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_3499444699;
char *UNISIM_P_0947159679;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    unisim_p_0947159679_init();
    work_a_3186387305_2111220564_init();
    work_a_2585315477_2111220564_init();
    work_a_2831261877_2111220564_init();
    work_a_0969174415_2111220564_init();
    work_a_3083751986_2111220564_init();
    work_a_3187085811_2111220564_init();
    work_a_2136549747_2111220564_init();
    work_a_2453008834_2111220564_init();
    work_a_2943447612_2111220564_init();
    work_a_0707607580_2111220564_init();
    work_a_3430011751_2111220564_init();
    work_a_2400065403_3212880686_init();
    work_a_4076964648_3212880686_init();
    work_a_1327218089_3212880686_init();
    work_a_0613545047_2111220564_init();
    work_a_0033876555_2111220564_init();
    work_a_3077673485_2111220564_init();
    work_a_0599426937_2111220564_init();
    work_a_1316348740_3212880686_init();
    work_a_1573286736_0445496520_init();
    work_a_3521875484_3212880686_init();


    xsi_register_tops("work_a_3521875484_3212880686");

    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
