#line 1 "memo.c"
#line 1 "25lc640.h"







char spi1(char in);
void spi1_config(void);
void spi1_unconfig(void);
void lc640_wren(void);
char lc640_rdsr(void);
int lc640_read(int ADR);
int lc640_read_int(int ADR);
long lc640_read_long(int ADR);
void lc640_read_long_ptr(int ADR,char* out_ptr);
void lc640_read_str(int ADR, char* ram_ptr, char num);
char lc640_write(int ADR,char in);
char lc640_write_int(short ADR,short in);
char lc640_write_long(int ADR,long in);
char lc640_write_long_ptr(int ADR,char* in);
#line 2 "memo.c"
#line 1 "memo.h"

void memo_read (void);






#line 3 "memo.c"
#line 1 "eeprom_map.h"






#line 37 "eeprom_map.h"

#line 132 "eeprom_map.h"





#line 151 "eeprom_map.h"



#line 163 "eeprom_map.h"


#line 174 "eeprom_map.h"


#line 183 "eeprom_map.h"








#line 229 "eeprom_map.h"








#line 4 "memo.c"
#line 1 "main.h"






#line 1 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"









 




 

 


#line 27 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"







 typedef unsigned int   size_t;


typedef signed char     S8;
typedef unsigned char   U8;
typedef short           S16;
typedef unsigned short  U16;
typedef int             S32;
typedef unsigned int    U32;
typedef long long       S64;
typedef unsigned long long U64;
typedef unsigned char   BIT;
typedef unsigned int    BOOL;

#line 54 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"

#line 66 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"



 





 
typedef U32 OS_SEM[2];

 

typedef U32 OS_MBX[];

 
typedef U32 OS_MUT[3];

 
typedef U32 OS_TID;

 
typedef void *OS_ID;

 
typedef U32 OS_RESULT;

 












 




#line 194 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"



 



 
extern void      os_set_env    (void);
extern void      rt_sys_init   (void (*task)(void), U8 priority, void *stk);
extern void      rt_tsk_pass   (void);
extern OS_TID    rt_tsk_self   (void);
extern OS_RESULT rt_tsk_prio   (OS_TID task_id, U8 new_prio);
extern OS_TID    rt_tsk_create (void (*task)(void), U8 priority, void *stk, void *argv);
extern OS_RESULT rt_tsk_delete (OS_TID task_id);

#line 230 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"

extern void      _os_sys_init(U32 p, void (*task)(void), U32 prio_stksz,
                                     void *stk)                        __svc_indirect(0);
extern OS_TID    _os_tsk_create (U32 p, void (*task)(void), U32 prio_stksz,
                                        void *stk, void *argv)         __svc_indirect(0);
extern OS_TID    _os_tsk_create_ex (U32 p, void (*task)(void *), U32 prio_stksz,
                                           void *stk, void *argv)      __svc_indirect(0);
extern OS_TID    _os_tsk_self (U32 p)                                  __svc_indirect(0);
extern void      _os_tsk_pass (U32 p)                                  __svc_indirect(0);
extern OS_RESULT _os_tsk_prio (U32 p, OS_TID task_id, U8 new_prio)     __svc_indirect(0);
extern OS_RESULT _os_tsk_delete (U32 p, OS_TID task_id)                __svc_indirect(0);

 
extern OS_RESULT rt_evt_wait (U16 wait_flags,  U16 timeout, BOOL and_wait);
extern void      rt_evt_set  (U16 event_flags, OS_TID task_id);
extern void      rt_evt_clr  (U16 clear_flags, OS_TID task_id);
extern U16       rt_evt_get  (void);







extern OS_RESULT _os_evt_wait(U32 p, U16 wait_flags, U16 timeout,
                                     BOOL and_wait)                    __svc_indirect(0);
extern void      _os_evt_set (U32 p, U16 event_flags, OS_TID task_id)  __svc_indirect(0);
extern void      _os_evt_clr (U32 p, U16 clear_flags, OS_TID task_id)  __svc_indirect(0);
extern U16       _os_evt_get (U32 p)                                   __svc_indirect(0);
extern void      isr_evt_set (U16 event_flags, OS_TID task_id);

 
extern void      rt_sem_init (OS_ID semaphore, U16 token_count);
extern OS_RESULT rt_sem_send (OS_ID semaphore);
extern OS_RESULT rt_sem_wait (OS_ID semaphore, U16 timeout);





extern void      _os_sem_init (U32 p, OS_ID semaphore, 
                                      U16 token_count)                 __svc_indirect(0);
extern OS_RESULT _os_sem_send (U32 p, OS_ID semaphore)                 __svc_indirect(0);
extern OS_RESULT _os_sem_wait (U32 p, OS_ID semaphore, U16 timeout)    __svc_indirect(0);
extern void      isr_sem_send (OS_ID semaphore);

 
extern void      rt_mbx_init  (OS_ID mailbox, U16 mbx_size);
extern OS_RESULT rt_mbx_send  (OS_ID mailbox, void *p_msg,    U16 timeout);
extern OS_RESULT rt_mbx_wait  (OS_ID mailbox, void **message, U16 timeout);
extern OS_RESULT rt_mbx_check (OS_ID mailbox);







extern void      _os_mbx_init (U32 p, OS_ID mailbox, U16 mbx_size)     __svc_indirect(0);
extern OS_RESULT _os_mbx_send (U32 p, OS_ID mailbox, void *message_ptr,
                                      U16 timeout)                     __svc_indirect(0);
extern OS_RESULT _os_mbx_wait (U32 p, OS_ID mailbox, void  **message,
                                      U16 timeout)                     __svc_indirect(0);
extern OS_RESULT _os_mbx_check (U32 p, OS_ID mailbox)                  __svc_indirect(0);
extern void      isr_mbx_send (OS_ID mailbox, void *message_ptr);
extern OS_RESULT isr_mbx_receive (OS_ID mailbox, void **message);

 
extern void      rt_mut_init    (OS_ID mutex);
extern OS_RESULT rt_mut_release (OS_ID mutex);
extern OS_RESULT rt_mut_wait    (OS_ID mutex, U16 timeout);





extern void      _os_mut_init (U32 p, OS_ID mutex)                     __svc_indirect(0);
extern OS_RESULT _os_mut_release (U32 p, OS_ID mutex)                  __svc_indirect(0);
extern OS_RESULT _os_mut_wait (U32 p, OS_ID mutex, U16 timeout)        __svc_indirect(0);

 
extern void      rt_dly_wait (U16 delay_time);
extern void      rt_itv_set  (U16 interval_time);
extern void      rt_itv_wait (void);





extern void      _os_dly_wait (U32 p, U16 delay_time)                  __svc_indirect(0);
extern void      _os_itv_set (U32 p, U16 interval_time)                __svc_indirect(0);
extern void      _os_itv_wait (U32 p)                                  __svc_indirect(0);

 
extern OS_ID     rt_tmr_create (U16 tcnt, U16 info);
extern OS_ID     rt_tmr_kill   (OS_ID timer);




extern OS_ID     _os_tmr_create (U32 p, U16 tcnt, U16 info)            __svc_indirect(0);
extern OS_ID     _os_tmr_kill (U32 p, OS_ID timer)                     __svc_indirect(0);

 
extern void      rt_tsk_lock   (void);
extern void      rt_tsk_unlock (void);




extern void      _os_tsk_lock (U32 p)                                  __svc_indirect(0);
extern void      _os_tsk_unlock (U32 p)                                __svc_indirect(0);

 
extern int       _init_box (void *box_mem, U32 box_size, U32 blk_size);
extern void     *_alloc_box (void *box_mem);
extern void     *_calloc_box (void *box_mem);
extern int       _free_box (void *box_mem, void *box);








 




 

typedef struct {                         
  U8  hr;                                
  U8  min;                               
  U8  sec;                               
  U8  day;                               
  U8  mon;                               
  U16 year;                              
} RL_TIME;

typedef struct {                         
  S8  name[256];                         
  U32 size;                              
  U16 fileID;                            
  U8  attrib;                            
  RL_TIME time;                          
} FINFO;

extern int finit (void);
extern int fdelete (const char *filename);
extern int frename (const char *oldname, const char *newname);
extern int ffind (const char *pattern, FINFO *info);
extern U64 ffree (const char *drive);
extern int fformat (const char *drive);
extern int fanalyse (const char *drive);
extern int fcheck (const char *drive);
extern int fdefrag (const char *drive);

 




 

 



 






 
#line 415 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"

 
#line 428 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"

 





 
#line 442 "C:\\Keil\\ARM\\RV31\\INC\\rtl.h"

 




 



extern void init_TcpNet (void);
extern void main_TcpNet (void);
extern void timer_tick (void);
extern U8   udp_get_socket (U8 tos, U8 opt, 
                            U16 (*listener)(U8 socket, U8 *remip, U16 port, U8 *buf, U16 len));
extern BOOL udp_release_socket (U8 socket);
extern BOOL udp_open (U8 socket, U16 locport);
extern BOOL udp_close (U8 socket);
extern BOOL udp_mcast_ttl (U8 socket, U8 ttl);
extern U8  *udp_get_buf (U16 size);
extern BOOL udp_send (U8 socket, U8 *remip, U16 remport, U8 *buf, U16 dlen);
extern U8   tcp_get_socket (U8 type, U8 tos, U16 tout,
                            U16 (*listener)(U8 socket, U8 event, U8 *buf, U16 len));
extern BOOL tcp_release_socket (U8 socket);
extern BOOL tcp_listen (U8 socket, U16 locport);
extern BOOL tcp_connect (U8 socket, U8 *remip, U16 remport, U16 locport);
extern U8  *tcp_get_buf (U16 size);
extern U16  tcp_max_dsize (U8 socket);
extern BOOL tcp_check_send (U8 socket);
extern U8   tcp_get_state (U8 socket);
extern BOOL tcp_send (U8 socket, U8 *buf, U16 dlen);
extern BOOL tcp_close (U8 socket);
extern BOOL tcp_abort (U8 socket);
extern void tcp_reset_window (U8 socket);
extern BOOL arp_cache_ip (U8 *ipadr, U8 type);
extern void ppp_listen (char const *user, char const *passw);
extern void ppp_connect (char const *dialnum, char const *user, char const *passw);
extern void ppp_close (void);
extern BOOL ppp_is_up (void);
extern void slip_listen (void);
extern void slip_connect (char const *dialnum);
extern void slip_close (void);
extern BOOL slip_is_up (void);
extern U8   get_host_by_name (U8 *hostn, void (*cbfunc)(U8 event, U8 *host_ip));
extern BOOL smtp_connect (U8 *ipadr, U16 port, void (*cbfunc)(U8 event));
extern void dhcp_disable (void);
extern BOOL igmp_join (U8 *group_ip);
extern BOOL igmp_leave (U8 *group_ip);
extern BOOL snmp_trap (U8 *manager_ip, U8 gen_trap, U8 spec_trap, U16 *obj_list);
extern BOOL snmp_set_community (const char *community);






 
  

 
#line 8 "main.h"












#line 33 "main.h"





#line 44 "main.h"


#line 56 "main.h"

#line 64 "main.h"

#line 75 "main.h"









#line 90 "main.h"







#line 115 "main.h"





#line 129 "main.h"





























































#line 218 "main.h"







		










#line 254 "main.h"

#line 270 "main.h"





















#line 304 "main.h"

#line 318 "main.h"










extern char b1000Hz,b100Hz,b50Hz,b10Hz,b5Hz,b2Hz,b1Hz;
extern short t0cnt,t0cnt0,t0cnt1,t0cnt2,t0cnt3,t0cnt4,t0cnt5,t0cnt6,t0_cnt7;
extern char bFL5,bFL2,bFL,bFL_;
extern signed short main_10Hz_cnt;
extern signed short main_1Hz_cnt;



extern char cnt_of_slave;


extern U8  snmp_Community[];




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
	iK_bps,iK_bps_sel,iK_bat,iK_bat_simple,iK_bat_sel,iK_load,iK_net,iK_net3,
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
	iAch_off,iCurr_off,
	iProcIsComplete}i_enum;

typedef struct  
{

i_enum i;
signed char s_i;
signed char s_i1;
signed char s_i2;
signed char i_s;
} stuct_ind;







extern stuct_ind a_ind,b_ind[10],c_ind;
extern signed short ptr_ind;
extern char lcd_buffer[200+100];
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
extern signed short MODBUS_BAUDRATE;
extern signed short CURR_FADE_IN; 
extern signed short SK_START;	  
extern signed short SK_START_LEV; 
extern signed short ACH_OFF_EN;		
extern signed short ACH_OFF_LEVEL;	
extern signed short CURR_OFF_EN;
extern signed short CUR_OFF_LEVEL_RELATIV;
extern signed short CUR_OFF_LEVEL_ABSOLUT;
extern signed short CUR_OFF_T_OFF;
extern signed short CUR_OFF_T_ON;




typedef struct
     {
	char 		_cnt_to_block;
	signed short	_Ub;
     signed short	_Ubm;
     signed short	_dUbm;
	signed short	_Ib;
	signed short	_Tb;
	char 		_nd;
	char 		_cnt_wrk;
	char 		_wrk;
	unsigned short _zar;
	char 		_full_ver;
	signed long 	_zar_cnt;
	signed long 	_zar_cnt_ke;
	unsigned short _Iintegr,_Iintegr_; 
	signed short 	_u_old[8];
	signed short	_u_old_cnt;
	unsigned long 	_wrk_date[2];
	char 		_rel_stat;
	char			_av;
	char			_time_cnt;
	char 		_temper_stat;
	
	
	signed short 	_sign_temper_cnt;
	signed short 	_max_temper_cnt;
	signed long 	_resurs_cnt;
	signed short 	_cnt_as; 	
     } BAT_STAT; 
extern BAT_STAT bat[2];
extern signed short		bat_u_old_cnt;





typedef struct
     {
     enum {dSRC=3,dINV=5}_device;
	char _av;
	
	
	
	
     enum {bsAPV,bsWRK,bsRDY,bsBL,bsAV,bsOFF_AV_NET}_state;
     char _cnt;
     char _cnt_old;
     char _cnt_more2;
     char _buff[16]; 
     
     
     
     
     signed _Uii; 
     signed _Uin;
     signed _Ii;
     signed _Ti; 
     char _flags_tu;
     
     
     
     
     
     signed _vol_u;
     signed _vol_i;
     char _is_on_cnt;
     
     int _ist_blok_host_cnt;
     short _blok_cnt; 
     char _flags_tm;
	signed short _overload_av_cnt;     
     signed short _temp_av_cnt;
     signed short _umax_av_cnt;
     signed short _umin_av_cnt;
     signed _rotor;
     signed  short _x_; 
     char _adr_ee;
	char _last_avar;
     } BPS_STAT; 
extern BPS_STAT bps[16];

extern char first_inv_slot;



extern signed short load_U;
extern signed short load_I;
extern signed short load_U_;	
extern signed short load_I_;	




extern signed short net_U,net_Ustore,net_Ua,net_Ub,net_Uc;
extern char bFF,bFF_;
extern signed short net_F,hz_out,hz_out_cnt;

extern char net_av;


extern char plazma_plazma_plazma;

void bitmap_hndl(void);
void ind_hndl(void);
__irq void timer1_interrupt(void);
__irq void timer0_interrupt(void); 





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



extern BOOL bSILENT;



typedef enum {tstOFF,tst1,tst2} enum_tst_state;
extern enum_tst_state tst_state[15];



extern char sign_U[2],sign_I[2];
extern char superviser_cnt;



extern unsigned short adc_buff_ext_[3];
extern unsigned short Uvv[3];
extern unsigned short Uvv0;
extern short pos_vent;
extern short t_ext_can;
extern char t_ext_can_nd;



extern char eb2_data[30];
extern short eb2_data_short[10];
extern short Uvv_eb2[3],Upes_eb2[3];
extern short Kvv_eb2[3],Kpes_eb2[3];



extern signed short vvod_pos;



extern signed long power_summary;
extern signed short power_current;

extern char bRESET;
extern char bRESET_EXT;



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



extern char ext_can_cnt;


signed short abs_pal(signed short in);
void ADC_IRQHandler(void);




typedef enum  {avtOFF,avtON} enum_avt_stat;
extern enum_avt_stat avt_stat[12],avt_stat_old[12]; 


extern char snmp_plazma;
extern signed short plazma_vol_u_0,plazma_vol_u_1;
















extern short unet_drv_cnt;






typedef enum {wsOFF,wsGS,wsPS,wsCAP} enum_work_stat;
extern enum_work_stat work_stat;
typedef enum  {stOFF=0,stON=1}enum_onoff;
extern enum_onoff bps_stat;
extern signed short _x_,_xu_;



extern signed short Kiload0;
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
extern signed long T_PROC_GS;			
extern signed short T_PROC_GS_block_cnt;
extern signed short T_PROC_GS_MODE;	
extern signed long T_PROC_PS;			
extern signed short T_PROC_PS_block_cnt;
extern signed short T_PROC_PS_MODE;	
extern signed long 	T_PROC_MAX;		
extern signed short TIME_VISION;		
extern signed short TIME_VISION_PULT;	
extern signed short I_MAX_IPS;		
extern signed short I_MIN_IPS;		
extern signed short I_LOAD_MODE;		
extern signed long time_proc;			
extern signed long time_proc_remain;	
typedef enum {mmmIT,mmmIN,mmmITIN,mmmINIT} enum_main_menu_mode;
extern enum_main_menu_mode main_menu_mode;	
typedef enum {reOFF,reON}enum_restart_enable;
extern enum_restart_enable restart_enable;	
extern signed short RELE_LOG_CURR;		
extern signed short RELE_LOG_VOLT;		
extern char can2_plazma;
extern signed short T_DEL_REL_CURR_START;		
extern signed short T_DEL_REL_CURR_WRK;			
extern signed short T_DEL_REL_VOLT_START;		
extern signed short T_DEL_REL_VOLT_WRK;			
extern signed short DELT_REL_CURR_U;				
extern signed short DELT_REL_CURR_I;
extern signed short REL_VOLT_UMAX;				
extern signed short REL_VOLT_UMIN;				
extern signed long cap_time_proc;
extern signed long AMPERCHAS;	




extern short pult_time;
extern unsigned short pult_time_set;
extern short pult_u;
extern short pult_u_set;
extern short pult_i;
extern short pult_i_set;
extern enum_work_stat pult_work_stat;



typedef enum { tsU=1,tsI=0}enum_tumbler_stat;
extern enum_tumbler_stat tumbler_stat,tumbler_stat_old;

extern signed short U_up_d;

extern signed short tst_pwm_u;
extern signed short tst_pwm_i;

extern signed short sk_in_drv_cnt;
extern signed short sk_in_drv_stat,sk_in_drv_stat_old;

typedef enum {vsOFF,vsON}enum_viz_stat;
extern enum_viz_stat viz_stat;
extern signed short viz_stat_cnt;



extern signed long delta_U_abs,delta_U_rel,delta_I_abs,delta_I_rel;
extern char bCURRENT_STAB;
extern signed short cnt_del_rel;



typedef enum {rsREW=0,rsFF=1}enum_rev_stat;
extern enum_rev_stat REV_STAT;
extern short REV_IS_ON;
extern short AVT_REV_IS_ON;
extern short AVT_REV_TIME_FF;
extern short AVT_REV_TIME_REW;
extern short AVT_REV_TIME_PAUSE;
extern short AVT_REV_I_NOM_FF;
extern short AVT_REV_I_NOM_REW;
extern short AVT_REV_U_NOM_FF;
extern short AVT_REV_U_NOM_REW;
extern short time_proc_phase;
typedef enum {ppFF=0,ppFF_P_REW,ppREW,ppREW_P_FF}enum_proc_phase;
extern enum_proc_phase proc_phase;

extern signed short I_ug_temp;
extern signed short U_up_temp;
extern signed short fiks_stat_I;
extern signed short fiks_stat_U;



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



extern signed long milliAmperSecunda;



extern signed short curr_off_stop_cnt;
extern signed short curr_off_start_cnt;
extern signed short curr_off_temp;



 
#line 5 "memo.c"

#line 1 "control.h"







extern char num_of_wrks_bps;
extern char bps_all_off_cnt,bps_mask_off_cnt,bps_mask_on_off_cnt;
extern char bps_hndl_2sec_cnt;
extern unsigned short bps_on_mask,bps_off_mask;
extern char num_necc_up,num_necc_down;
extern unsigned char sh_cnt0,b1Hz_sh;


extern short cntrl_stat_blok_cnt,cntrl_stat_blok_cnt_,cntrl_stat_blok_cnt_plus[2],cntrl_stat_blok_cnt_minus[2];



extern long adc_buff[16][32];
extern signed short adc_buff_max[12],adc_buff_min[12],unet_buff_max,unet_buff_min;
extern short adc_buff_[16];
extern short adc_buff__[16];
extern char adc_self_ch_cnt,adc_ch_net;
extern char adc_cnt,adc_cnt1,adc_ch,adc_ch_cnt;
extern short zero_cnt;
typedef enum {asCH=1,asNET_WAIT=2,asNET_RDY=3,asNET=4} enum_adc_stat;
extern enum_adc_stat adc_stat;
extern unsigned short net_buff[32],net_buff_;
extern char net_buff_cnt;
extern short ADWR,period_cnt,non_zero_cnt;

extern char bRELE_OUT;
extern short plazma_adc_cnt;
extern signed short adc_self_ch_buff[3],adc_self_ch_disp[3];
extern long main_power_buffer[8],main_power_buffer_;
extern short main_power_buffer_cnt;
extern short adc_gorb_cnt,adc_zero_cnt;
extern char adc_window_flag;
extern short adc_window_cnt;
extern short adc_net_buff_cnt;


char vz_start(char hour);
void vz_stop(void);
void vz_drv(void);
void samokalibr_init(void);
void samokalibr_hndl(void);
void kb_init(void);
void kb_hndl(void);
void ubat_old_drv(void);
void unet_drv(void);
void matemat(void);
void adc_init(void);
void adc_drv5(void);
void adc_drv_(void);
void avg_hndl(void);


void rele_hndl(void);
void bps_hndl(void);
void bps_drv(char in);
void bat_hndl(void);
void bat_drv(char in);
void u_necc_hndl(void);
void cntrl_hndl(void);
void zar_drv(void);
void num_necc_hndl(void);
void ke_start(char in);
void ke_drv(void);
void avz_drv(void);
void zar_drv(void);
void vent_hndl(void);
void avz_next_date_hndl(void);
void klimat_hndl(void);
void ext_drv(void);
void adc_drv7(void);
void time_hndl(void);
void restart_on_GS(void);
void restart_on_PS(void);
void restart_off(void);
void viz_hndl(void);
short find_U_curve(signed short in);




typedef enum {spcOFF=0,spcKE, spcVZ}enum_spc_stat;
typedef enum {kssNOT=0,kssNOT_VZ,kssYES=100,kssNOT_BAT,kssNOT_BAT_AV,kssNOT_BAT_AV_T,kssNOT_BAT_AV_ASS,kssNOT_BAT_ZAR,kssNOT_BAT_RAZR,kssNOT_KE1,kssNOT_KE2}enum_ke_start_stat;
extern enum_spc_stat spc_stat;
extern enum_ke_start_stat ke_start_stat;
extern char spc_bat;
extern char spc_phase;
extern unsigned short vz_cnt_s,vz_cnt_s_,vz_cnt_h,vz_cnt_h_;
extern short cnt_end_ke;
extern unsigned long ke_date[2];
extern short __ee_vz_cnt;
extern short __ee_spc_stat;
extern short __ee_spc_bat;
extern short __ee_spc_phase;



extern signed short cntrl_stat_U;
extern signed short cntrl_stat_I;
extern signed short cntrl_stat_old;
extern signed short cntrl_stat_new;
extern signed short Ibmax;
extern unsigned char unh_cnt0,unh_cnt1,b1Hz_unh;
extern unsigned char	ch_cnt0,b1Hz_ch,i,iiii;
extern unsigned short IZMAX_;

extern short plazma_sk;
extern char	plazma_inv[4];
extern char plazma_bat;


extern signed int i_avg_max,i_avg_min,i_avg_summ,i_avg; 
extern signed int avg;
extern char bAVG;
extern char bFAST_REG;
extern char bU_VALID;


typedef enum {rsOFF,rsON} enum_rele_stat;
extern enum_rele_stat rele_stat[2];

extern signed short cnt_volt_contr;
extern signed short cnt_rel_volt_umin;
extern signed short cnt_rel_volt_umax;

extern char bVOLT_IS_NOT_DOWN;
extern char bVOLT_IS_NOT_UP;
extern char bVOLT_IS_NORM;

void zar_superviser_drv(void);
void zar_superviser_start(void);
void current_stab_hndl(void);
void volt_stab_hndl(void);
void stop_proc(void);
void start_GS(void);
void start_PS(void);
void volt_contr_hndl(void);
void cap_time_hndl(void);
void rele_drv(void);
void ach_off_hndl(void);
void curr_off_hndl(void);
void reset_CAP(void);
void stop_CAP(void);
void pause_CAP(void);
void start_CAP(void); 


#line 7 "memo.c"


void memo_read (void)
{
char i;


U_MAX=lc640_read_int(0x10+8);
U_MIN=lc640_read_int(0x10+10);
I_MAX=lc640_read_int(0x10+12);
I_MIN=lc640_read_int(0x10+14);
T_MAX=lc640_read_int(0x10+22);
T_SIGN=lc640_read_int(0x10+24);
if(!I_ug_block_cnt)I_ug=lc640_read_int(0x10+16);
I_ug2=lc640_read_int(0x10+50);
I_ug3=lc640_read_int(0x10+52);
if(!U_up_block_cnt)U_up=lc640_read_int(0x10+18);
U_up2=lc640_read_int(0x10+54);
U_up3=lc640_read_int(0x10+56);
U_maxg=lc640_read_int(0x10+100+2);
I_maxp=lc640_read_int(0x10+100+4);
if(!T_PROC_GS_block_cnt)T_PROC_GS=lc640_read_long(0x10+100+100);
if(!T_PROC_PS_block_cnt)T_PROC_PS=lc640_read_long(0x10+100+104);
T_PROC_MAX=lc640_read_long(0x10+100+108);
TIME_VISION=lc640_read_int(0x10+100+112);
TIME_VISION_PULT=lc640_read_int(0x10+100+114);
I_LOAD_MODE=lc640_read_int(0x10+100+116);
main_menu_mode=(enum_main_menu_mode)lc640_read_int(0x10+100+118);
restart_enable=(enum_restart_enable)lc640_read_int(0x10+100+120);
T_PROC_GS_MODE=lc640_read_long(0x10+100+122);
T_PROC_PS_MODE=lc640_read_long(0x10+100+124);
MODBUS_ADRESS=lc640_read_int(0x10+100+128);
MODBUS_BAUDRATE=lc640_read_int(0x10+100+130);
RELE_LOG_CURR=lc640_read_int(0x10+100+174);
RELE_LOG_VOLT=lc640_read_int(0x10+100+176);
T_DEL_REL_CURR_START=lc640_read_int(0x10+100+134);		
T_DEL_REL_CURR_WRK=lc640_read_int(0x10+100+136);
T_DEL_REL_VOLT_START=lc640_read_int(0x10+100+178);		
T_DEL_REL_VOLT_WRK=lc640_read_int(0x10+100+180);			
DELT_REL_CURR_U=lc640_read_int(0x10+100+138);				
DELT_REL_CURR_I=lc640_read_int(0x10+100+140);
REL_VOLT_UMAX=lc640_read_int(0x10+100+182);				
REL_VOLT_UMIN=lc640_read_int(0x10+100+184);

REV_IS_ON=lc640_read_int(0x10+100+146);
AVT_REV_IS_ON=lc640_read_int(0x10+100+148);
AVT_REV_TIME_FF=lc640_read_int(0x10+100+150);
AVT_REV_TIME_REW=lc640_read_int(0x10+100+152);
AVT_REV_TIME_PAUSE=lc640_read_int(0x10+100+154);
AVT_REV_I_NOM_FF=lc640_read_int(0x10+100+156);
AVT_REV_I_NOM_REW=lc640_read_int(0x10+100+158);
AVT_REV_U_NOM_FF=lc640_read_int(0x10+100+160);
AVT_REV_U_NOM_REW=lc640_read_int(0x10+100+162);
ACH_OFF_EN=lc640_read_int(0x10+100+186);
ACH_OFF_LEVEL=lc640_read_int(0x10+100+188);
CURR_OFF_EN=lc640_read_int(0x10+100+190);
CUR_OFF_LEVEL_RELATIV=lc640_read_int(0x10+100+192);
CUR_OFF_LEVEL_ABSOLUT=lc640_read_int(0x10+100+194);
CUR_OFF_T_OFF=lc640_read_int(0x10+100+196);
CUR_OFF_T_ON=lc640_read_int(0x10+100+198);
AMPERCHAS=lc640_read_int(0x10+100+200);
			




 
Kiload0=lc640_read_int(0x10+4);
Kiload1=lc640_read_int(0x10+6);
Kuload=lc640_read_int(0x10+20);













 

Ktext[0]=lc640_read_int(0x10+100+50);
Ktext[1]=lc640_read_int(0x10+100+52);
Ktext[2]=lc640_read_int(0x10+100+54);
	


UB0=lc640_read_int(0x10+100+6);
UB20=lc640_read_int(0x10+100+8);

TSIGN=lc640_read_int(0x10+100+82);
DU=lc640_read_int(0x10+100+84);
USIGN=lc640_read_int(0x10+100+14);
UMN=lc640_read_int(0x10+100+16);
ZV_ON=0;
IKB=lc640_read_int(0x10+100+20);

IMAX=lc640_read_int(0x10+100+24);
IMIN=lc640_read_int(0x10+100+26);
APV_ON=lc640_read_int(0x10+100+28);
IZMAX=lc640_read_int(0x10+100+30);
U0B=lc640_read_int(0x10+100+32);
TZAS=lc640_read_int(0x10+100+34);
NUMIST=lc640_read_int(0x10+100+36);

CURR_FADE_IN=lc640_read_int(0x10+100+164);
SK_START_LEV=lc640_read_int(0x10+100+168);
SK_START=lc640_read_int(0x10+100+166);
RELE_FUNC[0]=lc640_read_int(0x10+100+170);
RELE_FUNC[1]=lc640_read_int(0x10+100+172);

NUMSK=lc640_read_int(3000+88);
NUMDT=lc640_read_int(3000+90);
NUMAVT=lc640_read_int(3000+98);
NUMEXT=NUMSK+NUMDT;
AV_OFF_AVT=lc640_read_int(0x10+100+12);
MNEMO_ON=(enum_mnemo_on)lc640_read_int(0x10+100+72);
MNEMO_TIME=lc640_read_int(0x10+100+74);
U_AVT=lc640_read_int(0x10+100+80);
PAR=lc640_read_int(0x10+100+86);
TBATMAX=lc640_read_int(0x10+100+88);
TBATSIGN=lc640_read_int(0x10+100+90);
UBM_AV=lc640_read_int(3000+96);









BAT_IS_ON[0]=(enum_bat_is_on)lc640_read_int(0x10+400);
BAT_IS_ON[1]=(enum_bat_is_on)lc640_read_int(0x10+400+30);
NUMBAT=0;
if(BAT_IS_ON[0]==bisON)NUMBAT+=1;
if(BAT_IS_ON[1]==bisON)NUMBAT+=1;

BAT_DAY_OF_ON[0]=lc640_read_int(0x10+400+2);
BAT_MONTH_OF_ON[0]=lc640_read_int(0x10+400+4);
BAT_YEAR_OF_ON[0]=lc640_read_int(0x10+400+6);
BAT_C_REAL[0]=lc640_read_int(0x10+400+8);
BAT_C_NOM[0]=lc640_read_int(0x10+400+16);
BAT_RESURS[0]=lc640_read_int(0x10+400+10);

BAT_DAY_OF_ON[1]=lc640_read_int(0x10+400+32);
BAT_MONTH_OF_ON[1]=lc640_read_int(0x10+400+34);
BAT_YEAR_OF_ON[1]=lc640_read_int(0x10+400+36);
BAT_C_REAL[1]=lc640_read_int(0x10+400+38);
BAT_C_NOM[1]=lc640_read_int(0x10+400+48);
BAT_RESURS[1]=lc640_read_int(0x10+400+40);

CAP_ZAR_TIME=lc640_read_int(0x10+450);
CAP_PAUSE1_TIME=lc640_read_int(0x10+450+2);
CAP_RAZR_TIME=lc640_read_int(0x10+450+4);
CAP_PAUSE2_TIME=lc640_read_int(0x10+450+6);
CAP_MAX_VOLT=lc640_read_int(0x10+450+8);
CAP_WRK_CURR=lc640_read_int(0x10+450+10);


APV_ON1=(enum_apv_on)lc640_read_int(0x10+100+44);
APV_ON2=(enum_apv_on)lc640_read_int(0x10+100+46);
APV_ON2_TIME=lc640_read_int(0x10+100+48);
VZ_HR=lc640_read_int(0x10+100+76);
TBAT=lc640_read_int(0x10+100+78);

AUSW_MAIN=lc640_read_int(0x10+300);
	AUSW_MAIN_NUMBER=lc640_read_long(0x10+300+2);
	AUSW_DAY=lc640_read_int(0x10+300+10);
	AUSW_MONTH=lc640_read_int(0x10+300+12);
	AUSW_YEAR=lc640_read_int(0x10+300+14);
	AUSW_BPS1_NUMBER=lc640_read_long(0x10+300+16);
	AUSW_BPS2_NUMBER=lc640_read_long(0x10+300+18);
	AUSW_RS232=lc640_read_int(0x10+300+20);
	AUSW_PDH=lc640_read_int(0x10+300+22);
	AUSW_SDH=lc640_read_int(0x10+300+24);
	AUSW_ETH=lc640_read_int(0x10+300+26);
	AUSW_UKU=lc640_read_int(0x10+300+4);
	AUSW_UKU_SUB=lc640_read_int(0x10+300+6);
	AUSW_UKU_NUMBER=lc640_read_long(0x10+300+8);			


TMAX_EXT_EN[0]=lc640_read_int(3000);
TMAX_EXT[0]=lc640_read_int(3000+2);
TMIN_EXT_EN[0]=lc640_read_int(3000+4);
TMIN_EXT[0]=lc640_read_int(3000+6);	
T_EXT_REL_EN[0]=lc640_read_int(3000+8);
T_EXT_ZVUK_EN[0]=lc640_read_int(3000+10);
T_EXT_LCD_EN[0]=lc640_read_int(3000+12);
T_EXT_RS_EN[0]=lc640_read_int(3000+14);
SK_SIGN[0]=lc640_read_int(3000+48);
SK_REL_EN[0]=lc640_read_int(3000+50);
SK_ZVUK_EN[0]=lc640_read_int(3000+52);
SK_LCD_EN[0]=lc640_read_int(3000+54);	
SK_RS_EN[0]=lc640_read_int(3000+56);
SK_SIGN[1]=lc640_read_int(3000+58);
SK_REL_EN[1]=lc640_read_int(3000+60);
SK_ZVUK_EN[1]=lc640_read_int(3000+62);
SK_LCD_EN[1]=lc640_read_int(3000+64);	
SK_RS_EN[1]=lc640_read_int(3000+66);
SK_SIGN[2]=lc640_read_int(3000+68);
SK_REL_EN[2]=lc640_read_int(3000+70);
SK_ZVUK_EN[2]=lc640_read_int(3000+72);
SK_LCD_EN[2]=lc640_read_int(3000+74);	
SK_RS_EN[2]=lc640_read_int(3000+76);
SK_SIGN[3]=lc640_read_int(3000+78);
SK_REL_EN[3]=lc640_read_int(3000+80);
SK_ZVUK_EN[3]=lc640_read_int(3000+82);
SK_LCD_EN[3]=lc640_read_int(3000+84);	


AVZ=(enum_avz)(lc640_read_int(0x10+100+70));


MIN_AVZ=lc640_read_int(0x10+100+60);
SEC_AVZ=lc640_read_int(0x10+100+62);
DATE_AVZ=lc640_read_int(0x10+100+64);
MONTH_AVZ=lc640_read_int(0x10+100+66);
if(!((MONTH_AVZ>0)&&(MONTH_AVZ<13)))MONTH_AVZ=0;
YEAR_AVZ=lc640_read_int(0x10+100+68);

pos_vent=lc640_read_int(3000+92);
POWER_CNT_ADRESS=lc640_read_int(3000+94);

ETH_IS_ON=lc640_read_int(2000);
ETH_DHCP_ON=lc640_read_int(2000+2);
ETH_IP_1=lc640_read_int(2000+4);
ETH_IP_2=lc640_read_int(2000+6);
ETH_IP_3=lc640_read_int(2000+8);
ETH_IP_4=lc640_read_int(2000+10);
ETH_MASK_1=lc640_read_int(2000+12);
ETH_MASK_2=lc640_read_int(2000+14);
ETH_MASK_3=lc640_read_int(2000+16);
ETH_MASK_4=lc640_read_int(2000+18);
ETH_GW_1=lc640_read_int(2000+64);
ETH_GW_2=lc640_read_int(2000+66);
ETH_GW_3=lc640_read_int(2000+68);
ETH_GW_4=lc640_read_int(2000+70);
ETH_TRAP1_IP_1=lc640_read_int(2000+20);
ETH_TRAP1_IP_2=lc640_read_int(2000+22);
ETH_TRAP1_IP_3=lc640_read_int(2000+24);
ETH_TRAP1_IP_4=lc640_read_int(2000+26);
ETH_TRAP2_IP_1=lc640_read_int(2000+28);
ETH_TRAP2_IP_2=lc640_read_int(2000+30);
ETH_TRAP2_IP_3=lc640_read_int(2000+32);
ETH_TRAP2_IP_4=lc640_read_int(2000+34);
ETH_TRAP3_IP_1=lc640_read_int(2000+36);
ETH_TRAP3_IP_2=lc640_read_int(2000+38);
ETH_TRAP3_IP_3=lc640_read_int(2000+40);
ETH_TRAP3_IP_4=lc640_read_int(2000+42);
ETH_TRAP4_IP_1=lc640_read_int(2000+44);
ETH_TRAP4_IP_2=lc640_read_int(2000+46);
ETH_TRAP4_IP_3=lc640_read_int(2000+48);
ETH_TRAP4_IP_4=lc640_read_int(2000+50);
ETH_TRAP5_IP_1=lc640_read_int(2000+52);
ETH_TRAP5_IP_2=lc640_read_int(2000+54);
ETH_TRAP5_IP_3=lc640_read_int(2000+56);
ETH_TRAP5_IP_4=lc640_read_int(2000+58);
ETH_SNMP_PORT_READ=lc640_read_int(2000+60);
ETH_SNMP_PORT_WRITE=lc640_read_int(2000+62);




 
for(i=0;i<10;i++)
	{
	snmp_Community[i]=lc640_read(2000+270+(i*2));
	}


if(I_ug_block_cnt)
	{
	I_ug_block_cnt--;
	if(!I_ug_block_cnt)
		{
		lc640_write_int(0x10+16,I_ug);
		}
	}

if(U_up_block_cnt)
	{
	U_up_block_cnt--;
	if(!U_up_block_cnt)
		{
		lc640_write_int(0x10+18,U_up);
		}
	}

if(T_PROC_GS_block_cnt)
	{
	T_PROC_GS_block_cnt--;
	if(!T_PROC_GS_block_cnt)
		{
		lc640_write_long(0x10+100+100,T_PROC_GS);
		}
	}

if(T_PROC_PS_block_cnt)
	{
	T_PROC_PS_block_cnt--;
	if(!T_PROC_PS_block_cnt)
		{
		lc640_write_long(0x10+100+104,T_PROC_PS);
		}
	}
}


