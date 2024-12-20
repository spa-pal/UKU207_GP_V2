#ifdef UKU2071x
#define MCP2515_CAN
#define SC16IS740_UART
//#define can1_out mcp2515_transmit
#endif

#include <rtl.h>

#define SOFT_NUM	1051
#define SOFT_DATE	21112UL

#define _ACDC_

//#define SystemFrequency 10000000UL

#define BIN__N(x) (x) | x>>3 | x>>6 | x>>9
#define BIN__B(x) (x) & 0xf | (x)>>12 & 0xf0
#define BIN8(v) (BIN__B(BIN__N(0x##v)))

#define OID_ENTERPRISE 	OID0(1,3), 6, 1, 4, 1, 130, 131, 31
#define OID_DEVICE 						40
#define DISPLAY_DEVICE_INFO			1
#define DISPLAY_DEVICE_INFO_CODE			1
#define DISPLAY_DEVICE_INFO_SERIAL			2
#define DISPLAY_DEVICE_INFO_LOCATION 		3
#define DISPLAY_DEVICE_INFO_NUMOFBAT 		4
#define DISPLAY_DEVICE_INFO_NUMOFBPS 		5
#define DISPLAY_DEVICE_INFO_NUMOFINV 		6
#define DISPLAY_DEVICE_INFO_NUMOFAVT 		7
#define DISPLAY_DEVICE_INFO_NUMOFDT 		8
#define DISPLAY_DEVICE_INFO_NUMOFSK 		9
#define DISPLAY_DEVICE_INFO_NUMOFEVENTS		10

#define OUT_PARAMETERS				2
#define OUT_VOLTAGE						1
#define OUT_CURRENT						2
#define OUT_FLAGS						3

#define DISPLAY_PSU					3
#define DISPLAY_PSU_ENTRY_NUMBER			1,1
#define DISPLAY_PSU_ENTRY_VOLTAGE 			1,2
#define DISPLAY_PSU_ENTRY_CURRENT			1,3
#define DISPLAY_PSU_ENTRY_TEMPERATURE		1,4
#define DISPLAY_PSU_ENTRY_STATUS			1,5

#define DISPLAY_SK					10
#define DISPLAY_SK_ENTRY_NUMBER				1,1
#define DISPLAY_SK_ENTRY_STAT				1,2

#define SETTED_PARAMETERS			5
#define NUM_OF_PSU						1
#define MAX_TIME_OF_PROCESS				2
#define TIME_VISUALISATION				3
#define PULT_TIME_MODE					4
#define LOAD_CURRENT_MEASURE_MODE			5
#define MAIN_MENU_MODE					6
#define RESTART_ENABLED					7
#define MUDBUS_ADRESS_OID				8
#define MODBUS_BAUDRATE_OID				9

#define WRK_PARAMETERS				6
#define DISPLAY_STABILITY_VOLTAGE 			1  	
#define DISPLAY_STABILITY_CURRENT 			2  	
#define DISPLAY_MAX_VOLTAGE 				3 	
#define DISPLAY_MAX_CURRENT 				4	
#define DISPLAY_VOLTAGE_STABILITY_PROCESS_DURATION 	5 	
#define DISPLAY_CURRENT_STABILITY_PROCESS_DURATION 	6  	

#define REVERSE_PARAMETERS			7
#define REVERSE_STATE				1
#define AVTO_REVERSE_ENABLE			2  	
#define AVTO_REVERSE_FF_TIME			3
#define AVTO_REVERSE_REW_TIME			4  	
#define AVTO_REVERSE_PAUSE_TIME		5
#define AVTO_REVERSE_FF_I			6	
#define AVTO_REVERSE_REW_I			7 	
#define AVTO_REVERSE_FF_U			8	
#define AVTO_REVERSE_REW_U			9	

#define DISPLAY_SPEC_COMMAND				2

#define DISPLAY_SPEC_TRAP_MESSAGE			5
#define DISPLAY_SPEC_TRAP_VALUE_0			6
#define DISPLAY_SPEC_TRAP_VALUE_1			7
#define DISPLAY_SPEC_TRAP_VALUE_2			8


#define DISPLAY_INV					14
#define DISPLAY_INV_ENTRY_NUMBER			1,1
#define DISPLAY_INV_ENTRY_VOLTAGE 			1,2
#define DISPLAY_INV_ENTRY_CURRENT			1,3
#define DISPLAY_INV_ENTRY_TEMPERATURE		1,4
#define DISPLAY_INV_ENTRY_STATUS			1,5

#define LCD_SIZE 200

#define COMMANDS				9
#define SNMP_COMMAND					1
//#define COMMAND_PARAMETR					2

#define SYSPARAMS					10
#define SYSPARAMSMAINPSU					20
#define SYSPARAMSSOUNDALARMEN				40
#define SYSPARAMSALARMAUTODISABLE			41
#define SYSPARAMS_BAT_TEST_TIME			42
#define SYSPARAMS_U_MAX					49
#define SYSPARAMS_U_0_GRAD				50
#define SYSPARAMS_U_20_GRAD				51 
#define SYSPARAMS_U_SIGN					52
#define SYSPARAMS_U_MIN_POWER				53
#define SYSPARAMS_U_WITHOUT_BAT			54
#define SYSPARAMS_IBK					55
#define SYSPARAMS_IZMAX					56
#define SYSPARAMS_IMAX					57
#define SYSPARAMS_KIMAX					58
#define SYSPARAMS_KVZ					59
#define SYSPARAMS_TZAS					60
#define SYSPARAMS_TMAX					61	

#define DISPLAY_AVT					11
#define DISPLAY_AVT_ENTRY_NUMBER			1,1
#define DISPLAY_AVT_ENTRY_STAT 			1,2

#define DISPLAY_ENERGY				12
#define DISPLAY_ENERGY_VVOD_PHASE_A		1
#define DISPLAY_ENERGY_VVOD_PHASE_B		2
#define DISPLAY_ENERGY_VVOD_PHASE_C		3
#define DISPLAY_ENERGY_PES_PHASE_A			4
#define DISPLAY_ENERGY_PES_PHASE_B			5
#define DISPLAY_ENERGY_PES_PHASE_C			6
#define DISPLAY_ENERGY_TOTAL_ENERGY		7
#define DISPLAY_ENERGY_CURRENT_ENERGY		8

/*
#define DISPLAY_SK					15
#define DISPLAY_SK_ENTRY_NUMBER			1,1
#define DISPLAY_SK_AKTIVITY	 			1,2
#define DISPLAY_SK_ALARM_AKTIVITY 			1,3
#define DISPLAY_SK_ALARM 	 			1,4
*/

#define COMMAND_OK		0x5555
#define COMAND_FAIL		0xaaaa
#define COMMAND_INVALID	0xeeee
#define WRONG_PARAMETER	0xeeef

#define SNMP_PS_START		3
#define SNMP_GS_START		4
#define SNMP_CAP_START		5
#define SNMP_PROC_STOP		6
#define SNMP_RELE1_OFF		0x80
#define SNMP_RELE1_ON		0x81
#define SNMP_RELE2_OFF		0x82
#define SNMP_RELE2_ON		0x83

#define DISPLAY_LOG					9
#define DISPLAY_LOG_ENTRY_EVENTS 			1,1
//#define DISPLAY_LOG_ENTRY_EVENTS 			1,1


//#define SEC_IN_HOUR	36000L

#define LCD_SIZE 200

//#define PAROL_ALL_ZERO

#define AH_CONSTANT		36000L

//***********************************************
//��������� ����������




#define MASK(lengt) 		(0xffffffff>>(32-lengt))
#define MASK_OFFSET(shift,lengt)	(MASK(lengt)<<shift)

#define GET_REG( reg, shift, lengt) 		( (reg & MASK_OFFSET(shift,lengt)) >> shift)
#define SET_REG( reg, val, shift, lengt)  	reg = ( (reg & ~MASK_OFFSET(shift,lengt)) | ((unsigned)val << shift) )
//#define CHK_REG( reg, mask ) ( (reg) & (mask) == (mask) )



#define delay_ms(x) {long xx; xx=(unsigned long)x * 12000UL; while(xx)xx--;}
#define delay_us(x) {long xx; xx=(unsigned long)x * 12UL; while(xx)xx--;}

//*************************************************
//���������
#define MESS_DEEP	10

#define 	MESS_ZERO 		0
#define 	MESS_BAT1_OFF 		1
#define 	MESS_BAT2_OFF		2
#define 	MESS_ALL_SRC_OFF	3
#define 	MESS_ALL_SRC_ON	4
//#define 	MESS_RELSAM_ON		5
#define 	MESS_SRC1_OFF		6
#define 	MESS_SRC2_OFF		7
#define 	MESS_SRC3_OFF		8
#define 	MESS_SRC4_OFF		9
#define 	MESS_SRC5_OFF		10
#define 	MESS_SRC6_OFF		11
#define 	MESS_SRC7_OFF		12
#define 	MESS_SRC8_OFF		13
#define 	MESS_SRC9_OFF		14
#define 	MESS_SRC10_OFF		15
#define 	MESS_SRC11_OFF		16
#define 	MESS_SRC12_OFF		17
#define 	MESS_BAT_CONTROL	18
#define 	MESS_SRC_CONTROL	19
#define 	MESS_LOAD2_WAIT	9 
#define 	MESS_PONG			100
#define	MESS_SPA_UART_PONG	101 
#define	MESS_SPA_BLOK_BPS1	102
#define	MESS_SPA_BLOK_BPS2	103
#define	MESS_SPA_LEAVE_BPS1	104
#define	MESS_SPA_LEAVE_BPS2	105
#define 	MESS_SRC_ON_OFF	150
#define   _MESS_SRC_MASK_BLOK_2SEC		151
#define   _MESS_SRC_MASK_UNBLOK		152
#define 	_MESS_SRC_MASK_ON			153
#define	_MESS_SRC_PWM				154
#define	_MESS_U_NECC				155
#define   _MESS_FAST_REG				156
//#define   _MESS_U_AVT_GOOD			157

#define 	MESS_BAT_ON_OFF	160
#define   _MESS_BAT_MASK_BLOK_AFTER_2SEC		161
#define	_MESS_BAT_MASK_ON					162
#define	_MESS_BAT_MASK_OFF					163

		
//#define	MESS_SPA_UART_SRAM	200 
//#define	MESS_SPA_UART_CMND	201 

#define	MESS2UNECC_HNDL   					190
#define  		PARAM_UNECC_SET				 	191
#define	MESS2BAT_HNDL   					200
//#define	MESS2BAT_HNDL1   					201
#define		PARAM_BAT_ALL_OFF_AFTER_2SEC			201
#define		PARAM_BAT_MASK_OFF_AFTER_2SEC			202
//#define		PARAM_BAT_ON						202
#define	MESS2BPS_HNDL   					205
#define		PARAM_BPS_ALL_OFF_AFTER_2SEC			206
#define		PARAM_BPS_MASK_OFF_AFTER_2SEC			207
#define		PARAM_BPS_MASK_ON_OFF_AFTER_2SEC		208
#define		PARAM_BPS_MASK_ON					209
#define		PARAM_BPS_ALL_ON					210
#define 	MESS2RELE_HNDL						210
#define		PARAM_RELE_SAMOKALIBR			100
#define		PARAM_RELE_AV						101
#define		PARAM_RELE_AV_NET					102
#define		PARAM_RELE_AV_BAT					103
#define		PARAM_RELE_LOAD_OFF					103
#define		PARAM_RELE_LIGHT					104
#define		PARAM_RELE_AV_COMM					105
#define		PARAM_RELE_AV_BPS					106
#define		PARAM_RELE_VENT					107
#define		PARAM_RELE_AV_BAT1					108
#define		PARAM_RELE_AV_BAT2					109

#define	MESS2IND_HNDL						215
#define		PARAM_SAMOKALIBR					216
#define 		PARAM_U_AVT_GOOD					217
#define	MESS2MATEMAT						220
#define		PARAM_SAMOKALIBR					216
#define	MESS2CNTRL_HNDL   					225
#define		PARAM_CNTRL_STAT_PLUS				100
#define		PARAM_CNTRL_STAT_MINUS				105
#define		PARAM_CNTRL_STAT_STEP_DOWN			110
#define 		PARAM_CNTRL_STAT_SET		    		229
#define 		PARAM_CNTRL_STAT_FAST_REG		    	230	
#define	MESS2KB_HNDL   					230
#define		PARAM_CNTRL_IS_DOWN					231
#define	MESS2VENT_HNDL   					240
#define		PARAM_VENT_CB					241

#define MESS2NET_DRV							33
#define	PARAM_BPS_NET_OFF						34

#define LCD_SIZE 200



#define BIN__N(x) (x) | x>>3 | x>>6 | x>>9
#define BIN__B(x) (x) & 0xf | (x)>>12 & 0xf0
#define BIN8(v) (BIN__B(BIN__N(0x##v)))



#define BAUD_RATE0 9600UL
#define BAUD_RATE1 9600UL





#ifndef PAROL_ALL_ZERO
#define PAROL_KALIBR 873
#define PAROL_SET 184
#define PAROL_MODE 0 
#define PAROL_ALLER 815 
#define PAROL_BAT_IN 722 
#define PAROL_BAT_OUT 722
#define PAROL_KE 125
#define PAROL_VZ 126
#define PAROL_TST 999 
#define PAROL_DEFAULT 295
#define PAROL_AUSW 949
#endif                

#ifdef PAROL_ALL_ZERO
#define PAROL_KALIBR 0
#define PAROL_SET 0
#define PAROL_MODE 0 
#define PAROL_ALLER 0 
#define PAROL_BAT_IN 0 
#define PAROL_BAT_OUT 0
#define PAROL_KE 0
#define PAROL_VZ 0
#define PAROL_TST 0
#define PAROL_DEFAULT 0
#define PAROL_AUSW 0
#endif


#define CNT_SRC_MAX	60





//***********************************************
//������
extern char b1000Hz,b100Hz,b50Hz,b10Hz,b5Hz,b2Hz,b1Hz;
extern short t0cnt,t0cnt0,t0cnt1,t0cnt2,t0cnt3,t0cnt4,t0cnt5,t0cnt6,t0_cnt7;
extern char bFL5,bFL2,bFL,bFL_;
extern signed short main_10Hz_cnt;
extern signed short main_1Hz_cnt;

//***********************************************
//��������� �����
extern char cnt_of_slave;
//char cnt_of_wrks;   //����������� ���������� ���������� , ��� ���������

extern U8  snmp_Community[];


//***********************************************
//���������
typedef enum {
	iMn,iSrv_sl,iNet,iNet3,
	iSet,iSet_3U,iSet_RSTKM,iSet_GLONASS,iSet_KONTUR,iSet_6U,iSet_220,
	iBat,iBat_simple,
	iBps,iS2,iSet_prl,iK_prl,iDnd,
	iK,iK_3U,iK_RSTKM,iK_GLONASS,iK_KONTUR,iK_6U,iK_220,
	iSpcprl,iSpc,k,Crash_0,Crash_1,iKednd,iAv_view_avt,iAKE,
	iLoad,iSpc_prl_vz,iSpc_prl_ke,iKe,iVz,iAvz,iAVAR,
	iStr,
	iVrs,iApv,
	iK_bps,iK_bps_v2,iK_bps_sel,iK_bat,iK_bat_simple,iK_bat_sel,iK_load,iK_net,iK_net3,
	iTst_pwm,iDebug,iExtCtrl,
	iDef,iDef_3U,iDef_RSTKM,iDef_GLONASS,iDef_KONTUR,iDef_6U,iDef_220,
	iSet_st_prl,iK_pdp,iSet_T,
	iDeb,iJ_bat,iK_inv_sel,
	iK_viz_sel,iK_viz_i,iK_viz_u,
	iAusw,iAusw_prl,iAusw_set,
	iK_t_ext,iK_t_3U,iK_t_ext_6U,
	iAv_view,
	iBatLogKe,iJ_bat_ke,iBatLogVz,iJ_bat_vz,iBatLogWrk,
	iExtern,iExtern_3U,iExtern_GLONASS,iExtern_KONTUR,iExtern_6U,iExtern_220,
	iK_power_net,
	iExt_set,iExt_set_3U,iExt_set_GLONASS,
	iExt_dt,
	iExt_sk,iExt_sk_3U,iExt_sk_GLONASS,
	iExt_ddv,iExt_ddi,iExt_dud,iExt_dp,iSM,iLog,iLog_,iBatLog,iKlimat,
	iEnerg3,iEnerg,
	iVent,iAvtRev,
	iK_power_net3,
	iAvt,iLan_set,iRele_set,iRele_sel,iFiks_set,
	iK_max_param,iCurr_contr_set,iVolt_contr_set,
	iAch_off,iCurr_off,iUout_avar_control,
	iProcIsComplete,
	iFW_UKU,iFW_IPS,iFW_IPS_SEL}i_enum;

typedef struct  
{

i_enum i;
signed char s_i;
signed char s_i1;
signed char s_i2;
signed char i_s;
} stuct_ind;

#define ind     a_ind.i
#define sub_ind     a_ind.s_i
#define sub_ind1     a_ind.s_i1
#define sub_ind2     a_ind.s_i2
#define index_set     a_ind.i_s

extern stuct_ind a_ind,b_ind[10],c_ind;
extern signed short ptr_ind;
extern char lcd_buffer[LCD_SIZE+100];
extern signed char parol[3];
extern char phase;
extern char lcd_bitmap[1024];
extern char dig[5];
extern signed short ind_pointer;
extern char zero_on;
extern char mnemo_cnt;
extern char simax;
extern short av_j_si_max;
extern const char ABCDEF[];
extern const char sm_mont[13][4]; 


//**********************************************
//������������, ������������ �� EEPROM
extern signed short Ktsrc[2];
extern signed short Kusrc[2];
extern signed short Kisrc[2];
extern signed short Ki0src[2];
extern signed short Kubat[2];
extern signed short Kubatm[2];
extern unsigned short Kibat0[2];
extern signed short Kibat1[2];
extern signed short Ktbat[2];
extern signed short Kunet;
extern signed short Ktext[3];
extern signed short Kuload;
extern signed short Kunet_ext[3];
extern signed short KunetA;
extern signed short KunetB;
extern signed short KunetC;

extern signed short MAIN_IST;
extern signed short UMAX;
extern signed short UB0;
extern signed short UB20;
//extern signed short TMAX;
extern signed short TSIGN;
extern signed short AV_OFF_AVT;
extern signed short USIGN;
extern signed short UMN;
extern signed short ZV_ON;
extern signed short IKB;
extern signed short UVZ;
extern signed short IMAX;
extern signed short IMIN;
extern signed short APV_ON;
extern signed short IZMAX;
extern signed short U0B;
extern signed short TZAS;
extern signed short VZ_HR;
extern signed short TBAT;
extern signed short U_AVT;
extern signed short DU;
extern signed short PAR;
extern signed short TBATMAX;
extern signed short TBATSIGN;
extern signed short UBM_AV;
extern signed short TBOXMAX;
extern signed short TBOXREG;
extern signed short TBOXVENTMAX;
extern signed short TLOADDISABLE;
extern signed short TLOADENABLE;
extern signed short TBATDISABLE;
extern signed short TBATENABLE;
extern signed short TBOXMAX;
extern signed short TBOXREG;
extern signed short TBOXVENTMAX;
extern signed short TLOADDISABLE;
extern signed short TLOADENABLE;
extern signed short TBATDISABLE;
extern signed short TBATENABLE;

extern signed short NUMBAT;
extern signed short NUMIST;
//extern signed short NUMINV;
extern signed short NUMDT;
extern signed short NUMSK;
extern signed short NUMEXT;
extern signed short NUMAVT;

typedef enum {apvON=0x01,apvOFF=0x00}enum_apv_on;
extern enum_apv_on APV_ON1,APV_ON2;

extern signed short APV_ON2_TIME;

typedef enum {bisON=0x0055,bisOFF=0x00aa}enum_bat_is_on;
extern enum_bat_is_on BAT_IS_ON[2];

extern signed short BAT_DAY_OF_ON[2];
extern signed short BAT_MONTH_OF_ON[2];
extern signed short BAT_YEAR_OF_ON[2];
extern signed short BAT_C_NOM[2];
extern signed short BAT_RESURS[2];
extern signed short BAT_C_REAL[2];

extern unsigned short AUSW_MAIN;
extern unsigned long 	AUSW_MAIN_NUMBER;
extern unsigned short AUSW_DAY;
extern unsigned short AUSW_MONTH;
extern unsigned short AUSW_YEAR;
extern unsigned short AUSW_UKU;
extern unsigned short AUSW_UKU_SUB;
extern unsigned long AUSW_UKU_NUMBER;
extern unsigned long	AUSW_BPS1_NUMBER;
extern unsigned long  AUSW_BPS2_NUMBER;
extern unsigned short AUSW_RS232;
extern unsigned short AUSW_PDH;
extern unsigned short AUSW_SDH;
extern unsigned short AUSW_ETH;

extern signed short TMAX_EXT_EN[3];
extern signed short TMAX_EXT[3];
extern signed short TMIN_EXT_EN[3];
extern signed short TMIN_EXT[3];
extern signed short T_EXT_REL_EN[3];
extern signed short T_EXT_ZVUK_EN[3];
extern signed short T_EXT_LCD_EN[3];
extern signed short T_EXT_RS_EN[3];

extern signed short SK_SIGN[4];
extern signed short SK_REL_EN[4];
extern signed short SK_ZVUK_EN[4];
extern signed short SK_LCD_EN[4];
extern signed short SK_RS_EN[4];

typedef enum {AVZ_1=1,AVZ_2=2,AVZ_3=3,AVZ_6=6,AVZ_12=12,AVZ_OFF=0}enum_avz;
extern enum_avz AVZ;

extern unsigned short HOUR_AVZ;
extern unsigned short MIN_AVZ;
extern unsigned short SEC_AVZ;
extern unsigned short DATE_AVZ;
extern unsigned short MONTH_AVZ;
extern unsigned short YEAR_AVZ;
extern unsigned short AVZ_TIME;
typedef enum {mnON=0x55,mnOFF=0xAA}enum_mnemo_on;
extern enum_mnemo_on MNEMO_ON;
extern unsigned short MNEMO_TIME;
extern signed short POWER_CNT_ADRESS;

extern signed short ETH_IS_ON;
extern signed short ETH_DHCP_ON;
extern signed short ETH_IP_1;
extern signed short ETH_IP_2;
extern signed short ETH_IP_3;
extern signed short ETH_IP_4;
extern signed short ETH_MASK_1;
extern signed short ETH_MASK_2;
extern signed short ETH_MASK_3;
extern signed short ETH_MASK_4;
extern signed short ETH_TRAP1_IP_1;
extern signed short ETH_TRAP1_IP_2;
extern signed short ETH_TRAP1_IP_3;
extern signed short ETH_TRAP1_IP_4;
extern signed short ETH_TRAP2_IP_1;
extern signed short ETH_TRAP2_IP_2;
extern signed short ETH_TRAP2_IP_3;
extern signed short ETH_TRAP2_IP_4;
extern signed short ETH_TRAP3_IP_1;
extern signed short ETH_TRAP3_IP_2;
extern signed short ETH_TRAP3_IP_3;
extern signed short ETH_TRAP3_IP_4;
extern signed short ETH_TRAP4_IP_1;
extern signed short ETH_TRAP4_IP_2;
extern signed short ETH_TRAP4_IP_3;
extern signed short ETH_TRAP4_IP_4;
extern signed short ETH_TRAP5_IP_1;
extern signed short ETH_TRAP5_IP_2;
extern signed short ETH_TRAP5_IP_3;
extern signed short ETH_TRAP5_IP_4;
extern signed short ETH_SNMP_PORT_READ;
extern signed short ETH_SNMP_PORT_WRITE;
extern signed short ETH_GW_1;
extern signed short ETH_GW_2;
extern signed short ETH_GW_3;
extern signed short ETH_GW_4;
extern signed short MODBUS_ADRESS;
extern signed short MODBUS_BAUDRATE, MODBUS_BAUDRATEA, MODBUS_BAUDRATEB;
extern signed short CURR_FADE_IN; //������� ���������� ����. 0 - ����, 1 - 500 - ����� ���������� � ��������
extern signed short SK_START;	  //���������� ����� ���������, 0 - ����, 1 - ���������/����������, 2- ����������	
extern signed short SK_START_LEV; //���������� ����� ���������, 0 - ���������(����������) �����������, 1 - ���������(����������) ����������
extern signed short ACH_OFF_EN;		//������� ���������� ������ �� ����������, ��������-���������
extern signed short ACH_OFF_LEVEL;	//������� ���������� ������ �� ����������, ���������� ������� (���������), ������������ 0.1�*�
extern signed short CURR_OFF_EN;
extern signed short CUR_OFF_LEVEL_RELATIV;
extern signed short CUR_OFF_LEVEL_ABSOLUT;
extern signed short CUR_OFF_T_OFF;
extern signed short CUR_OFF_T_ON;
extern signed short EE_WRITE_CNT;
extern signed short UOUT_OFF_EN;	//������� ���������� ���������� �� ���������� ������ ��� �������� ���./����.
extern signed short UOUT_OFF_LEVEL;	//����� � ��������� ��� ������� ���������� ���������� �� ���������� ������ ��� ��������
extern signed short UOUT_OFF_DELAY;	//�������� ������������ � �������� ��� ������� ���������� ���������� �� ���������� ������ ��� ��������



//***********************************************
//��������� ����������


typedef struct
     {
     enum {dSRC=3,dINV=5}_device;
	char _av;
	//0��� - ������ �� ���������
	//1��� - ������ �� ����������� U���
	//2��� - ������ �� ����������� U���
	//3��� - ������ �� ������ �����	    
     enum {bsAPV,bsWRK,bsRDY,bsBL,bsAV,bsOFF_AV_NET}_state;
     char _cnt;
     char _cnt_old;
     char _cnt_more2;
     char _buff[16]; 
     //char _av_net;
     //char _av_u_max;
     //char _av_u_min;
     //char _av_temper; 
     signed _Uii; 
     signed _Uin;
     signed _Ii;
     signed _Ti; 
     char _flags_tu;
     //char _flags_tu_old;
     //char _is_ready;
     //char _is_wrk;
     //char _is_link;
     //char _is_av;
     signed _vol_u;
     signed _vol_i;
     char _is_on_cnt;
     //int _ist_blok_host_cnt_; //������������ ���������� �����(CAN ��� RS), ���� �� 0 �� �������� ������������.
     int _ist_blok_host_cnt;
     short _blok_cnt; //������������ ���������� 
     char _flags_tm;
	signed short _overload_av_cnt;     
    signed short _temp_av_cnt;
    signed short _umax_av_cnt;
    signed short _umin_av_cnt;
    signed _rotor;
    signed  short _x_; 
    char _adr_ee;
	char _last_avar; 
	signed short _xu_;
	char _uout_avar_cnt;
	signed short _build_year;
	signed short _build_month;
	signed short _build_day;
	signed short _hardvare_version;
	signed short _soft_version;
	signed short _build;
   	} BPS_STAT; 
extern BPS_STAT bps[32];

extern char first_inv_slot;

//***********************************************
//��������� ��������
extern signed short load_U;
extern signed short load_I;
extern signed short load_U_;	//������� ���������, ��� �������������, ��� ����������
extern signed short load_I_;	//������� ���������, ��� �������������, ��� ����������


//***********************************************
//��������� ��������� ����
extern signed short net_U,net_Ustore,net_Ua,net_Ub,net_Uc;
extern char bFF,bFF_;
extern signed short net_F,hz_out,hz_out_cnt;

extern char net_av;


extern char plazma_plazma_plazma;

void bitmap_hndl(void);
void ind_hndl(void);
__irq void timer1_interrupt(void);
__irq void timer0_interrupt(void); 


//***********************************************
//��������� ������� ��������
//signed short tout[4];
extern char tout_max_cnt[4],tout_min_cnt[4];
typedef enum {tNORM,tMAX,tMIN}enum_tout_stat;
extern enum_tout_stat tout_stat[4];
extern signed short t_ext[3];
extern BOOL ND_EXT[3];
extern signed char sk_cnt[4],sk_av_cnt[4];
typedef enum  {ssOFF,ssON} enum_sk_stat;
extern enum_sk_stat sk_stat[4];
typedef enum  {sasOFF,sasON} enum_sk_av_stat;
extern enum_sk_av_stat sk_av_stat[4],sk_av_stat_old[4];
extern signed short t_box;

//***********************************************
//�����
extern BOOL bSILENT;

//***********************************************
//����
typedef enum {tstOFF,tst1,tst2} enum_tst_state;
extern enum_tst_state tst_state[15];

//-----------------------------------------------
//�������� ������
extern char sign_U[2],sign_I[2];
extern char superviser_cnt;

//-----------------------------------------------
//����� ����������
extern unsigned short adc_buff_ext_[3];
extern unsigned short Uvv[3];
extern unsigned short Uvv0;
extern short pos_vent;
extern short t_ext_can;
extern char t_ext_can_nd;

//-----------------------------------------------
//����� ���������� 2
extern char eb2_data[30];
extern short eb2_data_short[10];
extern short Uvv_eb2[3],Upes_eb2[3];
extern short Kvv_eb2[3],Kpes_eb2[3];

//-----------------------------------------------
//��������� ������
extern signed short vvod_pos;

//-----------------------------------------------
//������ �� ��������
extern signed long power_summary;
extern signed short power_current;

extern char bRESET;
extern char bRESET_EXT;

//-----------------------------------------------
//�������������� � �����������
extern signed short main_vent_pos;
extern signed char t_box_cnt;
typedef enum  {mvsOFF,mvsON} enum_mixer_vent_stat;
extern enum_mixer_vent_stat mixer_vent_stat;
typedef struct
     {
	signed short _T[4];
	char _nd[4];
	signed short _T_dispers[4];
	char _max_dispers_num;
	signed short _max_dispers;
    	signed short _avg1;
	signed short _avg2;
	char _avg_cnt;
     } INT_BOX_TEMPER;
extern INT_BOX_TEMPER ibt;
typedef enum {tbdsON,tbdsOFF,tbdsMNL} enum_tbatdisable_stat;
extern enum_tbatdisable_stat tbatdisable_stat;
typedef enum {tldsON,tldsOFF,tldsMNL} enum_tloaddisable_stat;
extern enum_tloaddisable_stat tloaddisable_stat;
typedef enum {atsOFF,atsON} enum_av_tbox_stat;
extern enum_av_tbox_stat av_tbox_stat;
extern signed short av_tbox_cnt;
//extern char tbatdisable_cmnd,tloaddisable_cmnd;
//extern short tbatdisable_cnt,tloaddisable_cnt;

extern char ext_can_cnt;


signed short abs_pal(signed short in);
void ADC_IRQHandler(void);


//-----------------------------------------------
//��������� �������������� ��������� �������� 
typedef enum  {avtOFF,avtON} enum_avt_stat;
extern enum_avt_stat avt_stat[12],avt_stat_old[12]; 


extern char snmp_plazma;
extern signed short plazma_vol_u_0,plazma_vol_u_1;

#ifndef FALSE
#define FALSE   (0)
#endif

#ifndef TRUE
#define TRUE    (1)
#endif



//-----------------------------------------------
//����������

//-----------------------------------------------
//��������� ���
extern short unet_drv_cnt;

//-----------------------------------------------
//��������� ��������

//-----------------------------------------------
//���������� ���������
typedef enum {wsOFF,wsGS,wsPS,wsCAP} enum_work_stat;
extern enum_work_stat work_stat;
typedef enum  {stOFF=0,stON=1}enum_onoff;
extern enum_onoff bps_stat;
extern signed short _x_,_xu_;

//**********************************************
//������������, ������������ �� EEPROM
extern int Kiload0;
extern signed short Kiload1;
extern signed short U_MAX;
extern signed short U_MIN;
extern signed short I_MAX;
extern signed short I_MIN;
extern signed short T_MAX;
extern signed short T_SIGN;
extern signed short I_ug;
extern signed short I_ug2;
extern signed short I_ug3;
extern signed short I_ug_block_cnt;
extern signed short U_up;
extern signed short U_up2;
extern signed short U_up3;
extern signed short U_up_block_cnt;
extern signed short U_maxg;
extern signed short I_maxp;
extern signed long T_PROC_GS;			//������������� ����� ��� ��������� ����, �������
extern signed short T_PROC_GS_block_cnt;
extern signed short T_PROC_GS_MODE;	//����� ������� ��� ��������� ����, ���� 1 �� ����������
extern signed long T_PROC_PS;			//������������� ����� ��� ��������� ����������, �������
extern signed short T_PROC_PS_block_cnt;
extern signed short T_PROC_PS_MODE;	//����� ������� ��� ��������� ����������, ���� 1 �� ����������
extern unsigned short	T_PROC_MAX;		//����������� ����� ��� ��������� ������ ���������, �������
extern signed short TIME_VISION;		//������ ����������� ������� �������� �� ������ - ������(� ������) ��� ��������(�� �����)
extern signed short TIME_VISION_PULT;	//������ ����������� ������� �� ������ - ����-������ ��� ������-�������
extern signed short I_MAX_IPS;		//������������ ��� ����� ���������, =I_MAX*NUMIST
extern signed short I_MIN_IPS;		//����������� ��� ����� ���������, =I_MIN*NUMIST
extern signed short I_LOAD_MODE;		//������ ��������� ��������� ���� - �� ����� ��� ��� ����� ����� ����������
extern signed long time_proc;			//����� �������� ������
extern signed long time_proc_remain;	//����� �������� ��������
typedef enum {mmmIT,mmmIN,mmmITIN,mmmINIT} enum_main_menu_mode;
extern enum_main_menu_mode main_menu_mode;	//����� ������ �������� ���� 
typedef enum {reOFF,reON}enum_restart_enable;
extern enum_restart_enable restart_enable;	//������� �������-��������
extern signed short RELE_LOG_CURR;		//������ ������ ���� ��������� ��������������� (1 - �������� == ���������������)
extern signed short RELE_LOG_VOLT;		//������ ������ ���� �������� ���������� 	  (1 - �������� == ���������� � �����)
extern char can2_plazma;
extern signed short T_DEL_REL_CURR_START;		//������ ������������������ �� ������� ���� ��������������� ����� ������ ��������, ������ 
extern signed short T_DEL_REL_CURR_WRK;			//������ ������������������ �� ������� ���� ��������������� ����� ����������� ���������������, ������
extern signed short T_DEL_REL_VOLT_START;		//������ ������������������ �� ������� ���� �������� ���������� ����� ������ ��������, ������ 
extern signed short T_DEL_REL_VOLT_WRK;			//������ ������������������ �� ������� ���� �������� ���������� ����� ����������� ������� ������������ ����, ������
extern signed short I_ug_ram;					//������� ���� ���������� � RAM
extern signed short U_up_ram;					//������� ���������� ���������� � RAM
extern signed short DELT_REL_CURR_U;				
extern signed short DELT_REL_CURR_I;
extern signed short REL_VOLT_UMAX;				
extern signed short REL_VOLT_UMIN;				
extern signed long cap_time_proc;
extern signed long AMPERCHAS;	//������� ����������


//-----------------------------------------------
//������ ��� �������� � �����
extern short pult_time;
extern unsigned short pult_time_set;
extern short pult_u;
extern short pult_u_set;
extern short pult_i;
extern short pult_i_set;
extern enum_work_stat pult_work_stat;

//-----------------------------------------------
//���������� �� ������
typedef enum {/*tsOFF=0,*/tsU=1,tsI=0}enum_tumbler_stat;
extern enum_tumbler_stat tumbler_stat,tumbler_stat_old;

extern signed short U_up_d;

extern signed short tst_pwm_u;
extern signed short tst_pwm_i;

extern signed short sk_in_drv_cnt;
extern signed short sk_in_drv_stat,sk_in_drv_stat_old;

typedef enum {vsOFF,vsON}enum_viz_stat;
extern enum_viz_stat viz_stat;
extern signed short viz_stat_cnt;

//**********************************************
//���� ���������������
extern signed long delta_U_abs,delta_U_rel,delta_I_abs,delta_I_rel;
extern char bCURRENT_STAB;
extern signed short cnt_del_rel;

//-----------------------------------------------
//������
typedef enum {rsREW=0,rsFF=1}enum_rev_stat;
extern enum_rev_stat REV_STAT;
extern short REV_IS_ON;
extern short AVT_REV_IS_ON;
extern unsigned short AVT_REV_TIME_FF;
extern unsigned short AVT_REV_TIME_REW;
extern short AVT_REV_TIME_PAUSE;
extern short AVT_REV_I_NOM_FF;
extern short AVT_REV_I_NOM_REW;
extern short AVT_REV_U_NOM_FF;
extern short AVT_REV_U_NOM_REW;
extern short time_proc_phase;
typedef enum {ppFF=0,ppFF_P_REW,ppREW,ppREW_P_FF}enum_proc_phase;
extern enum_proc_phase proc_phase;
extern short RS485_QWARZ_DIGIT;

extern signed short I_ug_temp;
extern signed short U_up_temp;
extern signed short fiks_stat_I;
extern signed short fiks_stat_U;

//-----------------------------------------------
//�������� ������������
extern short CAP_ZAR_TIME;
extern short CAP_PAUSE1_TIME;
extern short CAP_RAZR_TIME;
extern short CAP_PAUSE2_TIME;
extern short CAP_MAX_VOLT;
extern short CAP_WRK_CURR;
extern short CAP_COUNTER;
extern short CAP_TIME_SEC;
extern short CAP_TIME_MIN;
extern short CAP_TIME_HOUR;

extern short main_cnt;

extern char  bOFF;
extern char bRAZR;

extern signed short RELE_FUNC[2];

extern U8 socket_tcp;

//-----------------------------------------------
//������� ���������� �� �������� ����������
extern signed long milliAmperSecunda;

//-----------------------------------------------
//������� ���������� �� �������� ����
extern signed short curr_off_stop_cnt;
extern signed short curr_off_start_cnt;
extern signed short curr_off_temp;

//***********************************************
//������������ �����
extern short avg_main_cnt;
extern signed int i_avg_max,i_avg_min,i_avg_summ,i_avg; 
extern signed int avg;
extern char bAVG;
extern char avg_cnt;  
extern char avg_num;
extern char num_of_dumm_src; 
extern char num_of_max_src;
extern char bAVG_CNT;

extern long gp_av_stat;

extern short pvlk;

extern char eepromRamSwitch; 	//������������� ���������� ��������� � EEPROM (���� 0) �� RAM (������)
extern short ramModbusCnt;		//������� ������������ MODBUS, ��� ���������� 300(5 �����) �������� ����������

//-----------------------------------------------
//�������� ��� ����������������� ���������� �� MODBUS
extern signed short pwm_u_reg;
extern signed short pwm_i_reg;
extern signed short pwm_t_reg;

extern short plazma_umax;

extern short modbus_tcp_plazma_pavlik[4];
/*----------------------------------------------------------------------------
 * end of file
 *---------------------------------------------------------------------------*/
