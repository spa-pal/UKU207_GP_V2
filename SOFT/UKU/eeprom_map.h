
#define EE_CAN_RESET_CNT	0x06
#define RESET_CNT	0x08
#define EE_MODBUS_BAUDRATEA			0x0b

#define SECTOR_KOEF 0x10

#define EE_KUBAT1		SECTOR_KOEF
#define EE_KUBAT2		SECTOR_KOEF+2
#define EE_KILOAD0		SECTOR_KOEF+4
#define EE_KILOAD1		SECTOR_KOEF+6
#define EE_U_MAX		SECTOR_KOEF+8
#define EE_U_MIN		SECTOR_KOEF+10
#define EE_I_MAX		SECTOR_KOEF+12
#define EE_I_MIN		SECTOR_KOEF+14
#define EE_I_UG       	SECTOR_KOEF+16
#define EE_U_UP      	SECTOR_KOEF+18
#define EE_KULOAD       SECTOR_KOEF+20
#define EE_T_MAX   		SECTOR_KOEF+22
#define EE_T_SIGN   	SECTOR_KOEF+24
#define  EE_KUNET_EXT2  SECTOR_KOEF+26
#define EE_KUBATM1		SECTOR_KOEF+28
#define EE_KUBATM2		SECTOR_KOEF+30
#define EE_KVV0_EB2		SECTOR_KOEF+32
#define EE_KVV1_EB2		SECTOR_KOEF+34
#define EE_KVV2_EB2		SECTOR_KOEF+36
#define EE_KPES0_EB2	SECTOR_KOEF+38
#define EE_KPES1_EB2	SECTOR_KOEF+40
#define EE_KPES2_EB2	SECTOR_KOEF+42
#define EE_KUNETA      	SECTOR_KOEF+44
#define EE_KUNETB      	SECTOR_KOEF+46
#define EE_KUNETC      	SECTOR_KOEF+48
#define EE_I_UG2		SECTOR_KOEF+50
#define EE_I_UG3		SECTOR_KOEF+52
#define EE_U_UP2		SECTOR_KOEF+54
#define EE_U_UP3		SECTOR_KOEF+56
#define EE_UMAX			SECTOR_KOEF+58
#define EE_EE_WRITE_CNT	SECTOR_KOEF+60
#define EE_UOUT_OFF_EN		SECTOR_KOEF+62	
#define EE_UOUT_OFF_LEVEL	SECTOR_KOEF+64	
#define EE_UOUT_OFF_DELAY	SECTOR_KOEF+66
#define SECTOR_SETS 	SECTOR_KOEF+100

#define EE_U_MAX_G 		SECTOR_SETS+2
#define EE_I_MAX_P    	SECTOR_SETS+4
#define EE_UB0    		SECTOR_SETS+6
#define EE_UB20    		SECTOR_SETS+8
#define EE_TMAX		SECTOR_SETS+10
#define EE_AV_OFF_AVT    SECTOR_SETS+12
#define EE_USIGN		SECTOR_SETS+14
#define EE_UMN			SECTOR_SETS+16
#define EE_ZV_ON		SECTOR_SETS+18
#define EE_IKB			SECTOR_SETS+20
#define EE_KVZ			SECTOR_SETS+22
#define EE_IMAX		SECTOR_SETS+24
#define EE_IMIN		SECTOR_SETS+26
#define EE_APV_ON		SECTOR_SETS+28
#define EE_IZMAX		SECTOR_SETS+30
#define EE_U0B			SECTOR_SETS+32
#define EE_TZAS		SECTOR_SETS+34
#define EE_NUMIST  		SECTOR_SETS+36
#define EE_NUMINV  		SECTOR_SETS+38
#define KI0SRC1     	SECTOR_SETS+40
#define KI0SRC2     	SECTOR_SETS+42
#define EE_APV_ON1  	SECTOR_SETS+44
#define EE_APV_ON2  	SECTOR_SETS+46
#define EE_APV_ON2_TIME  SECTOR_SETS+48
#define KT_EXT0		SECTOR_SETS+50
#define KT_EXT1		SECTOR_SETS+52
#define KT_EXT2		SECTOR_SETS+54
#define EE_U_CURVE_IS_ON		SECTOR_SETS+56
#define EE_I_CURVE_IS_ON		SECTOR_SETS+58	
#define EE_MIN_AVZ  	SECTOR_SETS+60
#define EE_SEC_AVZ  	SECTOR_SETS+62
#define EE_DATE_AVZ 	SECTOR_SETS+64
#define EE_MONTH_AVZ	SECTOR_SETS+66
#define EE_YEAR_AVZ 	SECTOR_SETS+68
#define EE_AVZ			SECTOR_SETS+70
#define EE_MNEMO_ON 	SECTOR_SETS+72
#define EE_MNEMO_TIME 	SECTOR_SETS+74
#define EE_VZ_HR		SECTOR_SETS+76
#define EE_TBAT          SECTOR_SETS+78
#define EE_U_AVT         SECTOR_SETS+80
#define EE_TSIGN		SECTOR_SETS+82
#define EE_DU			SECTOR_SETS+84
#define EE_PAR			SECTOR_SETS+86
#define EE_TBATMAX		SECTOR_SETS+88
#define EE_TBATSIGN		SECTOR_SETS+90
#define EE_TIME_PROC_GS_RESTART		SECTOR_SETS+92
#define EE_TIME_PROC_PS_RESTART		SECTOR_SETS+96
#define EE_T_PROC_GS 				SECTOR_SETS+100
#define EE_T_PROC_PS				SECTOR_SETS+104	
#define EE_T_PROC_MAX				SECTOR_SETS+108
#define EE_TIME_VISION				SECTOR_SETS+112
#define EE_TIME_VISION_PULT			SECTOR_SETS+114
#define EE_I_LOAD_MODE				SECTOR_SETS+116
#define EE_MAIN_MENU_MODE			SECTOR_SETS+118
#define EE_RESTART_ENABLE			SECTOR_SETS+120
#define EE_T_PROC_GS_MODE 			SECTOR_SETS+122
#define EE_T_PROC_PS_MODE			SECTOR_SETS+124
#define EE_MODBUS_ADRESS				SECTOR_SETS+128
#define EE_MODBUS_BAUDRATE			SECTOR_SETS+130   
#define EE_RELE_LOG					SECTOR_SETS+132
#define EE_T_DEL_REL_CURR_START		SECTOR_SETS+134
#define EE_T_DEL_REL_CURR_WRK			SECTOR_SETS+136
#define EE_DELT_REL_CURR_U			SECTOR_SETS+138
#define EE_DELT_REL_CURR_I			SECTOR_SETS+140
#define EE_RESTART_ENABLED			SECTOR_SETS+142
#define EE_REV_STAT					SECTOR_SETS+144
#define EE_REV_IS_ON				SECTOR_SETS+146
#define EE_AVT_REV_IS_ON				SECTOR_SETS+148
#define EE_AVT_REV_TIME_FF			SECTOR_SETS+150

#define EE_AVT_REV_TIME_PAUSE			SECTOR_SETS+154
#define EE_AVT_REV_I_NOM_FF			SECTOR_SETS+156
#define EE_AVT_REV_I_NOM_REW			SECTOR_SETS+158
#define EE_AVT_REV_U_NOM_FF			SECTOR_SETS+160
#define EE_AVT_REV_U_NOM_REW			SECTOR_SETS+162
#define EE_CURR_FADE_IN				SECTOR_SETS+164 
#define EE_SK_START					SECTOR_SETS+166	
#define EE_SK_START_LEV				SECTOR_SETS+168
#define EE_RELE_FUNC1				SECTOR_SETS+170
#define EE_RELE_FUNC2				SECTOR_SETS+172
#define EE_RELE_LOG_CURR				SECTOR_SETS+174
#define EE_RELE_LOG_VOLT				SECTOR_SETS+176
#define EE_T_DEL_REL_VOLT_START		SECTOR_SETS+178
#define EE_T_DEL_REL_VOLT_WRK			SECTOR_SETS+180
#define EE_REL_VOLT_UMAX				SECTOR_SETS+182
#define EE_REL_VOLT_UMIN				SECTOR_SETS+184
#define EE_ACH_OFF_EN				SECTOR_SETS+186
#define EE_ACH_OFF_LEVEL				SECTOR_SETS+188
#define EE_CURR_OFF_EN				SECTOR_SETS+190
#define EE_CUR_OFF_LEVEL_RELATIV		SECTOR_SETS+192
#define EE_CUR_OFF_LEVEL_ABSOLUT		SECTOR_SETS+194
#define EE_CUR_OFF_T_OFF				SECTOR_SETS+196
#define EE_CUR_OFF_T_ON				SECTOR_SETS+198
#define EE_AVT_REV_TIME_REW			SECTOR_SETS+202
//
//+4
//  ������ ����� �� ������

#define SECTOR_AUSW  		SECTOR_KOEF+300

#define EE_AUSW_MAIN 		SECTOR_AUSW
#define EE_AUSW_MAIN_NUMBER 	SECTOR_AUSW+2 
#define EE_AUSW_UKU 		SECTOR_AUSW+4 
#define EE_AUSW_UKU_SUB 		SECTOR_AUSW+6
#define EE_AUSW_UKU_NUMBER	SECTOR_AUSW+8
#define EE_AUSW_DAY			SECTOR_AUSW+10
#define EE_AUSW_MONTH		SECTOR_AUSW+12
#define EE_AUSW_YEAR		SECTOR_AUSW+14
#define EE_AUSW_BPS1_NUMBER	SECTOR_AUSW+16		
#define EE_AUSW_BPS2_NUMBER	SECTOR_AUSW+18
#define EE_AUSW_RS232		SECTOR_AUSW+20
#define EE_AUSW_PDH			SECTOR_AUSW+22
#define EE_AUSW_SDH			SECTOR_AUSW+24
#define EE_AUSW_ETH			SECTOR_AUSW+26

#define SECTOR_BAT  		SECTOR_KOEF+400

#define EE_BAT1_IS_ON         SECTOR_BAT
#define EE_BAT1_DAY_OF_ON     SECTOR_BAT+2
#define EE_BAT1_MONTH_OF_ON   SECTOR_BAT+4
#define EE_BAT1_YEAR_OF_ON    SECTOR_BAT+6
#define EE_BAT1_C_REAL        SECTOR_BAT+8
#define EE_BAT1_RESURS        SECTOR_BAT+10
#define EE_BAT1_ZAR_CNT      SECTOR_BAT+12
#define EE_BAT1_ZAR_CNT_KE   SECTOR_BAT+14
#define EE_BAT1_C_NOM         SECTOR_BAT+16


#define EE_BAT2_IS_ON         SECTOR_BAT+30
#define EE_BAT2_DAY_OF_ON     SECTOR_BAT+32
#define EE_BAT2_MONTH_OF_ON   SECTOR_BAT+34
#define EE_BAT2_YEAR_OF_ON    SECTOR_BAT+36
#define EE_BAT2_C_REAL        SECTOR_BAT+38
#define EE_BAT2_RESURS        SECTOR_BAT+40
#define EE_BAT2_ZAR_CNT       SECTOR_BAT+42
#define EE_BAT2_ZAR_CNT_KE    SECTOR_BAT+44
#define EE_BAT2_C_NOM         SECTOR_BAT+48


#define SECTOR_CAP	  		SECTOR_KOEF+450
#define EE_CAP_ZAR_TIME		SECTOR_CAP
#define EE_CAP_PAUSE1_TIME	SECTOR_CAP+2
#define EE_CAP_RAZR_TIME		SECTOR_CAP+4
#define EE_CAP_PAUSE2_TIME	SECTOR_CAP+6
#define EE_CAP_MAX_VOLT		SECTOR_CAP+8
#define EE_CAP_WRK_CURR		SECTOR_CAP+10


//#define KOEF_LONG	30


#define SEKTOR_KURVE_U	500
#define SEKTOR_KURVE_I	1000

#define SECTOR_ETH  		2000
#define EE_ETH_IS_ON		SECTOR_ETH
#define EE_ETH_DHCP_ON		SECTOR_ETH+2
#define EE_ETH_IP_1			SECTOR_ETH+4
#define EE_ETH_IP_2			SECTOR_ETH+6
#define EE_ETH_IP_3			SECTOR_ETH+8
#define EE_ETH_IP_4			SECTOR_ETH+10
#define EE_ETH_MASK_1		SECTOR_ETH+12
#define EE_ETH_MASK_2		SECTOR_ETH+14
#define EE_ETH_MASK_3		SECTOR_ETH+16
#define EE_ETH_MASK_4		SECTOR_ETH+18
#define EE_ETH_TRAP1_IP_1	SECTOR_ETH+20
#define EE_ETH_TRAP1_IP_2	SECTOR_ETH+22
#define EE_ETH_TRAP1_IP_3	SECTOR_ETH+24
#define EE_ETH_TRAP1_IP_4	SECTOR_ETH+26
#define EE_ETH_TRAP2_IP_1	SECTOR_ETH+28
#define EE_ETH_TRAP2_IP_2	SECTOR_ETH+30
#define EE_ETH_TRAP2_IP_3	SECTOR_ETH+32
#define EE_ETH_TRAP2_IP_4	SECTOR_ETH+34
#define EE_ETH_TRAP3_IP_1	SECTOR_ETH+36
#define EE_ETH_TRAP3_IP_2	SECTOR_ETH+38
#define EE_ETH_TRAP3_IP_3	SECTOR_ETH+40
#define EE_ETH_TRAP3_IP_4	SECTOR_ETH+42
#define EE_ETH_TRAP4_IP_1	SECTOR_ETH+44
#define EE_ETH_TRAP4_IP_2	SECTOR_ETH+46
#define EE_ETH_TRAP4_IP_3	SECTOR_ETH+48
#define EE_ETH_TRAP4_IP_4	SECTOR_ETH+50
#define EE_ETH_TRAP5_IP_1	SECTOR_ETH+52
#define EE_ETH_TRAP5_IP_2	SECTOR_ETH+54
#define EE_ETH_TRAP5_IP_3	SECTOR_ETH+56
#define EE_ETH_TRAP5_IP_4	SECTOR_ETH+58
#define EE_ETH_SNMP_PORT_READ	SECTOR_ETH+60
#define EE_ETH_SNMP_PORT_WRITE	SECTOR_ETH+62
#define EE_ETH_GW_1			SECTOR_ETH+64
#define EE_ETH_GW_2			SECTOR_ETH+66
#define EE_ETH_GW_3			SECTOR_ETH+68
#define EE_ETH_GW_4			SECTOR_ETH+70
#define EE_ETH_IS_NOT		SECTOR_ETH+72


#define SECTOR_LOCATION  	SECTOR_ETH+200
#define EE_LOCATION			SECTOR_LOCATION
#define SECTOR_COMMUNITY  	SECTOR_ETH+270
#define EE_COMMUNITY		SECTOR_COMMUNITY 


#define EE_MODBUS_BAUDRATEB	SECTOR_EXT-4

#define SECTOR_EXT  		3000
#define EE_TMAX_EXT_EN0		SECTOR_EXT
#define EE_TMAX_EXT0		SECTOR_EXT+2
#define EE_TMIN_EXT_EN0		SECTOR_EXT+4
#define EE_TMIN_EXT0		SECTOR_EXT+6
#define EE_T_EXT_REL_EN0		SECTOR_EXT+8
#define EE_T_EXT_ZVUK_EN0	SECTOR_EXT+10
#define EE_T_EXT_LCD_EN0		SECTOR_EXT+12
#define EE_T_EXT_RS_EN0		SECTOR_EXT+14
#define EE_TMAX_EXT_EN1		SECTOR_EXT+16
#define EE_TMAX_EXT1		SECTOR_EXT+18
#define EE_TMIN_EXT_EN1		SECTOR_EXT+20
#define EE_TMIN_EXT1		SECTOR_EXT+22
#define EE_T_EXT_REL_EN1		SECTOR_EXT+24
#define EE_T_EXT_ZVUK_EN1	SECTOR_EXT+26
#define EE_T_EXT_LCD_EN1		SECTOR_EXT+28
#define EE_T_EXT_RS_EN1		SECTOR_EXT+30
#define EE_TMAX_EXT_EN2		SECTOR_EXT+32
#define EE_TMAX_EXT2		SECTOR_EXT+34
#define EE_TMIN_EXT_EN2		SECTOR_EXT+36
#define EE_TMIN_EXT2		SECTOR_EXT+38
#define EE_T_EXT_REL_EN2		SECTOR_EXT+40
#define EE_T_EXT_ZVUK_EN2	SECTOR_EXT+42
#define EE_T_EXT_LCD_EN2		SECTOR_EXT+44
#define EE_T_EXT_RS_EN2		SECTOR_EXT+46
#define EE_SK_SIGN0			SECTOR_EXT+48
#define EE_SK_REL_EN0		SECTOR_EXT+50
#define EE_SK_ZVUK_EN0		SECTOR_EXT+52
#define EE_SK_LCD_EN0		SECTOR_EXT+54
#define EE_SK_RS_EN0		SECTOR_EXT+56
#define EE_SK_SIGN1			SECTOR_EXT+58
#define EE_SK_REL_EN1		SECTOR_EXT+60
#define EE_SK_ZVUK_EN1		SECTOR_EXT+62
#define EE_SK_LCD_EN1		SECTOR_EXT+64
#define EE_SK_RS_EN1		SECTOR_EXT+66
#define EE_SK_SIGN2			SECTOR_EXT+68
#define EE_SK_REL_EN2		SECTOR_EXT+70
#define EE_SK_ZVUK_EN2		SECTOR_EXT+72
#define EE_SK_LCD_EN2		SECTOR_EXT+74
#define EE_SK_RS_EN2		SECTOR_EXT+76
#define EE_SK_SIGN3			SECTOR_EXT+78
#define EE_SK_REL_EN3		SECTOR_EXT+80
#define EE_SK_ZVUK_EN3		SECTOR_EXT+82
#define EE_SK_LCD_EN3		SECTOR_EXT+84
#define EE_SK_RS_EN3		SECTOR_EXT+86
#define EE_NUMSK			SECTOR_EXT+88
#define EE_NUMDT			SECTOR_EXT+90
#define EE_POS_VENT			SECTOR_EXT+92
#define EE_POWER_CNT_ADRESS   SECTOR_EXT+94
#define EE_UBM_AV             SECTOR_EXT+96
#define EE_NUMAVT			SECTOR_EXT+98
#define EE_AMPERCHAS		SECTOR_EXT+100	   /*4 �����!!!!!	*/
#define EE_RS485_QWARZ_DIGIT	SECTOR_EXT+104
