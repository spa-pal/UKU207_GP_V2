#line 1 "main.c"
#line 1 "lcd_AGM1232_uku207_3.h"










#line 19 "lcd_AGM1232_uku207_3.h"




#line 32 "lcd_AGM1232_uku207_3.h"


void lcd1_chk(void);
void lcd1_wr(char in);
void lcd2_chk(void);
void lcd2_wr(char in);
char data1_wr(char in);
void data2_wr(char in);
void lcd_set_page(char in);
void lcd_set_col(char in);
void lcd_set_raw(char in);
void lcd_init(void);
void status(void);
void delay(void);
void ltstrobe(char in);
void lcd_init_(void);
void lcd_clear(void);
void lcd_on(void);
void lcd_off(void);
void lcd_out(char* adr);

#line 2 "main.c"
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






 
  

 
#line 3 "main.c"
#line 1 "type.h"










 
#line 1 "C:\\Keil\\ARM\\RV31\\INC\\stdint.h"
 
 





 









#line 25 "C:\\Keil\\ARM\\RV31\\INC\\stdint.h"







 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     
typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;

     
typedef   signed       __int64 intmax_t;
typedef unsigned       __int64 uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     


     


     


     

     


     


     


     

     



     



     


     
    
 



#line 196 "C:\\Keil\\ARM\\RV31\\INC\\stdint.h"

     







     










     











#line 260 "C:\\Keil\\ARM\\RV31\\INC\\stdint.h"



 


#line 13 "type.h"

















typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;
typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;

#line 4 "main.c"
#line 1 "main.h"






#line 8 "main.h"












#line 33 "main.h"






#line 45 "main.h"





#line 60 "main.h"

#line 68 "main.h"

#line 79 "main.h"









#line 94 "main.h"







#line 119 "main.h"





#line 133 "main.h"







 





















































#line 222 "main.h"







		










#line 258 "main.h"

#line 274 "main.h"





















#line 308 "main.h"

#line 322 "main.h"










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
extern signed short EE_WRITE_CNT;






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
	signed short _xu_;
     } BPS_STAT; 
extern BPS_STAT bps[32];

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
extern signed short I_ug_ram;					
extern signed short U_up_ram;					
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

extern U8 socket_tcp;



extern signed long milliAmperSecunda;



extern signed short curr_off_stop_cnt;
extern signed short curr_off_start_cnt;
extern signed short curr_off_temp;



extern short avg_main_cnt;
extern signed int i_avg_max,i_avg_min,i_avg_summ,i_avg; 
extern signed int avg;
extern char bAVG;
extern char avg_cnt;  
extern char avg_num;
extern char num_of_dumm_src; 
extern char num_of_max_src;
extern char bAVG_CNT;

extern short pvlk;

extern char eepromRamSwitch; 	
extern short ramModbusCnt;		



 
#line 5 "main.c"
#line 1 "simbol.h"

const char caracter[1536]={
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x7F,
0x3E,0x1C,0x08,0x00,0x00,0x08,0x0C,0x0E,
0x0C,0x08,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x5F,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x14,0x3E,0x14,0x3E,0x14,
0x00,0x24,0x2A,0x7F,0x2A,0x12,0x00,0x23,
0x13,0x08,0x64,0x62,0x00,0x36,0x49,0x55,
0x22,0x50,0x00,0x00,0x00,0x00,0x06,0x00,
0x00,0x00,0x3E,0x41,0x00,0x00,0x00,0x00,
0x00,0x41,0x3E,0x00,0x00,0x14,0x08,0x3E,
0x08,0x14,0x00,0x08,0x08,0x3E,0x08,0x08,
0x00,0x00,0x50,0x30,0x00,0x00,0x00,0x08,
0x08,0x08,0x08,0x08,0x00,0x00,0x00,0x60,
0x60,0x00,0x00,0x40,0x20,0x10,0x08,0x04,
0x00,0x3E,0x51,0x49,0x45,0x3E,0x00,0x00,
0x42,0x7F,0x40,0x00,0x00,0x42,0x61,0x51,
0x49,0x46,0x00,0x21,0x41,0x45,0x4B,0x31,
0x00,0x18,0x14,0x12,0x7F,0x10,0x00,0x27,
0x45,0x45,0x45,0x39,0x00,0x3C,0x4A,0x49,
0x49,0x30,0x00,0x01,0x71,0x09,0x05,0x03,
0x00,0x36,0x49,0x49,0x49,0x36,0x00,0x06,
0x49,0x49,0x29,0x1E,0x00,0x00,0x36,0x36,
0x00,0x00,0x00,0x00,0x56,0x36,0x00,0x00,
0x00,0x00,0x08,0x14,0x22,0x00,0x00,0x14,
0x14,0x14,0x14,0x14,0x00,0x00,0x22,0x14,
0x08,0x00,0x00,0x02,0x01,0x51,0x09,0x06,
0x00,0x32,0x49,0x79,0x41,0x3E,0x00,0x7E,
0x11,0x11,0x11,0x7E,0x00,0x7F,0x49,0x49,
0x49,0x36,0x00,0x3E,0x41,0x41,0x41,0x22,
0x00,0x7F,0x41,0x41,0x22,0x1C,0x00,0x7F,
0x49,0x49,0x49,0x41,0x00,0x7F,0x09,0x09,
0x09,0x01,0x00,0x3E,0x41,0x41,0x51,0x72,
0x00,0x7F,0x08,0x08,0x08,0x7F,0x00,0x00,
0x41,0x7F,0x41,0x00,0x00,0x20,0x40,0x41,
0x3F,0x01,0x00,0x7F,0x08,0x14,0x22,0x41,
0x00,0x7F,0x40,0x40,0x40,0x40,0x00,0x7F,
0x02,0x0C,0x02,0x7F,0x00,0x7F,0x04,0x08,
0x10,0x7F,0x00,0x3E,0x41,0x41,0x41,0x3E,
0x00,0x7F,0x09,0x09,0x09,0x06,0x00,0x3E,
0x41,0x51,0x21,0x5E,0x00,0x7F,0x09,0x19,
0x29,0x46,0x00,0x46,0x49,0x49,0x49,0x31,
0x00,0x01,0x01,0x7F,0x01,0x01,0x00,0x3F,
0x40,0x40,0x40,0x3F,0x00,0x1F,0x20,0x40,
0x20,0x1F,0x00,0x3F,0x40,0x38,0x40,0x3F,
0x00,0x63,0x14,0x08,0x14,0x63,0x00,0x07,
0x08,0x70,0x08,0x07,0x00,0x61,0x51,0x49,
0x45,0x43,0x00,0x00,0x7F,0x41,0x00,0x00,
0x00,0x04,0x08,0x10,0x20,0x40,0x00,0x00,
0x00,0x41,0x7F,0x00,0x00,0x04,0x02,0x01,
0x02,0x04,0x00,0x40,0x40,0x40,0x40,0x40,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,
0x54,0x54,0x54,0x78,0x00,0x7F,0x48,0x44,
0x44,0x38,0x00,0x38,0x44,0x44,0x44,0x20,
0x00,0x30,0x48,0x48,0x50,0x7E,0x00,0x38,
0x54,0x54,0x54,0x18,0x00,0x08,0x7E,0x09,
0x01,0x02,0x00,0x08,0x54,0x54,0x54,0x3C,
0x00,0x7F,0x10,0x08,0x08,0x70,0x00,0x00,
0x44,0x7D,0x40,0x00,0x00,0x20,0x40,0x44,
0x3D,0x00,0x00,0x7E,0x10,0x28,0x44,0x00,
0x00,0x00,0x41,0x7F,0x40,0x00,0x00,0x7C,
0x04,0x18,0x04,0x78,0x00,0x7C,0x08,0x04,
0x04,0x78,0x00,0x38,0x44,0x44,0x44,0x38,
0x00,0x7C,0x14,0x14,0x14,0x08,0x00,0x08,
0x14,0x14,0x14,0x7C,0x00,0x7C,0x08,0x04,
0x04,0x08,0x00,0x48,0x54,0x54,0x54,0x20,
0x00,0x04,0x3F,0x44,0x40,0x20,0x00,0x3C,
0x40,0x40,0x20,0x7C,0x00,0x1C,0x20,0x40,
0x20,0x1C,0x00,0x3C,0x40,0x30,0x40,0x3C,
0x00,0x44,0x28,0x10,0x28,0x44,0x00,0x0C,
0x50,0x50,0x50,0x3C,0x00,0x44,0x64,0x54,
0x4C,0x44,0x00,0x00,0x08,0x36,0x41,0x00,
0x00,0x00,0x00,0x7F,0x00,0x00,0x00,0x00,
0x41,0x36,0x08,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x04,0x06,0x07,
0x06,0x04,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x08,0x1C,0x3E,
0x7F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x7F,0x3E,0x1C,0x08,0x00,0x08,0x18,
0x38,0x18,0x08,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x1C,0x3E,0x3E,0x3E,0x1C,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x7C,0x55,0x54,0x45,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x06,0x09,0x09,0x06,0x00,0x00,
0x24,0x2E,0x24,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x38,0x55,0x54,0x55,0x18,0x00,0x7C,
0x10,0x20,0x7B,0x0B,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x20,0x30,0x38,0x30,0x20,0x00,
0x00,0x7E,0x11,0x11,0x11,0x7E,0x00,0x7F,
0x49,0x49,0x49,0x31,0x00,0x7F,0x49,0x49,
0x49,0x36,0x00,0x7F,0x01,0x01,0x01,0x03,
0x00,0x60,0x3E,0x21,0x21,0x7F,0x00,0x7F,
0x49,0x49,0x49,0x41,0x00,0x77,0x08,0x7F,
0x08,0x77,0x00,0x41,0x49,0x49,0x49,0x36,
0x00,0x7F,0x20,0x10,0x08,0x7F,0x00,0x7F,
0x20,0x11,0x08,0x7F,0x00,0x7F,0x08,0x14,
0x22,0x41,0x00,0x40,0x7E,0x01,0x01,0x7F,
0x00,0x7F,0x02,0x0C,0x02,0x7F,0x00,0x7F,
0x08,0x08,0x08,0x7F,0x00,0x3E,0x41,0x41,
0x41,0x3E,0x00,0x7F,0x01,0x01,0x01,0x7F,
0x00,0x7F,0x09,0x09,0x09,0x06,0x00,0x3E,
0x41,0x41,0x41,0x22,0x00,0x01,0x01,0x7F,
0x01,0x01,0x00,0x47,0x28,0x10,0x08,0x07,
0x00,0x1C,0x22,0x7F,0x22,0x1C,0x00,0x63,
0x14,0x08,0x14,0x63,0x00,0x7F,0x40,0x40,
0x40,0xFF,0x00,0x07,0x08,0x08,0x08,0x7F,
0x00,0x7F,0x40,0x7F,0x40,0x7F,0x00,0x7F,
0x40,0x7F,0x40,0xFF,0x00,0x01,0x7F,0x48,
0x48,0x70,0x00,0x7F,0x44,0x38,0x00,0x7F,
0x00,0x7F,0x48,0x48,0x48,0x30,0x00,0x22,
0x41,0x49,0x49,0x3E,0x00,0x7F,0x08,0x3E,
0x41,0x3E,0x00,0x46,0x29,0x19,0x09,0x7F,
0x00,0x20,0x54,0x54,0x54,0x78,0x00,0x3C,
0x4A,0x4A,0x49,0x31,0x00,0x7C,0x54,0x54,
0x28,0x00,0x00,0x7C,0x04,0x04,0x04,0x0C,
0x00,0x60,0x38,0x24,0x24,0x7C,0x00,0x38,
0x54,0x54,0x54,0x18,0x00,0x6C,0x10,0x7C,
0x10,0x6C,0x00,0x44,0x44,0x54,0x54,0x28,
0x00,0x7C,0x20,0x10,0x08,0x7C,0x00,0x7C,
0x20,0x12,0x08,0x7C,0x00,0x7C,0x10,0x28,
0x44,0x00,0x00,0x40,0x38,0x04,0x04,0x7C,
0x00,0x7C,0x08,0x10,0x08,0x7C,0x00,0x7C,
0x10,0x10,0x10,0x7C,0x00,0x38,0x44,0x44,
0x44,0x38,0x00,0x7C,0x04,0x04,0x04,0x7C,
0x00,0x7C,0x14,0x14,0x14,0x08,0x00,0x38,
0x44,0x44,0x44,0x00,0x00,0x04,0x04,0x7C,
0x04,0x04,0x00,0x0C,0x50,0x50,0x50,0x3C,
0x00,0x18,0x24,0x7E,0x24,0x18,0x00,0x44,
0x28,0x10,0x28,0x44,0x00,0x7C,0x40,0x40,
0x40,0xFC,0x00,0x00,0x1C,0x10,0x10,0x7C,
0x00,0x7C,0x40,0x7C,0x40,0x7C,0x00,0x7C,
0x40,0x7C,0x40,0xFC,0x00,0x04,0x7C,0x50,
0x50,0x20,0x00,0x7C,0x50,0x20,0x00,0x7C,
0x00,0x7C,0x50,0x50,0x50,0x20,0x00,0x28,
0x44,0x54,0x54,0x38,0x00,0x7C,0x10,0x38,
0x44,0x38,0x00,0x08,0x54,0x34,0x14,0x7C};
#line 6 "main.c"
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
#line 7 "main.c"
#line 1 "Timer.h"









 



	


extern void delayMs(uint8_t timer_num, uint32_t delayInMs);
extern uint32_t init_timer( uint8_t timer_num, uint32_t timerInterval );
extern void enable_timer( uint8_t timer_num );
extern void disable_timer( uint8_t timer_num );
extern void reset_timer( uint8_t timer_num );
extern void TIMER0_IRQHandler (void);
extern void TIMER1_IRQHandler (void);




 
#line 8 "main.c"
#line 1 "gran.h"

void gran_ring_char(signed char *adr, signed char min, signed char max) ;
void gran_char(signed char *adr, signed char min, signed char max);
void gran(signed short *adr, signed short min, signed short max);
void gran_ring(signed short *adr, signed short min, signed short max);
void gran_long(signed long *adr, signed long min, signed long max); 
#line 9 "main.c"
#line 1 "uart0.h"




















#line 29 "uart0.h"



extern char bRXIN0;
extern char UIB0[100];
extern char flag0;
extern char rx_buffer0[1024];
extern char tx_buffer0[1024];
extern unsigned short rx_wr_index0,rx_rd_index0,rx_counter0;
extern unsigned short tx_wr_index0,tx_rd_index0,tx_counter0;
extern char rx_buffer_overflow0;
extern char plazma_uart0;
extern char memo_out[50];
extern char data_rs[50];
extern char data_rs0[50];
extern const char Table87[];
extern const char Table95[]; 

char crc_87(char* ptr,char num);
char crc_95(char* ptr,char num);
void putchar0(char c);
void uart_out0 (char num,char data0,char data1,char data2,char data3,char data4,char data5);
void uart_out_adr0 (char *ptr, char len);
void uart0_init(void);
char getchar0(void);
__irq void uart0_interrupt(void);
void uart_in_an0(void);
signed short index_offset0 (signed short index,signed short offset);
char control_check0(signed short index);
void uart_in0(void);
void uart_out_adr_block (unsigned long adress,char *ptr, char len);
uint32_t UARTInit( uint32_t PortNum, uint32_t baudrate );


#line 10 "main.c"
#line 1 "uart1.h"









extern char bRXIN1;
extern char UIB1[20];
extern char flag1;
extern char rx_buffer1[100];
extern char tx_buffer1[300];
extern unsigned short rx_wr_index1,rx_rd_index1,rx_counter1;
extern unsigned short tx_wr_index1,tx_rd_index1,tx_counter1;
extern char rx_buffer_overflow1;
extern char plazma_uart1;
extern char uart1_mess[10];
extern char data_rs1[40];
typedef enum {ursMEGA=0x55,ursXPORT=0xaa}enum_usart1_router_stat;
extern enum_usart1_router_stat usart1_router_stat;
extern char usart1_router_wrk;
extern char memo_out1[100];

extern char UIB10[30];
extern char usart1_router_cnt;
extern char plazma_suz[5];

void putchar1(char c);
void uart_out1 (char num,char data0,char data1,char data2,char data3,char data4,char data5);
void uart_out_adr1 (char *ptr, unsigned char len);
void uart1_init(void);
char getchar1(void);
__irq void uart1_interrupt(void);
void uart_in_an1(void);
char index_offset1 (signed char index,signed char offset);
char control_check1(char index);
void uart_in1(void);

#line 11 "main.c"
#line 1 "cmd.h"


#line 12 "main.c"
#line 1 "ret.h"




extern char retind,retsub,retindsec;
extern int retcnt,retcntsec;
extern unsigned char f0,fc0,f1,fc1;
extern short ret_duty;

void ret_ind(char r_i,char r_s,int r_c);
void ret_ind_hndl(void);
void ret_ind_sec(char r_i,int r_c);
void ret_ind_sec_hndl(void);
void ret(short duty);
void ret_hndl(void);








 

     
#line 13 "main.c"
#line 1 "eeprom_map.h"






#line 39 "eeprom_map.h"

#line 134 "eeprom_map.h"





#line 153 "eeprom_map.h"



#line 165 "eeprom_map.h"


#line 176 "eeprom_map.h"


#line 185 "eeprom_map.h"








#line 231 "eeprom_map.h"








#line 14 "main.c"
#line 1 "common_func.h"




signed short abs(signed short in);
void clr_scrn(void);
char find(char xy);
void bin2bcd_int(unsigned int in);
void bcd2lcd_zero(char sig);
void int2lcd_m(signed short in,char xy,char des);
void int2lcd_mm(signed short in,char xy,char des);
void int2lcd_mmm(signed short in,char xy,char des);
void long2lcd_mmm(signed long in,char xy,char des);
void long2lcdyx_mmm(signed long in,char y,char x,char des);
void int2lcdyx(unsigned short in,char y,char x,char des);
void int2lcd(unsigned short in,char xy,char des);
void long2lcdhyx(unsigned long in,char y,char x);
void char2lcdh(char in,char yx);
void char2lcdhyx(char in,char y,char x);
void int2lcdhyx(unsigned short in,char y,char x);
void char2lcdbyx(char in,char y,char x);
void pointer_set(char num_of_first_row);
void tree_down(signed char offset_ind,signed char offset_sub_ind);
void tree_up(char tind, char tsub_ind, char tindex_set, char tsub_ind1);
void bgnd_par(char const *ptr0,char const *ptr1,char const *ptr2,char const *ptr3);
void sub_bgnd(char const *adr,char xy,signed char offset);
void show_mess(char* p1, char* p2, char* p3, char* p4,int m_sec);
void event2ind(char num, char simbol);
char ptr_carry(signed int in,unsigned char modul,signed int carry);
void event_data2ind(char num, char simbol);
void ip2lcd(	short in1,
			short in2,
			short in3,
			short in4,
			char xy,
			char flash_pos);
void community2lcd(char* in,
			char xy,
			char flash_pos,
			char flash_on);

#line 15 "main.c"
#line 1 "control.h"







extern char num_of_wrks_bps;
extern char bps_all_off_cnt,bps_mask_off_cnt,bps_mask_on_off_cnt;
extern char bps_hndl_2sec_cnt;
extern unsigned short bps_on_mask,bps_off_mask;
extern char num_necc_up,num_necc_down;
extern unsigned char sh_cnt0,b1Hz_sh,sh_cnt1;


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
extern char bU_VALID,bU_VALID_VALID;


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
void ramModbusCnt_hndl(void);
void pause_CAP(void);
void start_CAP(void); 


#line 16 "main.c"
#line 1 "mess.h"










		





void mess_hndl(void);
void mess_send(char _mess, short par0, short par1, char _time);
char mess_find(char _mess);
char mess_find_unvol(char _mess);

#line 17 "main.c"
#line 1 "full_can.h"


  








#line 19 "full_can.h"



  
















extern char ptr_can1_tx_wr,ptr_can1_tx_rd;
extern long can1_info[8];
extern long can1_id[8];
extern long can1_data[8];
extern long can1_datb[8];
																							 
extern char ptr_can2_tx_wr,ptr_can2_tx_rd;

extern long can2_info[8];
extern long can2_id[8];
extern long can2_data[8];
extern long can2_datb[8];

extern unsigned short rotor_can[6];



extern char bR;
extern char RXBUFF[40],TXBUFF[40];
extern char bIN,bIN2;
extern char bd_dumm[25];
extern char bd[25];
extern char TX_len;

extern char RXBUFF2[40],TXBUFF2[40];
extern char can_tx_cnt;
extern char can_tx_cnt2;


extern char rotor_rotor_rotor[2];
extern char can_tx_cnt;

extern const char Table87[];
extern const char Table95[];

extern char can_debug_plazma[2][10];
extern char bOUT_FREE;
extern char can_rotor[10];
extern char plazma_can;
extern char plazma_can1,plazma_can2,plazma_can3,plazma_can4;



typedef struct
{
  unsigned int Dat1; 
                     
                     
                     
  unsigned int DatA; 
  unsigned int DatB; 
} FULLCAN_MSG; 
extern short volatile gCANFilter;
extern FULLCAN_MSG volatile gFullCANList[2];
extern short can_reset_cnt;



char CRC1_in(void);
char CRC2_in(void);
char CRC1_out(void);
char CRC2_out(void);
void can1_out_adr(char* ptr,char num);
__irq void can_isr_err (void);
void can1_out(char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7);
void can_adr_hndl(void);
void can_in_an(void);
void can_in_an2(void);
__irq void can_isr_rx (void); 
__irq void can_isr_tx (void); 
short can1_init ( unsigned int can_btr);
short can2_init ( unsigned int can_btr);
short FullCAN_SetFilter (
  unsigned short can_port, 
  unsigned int CANID 
  );
void can2_out(char dat0,char dat1,char dat2,char dat3,char dat4,char dat5,char dat6,char dat7);

void can_in_an1(void);

extern char bCAN1_INIT;

void CAN_IRQHandler(void);
void CAN_ISR_Rx1( void );

extern char can_debug_plazma[2][10];

#line 18 "main.c"
#line 1 "watchdog.h"

void watchdog_init(unsigned long f,unsigned long time_out);
void watchdog_reset(void);





#line 19 "main.c"
#line 1 "ad7705.h"

extern unsigned short ad7705_res1,ad7705_res2;
extern unsigned short ad7705_buff[2][16],ad7705_buff_[2];
extern unsigned short ad7705_res;
extern char b7705ch,ad7705_wrk_cnt;
extern unsigned short cnt_ad7705_vis,cnt_ad7705_vis_wrk;
extern signed short ad7705_plazma;


void spi1_ad7705_config(void);
void ad7705_reset(void);
void ad7705_write(char in);
void ad7705_read(char num);
void ad7705_drv(void);



#line 20 "main.c"
#line 1 "beep.h"

extern unsigned long beep_stat_temp,beep_stat;
extern char beep_stat_cnt;
extern char beep_cnt;
extern char bU_BAT2REL_AV_BAT;

void beep_drv(void);
void beep_init(long zvuk,char fl);
void beep_hndl(void);
#line 21 "main.c"
#line 1 "avar_hndl.h"




extern unsigned avar_stat;	 	
extern unsigned avar_ind_stat; 	
extern unsigned avar_stat_old;
extern unsigned avar_stat_new,avar_stat_offed;









void avar_hndl(void);
void avar_unet_hndl(char in);
void reload_hndl(void);
void avar_bps_hndl(char bps, char v, char in);
void avar_bat_hndl(char bat, char in);
void avar_bat_as_hndl(char b, char in);
void ke_mem_hndl(char b,unsigned short in);
void vz_mem_hndl(unsigned short in);
void wrk_mem_hndl(char b);



#line 22 "main.c"
#line 1 "memo.h"

void memo_read (void);






#line 23 "main.c"
#line 1 "simbols.h"


extern const char sAVNET[150];
extern const char sAVNET1[150];
extern const char sBPS1[30];
extern const char sBPS2[30];
extern const char sAVT[30];
extern const char sAVU[30];
extern const char caracter[1536];
#line 24 "main.c"
#line 1 "graphic.h"


void draw(signed short x_b,signed short y_b,signed short x_o,signed short y_o,char inverse);
void draw_rectangle(signed short x_b,signed short y_b,signed short x_o,signed short y_o,char solid,char inverse);	   
void draw_ptr(char x_b,char y_b,char ptr,char vol);
void plot(signed short x_b,signed short y_b,unsigned long data,signed short len,char inverse);
void graphic_print(signed short x_b,signed short y_b,signed short x_l,signed short y_l,signed short x_d,signed short y_d,const char* adress,char inverse);
void graphic_print_text(signed short x_b,signed short y_b,const char* bgnd,signed short num,signed short data,signed short des,signed short pos,char inverse);
void graphic_print_text_text(signed short x_b,signed short y_b,const char* bgnd,signed short num,signed short data,signed short des,signed short pos,char inverse);
#line 25 "main.c"

#line 1 "C:\\Keil\\ARM\\RV31\\INC\\net_config.h"









 




#line 16 "C:\\Keil\\ARM\\RV31\\INC\\net_config.h"

 



                                   





 




 




 
#line 50 "C:\\Keil\\ARM\\RV31\\INC\\net_config.h"

 





 
#line 73 "C:\\Keil\\ARM\\RV31\\INC\\net_config.h"

 





typedef struct os_frame {          
  U16 length;                      
  U16 index;                       
  U8  data[1];                     
} OS_FRAME;


typedef struct arp_info {          
  U8  State;                       
  U8  Type;                        
  U8  Retries;                     
  U8  Tout;                        
  U8  HwAdr[6];           
  U8  IpAdr[4];            
} ARP_INFO;


typedef struct igmp_info {         
  U8  State;                       
  U8  Tout;                        
  U8  GrpIpAdr[4];         
} IGMP_INFO;


typedef struct udp_info {          
  U8  State;                       
  U8  McastTtl;                    
  U16 LocPort;                     
  U8  Tos;                         
  U8  Opt;                         
                                   
  U16 (*cb_func)(U8 socket, U8 *rem_ip, U16 port, U8 *buf, U16 len);
} UDP_INFO;


typedef struct tcp_info {          
  U8  State;                       
  U8  Type;                        
  U8  Flags;                       
  U8  Tos;                         
  U8  RemIpAdr[4];         
  U16 RemPort;                     
  U16 LocPort;                     
  U16 MaxSegSize;                  
  U16 WinSize;                     
  U32 SendSeq;                     
  U32 SendSeqNext;                 
  U32 RecSeqNext;                  
  U16 Tout;                        
  U16 AliveTimer;                  
  U16 RetryTimer;                  
  U8  TxFlags;                     
  U8  Retries;                     
  OS_FRAME *ReTransFrm;            
                                   
  U16 (*cb_func)(U8 socket, U8 event, U8 *p1, U16 p2);
} TCP_INFO;


typedef struct http_info {         
  U8  State;                       
  U8  Socket;                      
  U16 Flags;                       
  U8  FType;                       
  U8  PostSt;                      
  U16 DelimSz;                     
  U32 CGIvar;                      
  U32 DLen;                        
  U32 Count;                       
  U16 BCnt;                        
  U8  Lang[6];                     
  U32 LMDate;                      
  U8 *Script;                      
  U8 *pDelim;                      
  void *sFile;                     
  void *dFile;                     
} HTTP_INFO;


typedef struct http_file {         
  const U32 Id;                    
  const U8 *Start;                 
} HTTP_FILE;


typedef struct tnet_info {         
  U8  State;                       
  U8  Socket;                      
  U8  Flags;                       
  U8  BCnt;                        
  U16 Tout;                        
  U8  Widx;                        
  U8  Ridx;                        
  U32 SVar;                        
  U8  LBuf[96];           
  U8  Fifo[128];           
  U8  hNext;                       
  U8  hCurr;                       
  U8  Hist[128];           
} TNET_INFO;


typedef struct tftp_info {         
  U8  State;                       
  U8  Retries;                     
  U8  Flags;                       
  U16 Timer;                       
  U8  RemIpAdr[4];         
  U16 RemPort;                     
  U16 BlockNr;                     
  void *File;                      
  U32 FPos;                        
} TFTP_INFO;


typedef struct ftp_info {          
  U8  State;                       
  U8  Socket;                      
  U8  Flags;                       
  U8  Resp;                        
  U8  RemIpAdr[4];         
  U16 DPort;                       
  U8  DSocket;                     
  U8  PathLen;                     
  U8 *Path;                        
  U8 *Name;                        
  void *File;                      
} FTP_INFO;


typedef struct dns_cache {         
  U32 HostId;                      
  U32 Ttl;                         
  U8  IpAdr[4];            
} DNS_CACHE;


typedef struct localm {            
  U8 IpAdr[4];             
  U8 DefGW[4];             
  U8 NetMask[4];           
  U8 PriDNS[4];            
  U8 SecDNS[4];            
} LOCALM;


typedef struct remotem {           
  U8 IpAdr[4];             
  U8 HwAdr[6];            
} REMOTEM;


typedef struct mib_entry {         
  U8   Type;                       
  U8   OidLen;                     
  U8   Oid[13];             
  U8   ValSz;                      
  void *Val;                       
  void (*cb_func)(int mode);       
} MIB_ENTRY;


typedef enum {                     
  ERR_MEM_ALLOC,
  ERR_MEM_FREE,
  ERR_MEM_CORRUPT,
  ERR_UDP_ALLOC,
  ERR_TCP_ALLOC,
  ERR_TCP_STATE
} ERROR_CODE;




 

 
extern void init_system (void);
extern void run_system (void);
extern void process_hl_igmp (OS_FRAME *frame);
extern void process_hl_udp (OS_FRAME *frame);
extern void process_hl_tcp (OS_FRAME *frame);
extern BOOL dispatch_frame (OS_FRAME *frame, U8 netif);
extern BOOL eth_chk_adr (OS_FRAME *frame);
extern U8  *eth_get_adr (U8 *ipadr);
__weak void arp_notify (void);
extern void sys_error (ERROR_CODE code);

 
extern OS_FRAME *alloc_mem (U32 byte_size);
extern void free_mem (OS_FRAME *mem_ptr);

 
extern void init_eth_link (void);
extern void run_eth_link (void);
extern void put_in_queue (OS_FRAME *frame);
extern BOOL eth_send_frame (OS_FRAME *frame);

 
extern void init_ppp_link (void);
extern void run_ppp_link (void);
extern BOOL ppp_send_frame (OS_FRAME *frame, U16 prot);

 
extern void init_slip_link (void);
extern void run_slip_link (void);
extern BOOL slip_send_frame (OS_FRAME *frame);

 
extern int  mem_copy (void *dp, void *sp, int len);
extern void mem_rcopy (void *dp, void *sp, int len);
extern BOOL mem_comp (void *sp1, void *sp2, int len);
extern void mem_set (void *dp, U8 val, int len);
extern BOOL mem_test (void *sp, U8 val, int len);
extern BOOL str_scomp (U8 *sp, U8 const *cp);
extern int  str_copy (U8 *dp, U8 *sp);
extern void str_up_case (U8 *dp, U8 *sp);
extern U16  SwapB (U16 w16);
extern U16  get_u16 (U8 *p16);
extern U32  get_u32 (U8 *p32);
extern void set_u32 (U8 *p32, U32 val);

 
extern void arp_send_req (U32 entry);

 
extern void init_igmp (void);
extern void run_igmp_host (void);
extern void process_igmp (OS_FRAME *frame);

 
extern void init_udp (void);
extern void process_udp (OS_FRAME *frame);

 
extern void init_tcp (void);
extern void tcp_poll_sockets (void);
extern void process_tcp (OS_FRAME *frame_r);

 
extern void init_http (void);
extern void run_http_server (void);
extern void *http_fopen (U8 *name);
extern void http_fclose (void *file);
extern U16  http_fread (void *file, U8 *buf, U16 len);
extern BOOL http_fgets (void *file, U8 *buf, U16 size);
extern U32  http_finfo (U8 *name);
extern void cgi_process_var (U8 *qstr);
extern void cgi_process_data (U8 code, U8 *dat, U16 len);
extern U16  cgi_func (U8 *env, U8 *buf, U16 buflen, U32 *pcgi);
extern U8  *cgx_content_type (void);
extern BOOL http_accept_host (U8 *rem_ip, U16 rem_port);
extern U8  *http_get_var (U8 *env, void *ansi, U16 maxlen);
extern U8  *http_get_lang (void);
extern void http_get_info (REMOTEM *info);
extern U8   http_get_session (void);
extern U8  *http_get_content_type (void);
extern U32  http_date (RL_TIME *time);

 
extern void init_tnet (void);
extern void run_tnet_server (void);
extern U16  tnet_cbfunc (U8 code, U8 *buf, U16 buflen);
extern U16  tnet_process_cmd (U8 *cmd, U8 *buf, U16 buflen, U32 *pvar);
extern BOOL tnet_ccmp (U8 *buf, U8 *cmd);
extern void tnet_set_delay (U16 cnt);
extern void tnet_get_info (REMOTEM *info);
extern U8   tnet_get_session (void);
extern BOOL tnet_msg_poll (U8 session);

 
extern void init_tftp (void);
extern void run_tftp_server (void);
extern void *tftp_fopen (U8 *fname, U8 *mode);
extern void tftp_fclose (void *file);
extern U16  tftp_fread (void *file, U32 fpos, U8 *buf);
extern U16  tftp_fwrite (void *file, U8 *buf, U16 len);

 
extern void init_ftp (void);
extern void run_ftp_server (void);
extern void *ftp_fopen (U8 *fname, U8 *mode);
extern void ftp_fclose (void *file);
extern U16  ftp_fread (void *file, U8 *buf, U16 len);
extern U16  ftp_fwrite (void *file, U8 *buf, U16 len);
extern BOOL ftp_fdelete (U8 *fname);
extern BOOL ftp_frename (U8 *fname, U8 *newn);
extern U16  ftp_ffind (U8 code, U8 *buf, U8 *mask, U16 len);

 
extern void init_dhcp (void);
extern void run_dhcp_client (void);

 
extern void init_nbns (void);

 
extern void init_dns (void);
extern void run_dns_client (void);
extern U8   get_host_by_name (U8 *hostn, void (*cbfunc)(U8, U8 *));

 
extern void init_smtp (void);
extern void run_smtp_client (void);
extern U16  smtp_cbfunc (U8 code, U8 *buf, U16 buflen, U32 *pvar);
extern BOOL smtp_accept_auth (U8 *srv_ip);

 
extern void init_ethernet (void);
extern void send_frame (OS_FRAME *frame);
extern void poll_ethernet (void);
extern void int_enable_eth (void);
extern void int_disable_eth (void);

 
extern void init_serial (void);
extern int  com_getchar (void);
extern BOOL com_putchar (U8 c);
extern BOOL com_tx_active (void);

 
extern void init_modem (void);
extern void modem_dial (U8 *dialnum);
extern void modem_hangup (void);
extern void modem_listen (void);
extern BOOL modem_online (void);
extern BOOL modem_process (U8 ch);
extern void modem_run (void);







 



#line 27 "main.c"
#line 1 "uart0.h"




















#line 29 "uart0.h"



extern char bRXIN0;
extern char UIB0[100];
extern char flag0;
extern char rx_buffer0[1024];
extern char tx_buffer0[1024];
extern unsigned short rx_wr_index0,rx_rd_index0,rx_counter0;
extern unsigned short tx_wr_index0,tx_rd_index0,tx_counter0;
extern char rx_buffer_overflow0;
extern char plazma_uart0;
extern char memo_out[50];
extern char data_rs[50];
extern char data_rs0[50];
extern const char Table87[];
extern const char Table95[]; 

char crc_87(char* ptr,char num);
char crc_95(char* ptr,char num);
void putchar0(char c);
void uart_out0 (char num,char data0,char data1,char data2,char data3,char data4,char data5);
void uart_out_adr0 (char *ptr, char len);
void uart0_init(void);
char getchar0(void);
__irq void uart0_interrupt(void);
void uart_in_an0(void);
signed short index_offset0 (signed short index,signed short offset);
char control_check0(signed short index);
void uart_in0(void);
void uart_out_adr_block (unsigned long adress,char *ptr, char len);
uint32_t UARTInit( uint32_t PortNum, uint32_t baudrate );


#line 28 "main.c"
#line 29 "main.c"
#line 1 "modbus.h"

extern unsigned char modbus_buf[20];
extern short modbus_crc16;
extern char modbus_timeout_cnt;
extern char bMODBUS_TIMEOUT;
extern unsigned char modbus_rx_buffer[30];	
extern unsigned char modbus_an_buffer[30];	
extern unsigned char modbus_rx_buffer_ptr;	
extern unsigned char modbus_rx_counter;		
extern signed short modbusTimeoutInMills;
extern short modbus_plazma;				
extern short modbus_plazma1;				
extern short modbus_plazma2;				
extern short modbus_plazma3;				
extern char modbus_cmnd_cnt,modbus_cmnd,modbus_self_cmnd_cnt;

extern char modbus_registers[200];


unsigned short CRC16_2(char* buf, short len);

void modbus_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr,unsigned short reg_quantity);

void modbus_hold_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short reg_quantity, char prot);

void modbus_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr);

void modbus_hold_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr);

void modbus_input_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short reg_quantity, char prot);

void modbus_for_pult_registers_transmit(unsigned short reg_quantity);

void modbus_in(void);



#line 30 "main.c"
#line 1 "mcp2515.h"


























#line 43 "mcp2515.h"

#line 58 "mcp2515.h"

#line 73 "mcp2515.h"

#line 88 "mcp2515.h"

#line 103 "mcp2515.h"

#line 118 "mcp2515.h"

#line 133 "mcp2515.h"

#line 148 "mcp2515.h"

extern char mcp2515_can_st,mcp2515_can_st_old;
extern char MCP2515_RXBUFF[40];
extern char bMCP2515_IN;
extern char mcp2515_out_buff[8][8];
extern char mcp2515_buff_wr_ptr;
extern char mcp2515_buff_rd_ptr;



void mcp2515_reset(void);

char mcp2515_write(char addr,char in);

char mcp2515_read(char addr);

void mcp2515_bit_modify(char addr,char mask,char data);

char mcp2515_read_status(void);

void mcp2515_rts(char in);

void can_mcp2515_init(void);

void can_mcp2515_hndl(void);

void mcp2515_transmit(char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7);


#line 31 "main.c"
#line 1 "sc16is7xx.h"
#line 2 "sc16is7xx.h"

#line 15 "sc16is7xx.h"















extern char sc16is700ByteAvailable;
extern char sc16is700TxFifoLevel;
extern char tx_buffer_sc16is700[32]; 
extern char tx_wr_index_sc16is700;
extern char tx_rd_index_sc16is700;
extern char sc16is700TxFifoEmptyCnt; 
extern char sc16is700TxPossibleFlag;


void sc16is700_init(uint32_t baudrate);
void sc16is700_wr_byte(char reg_num,char data);
char sc16is700_rd_byte(char reg_num);


void sc16is700_wr_buff(char reg_num,char num);
void putchar_sc16is700(char out_byte);
void sc16is700_uart_hndl(void);

#line 32 "main.c"
#line 1 "snmp_data_file.h"
extern char snmp_community[10];







 
extern signed short snmp_num_of_psu;
extern signed short snmp_max_time_of_process;
extern signed short snmp_time_visualisation;
extern signed short snmp_pult_time_mode; 		
extern signed short snmp_load_current_measure_mode;	
extern signed short snmp_main_menu_mode;
extern signed short snmp_restart_enabled;
extern signed short snmp_modbus_adress;
extern signed long snmp_modbus_baudrate;	



extern signed short snmp_mains_power_voltage;
extern signed short snmp_mains_power_frequency;
extern signed short snmp_mains_power_status;
extern signed short snmp_mains_power_alarm;


extern signed short snmp_out_voltage;
extern signed short snmp_out_current;



extern signed short snmp_bps_number[30];
extern signed short snmp_bps_voltage[30];
extern signed short snmp_bps_current[30];
extern signed short snmp_bps_temperature[30];
extern signed short snmp_bps_stat[30];










extern signed short snmp_spc_stat;
extern char snmp_spc_trap_message[100];
extern signed short snmp_spc_trap_value_0,snmp_spc_trap_value_1,snmp_spc_trap_value_2;


extern signed short snmp_energy_vvod_phase_a;
extern signed short snmp_energy_vvod_phase_b;
extern signed short snmp_energy_vvod_phase_c;
extern signed short snmp_energy_pes_phase_a;
extern signed short snmp_energy_pes_phase_b;
extern signed short snmp_energy_pes_phase_c;


extern signed short snmp_sk_number[4];
extern signed short snmp_sk_state[4];


extern signed long snmp_energy_total_energy;
extern signed short snmp_energy_current_energy;


extern signed short snmp_ips_state_flags;


extern signed char snmp_avt_number[12];
extern signed char snmp_avt_stat[12];


extern signed short snmp_command;
extern signed short snmp_command_parametr;


extern char snmp_log[64][128];


extern signed short snmp_main_bps;
extern signed short snmp_zv_en;
extern signed short snmp_alarm_auto_disable;
extern signed short snmp_bat_test_time;
extern signed short snmp_u_max;
extern signed short snmp_u_0_grad;
extern signed short snmp_u_20_grad;
extern signed short snmp_u_sign;
extern signed short snmp_u_min_power;
extern signed short snmp_u_withouth_bat;
extern signed short snmp_control_current;
extern signed short snmp_max_charge_current;
extern signed short snmp_max_current;
extern signed short snmp_max_current_koef;
extern signed short snmp_max_current_koef;
extern signed short snmp_up_charge_koef;
extern signed short snmp_powerup_psu_timeout;
extern signed short snmp_max_temperature;


extern signed short snmp_U_up;  	
extern signed short snmp_I_ug; 	
extern signed short snmp_U_maxg;  	
extern signed short snmp_I_maxp; 	
extern signed long snmp_time_p;  	
extern signed long snmp_time_g;


extern signed short snmp_reverse_state;
extern signed short snmp_avtoreverse_enable;
extern signed short snmp_avtoreverse_ff_time;
extern signed short snmp_avtoreverse_rew_time;
extern signed short snmp_avtoreverse_pause_time; 
extern signed short snmp_avtoreverse_ff_i;
extern signed short snmp_avtoreverse_rew_i;
extern signed short snmp_avtoreverse_ff_u;
extern signed short snmp_avtoreverse_rew_u;


void snmp_data (void);
void snmp_sernum_write (int mode); 
void snmp_location_write (int mode);
void snmp_command_execute (int mode);
void event2snmp(char num);
void snmp_main_bps_write (int mode);
void snmp_zv_on_write (int mode);
void snmp_alarm_auto_disable_write (int mode);
void snmp_bat_test_time_write (int mode);
void snmp_u_max_write (int mode);
void snmp_u_0_grad_write (int mode);
void snmp_u_20_grad_write (int mode);
void snmp_u_sign_write (int mode);
void snmp_u_min_power_write (int mode);
void snmp_u_withouth_bat_write (int mode);
void snmp_control_current_write (int mode);
void snmp_max_charge_current_write (int mode);
void snmp_max_current_write (int mode);
void snmp_max_current_koef_write (int mode);
void snmp_up_charge_koef_write (int mode);
void snmp_powerup_psu_timeout_write (int mode);
void snmp_max_temperature_write (int mode);
void event2snmp(char num);
void snmp_trap_send(char* str, signed short in0, signed short in1, signed short in2);
void snmp_alarm_aktiv_write1(void);
void snmp_alarm_aktiv_write2(void);
void snmp_alarm_aktiv_write3(void);
void snmp_alarm_aktiv_write4(void);
void snmp_num_of_psu_write (int mode);
void snmp_max_time_of_process_write(int mode); 
void snmp_time_visualisation_write(int mode);
void snmp_pult_time_mode_write(int mode);  	
void snmp_load_current_measure_mode_write(int mode); 
void snmp_main_menu_mode_write(int mode); 
void snmp_restart_enabled_write(int mode);
void snmp_modbus_adress_write(int mode);
void snmp_modbus_baudrate_write(int mode);
void snmp_U_up_write(int mode);
void snmp_I_ug_write(int mode);
void snmp_U_maxg_write(int mode);
void snmp_I_maxp_write(int mode);
void snmp_time_p_write(int mode);
void snmp_time_g_write(int mode); 
void snmp_reverse_state_write (int mode);
void snmp_avtoreverse_enable_write(int mode);
void snmp_avtoreverse_ff_time_write(int mode);
void snmp_avtoreverse_rew_time_write(int mode);
void snmp_avtoreverse_pause_time_write(int mode);
void snmp_avtoreverse_ff_i_write(int mode);
void snmp_avtoreverse_rew_i_write(int mode);
void snmp_avtoreverse_ff_u_write(int mode);
void snmp_avtoreverse_rew_u_write(int mode);
void snmp_data (void);	



 
#line 33 "main.c"
#line 1 "modbus_tcp.h"

extern char plazma_modbus_tcp[20];
extern short modbus_tcp_plazma[10];

U16 tcp_callback (U8 soc, U8 evt, U8 *ptr, U16 par);

extern char modbus_tcp_func;
extern char modbus_tcp_unit;
extern short modbus_tcp_rx_arg0;
extern short modbus_tcp_rx_arg1;



extern char* modbus_tcp_out_ptr;

#line 34 "main.c"








extern U8 own_hw_adr[];

BOOL tick;
extern LOCALM localm[];





char b10000Hz,b1000Hz,b2000Hz,b100Hz,b50Hz,b10Hz,b5Hz,b2Hz,b1Hz,b1min,bFL34;
short t0cnt,t0cnt0,t0cnt1,t0cnt2,t0cnt3,t0cnt4,t0cnt5,t0cnt6,t0_cnt7,t0_cnt_min;
char bFL5,bFL2,bFL,bFL_,bTPS,bFL_REV;
signed short main_10Hz_cnt=0;
signed short main_1Hz_cnt=0;

 


char cnt_of_slave=3;






signed short Ktsrc[2];
signed short Kusrc[2];
signed short Kisrc[2];
signed short Ki0src[2];
signed short Kubat[2];
signed short Kubatm[2];
unsigned short Kibat0[2];
signed short Kibat1[2];
signed short Ktbat[2];
signed short Kunet;
signed short Kunet_ext[3];
signed short Ktext[3];
signed short Kuload;
signed short KunetA;
signed short KunetB;
signed short KunetC;

signed short MAIN_IST;
signed short UMAX;
signed short UB0;
signed short UB20;

signed short TSIGN;
signed short AV_OFF_AVT;
signed short USIGN;
signed short UMN;
signed short ZV_ON;
signed short IKB;

signed short UVZ;
signed short IMAX;
signed short IMIN;
signed short APV_ON;
signed short IZMAX;
signed short U0B;
signed short TZAS;
signed short VZ_HR;
signed short TBAT;
signed short U_AVT;
signed short DU;
signed short PAR;
signed short TBATMAX;
signed short TBATSIGN;
signed short UBM_AV;
signed short TBOXMAX;
signed short TBOXREG;
signed short TBOXVENTMAX;
signed short TLOADDISABLE;
signed short TLOADENABLE;
signed short TBATDISABLE;
signed short TBATENABLE;

signed short NUMBAT;
signed short NUMIST;

signed short NUMDT;
signed short NUMSK;
signed short NUMEXT;
signed short NUMAVT;

enum_apv_on APV_ON1,APV_ON2;
signed short APV_ON2_TIME;

enum_bat_is_on BAT_IS_ON[2];
signed short BAT_DAY_OF_ON[2];
signed short BAT_MONTH_OF_ON[2];
signed short BAT_YEAR_OF_ON[2];
signed short BAT_C_NOM[2];
signed short BAT_RESURS[2];
signed short BAT_C_REAL[2];

unsigned short AUSW_MAIN;
unsigned long 	AUSW_MAIN_NUMBER=0x123456;
unsigned short AUSW_DAY;
unsigned short AUSW_MONTH;
unsigned short AUSW_YEAR;
unsigned short AUSW_UKU;
unsigned short AUSW_UKU_SUB;
unsigned long AUSW_UKU_NUMBER;
unsigned long	AUSW_BPS1_NUMBER;
unsigned long  AUSW_BPS2_NUMBER;
unsigned short AUSW_RS232;
unsigned short AUSW_PDH;
unsigned short AUSW_SDH;
unsigned short AUSW_ETH;

signed short TMAX_EXT_EN[3];
signed short TMAX_EXT[3];
signed short TMIN_EXT_EN[3];
signed short TMIN_EXT[3];
signed short T_EXT_REL_EN[3];
signed short T_EXT_ZVUK_EN[3];
signed short T_EXT_LCD_EN[3];
signed short T_EXT_RS_EN[3];

signed short SK_SIGN[4];
signed short SK_REL_EN[4];
signed short SK_ZVUK_EN[4];
signed short SK_LCD_EN[4];
signed short SK_RS_EN[4];

enum_avz AVZ;

unsigned short HOUR_AVZ;
unsigned short MIN_AVZ;
unsigned short SEC_AVZ;
unsigned short DATE_AVZ;
unsigned short MONTH_AVZ;
unsigned short YEAR_AVZ;
unsigned short AVZ_TIME;

enum_mnemo_on MNEMO_ON;
unsigned short MNEMO_TIME;

signed short POWER_CNT_ADRESS;

signed short ETH_IS_ON;
signed short ETH_DHCP_ON;
signed short ETH_IP_1;
signed short ETH_IP_2;
signed short ETH_IP_3;
signed short ETH_IP_4;
signed short ETH_MASK_1;
signed short ETH_MASK_2;
signed short ETH_MASK_3;
signed short ETH_MASK_4;
signed short ETH_TRAP1_IP_1;
signed short ETH_TRAP1_IP_2;
signed short ETH_TRAP1_IP_3;
signed short ETH_TRAP1_IP_4;
signed short ETH_TRAP2_IP_1;
signed short ETH_TRAP2_IP_2;
signed short ETH_TRAP2_IP_3;
signed short ETH_TRAP2_IP_4;
signed short ETH_TRAP3_IP_1;
signed short ETH_TRAP3_IP_2;
signed short ETH_TRAP3_IP_3;
signed short ETH_TRAP3_IP_4;
signed short ETH_TRAP4_IP_1;
signed short ETH_TRAP4_IP_2;
signed short ETH_TRAP4_IP_3;
signed short ETH_TRAP4_IP_4;
signed short ETH_TRAP5_IP_1;
signed short ETH_TRAP5_IP_2;
signed short ETH_TRAP5_IP_3;
signed short ETH_TRAP5_IP_4;

signed short ETH_SNMP_PORT_READ;
signed short ETH_SNMP_PORT_WRITE;

signed short ETH_GW_1;
signed short ETH_GW_2;
signed short ETH_GW_3;
signed short ETH_GW_4;

signed short MODBUS_ADRESS;
signed short MODBUS_BAUDRATE;

signed short CURR_FADE_IN; 
signed short SK_START;	  
signed short SK_START_LEV; 

signed short ACH_OFF_EN;		
signed short ACH_OFF_LEVEL;	
signed short CURR_OFF_EN;
signed short CUR_OFF_LEVEL_RELATIV;
signed short CUR_OFF_LEVEL_ABSOLUT;
signed short CUR_OFF_T_OFF;
signed short CUR_OFF_T_ON;

signed short EE_WRITE_CNT;







BPS_STAT bps[32];




char first_inv_slot;



signed short load_U;
signed short load_I;
signed short load_U_;	
signed short load_I_;	




char lcd_buffer[200+100]={"Hello World"};
signed char parol[3];
char phase;
char lcd_bitmap[1024];
char dig[5];
char dumm_ind[20];
stuct_ind a_ind,b_ind[10],c_ind;
char dumm_ind_[20];
char zero_on;
char mnemo_cnt=50;
char simax;
short av_j_si_max;
const char ABCDEF[]={"0123456789ABCDEF"};
const char sm_mont[13][4]={"   ","янв","фев","мар","апр","май","июн","июл","авг","сен","окт","ноя","дек"}; 
signed short ptr_ind=0;

signed short ind_pointer=0;
char ind_fl_cnt;



signed short net_U,net_Ustore,net_Ua,net_Ub,net_Uc;
char bFF,bFF_;
signed short net_F,hz_out,hz_out_cnt;
char net_av;




char tout_max_cnt[4],tout_min_cnt[4];
enum_tout_stat tout_stat[4];
signed short t_ext[3];
BOOL ND_EXT[3];
signed char sk_cnt_dumm[4],sk_cnt[4],sk_av_cnt[4];
enum_sk_stat sk_stat[4]={ssOFF,ssOFF,ssOFF,ssOFF};
enum_sk_av_stat sk_av_stat[4]={sasOFF,sasOFF,sasOFF,sasOFF},sk_av_stat_old[4];
signed short t_box;



extern char beep_cnt;
BOOL bSILENT;








signed short u_necc,u_necc_,u_necc_up,u_necc_dn;
signed short main_cnt_5Hz;
signed short num_necc;
signed short num_necc_Imax;
signed short num_necc_Imin;
signed short cnt_num_necc;

signed mat_temper;



unsigned main_apv_cnt,hour_apv_cnt[2],reset_apv_cnt[2];
unsigned short apv_cnt_sec[2],apv_cnt[2];



const char sm_[]	={"                    "};
const char sm_exit[]={" Выход              "};
const char sm_time[]={" 0%:0^:0& 0</>  /0{ "};







char but;                            
unsigned long but_n,but_s;
char but0_cnt;
char but1_cnt;
char but_onL_temp;



char cnt_net_drv;



extern char ptr_can1_tx_wr,ptr_can1_tx_rd;
extern char ptr_can2_tx_wr,ptr_can2_tx_rd;
extern unsigned short rotor_can[6];
extern char RXBUFF[40],TXBUFF[40];







char speed,l_but,n_but;
char speed__;
char speed__old;
signed short speed_cnt;



enum {wrkON=0x55,wrkOFF=0xAA}wrk;
char cnt_wrk;
signed short ibat_integr;
unsigned short av_beep,av_rele,av_stat;
char default_temp;
char ND_out[3];



enum_tst_state tst_state[15];




extern char adc_cnt,adc_cnt1,adc_ch;



char flag=0;


extern signed short bat_ver_cnt;
signed short Isumm;
signed short Isumm_;


signed short tst_pwm_u;
signed short tst_pwm_i;

signed short sk_in_drv_cnt;
signed short sk_in_drv_stat,sk_in_drv_stat_old;

#line 1 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.H"




















 









 

typedef enum IRQn
{
 
  NonMaskableInt_IRQn           = -14,       
  MemoryManagement_IRQn         = -12,       
  BusFault_IRQn                 = -11,       
  UsageFault_IRQn               = -10,       
  SVCall_IRQn                   = -5,        
  DebugMonitor_IRQn             = -4,        
  PendSV_IRQn                   = -2,        
  SysTick_IRQn                  = -1,        

 
  WDT_IRQn                      = 0,         
  TIMER0_IRQn                   = 1,         
  TIMER1_IRQn                   = 2,         
  TIMER2_IRQn                   = 3,         
  TIMER3_IRQn                   = 4,         
  UART0_IRQn                    = 5,         
  UART1_IRQn                    = 6,         
  UART2_IRQn                    = 7,         
  UART3_IRQn                    = 8,         
  PWM1_IRQn                     = 9,         
  I2C0_IRQn                     = 10,        
  I2C1_IRQn                     = 11,        
  I2C2_IRQn                     = 12,        
  SPI_IRQn                      = 13,        
  SSP0_IRQn                     = 14,        
  SSP1_IRQn                     = 15,        
  PLL0_IRQn                     = 16,        
  RTC_IRQn                      = 17,        
  EINT0_IRQn                    = 18,        
  EINT1_IRQn                    = 19,        
  EINT2_IRQn                    = 20,        
  EINT3_IRQn                    = 21,        
  ADC_IRQn                      = 22,        
  BOD_IRQn                      = 23,        
  USB_IRQn                      = 24,        
  CAN_IRQn                      = 25,        
  DMA_IRQn                      = 26,        
  I2S_IRQn                      = 27,        
  ENET_IRQn                     = 28,        
  RIT_IRQn                      = 29,        
  MCPWM_IRQn                    = 30,        
  QEI_IRQn                      = 31,        
  PLL1_IRQn                     = 32,        
  USBActivity_IRQn              = 33,        
  CANActivity_IRQn              = 34,        
} IRQn_Type;






 

 





#line 1 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"



















 




















































 

 
 
 
 
 
 
 
 


#line 86 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"

















 

#line 112 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"





 


 





 






 
typedef struct
{
  volatile uint32_t ISER[8];                       
       uint32_t RESERVED0[24];
  volatile uint32_t ICER[8];                       
       uint32_t RSERVED1[24];
  volatile uint32_t ISPR[8];                       
       uint32_t RESERVED2[24];
  volatile uint32_t ICPR[8];                       
       uint32_t RESERVED3[24];
  volatile uint32_t IABR[8];                       
       uint32_t RESERVED4[56];
  volatile uint8_t  IP[240];                       
       uint32_t RESERVED5[644];
  volatile  uint32_t STIR;                          
}  NVIC_Type;


 
typedef struct
{
  volatile const  uint32_t CPUID;                         
  volatile uint32_t ICSR;                          
  volatile uint32_t VTOR;                          
  volatile uint32_t AIRCR;                         
  volatile uint32_t SCR;                           
  volatile uint32_t CCR;                           
  volatile uint8_t  SHP[12];                       
  volatile uint32_t SHCSR;                         
  volatile uint32_t CFSR;                          
  volatile uint32_t HFSR;                          
  volatile uint32_t DFSR;                          
  volatile uint32_t MMFAR;                         
  volatile uint32_t BFAR;                          
  volatile uint32_t AFSR;                          
  volatile const  uint32_t PFR[2];                        
  volatile const  uint32_t DFR;                           
  volatile const  uint32_t ADR;                           
  volatile const  uint32_t MMFR[4];                       
  volatile const  uint32_t ISAR[5];                       
} SCB_Type;


 
typedef struct
{
  volatile uint32_t CTRL;                          
  volatile uint32_t LOAD;                          
  volatile uint32_t VAL;                           
  volatile const  uint32_t CALIB;                         
} SysTick_Type;


 
typedef struct
{
  volatile  union  
  {
    volatile  uint8_t    u8;                        
    volatile  uint16_t   u16;                       
    volatile  uint32_t   u32;                       
  }  PORT [32];                                
       uint32_t RESERVED0[864];
  volatile uint32_t TER;                           
       uint32_t RESERVED1[15];
  volatile uint32_t TPR;                           
       uint32_t RESERVED2[15];
  volatile uint32_t TCR;                           
       uint32_t RESERVED3[29];
  volatile uint32_t IWR;                           
  volatile uint32_t IRR;                           
  volatile uint32_t IMCR;                          
       uint32_t RESERVED4[43];
  volatile uint32_t LAR;                           
  volatile uint32_t LSR;                           
       uint32_t RESERVED5[6];
  volatile const  uint32_t PID4;                          
  volatile const  uint32_t PID5;
  volatile const  uint32_t PID6;
  volatile const  uint32_t PID7;
  volatile const  uint32_t PID0;
  volatile const  uint32_t PID1;
  volatile const  uint32_t PID2;
  volatile const  uint32_t PID3;
  volatile const  uint32_t CID0;
  volatile const  uint32_t CID1;
  volatile const  uint32_t CID2;
  volatile const  uint32_t CID3;
} ITM_Type;


 
typedef struct
{
       uint32_t RESERVED0;
  volatile const  uint32_t ICTR;                          



       uint32_t RESERVED1;

} InterruptType_Type;


 

typedef struct
{
  volatile const  uint32_t TYPE;                          
  volatile uint32_t CTRL;                          
  volatile uint32_t RNR;                           
  volatile uint32_t RBAR;                          
  volatile uint32_t RASR;                          
  volatile uint32_t RBAR_A1;                       
  volatile uint32_t RASR_A1;                       
  volatile uint32_t RBAR_A2;                       
  volatile uint32_t RASR_A2;                       
  volatile uint32_t RBAR_A3;                       
  volatile uint32_t RASR_A3;                       
} MPU_Type;



 
typedef struct
{
  volatile uint32_t DHCSR;                         
  volatile  uint32_t DCRSR;                         
  volatile uint32_t DCRDR;                         
  volatile uint32_t DEMCR;                         
} CoreDebug_Type;


 
#line 274 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"

#line 281 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"










 






#line 311 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"


 


 




#line 336 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"


 
 
 
 









 
extern uint32_t __get_PSP(void);









 
extern void __set_PSP(uint32_t topOfProcStack);









 
extern uint32_t __get_MSP(void);









 
extern void __set_MSP(uint32_t topOfMainStack);








 
extern uint32_t __REV16(uint16_t value);








 
extern int32_t __REVSH(int16_t value);


#line 502 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"









 









 
static __inline uint32_t  __get_BASEPRI(void)
{
  register uint32_t __regBasePri         __asm("basepri");
  return(__regBasePri);
}








 
static __inline void __set_BASEPRI(uint32_t basePri)
{
  register uint32_t __regBasePri         __asm("basepri");
  __regBasePri = (basePri & 0x1ff);
}









 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}








 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}








 
static __inline uint32_t __get_FAULTMASK(void)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  return(__regFaultMask);
}








 
static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  __regFaultMask = (faultMask & 1);
}








 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}








 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}





#line 1044 "C:\\Keil\\ARM\\RV31\\INC\\core_cm3.h"



 













 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  
  reg_value  = ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR;                                                     
  reg_value &= ~((0xFFFFU << 16) | (0x0F << 8));                               
  reg_value  = ((reg_value | (0x5FA << 16) | (PriorityGroupTmp << 8)));   
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR = reg_value;
}









 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR >> 8) & 0x07);                                           
}









 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}









 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)((((NVIC_Type *) ((0xE000E000) + 0x0100))->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}













 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 5)) & 0xff); }  
  else {
    ((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)] = ((priority << (8 - 5)) & 0xff);    }         
}















 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 5)));  }  
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[(uint32_t)(IRQn)]           >> (8 - 5)));  }  
}
















 
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 5) ? 5 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 5) < 7) ? 0 : PriorityGroupTmp - 7 + 5;
 
  return (
           ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
           ((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
         );
}

















 
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);                          
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 5) ? 5 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 5) < 7) ? 0 : PriorityGroupTmp - 7 + 5;
  
  *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
  *pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
}



 



 














 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > ((1<<24) -1))  return (1);                                              

  ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD  =  (ticks & ((1<<24) -1)) - 1;                                       
  NVIC_SetPriority (SysTick_IRQn, (1<<5) - 1);                             
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   =  (0x00);                                                               
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL = (1 << 2) | (1<<0) | (1<<1);  
  return (0);                                                                             
}







 








 
static __inline void NVIC_SystemReset(void)
{
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR  = ((0x5FA << 16) | (((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR & (0x700)) | (1<<2));  
  __dsb(0);                                                                                            
  while(1);                                                                             
}


 











 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (ch == '\n') ITM_SendChar('\r');
  
  if ((((CoreDebug_Type *) (0xE000EDF0))->DEMCR & (1 << 24))  &&
      (((ITM_Type *) (0xE0000000))->TCR & 1)                  &&
      (((ITM_Type *) (0xE0000000))->TER & (1UL << 0))  ) 
  {
    while (((ITM_Type *) (0xE0000000))->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000))->PORT[0].u8 = (uint8_t) ch;
  }  
  return (ch);
}







 
#line 97 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.H"
#line 1 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\system_LPC17xx.h"




















 









extern uint32_t SystemFrequency;     










 
extern void SystemInit (void);





#line 98 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.H"


 
 
 


#pragma anon_unions


 
typedef struct
{
  volatile uint32_t FLASHCFG;                
       uint32_t RESERVED0[31];
  volatile uint32_t PLL0CON;                 
  volatile uint32_t PLL0CFG;
  volatile const  uint32_t PLL0STAT;
  volatile  uint32_t PLL0FEED;
       uint32_t RESERVED1[4];
  volatile uint32_t PLL1CON;
  volatile uint32_t PLL1CFG;
  volatile const  uint32_t PLL1STAT;
  volatile  uint32_t PLL1FEED;
       uint32_t RESERVED2[4];
  volatile uint32_t PCON;
  volatile uint32_t PCONP;
       uint32_t RESERVED3[15];
  volatile uint32_t CCLKCFG;
  volatile uint32_t USBCLKCFG;
  volatile uint32_t CLKSRCSEL;
  volatile uint32_t	CANSLEEPCLR;
  volatile uint32_t	CANWAKEFLAGS;
       uint32_t RESERVED4[10];
  volatile uint32_t EXTINT;                  
       uint32_t RESERVED5;
  volatile uint32_t EXTMODE;
  volatile uint32_t EXTPOLAR;
       uint32_t RESERVED6[12];
  volatile uint32_t RSID;                    
       uint32_t RESERVED7[7];
  volatile uint32_t SCS;                     
  volatile uint32_t IRCTRIM;                 
  volatile uint32_t PCLKSEL0;
  volatile uint32_t PCLKSEL1;
       uint32_t RESERVED8[4];
  volatile uint32_t USBIntSt;                
  volatile uint32_t DMAREQSEL;
  volatile uint32_t CLKOUTCFG;               
 } LPC_SC_TypeDef;

 
typedef struct
{
  volatile uint32_t PINSEL0;
  volatile uint32_t PINSEL1;
  volatile uint32_t PINSEL2;
  volatile uint32_t PINSEL3;
  volatile uint32_t PINSEL4;
  volatile uint32_t PINSEL5;
  volatile uint32_t PINSEL6;
  volatile uint32_t PINSEL7;
  volatile uint32_t PINSEL8;
  volatile uint32_t PINSEL9;
  volatile uint32_t PINSEL10;
       uint32_t RESERVED0[5];
  volatile uint32_t PINMODE0;
  volatile uint32_t PINMODE1;
  volatile uint32_t PINMODE2;
  volatile uint32_t PINMODE3;
  volatile uint32_t PINMODE4;
  volatile uint32_t PINMODE5;
  volatile uint32_t PINMODE6;
  volatile uint32_t PINMODE7;
  volatile uint32_t PINMODE8;
  volatile uint32_t PINMODE9;
  volatile uint32_t PINMODE_OD0;
  volatile uint32_t PINMODE_OD1;
  volatile uint32_t PINMODE_OD2;
  volatile uint32_t PINMODE_OD3;
  volatile uint32_t PINMODE_OD4;
  volatile uint32_t I2CPADCFG;
} LPC_PINCON_TypeDef;

 
typedef struct
{
  union {
    volatile uint32_t FIODIR;
    struct {
      volatile uint16_t FIODIRL;
      volatile uint16_t FIODIRH;
    };
    struct {
      volatile uint8_t  FIODIR0;
      volatile uint8_t  FIODIR1;
      volatile uint8_t  FIODIR2;
      volatile uint8_t  FIODIR3;
    };
  };
  uint32_t RESERVED0[3];
  union {
    volatile uint32_t FIOMASK;
    struct {
      volatile uint16_t FIOMASKL;
      volatile uint16_t FIOMASKH;
    };
    struct {
      volatile uint8_t  FIOMASK0;
      volatile uint8_t  FIOMASK1;
      volatile uint8_t  FIOMASK2;
      volatile uint8_t  FIOMASK3;
    };
  };
  union {
    volatile uint32_t FIOPIN;
    struct {
      volatile uint16_t FIOPINL;
      volatile uint16_t FIOPINH;
    };
    struct {
      volatile uint8_t  FIOPIN0;
      volatile uint8_t  FIOPIN1;
      volatile uint8_t  FIOPIN2;
      volatile uint8_t  FIOPIN3;
    };
  };
  union {
    volatile uint32_t FIOSET;
    struct {
      volatile uint16_t FIOSETL;
      volatile uint16_t FIOSETH;
    };
    struct {
      volatile uint8_t  FIOSET0;
      volatile uint8_t  FIOSET1;
      volatile uint8_t  FIOSET2;
      volatile uint8_t  FIOSET3;
    };
  };
  union {
    volatile  uint32_t FIOCLR;
    struct {
      volatile  uint16_t FIOCLRL;
      volatile  uint16_t FIOCLRH;
    };
    struct {
      volatile  uint8_t  FIOCLR0;
      volatile  uint8_t  FIOCLR1;
      volatile  uint8_t  FIOCLR2;
      volatile  uint8_t  FIOCLR3;
    };
  };
} LPC_GPIO_TypeDef;

typedef struct
{
  volatile const  uint32_t IntStatus;
  volatile const  uint32_t IO0IntStatR;
  volatile const  uint32_t IO0IntStatF;
  volatile  uint32_t IO0IntClr;
  volatile uint32_t IO0IntEnR;
  volatile uint32_t IO0IntEnF;
       uint32_t RESERVED0[3];
  volatile const  uint32_t IO2IntStatR;
  volatile const  uint32_t IO2IntStatF;
  volatile  uint32_t IO2IntClr;
  volatile uint32_t IO2IntEnR;
  volatile uint32_t IO2IntEnF;
} LPC_GPIOINT_TypeDef;

 
typedef struct
{
  volatile uint32_t IR;
  volatile uint32_t TCR;
  volatile uint32_t TC;
  volatile uint32_t PR;
  volatile uint32_t PC;
  volatile uint32_t MCR;
  volatile uint32_t MR0;
  volatile uint32_t MR1;
  volatile uint32_t MR2;
  volatile uint32_t MR3;
  volatile uint32_t CCR;
  volatile const  uint32_t CR0;
  volatile const  uint32_t CR1;
       uint32_t RESERVED0[2];
  volatile uint32_t EMR;
       uint32_t RESERVED1[12];
  volatile uint32_t CTCR;
} LPC_TIM_TypeDef;

 
typedef struct
{
  volatile uint32_t IR;
  volatile uint32_t TCR;
  volatile uint32_t TC;
  volatile uint32_t PR;
  volatile uint32_t PC;
  volatile uint32_t MCR;
  volatile uint32_t MR0;
  volatile uint32_t MR1;
  volatile uint32_t MR2;
  volatile uint32_t MR3;
  volatile uint32_t CCR;
  volatile const  uint32_t CR0;
  volatile const  uint32_t CR1;
  volatile const  uint32_t CR2;
  volatile const  uint32_t CR3;
       uint32_t RESERVED0;
  volatile uint32_t MR4;
  volatile uint32_t MR5;
  volatile uint32_t MR6;
  volatile uint32_t PCR;
  volatile uint32_t LER;
       uint32_t RESERVED1[7];
  volatile uint32_t CTCR;
} LPC_PWM_TypeDef;

 
typedef struct
{
  union {
  volatile const  uint8_t  RBR;
  volatile  uint8_t  THR;
  volatile uint8_t  DLL;
       uint32_t RESERVED0;
  };
  union {
  volatile uint8_t  DLM;
  volatile uint32_t IER;
  };
  union {
  volatile const  uint32_t IIR;
  volatile  uint8_t  FCR;
  };
  volatile uint8_t  LCR;
       uint8_t  RESERVED1[7];
  volatile const  uint8_t  LSR;
       uint8_t  RESERVED2[7];
  volatile uint8_t  SCR;
       uint8_t  RESERVED3[3];
  volatile uint32_t ACR;
  volatile uint8_t  ICR;
       uint8_t  RESERVED4[3];
  volatile uint8_t  FDR;
       uint8_t  RESERVED5[7];
  volatile uint8_t  TER;
       uint8_t  RESERVED6[39];
  volatile uint32_t FIFOLVL;
} LPC_UART_TypeDef;

typedef struct
{
  union {
  volatile const  uint8_t  RBR;
  volatile  uint8_t  THR;
  volatile uint8_t  DLL;
       uint32_t RESERVED0;
  };
  union {
  volatile uint8_t  DLM;
  volatile uint32_t IER;
  };
  union {
  volatile const  uint32_t IIR;
  volatile  uint8_t  FCR;
  };
  volatile uint8_t  LCR;
       uint8_t  RESERVED1[7];
  volatile const  uint8_t  LSR;
       uint8_t  RESERVED2[7];
  volatile uint8_t  SCR;
       uint8_t  RESERVED3[3];
  volatile uint32_t ACR;
  volatile uint8_t  ICR;
       uint8_t  RESERVED4[3];
  volatile uint8_t  FDR;
       uint8_t  RESERVED5[7];
  volatile uint8_t  TER;
       uint8_t  RESERVED6[39];
  volatile uint32_t FIFOLVL;
} LPC_UART0_TypeDef;

typedef struct
{
  union {
  volatile const  uint8_t  RBR;
  volatile  uint8_t  THR;
  volatile uint8_t  DLL;
       uint32_t RESERVED0;
  };
  union {
  volatile uint8_t  DLM;
  volatile uint32_t IER;
  };
  union {
  volatile const  uint32_t IIR;
  volatile  uint8_t  FCR;
  };
  volatile uint8_t  LCR;
       uint8_t  RESERVED1[3];
  volatile uint8_t  MCR;
       uint8_t  RESERVED2[3];
  volatile const  uint8_t  LSR;
       uint8_t  RESERVED3[3];
  volatile const  uint8_t  MSR;
       uint8_t  RESERVED4[3];
  volatile uint8_t  SCR;
       uint8_t  RESERVED5[3];
  volatile uint32_t ACR;
       uint32_t RESERVED6;
  volatile uint32_t FDR;
       uint32_t RESERVED7;
  volatile uint8_t  TER;
       uint8_t  RESERVED8[27];
  volatile uint8_t  RS485CTRL;
       uint8_t  RESERVED9[3];
  volatile uint8_t  ADRMATCH;
       uint8_t  RESERVED10[3];
  volatile uint8_t  RS485DLY;
       uint8_t  RESERVED11[3];
  volatile uint32_t FIFOLVL;
} LPC_UART1_TypeDef;

 
typedef struct
{
  volatile uint32_t SPCR;
  volatile const  uint32_t SPSR;
  volatile uint32_t SPDR;
  volatile uint32_t SPCCR;
       uint32_t RESERVED0[3];
  volatile uint32_t SPINT;
} LPC_SPI_TypeDef;

 
typedef struct
{
  volatile uint32_t CR0;
  volatile uint32_t CR1;
  volatile uint32_t DR;
  volatile const  uint32_t SR;
  volatile uint32_t CPSR;
  volatile uint32_t IMSC;
  volatile uint32_t RIS;
  volatile uint32_t MIS;
  volatile uint32_t ICR;
  volatile uint32_t DMACR;
} LPC_SSP_TypeDef;

 
typedef struct
{
  volatile uint32_t I2CONSET;
  volatile const  uint32_t I2STAT;
  volatile uint32_t I2DAT;
  volatile uint32_t I2ADR0;
  volatile uint32_t I2SCLH;
  volatile uint32_t I2SCLL;
  volatile  uint32_t I2CONCLR;
  volatile uint32_t MMCTRL;
  volatile uint32_t I2ADR1;
  volatile uint32_t I2ADR2;
  volatile uint32_t I2ADR3;
  volatile const  uint32_t I2DATA_BUFFER;
  volatile uint32_t I2MASK0;
  volatile uint32_t I2MASK1;
  volatile uint32_t I2MASK2;
  volatile uint32_t I2MASK3;
} LPC_I2C_TypeDef;

 
typedef struct
{
  volatile uint32_t I2SDAO;
  volatile uint32_t I2SDAI;
  volatile  uint32_t I2STXFIFO;
  volatile const  uint32_t I2SRXFIFO;
  volatile const  uint32_t I2SSTATE;
  volatile uint32_t I2SDMA1;
  volatile uint32_t I2SDMA2;
  volatile uint32_t I2SIRQ;
  volatile uint32_t I2STXRATE;
  volatile uint32_t I2SRXRATE;
  volatile uint32_t I2STXBITRATE;
  volatile uint32_t I2SRXBITRATE;
  volatile uint32_t I2STXMODE;
  volatile uint32_t I2SRXMODE;
} LPC_I2S_TypeDef;

 
typedef struct
{
  volatile uint32_t RICOMPVAL;
  volatile uint32_t RIMASK;
  volatile uint8_t  RICTRL;
       uint8_t  RESERVED0[3];
  volatile uint32_t RICOUNTER;
} LPC_RIT_TypeDef;

 
typedef struct
{
  volatile uint8_t  ILR;
       uint8_t  RESERVED0[7];
  volatile uint8_t  CCR;
       uint8_t  RESERVED1[3];
  volatile uint8_t  CIIR;
       uint8_t  RESERVED2[3];
  volatile uint8_t  AMR;
       uint8_t  RESERVED3[3];
  volatile const  uint32_t CTIME0;
  volatile const  uint32_t CTIME1;
  volatile const  uint32_t CTIME2;
  volatile uint8_t  SEC;
       uint8_t  RESERVED4[3];
  volatile uint8_t  MIN;
       uint8_t  RESERVED5[3];
  volatile uint8_t  HOUR;
       uint8_t  RESERVED6[3];
  volatile uint8_t  DOM;
       uint8_t  RESERVED7[3];
  volatile uint8_t  DOW;
       uint8_t  RESERVED8[3];
  volatile uint16_t DOY;
       uint16_t RESERVED9;
  volatile uint8_t  MONTH;
       uint8_t  RESERVED10[3];
  volatile uint16_t YEAR;
       uint16_t RESERVED11;
  volatile uint32_t CALIBRATION;
  volatile uint32_t GPREG0;
  volatile uint32_t GPREG1;
  volatile uint32_t GPREG2;
  volatile uint32_t GPREG3;
  volatile uint32_t GPREG4;
  volatile uint8_t  RTC_AUXEN;
       uint8_t  RESERVED12[3];
  volatile uint8_t  RTC_AUX;
       uint8_t  RESERVED13[3];
  volatile uint8_t  ALSEC;
       uint8_t  RESERVED14[3];
  volatile uint8_t  ALMIN;
       uint8_t  RESERVED15[3];
  volatile uint8_t  ALHOUR;
       uint8_t  RESERVED16[3];
  volatile uint8_t  ALDOM;
       uint8_t  RESERVED17[3];
  volatile uint8_t  ALDOW;
       uint8_t  RESERVED18[3];
  volatile uint16_t ALDOY;
       uint16_t RESERVED19;
  volatile uint8_t  ALMON;
       uint8_t  RESERVED20[3];
  volatile uint16_t ALYEAR;
       uint16_t RESERVED21;
} LPC_RTC_TypeDef;

 
typedef struct
{
  volatile uint8_t  WDMOD;
       uint8_t  RESERVED0[3];
  volatile uint32_t WDTC;
  volatile  uint8_t  WDFEED;
       uint8_t  RESERVED1[3];
  volatile const  uint32_t WDTV;
  volatile uint32_t WDCLKSEL;
} LPC_WDT_TypeDef;

 
typedef struct
{
  volatile uint32_t ADCR;
  volatile uint32_t ADGDR;
       uint32_t RESERVED0;
  volatile uint32_t ADINTEN;
  volatile const  uint32_t ADDR0;
  volatile const  uint32_t ADDR1;
  volatile const  uint32_t ADDR2;
  volatile const  uint32_t ADDR3;
  volatile const  uint32_t ADDR4;
  volatile const  uint32_t ADDR5;
  volatile const  uint32_t ADDR6;
  volatile const  uint32_t ADDR7;
  volatile const  uint32_t ADSTAT;
  volatile uint32_t ADTRM;
} LPC_ADC_TypeDef;

 
typedef struct
{
  volatile uint32_t DACR;
  volatile uint32_t DACCTRL;
  volatile uint16_t DACCNTVAL;
} LPC_DAC_TypeDef;

 
typedef struct
{
  volatile const  uint32_t MCCON;
  volatile  uint32_t MCCON_SET;
  volatile  uint32_t MCCON_CLR;
  volatile const  uint32_t MCCAPCON;
  volatile  uint32_t MCCAPCON_SET;
  volatile  uint32_t MCCAPCON_CLR;
  volatile uint32_t MCTIM0;
  volatile uint32_t MCTIM1;
  volatile uint32_t MCTIM2;
  volatile uint32_t MCPER0;
  volatile uint32_t MCPER1;
  volatile uint32_t MCPER2;
  volatile uint32_t MCPW0;
  volatile uint32_t MCPW1;
  volatile uint32_t MCPW2;
  volatile uint32_t MCDEADTIME;
  volatile uint32_t MCCCP;
  volatile uint32_t MCCR0;
  volatile uint32_t MCCR1;
  volatile uint32_t MCCR2;
  volatile const  uint32_t MCINTEN;
  volatile  uint32_t MCINTEN_SET;
  volatile  uint32_t MCINTEN_CLR;
  volatile const  uint32_t MCCNTCON;
  volatile  uint32_t MCCNTCON_SET;
  volatile  uint32_t MCCNTCON_CLR;
  volatile const  uint32_t MCINTFLAG;
  volatile  uint32_t MCINTFLAG_SET;
  volatile  uint32_t MCINTFLAG_CLR;
  volatile  uint32_t MCCAP_CLR;
} LPC_MCPWM_TypeDef;

 
typedef struct
{
  volatile  uint32_t QEICON;
  volatile const  uint32_t QEISTAT;
  volatile uint32_t QEICONF;
  volatile const  uint32_t QEIPOS;
  volatile uint32_t QEIMAXPOS;
  volatile uint32_t CMPOS0;
  volatile uint32_t CMPOS1;
  volatile uint32_t CMPOS2;
  volatile const  uint32_t INXCNT;
  volatile uint32_t INXCMP;
  volatile uint32_t QEILOAD;
  volatile const  uint32_t QEITIME;
  volatile const  uint32_t QEIVEL;
  volatile const  uint32_t QEICAP;
  volatile uint32_t VELCOMP;
  volatile uint32_t FILTER;
       uint32_t RESERVED0[998];
  volatile  uint32_t QEIIEC;
  volatile  uint32_t QEIIES;
  volatile const  uint32_t QEIINTSTAT;
  volatile const  uint32_t QEIIE;
  volatile  uint32_t QEICLR;
  volatile  uint32_t QEISET;
} LPC_QEI_TypeDef;

 
typedef struct
{
  volatile uint32_t mask[512];               
} LPC_CANAF_RAM_TypeDef;

typedef struct                           
{
  volatile uint32_t AFMR;
  volatile uint32_t SFF_sa;
  volatile uint32_t SFF_GRP_sa;
  volatile uint32_t EFF_sa;
  volatile uint32_t EFF_GRP_sa;
  volatile uint32_t ENDofTable;
  volatile const  uint32_t LUTerrAd;
  volatile const  uint32_t LUTerr;
  volatile uint32_t FCANIE;
  volatile uint32_t FCANIC0;
  volatile uint32_t FCANIC1;
} LPC_CANAF_TypeDef;

typedef struct                           
{
  volatile const  uint32_t CANTxSR;
  volatile const  uint32_t CANRxSR;
  volatile const  uint32_t CANMSR;
} LPC_CANCR_TypeDef;

typedef struct                           
{
  volatile uint32_t MOD;
  volatile  uint32_t CMR;
  volatile uint32_t GSR;
  volatile const  uint32_t ICR;
  volatile uint32_t IER;
  volatile uint32_t BTR;
  volatile uint32_t EWL;
  volatile const  uint32_t SR;
  volatile uint32_t RFS;
  volatile uint32_t RID;
  volatile uint32_t RDA;
  volatile uint32_t RDB;
  volatile uint32_t TFI1;
  volatile uint32_t TID1;
  volatile uint32_t TDA1;
  volatile uint32_t TDB1;
  volatile uint32_t TFI2;
  volatile uint32_t TID2;
  volatile uint32_t TDA2;
  volatile uint32_t TDB2;
  volatile uint32_t TFI3;
  volatile uint32_t TID3;
  volatile uint32_t TDA3;
  volatile uint32_t TDB3;
} LPC_CAN_TypeDef;

 
typedef struct                           
{
  volatile const  uint32_t DMACIntStat;
  volatile const  uint32_t DMACIntTCStat;
  volatile  uint32_t DMACIntTCClear;
  volatile const  uint32_t DMACIntErrStat;
  volatile  uint32_t DMACIntErrClr;
  volatile const  uint32_t DMACRawIntTCStat;
  volatile const  uint32_t DMACRawIntErrStat;
  volatile const  uint32_t DMACEnbldChns;
  volatile uint32_t DMACSoftBReq;
  volatile uint32_t DMACSoftSReq;
  volatile uint32_t DMACSoftLBReq;
  volatile uint32_t DMACSoftLSReq;
  volatile uint32_t DMACConfig;
  volatile uint32_t DMACSync;
} LPC_GPDMA_TypeDef;

typedef struct                           
{
  volatile uint32_t DMACCSrcAddr;
  volatile uint32_t DMACCDestAddr;
  volatile uint32_t DMACCLLI;
  volatile uint32_t DMACCControl;
  volatile uint32_t DMACCConfig;
} LPC_GPDMACH_TypeDef;

 
typedef struct
{
  volatile const  uint32_t HcRevision;              
  volatile uint32_t HcControl;
  volatile uint32_t HcCommandStatus;
  volatile uint32_t HcInterruptStatus;
  volatile uint32_t HcInterruptEnable;
  volatile uint32_t HcInterruptDisable;
  volatile uint32_t HcHCCA;
  volatile const  uint32_t HcPeriodCurrentED;
  volatile uint32_t HcControlHeadED;
  volatile uint32_t HcControlCurrentED;
  volatile uint32_t HcBulkHeadED;
  volatile uint32_t HcBulkCurrentED;
  volatile const  uint32_t HcDoneHead;
  volatile uint32_t HcFmInterval;
  volatile const  uint32_t HcFmRemaining;
  volatile const  uint32_t HcFmNumber;
  volatile uint32_t HcPeriodicStart;
  volatile uint32_t HcLSTreshold;
  volatile uint32_t HcRhDescriptorA;
  volatile uint32_t HcRhDescriptorB;
  volatile uint32_t HcRhStatus;
  volatile uint32_t HcRhPortStatus1;
  volatile uint32_t HcRhPortStatus2;
       uint32_t RESERVED0[40];
  volatile const  uint32_t Module_ID;

  volatile const  uint32_t OTGIntSt;                
  volatile uint32_t OTGIntEn;
  volatile  uint32_t OTGIntSet;
  volatile  uint32_t OTGIntClr;
  volatile uint32_t OTGStCtrl;
  volatile uint32_t OTGTmr;
       uint32_t RESERVED1[58];

  volatile const  uint32_t USBDevIntSt;             
  volatile uint32_t USBDevIntEn;
  volatile  uint32_t USBDevIntClr;
  volatile  uint32_t USBDevIntSet;

  volatile  uint32_t USBCmdCode;              
  volatile const  uint32_t USBCmdData;

  volatile const  uint32_t USBRxData;               
  volatile  uint32_t USBTxData;
  volatile const  uint32_t USBRxPLen;
  volatile  uint32_t USBTxPLen;
  volatile uint32_t USBCtrl;
  volatile  uint32_t USBDevIntPri;

  volatile const  uint32_t USBEpIntSt;              
  volatile uint32_t USBEpIntEn;
  volatile  uint32_t USBEpIntClr;
  volatile  uint32_t USBEpIntSet;
  volatile  uint32_t USBEpIntPri;

  volatile uint32_t USBReEp;                 
  volatile  uint32_t USBEpInd;
  volatile uint32_t USBMaxPSize;

  volatile const  uint32_t USBDMARSt;               
  volatile  uint32_t USBDMARClr;
  volatile  uint32_t USBDMARSet;
       uint32_t RESERVED2[9];
  volatile uint32_t USBUDCAH;
  volatile const  uint32_t USBEpDMASt;
  volatile  uint32_t USBEpDMAEn;
  volatile  uint32_t USBEpDMADis;
  volatile const  uint32_t USBDMAIntSt;
  volatile uint32_t USBDMAIntEn;
       uint32_t RESERVED3[2];
  volatile const  uint32_t USBEoTIntSt;
  volatile  uint32_t USBEoTIntClr;
  volatile  uint32_t USBEoTIntSet;
  volatile const  uint32_t USBNDDRIntSt;
  volatile  uint32_t USBNDDRIntClr;
  volatile  uint32_t USBNDDRIntSet;
  volatile const  uint32_t USBSysErrIntSt;
  volatile  uint32_t USBSysErrIntClr;
  volatile  uint32_t USBSysErrIntSet;
       uint32_t RESERVED4[15];

  union {
  volatile const  uint32_t I2C_RX;                  
  volatile  uint32_t I2C_TX;
  };
  volatile const  uint32_t I2C_STS;
  volatile uint32_t I2C_CTL;
  volatile uint32_t I2C_CLKHI;
  volatile  uint32_t I2C_CLKLO;
       uint32_t RESERVED5[824];

  union {
  volatile uint32_t USBClkCtrl;              
  volatile uint32_t OTGClkCtrl;
  };
  union {
  volatile const  uint32_t USBClkSt;
  volatile const  uint32_t OTGClkSt;
  };
} LPC_USB_TypeDef;

 
typedef struct
{
  volatile uint32_t MAC1;                    
  volatile uint32_t MAC2;
  volatile uint32_t IPGT;
  volatile uint32_t IPGR;
  volatile uint32_t CLRT;
  volatile uint32_t MAXF;
  volatile uint32_t SUPP;
  volatile uint32_t TEST;
  volatile uint32_t MCFG;
  volatile uint32_t MCMD;
  volatile uint32_t MADR;
  volatile  uint32_t MWTD;
  volatile const  uint32_t MRDD;
  volatile const  uint32_t MIND;
       uint32_t RESERVED0[2];
  volatile uint32_t SA0;
  volatile uint32_t SA1;
  volatile uint32_t SA2;
       uint32_t RESERVED1[45];
  volatile uint32_t Command;                 
  volatile const  uint32_t Status;
  volatile uint32_t RxDescriptor;
  volatile uint32_t RxStatus;
  volatile uint32_t RxDescriptorNumber;
  volatile const  uint32_t RxProduceIndex;
  volatile uint32_t RxConsumeIndex;
  volatile uint32_t TxDescriptor;
  volatile uint32_t TxStatus;
  volatile uint32_t TxDescriptorNumber;
  volatile uint32_t TxProduceIndex;
  volatile const  uint32_t TxConsumeIndex;
       uint32_t RESERVED2[10];
  volatile const  uint32_t TSV0;
  volatile const  uint32_t TSV1;
  volatile const  uint32_t RSV;
       uint32_t RESERVED3[3];
  volatile uint32_t FlowControlCounter;
  volatile const  uint32_t FlowControlStatus;
       uint32_t RESERVED4[34];
  volatile uint32_t RxFilterCtrl;            
  volatile uint32_t RxFilterWoLStatus;
  volatile uint32_t RxFilterWoLClear;
       uint32_t RESERVED5;
  volatile uint32_t HashFilterL;
  volatile uint32_t HashFilterH;
       uint32_t RESERVED6[882];
  volatile const  uint32_t IntStatus;               
  volatile uint32_t IntEnable;
  volatile  uint32_t IntClear;
  volatile  uint32_t IntSet;
       uint32_t RESERVED7;
  volatile uint32_t PowerDown;
       uint32_t RESERVED8;
  volatile uint32_t Module_ID;
} LPC_EMAC_TypeDef;


#pragma no_anon_unions



 
 
 
 
#line 924 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.H"

 
#line 945 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.H"

 
#line 959 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.H"

 
#line 972 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.H"

 







 
 
 
#line 1031 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.H"

#line 401 "main.c"







 

extern short plazma_adc_cnt;
extern char net_buff_cnt;
extern unsigned short net_buff[32],net_buff_;

extern char bRXIN0;


char cntrl_plazma;
extern char bOUT_FREE2;
extern char   av_bps[12],av_inv[6],av_dt[4],av_sk[4];

char content[63];









extern signed short samokalibr_cnt;



extern char mess[10],mess_old[10],mess_cnt[10];
extern short mess_par0[10],mess_par1[10],mess_data[2];




extern signed short 	main_kb_cnt;
extern signed short 	kb_cnt_1lev;
extern signed short 	kb_cnt_2lev;
extern char 			kb_full_ver;
extern char 			kb_start[2];




extern signed short cntrl_stat_old;
extern signed short cntrl_stat_new;
extern signed short Ibmax;




char sign_U[2],sign_I[2];
char superviser_cnt;


char plazma_plazma_plazma;

char bRESET=0;
char bRESET_EXT=0;
char ext_can_cnt;


signed short vvod_pos;



unsigned short adc_buff_ext_[3];
unsigned short Uvv[3];
unsigned short Uvv0;
short pos_vent;
short t_ext_can;
char t_ext_can_nd;




char eb2_data[30];
short eb2_data_short[10];
short Uvv_eb2[3],Upes_eb2[3];
short Kvv_eb2[3],Kpes_eb2[3];


signed long power_summary;
signed short power_current;



signed short main_vent_pos;
signed char t_box_cnt=0;
enum_mixer_vent_stat mixer_vent_stat=mvsOFF;
INT_BOX_TEMPER ibt;
enum_tbatdisable_stat tbatdisable_stat=tbdsON;
enum_tloaddisable_stat tloaddisable_stat=tldsON;
enum_av_tbox_stat av_tbox_stat=atsOFF;
signed short av_tbox_cnt;





enum_avt_stat avt_stat[12],avt_stat_old[12];



char snmp_plazma;


short plazma_but_an;

char bCAN_OFF;








short unet_drv_cnt;





enum_work_stat work_stat=wsOFF;

enum_onoff bps_stat=stOFF;

signed short _x_,_xu_;


signed short Kiload0;
signed short Kiload1;
signed short U_MAX;
signed short U_MIN;
signed short I_MAX;
signed short I_MIN;
signed short T_MAX;
signed short T_SIGN;
signed short I_ug;
signed short I_ug2;
signed short I_ug3;
signed short I_ug_block_cnt;
signed short U_up;
signed short U_up2;
signed short U_up3;
signed short U_up_block_cnt;
signed short U_maxg;
signed short I_maxp;
signed long 	T_PROC_GS;		
signed short 	T_PROC_GS_block_cnt;
signed short 	T_PROC_GS_MODE;	
signed long 	T_PROC_PS;		
signed short 	T_PROC_PS_block_cnt;
signed short 	T_PROC_PS_MODE;	
signed long T_PROC_MAX;			
signed short TIME_VISION;	
signed short TIME_VISION_PULT;
signed short I_MAX_IPS;		
signed short I_MIN_IPS;		
signed short I_LOAD_MODE;	
enum_main_menu_mode main_menu_mode;	
enum_restart_enable restart_enable;	
signed short RELE_LOG_CURR;			
signed short RELE_LOG_VOLT;			
signed short T_DEL_REL_CURR_START;		
signed short T_DEL_REL_CURR_WRK;			
signed short T_DEL_REL_VOLT_START;		
signed short T_DEL_REL_VOLT_WRK;			
signed short I_ug_ram;					
signed short U_up_ram;					
signed short DELT_REL_CURR_U;				
signed short DELT_REL_CURR_I;
signed short REL_VOLT_UMAX;				
signed short REL_VOLT_UMIN;
signed long time_proc;		
signed long time_proc_remain;	
signed long cap_time_proc;
char can2_plazma;
char plazma_restart;

signed long AMPERCHAS;	



short pult_time;
unsigned short pult_time_set;
short pult_u;
short pult_u_set;
short pult_i;
short pult_i_set;
enum_work_stat pult_work_stat;



enum_tumbler_stat tumbler_stat=tsI,tumbler_stat_old=tsI;


signed short plazma_vol_u_0,plazma_vol_u_1;

signed short U_up_d;

signed short I_ug_temp;
signed short U_up_temp;
signed short fiks_stat_I;
signed short fiks_stat_U;


enum_viz_stat viz_stat=vsOFF;
signed short viz_stat_cnt=0;



signed long delta_U_abs,delta_U_rel,delta_I_abs,delta_I_rel;
char bCURRENT_STAB;
signed short cnt_del_rel;

short main_cnt;



enum_rev_stat REV_STAT=rsFF;
short REV_IS_ON;
short AVT_REV_IS_ON;
short AVT_REV_TIME_FF;
short AVT_REV_TIME_REW;
short AVT_REV_TIME_PAUSE;
short AVT_REV_I_NOM_FF;
short AVT_REV_I_NOM_REW;
short AVT_REV_U_NOM_FF;
short AVT_REV_U_NOM_REW;
short time_proc_phase;
enum_proc_phase proc_phase=ppFF;



short CAP_ZAR_TIME;
short CAP_PAUSE1_TIME;
short CAP_RAZR_TIME;
short CAP_PAUSE2_TIME;
short CAP_MAX_VOLT;
short CAP_WRK_CURR;
short CAP_COUNTER;
short CAP_TIME_SEC;
short CAP_TIME_MIN;
short CAP_TIME_HOUR;


char  bOFF;
char bRAZR;

signed short RELE_FUNC[2];

U8 socket_tcp;



signed long milliAmperSecunda;



signed short curr_off_stop_cnt;
signed short curr_off_start_cnt;
signed short curr_off_temp;



short avg_main_cnt=20;
signed int i_avg_max,i_avg_min,i_avg_summ,i_avg; 
signed int avg;
char bAVG;
char avg_cnt;  
char avg_num; 
char num_of_dumm_src;
char num_of_max_src;
char bAVG_CNT;

short pvlk;

char eepromRamSwitch; 	
short ramModbusCnt;		


void rtc_init (void) 
{
((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->CCR=0x11;
}










 



signed short abs_pal(signed short in)
{
if(in<0)return -in;
else return in;
}


void init_ETH(void)
{
localm[0].IpAdr[0]=lc640_read_int(2000+4);
localm[0].IpAdr[1]=lc640_read_int(2000+6);
localm[0].IpAdr[2]=lc640_read_int(2000+8);
localm[0].IpAdr[3]=lc640_read_int(2000+10);

localm[0].NetMask[0]=lc640_read_int(2000+12);
localm[0].NetMask[1]=lc640_read_int(2000+14);
localm[0].NetMask[2]=lc640_read_int(2000+16);
localm[0].NetMask[3]=lc640_read_int(2000+18);

localm[0].DefGW[0]=lc640_read_int(2000+64);
localm[0].DefGW[1]=lc640_read_int(2000+66);
localm[0].DefGW[2]=lc640_read_int(2000+68);
localm[0].DefGW[3]=lc640_read_int(2000+70);

}



void ADC_IRQHandler(void) {
((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR &=  ~(7<<24);



adc_self_ch_buff[adc_self_ch_cnt]=(((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADGDR>>4) & 0xFFF; 
adc_self_ch_cnt++;
if(adc_self_ch_cnt<3)
	{
	((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR |=  (1<<24);
	}
else
	{

 
	
	}



 
}






































































 


void can_reset_hndl(void)
{


can_reset_cnt++;

if((can_reset_cnt>=3)&&(lc640_read_int(0x06)==0)&&(!(avar_stat&0x0001))&&(!bRESET))
	{
	lc640_write_int(0x06,1);
	bRESET=1;
	}

if((can_reset_cnt>=300)&&(lc640_read_int(0x06)==1)&&(!(avar_stat&0x0001))&&(!bRESET))
	{
	lc640_write_int(0x06,1);
	bRESET=1;
	}

if((main_1Hz_cnt>=20 )&&(lc640_read_int(0x06)!=0))
	{
	lc640_write_int(0x06,0);
	}




}


void net_drv(void)
{ 


	
	
	
	DU=UMAX;
	TZAS=3;

if(++cnt_net_drv>=35) cnt_net_drv=0; 

if(cnt_net_drv<=32) 
	{ 
	if(mess_find_unvol(33))
		{
		if(mess_data[0]==34)
			{
			
			if(a_ind . s_i1==cnt_net_drv)
				{
				return;
				}
			}
		}
	
	
	

			   
	if(!bCAN_OFF)mcp2515_transmit(cnt_net_drv,cnt_net_drv,0xED,bps[cnt_net_drv]._flags_tu,*((char*)(&bps[cnt_net_drv]._vol_u)),*((char*)((&bps[cnt_net_drv]._vol_u))+1),*((char*)(&bps[cnt_net_drv]._vol_i)),*((char*)((&bps[cnt_net_drv]._vol_i))+1));
     
	if(cnt_net_drv<32)
	     {
	     if(bps[cnt_net_drv]._cnt<60)
   	 		{    
   	 		bps[cnt_net_drv]._cnt++;
   	 		if( (bps[cnt_net_drv]._cnt>=60) && (!net_av) && (!(bps[cnt_net_drv]._av&0x08)) && (cnt_net_drv<NUMIST) ) 
   	 			{
   	 			
   	 			}
   	 		}
		else bps[cnt_net_drv]._cnt=60;
						
		if((bps[cnt_net_drv]._cnt>=3)&&(bps[cnt_net_drv]._cnt_old<3))bps[cnt_net_drv]._cnt_more2++;
		bps[cnt_net_drv]._cnt_old=bps[cnt_net_drv]._cnt;
	    }
	}
else if(cnt_net_drv==33)
	{
     if(!bCAN_OFF)mcp2515_transmit(0xff,0xff,0x62,*((char*)(&UMAX)),*((char*)((&UMAX))+1),*((char*)(&DU)),*((char*)((&DU))+1),0);
     } 
    
else if(cnt_net_drv==34)
	{
     if(!bCAN_OFF)mcp2515_transmit(0xff,0xff,0x29,*((char*)(&T_MAX)),*((char*)((&T_MAX))+1),*((char*)(&T_SIGN)),*((char*)((&T_SIGN))+1),((char)(I_MAX/10)));
     } 
	 
}




void parol_init(void)
{
parol[0]=0;
parol[1]=0;
parol[2]=0;
a_ind . s_i=0;
}


void pult_data_hndl(void)
{
if(main_menu_mode==mmmIT)
	{
	pult_u_set=U_maxg;
	pult_i_set=I_ug;
	pult_u=load_U;
	pult_i=load_I;
	if(T_PROC_GS_MODE)				
		{
		pult_time_set=0xffff;
		}
	else
		{
		if(TIME_VISION_PULT)pult_time_set=(short)(T_PROC_GS/60);
		else pult_time_set=(short)(T_PROC_GS);
		}

	if((TIME_VISION)||(T_PROC_GS_MODE))	
		{
		if(TIME_VISION_PULT)pult_time=(short)(time_proc/60);
		else pult_time=(short)(time_proc);
		}
	else
		{
		if(TIME_VISION_PULT)pult_time=(short)(time_proc_remain/60);
		else pult_time=(short)(time_proc_remain);
		}
	pult_work_stat=work_stat;
	}

if(main_menu_mode==mmmIN)
	{
	pult_u_set=U_up;
	pult_i_set=I_maxp;
	pult_u=load_U;
	pult_i=load_I;
	if(T_PROC_PS_MODE)				
		{
		pult_time_set=0xffff;
		}
	else
		{
		if(TIME_VISION_PULT)pult_time_set=(short)(T_PROC_PS/60);
		else pult_time_set=(short)(T_PROC_PS);
		}

	if((TIME_VISION)||(T_PROC_PS_MODE))	
		{
		if(TIME_VISION_PULT)pult_time=(short)(time_proc/60);
		else pult_time=(short)(time_proc);
		}
	else
		{
		if(TIME_VISION_PULT)pult_time=(short)(time_proc_remain/60);
		else pult_time=(short)(time_proc_remain);
		}
	pult_work_stat=work_stat;
	}


}


void bitmap_hndl(void)
{
short x,ii,i;
unsigned int ptr_bitmap;


for(ii=0;ii<488;ii++)
	{
	lcd_bitmap[ii]=0x00;
	}

	{
	for(i=0;i<4;i++)
		{
		ptr_bitmap=122*(unsigned)i;
		for(x=(20*i);x<((20*i)+20);x++)
	 		{

			if(lcd_buffer[x]==94)
				{
				lcd_bitmap[ptr_bitmap++]=0x7e;
				lcd_bitmap[ptr_bitmap++]=0x42;
				lcd_bitmap[ptr_bitmap++]=0x5a;
				lcd_bitmap[ptr_bitmap++]=0x5a;
				lcd_bitmap[ptr_bitmap++]=0x42;
				lcd_bitmap[ptr_bitmap++]=0x7e;
				}
			else
				{
				lcd_bitmap[ptr_bitmap++]=caracter[(unsigned)lcd_buffer[x]*6];
				lcd_bitmap[ptr_bitmap++]=caracter[((unsigned)lcd_buffer[x]*6)+1];
				lcd_bitmap[ptr_bitmap++]=caracter[((unsigned)lcd_buffer[x]*6)+2];
				lcd_bitmap[ptr_bitmap++]=caracter[((unsigned)lcd_buffer[x]*6)+3];
				lcd_bitmap[ptr_bitmap++]=caracter[((unsigned)lcd_buffer[x]*6)+4];
				lcd_bitmap[ptr_bitmap++]=caracter[((unsigned)lcd_buffer[x]*6)+5];
				}
			} 
		}
	}	
}


void ind_hndl(void)
{

const char* ptrs[40];

static char sub_cnt,sub_cnt1;
char  sub_cnt_max;




	   
sub_cnt_max=5;
i=0;






 

cnt_of_slave=NUMIST ;



sub_cnt1++;	
if(sub_cnt1>=20)
	{
	sub_cnt1=0;
	sub_cnt++;
	if(sub_cnt>=sub_cnt_max)
		{
		sub_cnt=0;
		}
	}


if(a_ind . i==iMn)
	{
	
	if(work_stat==wsCAP)
		{
		ptrs[0]=		"   ИСПЫТАНИЕ ФАЗА ! ";
		ptrs[1]=		" Iу    +А Umax    @B";
		ptrs[2]=		" I     #А U       $B";
		ptrs[3]=		" Цикл N   ^   0T:0s ";

		bgnd_par(ptrs[0],ptrs[1],ptrs[2],ptrs[3]);

		if(cap_time_proc<CAP_ZAR_TIME) sub_bgnd("A",'!',0);
		else if(cap_time_proc<(CAP_ZAR_TIME+CAP_PAUSE1_TIME)) sub_bgnd("B",'!',0);
		else if(cap_time_proc<(CAP_ZAR_TIME+CAP_PAUSE1_TIME+CAP_RAZR_TIME)) sub_bgnd("C",'!',0);
		else if(cap_time_proc<(CAP_ZAR_TIME+CAP_PAUSE1_TIME+CAP_RAZR_TIME+CAP_PAUSE2_TIME)) sub_bgnd("D",'!',0);
		
		int2lcd(CAP_WRK_CURR,'+',0);
		int2lcd(CAP_MAX_VOLT,'@',0);
		int2lcd(load_I/10,'#',0);
		int2lcd(load_U/10,'$',0);
		int2lcd(CAP_COUNTER+1,'^',0);
		int2lcd((cap_time_proc/10)%60,'s',0);
		int2lcd((cap_time_proc/10)/60,'T',0);
		}
	else if(main_menu_mode==mmmIT)
		{
		if(work_stat!=wsGS)	{	 	
	 		ptrs[0]=		" Источник тока  ^   ";
			
			if(REV_IS_ON) {
				if(AVT_REV_IS_ON) {
					ptrs[0]=		" Источник тока  ^   ";
				} else {
					if(REV_STAT==rsFF) ptrs[0]=		" Источник тока  ^>>>";
					if(REV_STAT==rsREW) ptrs[0]=		" Источник тока  ^<<<";
				}
			}
		}
		else if(work_stat==wsGS)	{		ptrs[0]=	" Источник тока      ";
			if((REV_IS_ON)&&(AVT_REV_IS_ON)&&((proc_phase==ppFF_P_REW)||(proc_phase==ppREW_P_FF))) {
				if(ind_fl_cnt&0x02)		ptrs[0]=	" Источник тока  ^ <>";
				else 				ptrs[0]=	" Источник тока      ";
			} else if(((REV_IS_ON)&&(REV_STAT==rsFF)) ) {
				if(ind_fl_cnt==0)	  	ptrs[0]=	" Источник тока  ^>  ";
				else if(ind_fl_cnt==1)	ptrs[0]=	" Источник тока  ^>> ";
				else if(ind_fl_cnt==2)	ptrs[0]=	" Источник тока  ^>>>";
				else if(ind_fl_cnt==3)	ptrs[0]=	" Источник тока  ^ >>";
				else if(ind_fl_cnt==4)	ptrs[0]=	" Источник тока  ^  >";
				else if(ind_fl_cnt==5)	ptrs[0]=	" Источник тока  ^   ";
			} else if((REV_IS_ON)&&(REV_STAT==rsREW)) {
				if(ind_fl_cnt==0)		ptrs[0]=	" Источник тока  ^  <";
				else if(ind_fl_cnt==1)	ptrs[0]=	" Источник тока  ^ <<";
				else if(ind_fl_cnt==2)	ptrs[0]=	" Источник тока  ^<<<";
				else if(ind_fl_cnt==3)	ptrs[0]=	" Источник тока  ^<< ";
				else if(ind_fl_cnt==4)	ptrs[0]=	" Источник тока  ^<  ";
				else if(ind_fl_cnt==5)	ptrs[0]=	" Источник тока  ^   ";
			}  
		}
		



 

		
		
		
	  	ptrs[1]=		" Iу    +А Umax    @B";
	   	ptrs[2]=		" Длит-сть.  0t:0T:0s";
		if(work_stat==wsGS) {
		ptrs[2]=		"      0t:0T:0s      ";
		if(ACH_OFF_EN)
		ptrs[2]=		" 0t:0T:0s      qА*ч ";
		}
	   	ptrs[3]=		" I     #А U       $B";
		ptrs[4]=		" Uмax.ист.тока    {В";
	   	ptrs[5]=		" Выход              ";
		ptrs[6]=		" Установки          ";
	   	ptrs[7]=		" Выпрямители        ";
	
	
		if(a_ind . s_i-a_ind . i_s>3)a_ind . i_s=a_ind . s_i-3;
		else if (a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
		
		if(unet_drv_cnt>15)	bgnd_par(	"  Авария питающей   ",
								"      сети!!!!      ",
								"  Отсутствует одна  ",
								" или несколько фаз. ");
		else 
			{
			bgnd_par(ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2],ptrs[a_ind . i_s+3]);
			pointer_set(0);
			}
	   	

		if((!REV_IS_ON)||(!AVT_REV_IS_ON))sub_bgnd(" ",'^',0);

		
		
		if(I_ug_temp<1000) {
			int2lcd(I_ug_temp,'+',1);
		} else {
			int2lcd(I_ug_temp/10,'+',0);
		}
		
	   	if(load_I<1000) {
			int2lcd(load_I,'#',1);
		} else {
			int2lcd(load_I/10,'#',0);
		}

		if(load_U<1000) {
			int2lcd(load_U,'$',1);
		} else {
			int2lcd(load_U/10,'$',0);
		}

		if(U_maxg<1000) {
			int2lcd(U_maxg,'{',1);
			int2lcd(U_maxg,'@',1);
		} else {
			int2lcd(U_maxg/10,'{',0);
			int2lcd(U_maxg/10,'@',0);
		}
		
	
			{
			if(work_stat==wsGS)
				{
				if((TIME_VISION)||(T_PROC_GS_MODE))
					{
					int2lcd(time_proc%60,'s',0);
					int2lcd((time_proc/60)%60,'T',0);
					int2lcd(time_proc/3600,'t',0);
					}
				else
					{
					int2lcd(time_proc_remain%60,'s',0);
					int2lcd((time_proc_remain/60)%60,'T',0);
					int2lcd(time_proc_remain/3600,'t',0);
					}
				if(bFL2)
					{
					sub_bgnd(" ",':',0);
					sub_bgnd(" ",':',0);
					}
				}
			else 
				{
				if(T_PROC_GS_MODE)				
					{
					sub_bgnd("непрерывно",'t',-3);
					}
				else
					{
					int2lcd(T_PROC_GS%60,'s',0);
					int2lcd((T_PROC_GS/60)%60,'T',0);
					int2lcd(T_PROC_GS/3600,'t',0);
					}
				}
			}
	
		int2lcd(AMPERCHAS,'q',1);

		
		
		
		
		
	 
		
		
		
		
		
		}
	else if(main_menu_mode==mmmIN)
		{
		if(work_stat!=wsPS)	{	 	
	 		ptrs[0]=		" Источник напр. ^   ";
			
			if(REV_IS_ON) {
				if(AVT_REV_IS_ON) {
					ptrs[0]=		" Источник напр. ^   ";
				} else {
					if(REV_STAT==rsFF) ptrs[0]=		" Источник напр. ^>>>";
					if(REV_STAT==rsREW) ptrs[0]=		" Источник напр. ^<<<";
				}
			}
		}
		else if(work_stat==wsPS)	{		ptrs[0]=	" Источник напр.     ";
			if((REV_IS_ON)&&(AVT_REV_IS_ON)&&((proc_phase==ppFF_P_REW)||(proc_phase==ppREW_P_FF))) {
				if(ind_fl_cnt&0x02)		ptrs[0]=	" Источник напр. ^ <>";
				else 				ptrs[0]=	" Источник напр.     ";
			} else if(((REV_IS_ON)&&(REV_STAT==rsFF)) ) {
				if(ind_fl_cnt==0)	  	ptrs[0]=	" Источник напр. ^>  ";
				else if(ind_fl_cnt==1)	ptrs[0]=	" Источник напр. ^>> ";
				else if(ind_fl_cnt==2)	ptrs[0]=	" Источник напр. ^>>>";
				else if(ind_fl_cnt==3)	ptrs[0]=	" Источник напр. ^ >>";
				else if(ind_fl_cnt==4)	ptrs[0]=	" Источник напр. ^  >";
				else if(ind_fl_cnt==5)	ptrs[0]=	" Источник напр. ^   ";
			} else if((REV_IS_ON)&&(REV_STAT==rsREW)) {
				if(ind_fl_cnt==0)		ptrs[0]=	" Источник напр. ^  <";
				else if(ind_fl_cnt==1)	ptrs[0]=	" Источник напр. ^ <<";
				else if(ind_fl_cnt==2)	ptrs[0]=	" Источник напр. ^<<<";
				else if(ind_fl_cnt==3)	ptrs[0]=	" Источник напр. ^<< ";
				else if(ind_fl_cnt==4)	ptrs[0]=	" Источник напр. ^<  ";
				else if(ind_fl_cnt==5)	ptrs[0]=	" Источник напр. ^   ";
			}  
		}

 






 
	  	ptrs[1]=		" Uу    %B Imax    }A";
	   	ptrs[2]=		" Длит-сть.  0t:0T:0s";
		if(work_stat==wsPS) {
		ptrs[2]=		"      0t:0T:0s      ";
		if(ACH_OFF_EN)
		ptrs[2]=		" 0t:0T:0s      qА*ч ";
		}
	   	ptrs[3]=		" U     &B I       #A";
		ptrs[4]=		" Iмax.ист.напр.   }A";
	   	ptrs[5]=		" Выход              ";
		ptrs[6]=		" Установки          ";
	   	ptrs[7]=		" Выпрямители        ";
	
	
		if(a_ind . s_i-a_ind . i_s>3)a_ind . i_s=a_ind . s_i-3;
		else if (a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
		
		if(unet_drv_cnt>15)	bgnd_par(	"  Авария питающей   ",
								"      сети!!!!      ",
								"  Отсутствует одна  ",
								" или несколько фаз. ");
		else 
			{
			bgnd_par(ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2],ptrs[a_ind . i_s+3]);
			pointer_set(0);
			}

		if((!REV_IS_ON)||(!AVT_REV_IS_ON))sub_bgnd(" ",'^',0);
	
	











 
	   	
		
		
	   	
		
		if(U_up_temp<1000) {
			int2lcd(U_up_temp,'%',1);
		} else {
			int2lcd(U_up_temp/10,'%',0);
		}
		
	   	if(load_U<1000) {
			int2lcd(load_U,'&',1); 
		} else {
			int2lcd(load_U/10,'&',0);
		}
		
		if(load_I<1000)int2lcd(load_I,'#',1);
		else int2lcd(load_I/10,'#',0);
		

	





 


		
		if(I_maxp<1000) {
			int2lcd(I_maxp,'}',1);
			int2lcd(I_maxp,'}',1);
		} else {
			int2lcd(I_maxp/10,'}',0);
			int2lcd(I_maxp/10,'}',0);
		}	
			{
			if(work_stat==wsPS)
				{
				if((TIME_VISION)||(T_PROC_PS_MODE))
					{
					int2lcd(time_proc%60,'s',0);
					int2lcd((time_proc/60)%60,'T',0);
					int2lcd(time_proc/3600,'t',0);
					}
				else
					{
					int2lcd(time_proc_remain%60,'s',0);
					int2lcd((time_proc_remain/60)%60,'T',0);
					int2lcd(time_proc_remain/3600,'t',0);
					}
				if(bFL2)
					{
					sub_bgnd(" ",':',0);
					sub_bgnd(" ",':',0);
					}
				}
			else 
				{
				if(T_PROC_PS_MODE)				
					{
					sub_bgnd("непрерывно",'t',-3);
					}
				else
					{
					int2lcd(T_PROC_PS%60,'s',0);
					int2lcd((T_PROC_PS/60)%60,'T',0);
					int2lcd(T_PROC_PS/3600,'t',0);
					}
				}
			}
	
		int2lcd(AMPERCHAS,'q',1);

	


 
		
		
		
		
		
		}
	else if(main_menu_mode==mmmITIN)
		{
			 	








 

		if(work_stat!=wsGS)	{	 	
	 		ptrs[0]=		" Источник тока  ^   ";
			
			if(REV_IS_ON) {
				if(AVT_REV_IS_ON) {
					ptrs[0]=		" Источник тока  ^>>>";
				} else {
					if(REV_STAT==rsFF) ptrs[0]=		" Источник тока  ^>>>";
					if(REV_STAT!=rsFF) ptrs[0]=		" Источник тока  ^<<<";
				}
			}
		}
		else if(work_stat==wsGS)	{		ptrs[0]=	" Источник тока      ";
			if(((REV_IS_ON)&&(REV_STAT==rsFF)) ) {
				if(ind_fl_cnt==0)	  	ptrs[0]=	" Источник тока  ^>  ";
				else if(ind_fl_cnt==1)	ptrs[0]=	" Источник тока  ^>> ";
				else if(ind_fl_cnt==2)	ptrs[0]=	" Источник тока  ^>>>";
				else if(ind_fl_cnt==3)	ptrs[0]=	" Источник тока  ^ >>";
				else if(ind_fl_cnt==4)	ptrs[0]=	" Источник тока  ^  >";
				else if(ind_fl_cnt==5)	ptrs[0]=	" Источник тока  ^   ";
			} else if((REV_IS_ON)&&(REV_STAT==rsREW)) {
				if(ind_fl_cnt==0)		ptrs[0]=	" Источник тока  ^  <";
				else if(ind_fl_cnt==1)	ptrs[0]=	" Источник тока  ^ <<";
				else if(ind_fl_cnt==2)	ptrs[0]=	" Источник тока  ^<<<";
				else if(ind_fl_cnt==3)	ptrs[0]=	" Источник тока  ^<< ";
				else if(ind_fl_cnt==4)	ptrs[0]=	" Источник тока  ^<  ";
				else if(ind_fl_cnt==5)	ptrs[0]=	" Источник тока  ^   ";
			}
		}

	  	ptrs[1]=		" Iу    +А Umax    @B";
	   	ptrs[2]=		" Длит-сть.  0t:0T:0s";
		if(work_stat==wsGS)	{
		ptrs[2]=		"      0t:0T:0s      ";
		if(ACH_OFF_EN)
		ptrs[2]=		" 0t:0T:0s      qА*ч ";
		}
	   	ptrs[3]=		" I     #А U       $B";

		if(work_stat!=wsPS)	{	 	
	 		ptrs[4]=		" Источник напр. ^   ";
			
			if(REV_IS_ON) {
				if(AVT_REV_IS_ON) {
					ptrs[4]=		" Источник напр. ^>>>";
				} else {
					if(REV_STAT==rsFF) ptrs[4]=		" Источник напр. ^>>>";
					if(REV_STAT!=rsFF) ptrs[4]=		" Источник напр. ^<<<";
				}
			}
		}
		else if(work_stat==wsPS)	{		ptrs[4]=	" Источник напр.     ";
			if(((REV_IS_ON)&&(REV_STAT==rsFF)) ) {
				if(ind_fl_cnt==0)	  	ptrs[4]=	" Источник напр. ^>  ";
				else if(ind_fl_cnt==1)	ptrs[4]=	" Источник напр. ^>> ";
				else if(ind_fl_cnt==2)	ptrs[4]=	" Источник напр. ^>>>";
				else if(ind_fl_cnt==3)	ptrs[4]=	" Источник напр. ^ >>";
				else if(ind_fl_cnt==4)	ptrs[4]=	" Источник напр. ^  >";
				else if(ind_fl_cnt==5)	ptrs[4]=	" Источник напр. ^   ";
			} else if((REV_IS_ON)&&(REV_STAT==rsREW)) {
				if(ind_fl_cnt==0)		ptrs[4]=	" Источник напр. ^  <";
				else if(ind_fl_cnt==1)	ptrs[4]=	" Источник напр. ^ <<";
				else if(ind_fl_cnt==2)	ptrs[4]=	" Источник напр. ^<<<";
				else if(ind_fl_cnt==3)	ptrs[4]=	" Источник напр. ^<< ";
				else if(ind_fl_cnt==4)	ptrs[4]=	" Источник напр. ^<  ";
				else if(ind_fl_cnt==5)	ptrs[4]=	" Источник напр. ^   ";
			}
		}

		if((work_stat==wsPS)&&(!bFL34))
		ptrs[4]=		"                    ";
	  	ptrs[5]=		" Uу    %B Imax    }A";
	   	ptrs[6]=		" Длит-сть.  0t:0T:0s";
		if(work_stat==wsPS){
		ptrs[6]=		"      0t:0T:0s      ";
		if(ACH_OFF_EN)
		ptrs[6]=		" 0t:0T:0s      qА*ч ";
		}
	   	ptrs[7]=		" U     &B I       #A";
		ptrs[8]=		" Uмax.ист.тока    {В";
		ptrs[9]=		" Iмax.ист.напр.   }A";
	   	ptrs[10]=		" Выход              ";
		ptrs[11]=		" Установки          ";
	   	ptrs[12]=		" Выпрямители        ";
	
	
		if(a_ind . s_i-a_ind . i_s>3)a_ind . i_s=a_ind . s_i-3;
		else if (a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
		
		if(unet_drv_cnt>15)	bgnd_par(	"  Авария питающей   ",
								"      сети!!!!      ",
								"  Отсутствует одна  ",
								" или несколько фаз. ");
		else 
			{
			bgnd_par(ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2],ptrs[a_ind . i_s+3]);
			pointer_set(0);
			}
		if((!REV_IS_ON)||(!AVT_REV_IS_ON))sub_bgnd(" ",'^',0);
	   	
		if(I_ug_temp<1000)int2lcd(I_ug_temp,'+',1);
		else int2lcd(I_ug_temp/10,'+',0);
		
	   	if(load_I<1000) {
			int2lcd(load_I,'#',1);
			int2lcd(load_I,'#',1);
		} else {
			int2lcd(load_I/10,'#',0);
			int2lcd(load_I/10,'#',0);
		}

		if(U_up_temp<1000) {
			int2lcd(U_up_temp,'%',1);
		} else {
			int2lcd(U_up_temp/10,'%',0);
		}
		
	   	if(load_U<1000) {
			int2lcd(load_U,'&',1);
			int2lcd(load_U,'$',1); 
		} else {
			int2lcd(load_U/10,'&',0);
			int2lcd(load_U/10,'$',0);
		}
		
		
		if(I_maxp<1000) {
			int2lcd(I_maxp,'}',1);
			int2lcd(I_maxp,'}',1);
		} else {
			int2lcd(I_maxp/10,'}',0);
			int2lcd(I_maxp/10,'}',0);
		}

		if(U_maxg<1000) {
			int2lcd(U_maxg,'{',1);
			int2lcd(U_maxg,'@',1);
		} else {
			int2lcd(U_maxg/10,'{',0);
			int2lcd(U_maxg/10,'@',0);
		}

	
		if(a_ind . i_s<=2)
			{
			if(work_stat==wsGS)
				{
				if((TIME_VISION)||(T_PROC_GS_MODE))
					{
					int2lcd(time_proc%60,'s',0);
					int2lcd((time_proc/60)%60,'T',0);
					int2lcd(time_proc/3600,'t',0);
					}
				else
					{
					int2lcd(time_proc_remain%60,'s',0);
					int2lcd((time_proc_remain/60)%60,'T',0);
					int2lcd(time_proc_remain/3600,'t',0);
					}
				if(bFL2)
					{
					sub_bgnd(" ",':',0);
					sub_bgnd(" ",':',0);
					}
				}
			else 
				{
				if(T_PROC_GS_MODE)				
					{
					sub_bgnd("непрерывно",'t',-3);
					}
				else
					{
					int2lcd(T_PROC_GS%60,'s',0);
					int2lcd((T_PROC_GS/60)%60,'T',0);
					int2lcd(T_PROC_GS/3600,'t',0);
					}
				}
			}
		else 
			{
			if(work_stat==wsPS)
				{
				if((TIME_VISION)||(T_PROC_PS_MODE))
					{
					int2lcd(time_proc%60,'s',0);
					int2lcd((time_proc/60)%60,'T',0);
					int2lcd(time_proc/3600,'t',0);
					}
				else
					{
					int2lcd(time_proc_remain%60,'s',0);
					int2lcd((time_proc_remain/60)%60,'T',0);
					int2lcd(time_proc_remain/3600,'t',0);
					}
				if(bFL2)
					{
					sub_bgnd(" ",':',0);
					sub_bgnd(" ",':',0);
					}
				}
			else 
				{
				if(T_PROC_PS_MODE)				
					{
					sub_bgnd("непрерывно",'t',-3);
					}
				else
					{
					int2lcd(T_PROC_PS%60,'s',0);
					int2lcd((T_PROC_PS/60)%60,'T',0);
					int2lcd(T_PROC_PS/3600,'t',0);
					}				
				}
			}

		int2lcd(AMPERCHAS,'q',1);
	
	


 
		
		
		
		
		
		}
	else 
		{

		if(work_stat!=wsPS)	{	 	
	 		ptrs[0]=		" Источник напр. ^   ";
			
			if(REV_IS_ON) {
				if(AVT_REV_IS_ON) {
					ptrs[0]=		" Источник напр. ^>>>";
				} else {
					if(REV_STAT==rsFF) ptrs[0]=		" Источник напр. ^>>>";
					if(REV_STAT!=rsFF) ptrs[0]=		" Источник напр. ^<<<";
				}
			}
		}
		else if(work_stat==wsPS)	{		ptrs[0]=	" Источник напр.     ";
			if(((REV_IS_ON)&&(REV_STAT==rsFF)) ) {
				if(ind_fl_cnt==0)	  	ptrs[0]=	" Источник напр. ^>  ";
				else if(ind_fl_cnt==1)	ptrs[0]=	" Источник напр. ^>> ";
				else if(ind_fl_cnt==2)	ptrs[0]=	" Источник напр. ^>>>";
				else if(ind_fl_cnt==3)	ptrs[0]=	" Источник напр. ^ >>";
				else if(ind_fl_cnt==4)	ptrs[0]=	" Источник напр. ^  >";
				else if(ind_fl_cnt==5)	ptrs[0]=	" Источник напр. ^   ";
			} else if((REV_IS_ON)&&(REV_STAT==rsREW)) {
				if(ind_fl_cnt==0)		ptrs[0]=	" Источник напр. ^  <";
				else if(ind_fl_cnt==1)	ptrs[0]=	" Источник напр. ^ <<";
				else if(ind_fl_cnt==2)	ptrs[0]=	" Источник напр. ^<<<";
				else if(ind_fl_cnt==3)	ptrs[0]=	" Источник напр. ^<< ";
				else if(ind_fl_cnt==4)	ptrs[0]=	" Источник напр. ^<  ";
				else if(ind_fl_cnt==5)	ptrs[0]=	" Источник напр. ^   ";
			}
		}



	  	ptrs[1]=		" Uу    %B Imax    }A";
	   	ptrs[2]=		" Длит-сть.  0t:0T:0s";
		if(work_stat==wsPS){
		ptrs[2]=		"      0t:0T:0s      ";
		if(ACH_OFF_EN)
		ptrs[2]=		" 0t:0T:0s      qА*ч ";
		}
	   	ptrs[3]=		" U     &B I       #A";			 	

		if(work_stat!=wsGS)	{	 	
	 		ptrs[4]=		" Источник тока  ^   ";
			
			if(REV_IS_ON) {
				if(AVT_REV_IS_ON) {
					ptrs[4]=		" Источник тока  ^>>>";
				} else {
					if(REV_STAT==rsFF) ptrs[4]=		" Источник тока  ^>>>";
					if(REV_STAT!=rsFF) ptrs[4]=		" Источник тока  ^<<<";
				}
			}
		}
		else if(work_stat==wsGS)	{		ptrs[4]=	" Источник тока      ";
			if(((REV_IS_ON)&&(REV_STAT==rsFF)) ) {
				if(ind_fl_cnt==0)	  	ptrs[4]=	" Источник тока  ^>  ";
				else if(ind_fl_cnt==1)	ptrs[4]=	" Источник тока  ^>> ";
				else if(ind_fl_cnt==2)	ptrs[4]=	" Источник тока  ^>>>";
				else if(ind_fl_cnt==3)	ptrs[4]=	" Источник тока  ^ >>";
				else if(ind_fl_cnt==4)	ptrs[4]=	" Источник тока  ^  >";
				else if(ind_fl_cnt==5)	ptrs[4]=	" Источник тока  ^   ";
			} else if((REV_IS_ON)&&(REV_STAT==rsREW)) {
				if(ind_fl_cnt==0)		ptrs[4]=	" Источник тока  ^  <";
				else if(ind_fl_cnt==1)	ptrs[4]=	" Источник тока  ^ <<";
				else if(ind_fl_cnt==2)	ptrs[4]=	" Источник тока  ^<<<";
				else if(ind_fl_cnt==3)	ptrs[4]=	" Источник тока  ^<< ";
				else if(ind_fl_cnt==4)	ptrs[4]=	" Источник тока  ^<  ";
				else if(ind_fl_cnt==5)	ptrs[4]=	" Источник тока  ^   ";
			}
		}
	  	ptrs[5]=		" Iу    +А Umax    @B";
	   	ptrs[6]=		" Длит-сть.  0t:0T:0s";
		if(work_stat==wsGS){
		ptrs[6]=		"      0t:0T:0s      ";
		if(ACH_OFF_EN)
		ptrs[6]=		" 0t:0T:0s      qА*ч ";
		}
	   	ptrs[7]=		" I     #А U       $B";
		ptrs[8]=		" Uмax.ист.тока    {В";
		ptrs[9]=		" Iмax.ист.напр.   }A";
	   	ptrs[10]=		" Выход              ";
		ptrs[11]=		" Установки          ";
	   	ptrs[12]=		" Выпрямители        ";
	
	
		if(a_ind . s_i-a_ind . i_s>3)a_ind . i_s=a_ind . s_i-3;
		else if (a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
		
		if(unet_drv_cnt>15)	bgnd_par(	"  Авария питающей   ",
								"      сети!!!!      ",
								"  Отсутствует одна  ",
								" или несколько фаз. ");
		else 
			{
			bgnd_par(ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2],ptrs[a_ind . i_s+3]);
			pointer_set(0);
			}
	
		if((!REV_IS_ON)||(!AVT_REV_IS_ON))sub_bgnd(" ",'^',0);
	   	
		if(I_ug_temp<1000)int2lcd(I_ug_temp,'+',1);
		else int2lcd(I_ug_temp/10,'+',0);
		
	   	if(load_I<1000) {
			int2lcd(load_I,'#',1);
			int2lcd(load_I,'#',1);
		} else {
			int2lcd(load_I/10,'#',0);
			int2lcd(load_I/10,'#',0);
		}
		
	   	
		if(U_up_temp<1000) {
			int2lcd(U_up_temp,'%',1);
		} else {
			int2lcd(U_up_temp/10,'%',0);
		}
		
	   	
		if(load_I<1000) {
			int2lcd(load_I,'#',1);
			int2lcd(load_I,'#',1);
		} else {
			int2lcd(load_I/10,'#',0);
			int2lcd(load_I/10,'#',0);
		}
		
		

		if(load_U<1000) {
			int2lcd(load_U,'&',1);
			int2lcd(load_U,'$',1); 
		} else {
			int2lcd(load_U/10,'&',0);
			int2lcd(load_U/10,'$',0);
		}

		if(U_maxg<1000) {
			int2lcd(U_maxg,'{',1);
			int2lcd(U_maxg,'@',1);
		} else {
			int2lcd(U_maxg/10,'{',0);
			int2lcd(U_maxg/10,'@',0);
		}

		if(I_maxp<1000) {
			int2lcd(I_maxp,'}',1);
			int2lcd(I_maxp,'}',1);
		} else {
			int2lcd(I_maxp/10,'}',0);
			int2lcd(I_maxp/10,'}',0);
		}

	
		if(a_ind . i_s<=2)
			{
			if(work_stat==wsPS)
				{
				if((TIME_VISION)||(T_PROC_PS_MODE))
					{
					int2lcd(time_proc%60,'s',0);
					int2lcd((time_proc/60)%60,'T',0);
					int2lcd(time_proc/3600,'t',0);
					}
				else
					{
					int2lcd(time_proc_remain%60,'s',0);
					int2lcd((time_proc_remain/60)%60,'T',0);
					int2lcd(time_proc_remain/3600,'t',0);
					}
				if(bFL2)
					{
					sub_bgnd(" ",':',0);
					sub_bgnd(" ",':',0);
					}
				}
			else 
				{
				if(T_PROC_PS_MODE)				
					{
					sub_bgnd("непрерывно",'t',-3);
					}
				else
					{
					int2lcd(T_PROC_PS%60,'s',0);
					int2lcd((T_PROC_PS/60)%60,'T',0);
					int2lcd(T_PROC_PS/3600,'t',0);
					}				
				}
			}
		else 
			{
			if(work_stat==wsGS)
				{
				if((TIME_VISION)||(T_PROC_GS_MODE))
					{
					int2lcd(time_proc%60,'s',0);
					int2lcd((time_proc/60)%60,'T',0);
					int2lcd(time_proc/3600,'t',0);
					}
				else
					{
					int2lcd(time_proc_remain%60,'s',0);
					int2lcd((time_proc_remain/60)%60,'T',0);
					int2lcd(time_proc_remain/3600,'t',0);
					}
				if(bFL2)
					{
					sub_bgnd(" ",':',0);
					sub_bgnd(" ",':',0);
					}
				}
			else 
				{
				if(T_PROC_GS_MODE)				
					{
					sub_bgnd("непрерывно",'t',-3);
					}
				else
					{
					int2lcd(T_PROC_GS%60,'s',0);
					int2lcd((T_PROC_GS/60)%60,'T',0);
					int2lcd(T_PROC_GS/3600,'t',0);
					}
				}
			}
	

		int2lcd(AMPERCHAS,'q',1);

	 
		
		
		
		
		}
		
		
		
		
	





 
	




 





 

 
		
				


 
	
	
	
	
	



 
	
 



















 
	if(work_stat!=wsGS) fiks_stat_I=0;
	if(work_stat!=wsPS) fiks_stat_U=0;


	
 
	



 	

	}




 else if(a_ind . i==iBps)
	{
	

	if(NUMIST==1) {
		bgnd_par(			"N   U,В  I,A  t°C   ",
						"     .    .         ",
						" Выход              ",
						"                    ");
	
		int2lcdyx(1,1,0,0);
		
		if(bps[0]._Uii<10000)int2lcdyx(bps[0]._Uii,1,6,1);
		else int2lcdyx(bps[0]._Uii/10,1,6,0);	
			
		int2lcdyx(bps[0]._Ii,1,11,1);
		
		int2lcdyx(bps[0]._Ti,1,15,0);
				
		char2lcdhyx(bps[0]._flags_tm,1,19);
				
		lcd_buffer[40]=1;
		
	} else {
		if((a_ind . s_i>=(NUMIST-2))) {
			bgnd_par(			"N   U,В  I,A  t°C   ",
							"     .    .         ",
							"     .    .         ",
							" Выход              ");
		} else { 
			bgnd_par(			"N   U,В  I,A  t°C   ",
							"     .    .         ",
							"     .    .         ",
							"     .    .         ");
		}
	
		if(a_ind . s_i>=6)
			{
			int2lcdyx(a_ind . s_i+1,1,1,0);
			int2lcdyx(a_ind . s_i+2,2,1,0);
			}
		else 
			{
			int2lcdyx(a_ind . s_i+1,1,0,0);
			int2lcdyx(a_ind . s_i+2,2,0,0);
			}
		
			
			
		if(bps[a_ind . s_i  ]._Uii<10000)	int2lcdyx(bps[a_ind . s_i  ]._Uii,1,6,1);
		else							int2lcdyx(bps[a_ind . s_i  ]._Uii/10,1,6,0); 
		if(bps[a_ind . s_i+1]._Uii<10000)	int2lcdyx(bps[a_ind . s_i+1]._Uii,2,6,1);
		else 							int2lcdyx(bps[a_ind . s_i+1]._Uii/10,2,6,0);
		
		int2lcdyx(bps[a_ind . s_i  ]._Ii,1,11,1);
		int2lcdyx(bps[a_ind . s_i+1]._Ii,2,11,1);
		
		
		int2lcdyx(bps[a_ind . s_i  ]._Ti,1,15,0);
		int2lcdyx(bps[a_ind . s_i+1]._Ti,2,15,0);
		
		
		char2lcdhyx(bps[a_ind . s_i1  ]._flags_tm,1,19);
		char2lcdhyx(bps[a_ind . s_i1+1]._flags_tm,2,19);
		
		
		if((a_ind . s_i<(NUMIST-2))) {
		if(a_ind . s_i>=6)int2lcdyx(a_ind . s_i+3,3,1,0);
		else int2lcdyx(a_ind . s_i+3,3,0,0);
		if(bps[a_ind . s_i+2]._Uii<10000)	int2lcdyx(bps[a_ind . s_i+2]._Uii,3,6,1);
		else 							int2lcdyx(bps[a_ind . s_i+2]._Uii/10,3,6,0);
		int2lcdyx(bps[a_ind . s_i+2]._Ii,3,11,1);
		int2lcdyx(bps[a_ind . s_i+2]._Ti,3,15,0);
		char2lcdhyx(bps[a_ind . s_i1+2]._flags_tm,3,19);
		} else {
		lcd_buffer[60]=1;
		}

		




 

	}
					



 
		
	

 			
		

	 








 

	
     }  

else if(a_ind . i==iLoad)
	{
	bgnd_par(		"      НАГРУЗКА      ",
				" Uнагр =     [В     ",
				" Iнагр =     ]А     ",
				sm_exit);
	lcd_buffer[60]=1;
	     	
     int2lcd(load_U,'[',1);
     int2lcd(load_I,']',1);

     
                   	      	   	    		
     }





else if(a_ind . i==iVent)
	{

	ptrs[0]=  		" Fвент.текущ.     !%";
     ptrs[1]=  		" Fвент.max. (  @%) #";
	ptrs[2]=  	     " Выход              ";

	bgnd_par(			"     ВЕНТИЛЯТОР     ",
					ptrs[a_ind . i_s],
					ptrs[a_ind . i_s+1],
					ptrs[a_ind . i_s+2]);

	pointer_set(1);

     int2lcd(main_vent_pos*5,'!',0);
	int2lcd(pos_vent,'#',0);
	int2lcd(pos_vent*5+45,'@',0);     
	}

else if(a_ind . i==iAvtRev)
	{

	if(AVT_REV_IS_ON)
		{
		ptrs[0]=  	" Включен            ";
		}
	else 
		{
		ptrs[0]=  	" Выключен           ";
		}

	ptrs[1]=  		" Tпрям.     0{:0}:0[";
	ptrs[2]=  	     " Тобр.      0(:0):0]";
	ptrs[3]=  	     " Тперекл.      0<:0>";
	ptrs[4]=  	     " Iст.пр.          !А";
	ptrs[5]=  	     " Iст.обр.         @А";
	ptrs[6]=  	     " Uст.пр.          #B";
	ptrs[7]=  	     " Uст.обр.         $B";
	ptrs[8]=  	     " Выход              ";	
	
	if(a_ind . s_i-a_ind . i_s>2)a_ind . i_s=a_ind . s_i-2;
	else if (a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	
	bgnd_par(			"     АВТОРЕВЕРС     ",
					ptrs[a_ind . i_s],
					ptrs[a_ind . i_s+1],
					ptrs[a_ind . i_s+2]);	
		
	pointer_set(1);

	int2lcd(AVT_REV_TIME_FF%60,'[',0);
	int2lcd((AVT_REV_TIME_FF/60)%60,'}',0);
	int2lcd(AVT_REV_TIME_FF/3600,'{',0);
	int2lcd(AVT_REV_TIME_REW%60,']',0);
	int2lcd((AVT_REV_TIME_REW/60)%60,')',0);
	int2lcd(AVT_REV_TIME_REW/3600,'(',0);
	int2lcd(AVT_REV_TIME_PAUSE%60,'>',0);
	int2lcd((AVT_REV_TIME_PAUSE/60)%60,'<',0);
	int2lcd(AVT_REV_I_NOM_FF,'!',1);
	int2lcd(AVT_REV_I_NOM_REW,'@',1);
	int2lcd(AVT_REV_U_NOM_FF,'#',1);
	int2lcd(AVT_REV_U_NOM_REW,'$',1);
	   
	}

else if(a_ind . i==iAvt)
	{
     ptrs[0]=  		"  АВТОМАТЫ НАГРУЗОК ";
	ptrs[1]=  		" Автомат №1       ! ";
	ptrs[2]=  		" Автомат №2       @ ";
	ptrs[3]=  		" Автомат №3       # ";
	ptrs[4]=  		" Автомат №4       $ ";
	ptrs[5]=  		" Автомат №5       % ";
	ptrs[6]=  		" Автомат №6       ^ ";
	ptrs[7]=  		" Автомат №7       & ";
	ptrs[8]=  		" Автомат №8       * ";
	ptrs[9]=  		" Автомат №9       ( ";
	ptrs[10]=  		" Автомат №10      ) ";
	ptrs[11]=  		" Автомат №11      + ";
	ptrs[12]=  		" Автомат №12      = ";

	ptrs[1+NUMAVT]=  	" Выход              ";
	ptrs[2+NUMAVT]=  	"                    ";
	ptrs[3+NUMAVT]=  	"                    ";

	bgnd_par(		ptrs[0],
				ptrs[a_ind . i_s+1],
				ptrs[a_ind . i_s+2],
				ptrs[a_ind . i_s+3]);

	if(a_ind . s_i-a_ind . i_s>2)a_ind . i_s=a_ind . s_i-2;
	else if (a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	pointer_set(1);

	

	if(avt_stat[0]==avtON)	sub_bgnd("ВКЛ.",'!',-3);
	else 				sub_bgnd("ВЫКЛ.",'!',-4);
	if(avt_stat[1]==avtON)	sub_bgnd("ВКЛ.",'@',-3);
	else 				sub_bgnd("ВЫКЛ.",'@',-4);
	if(avt_stat[2]==avtON)	sub_bgnd("ВКЛ.",'#',-3);
	else 				sub_bgnd("ВЫКЛ.",'#',-4);
	if(avt_stat[3]==avtON)	sub_bgnd("ВКЛ.",'$',-3);
	else 				sub_bgnd("ВЫКЛ.",'$',-4);
	if(avt_stat[4]==avtON)	sub_bgnd("ВКЛ.",'%',-3);
	else 				sub_bgnd("ВЫКЛ.",'%',-4);
	if(avt_stat[5]==avtON)	sub_bgnd("ВКЛ.",'^',-3);
	else 				sub_bgnd("ВЫКЛ.",'^',-4);
	if(avt_stat[6]==avtON)	sub_bgnd("ВКЛ.",'&',-3);
	else 				sub_bgnd("ВЫКЛ.",'&',-4);
	if(avt_stat[7]==avtON)	sub_bgnd("ВКЛ.",'*',-3);
	else 				sub_bgnd("ВЫКЛ.",'*',-4);
	if(avt_stat[8]==avtON)	sub_bgnd("ВКЛ.",'(',-3);
	else 				sub_bgnd("ВЫКЛ.",'(',-4);
	if(avt_stat[9]==avtON)	sub_bgnd("ВКЛ.",')',-3);
	else 				sub_bgnd("ВЫКЛ.",')',-4);
	if(avt_stat[10]==avtON)	sub_bgnd("ВКЛ.",'+',-3);
	else 				sub_bgnd("ВЫКЛ.",'+',-4); 
	if(avt_stat[11]==avtON)	sub_bgnd("ВКЛ.",'=',-3);
	else 				sub_bgnd("ВЫКЛ.",'=',-4);
     
     

     
     

     
     
     
     }

else if(a_ind . i==iEnerg)
	{
     ptrs[0]=  		"  ЭЛЕКТРОСНАБЖЕНИЕ  ";

     ptrs[1]=  		" Ввод       #В      ";
     ptrs[2]=  	     " ПЭС        $В      ";            
     ptrs[3]=  	     " Pсумм.       %кВт*ч";
	ptrs[4]=  	     " Pтекущ.      ^Вт   ";
	ptrs[5]=  	     " Выход              ";
	ptrs[6]=  	     "                    ";
	ptrs[7]=  	     "                    ";

	bgnd_par(		ptrs[0],
				ptrs[a_ind . i_s+1],
				ptrs[a_ind . i_s+2],
				ptrs[a_ind . i_s+3]);

	if(a_ind . s_i-a_ind . i_s>2)a_ind . i_s=a_ind . s_i-2;
	else if (a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	pointer_set(1);

	int2lcd(Uvv0,'#',0);
     int2lcd(Uvv[1],'$',0);
     

     long2lcd_mmm(power_summary,'%',2);
     int2lcd(power_current,'^',0);

     
     
     
     }

else if(a_ind . i==iEnerg3)
	{
     ptrs[0]=  		"  ЭЛЕКТРОСНАБЖЕНИЕ  ";

     ptrs[1]=  		" Ввод ф.A    !В     ";
	ptrs[2]=  		" Ввод ф.B    @В     ";
	ptrs[3]=  		" Ввод ф.C    #В     ";
     ptrs[4]=  	     " ПЭС  ф.A    &В     ";
     ptrs[5]=  	     " ПЭС  ф.B    )В     ";
     ptrs[6]=  	     " ПЭС  ф.C    (В     ";		            
     ptrs[7]=  	     " Pсумм.       %кВт*ч";
	ptrs[8]=  	     " Pтекущ.      ^Вт   ";
	ptrs[9]=  	     " Выход              ";
	ptrs[10]=  	     "                    ";
	ptrs[11]=  	     "                    ";

	bgnd_par(		ptrs[0],
				ptrs[a_ind . i_s+1],
				ptrs[a_ind . i_s+2],
				ptrs[a_ind . i_s+3]);

	if(a_ind . s_i-a_ind . i_s>2)a_ind . i_s=a_ind . s_i-2;
	else if (a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	pointer_set(1);

	int2lcd(Uvv_eb2[0],'!',0);
	int2lcd(Uvv_eb2[1],'@',0);
	int2lcd(Uvv_eb2[2],'#',0);
	int2lcd(Upes_eb2[0],'&',0);
	int2lcd(Upes_eb2[1],')',0);
	int2lcd(Upes_eb2[2],'(',0);
     long2lcd_mmm(power_summary,'%',3);
     int2lcd(power_current,'^',0);

     }




		 
else if(a_ind . i==iBatLog)
	{
	if(BAT_IS_ON[a_ind . s_i1]==bisON)ptrs[0]=" Введена  0!/@  /0# ";
	else ptrs[0]=" Выведена 0!/@  /0# ";
     ptrs[1]=" Номин.емк.     $A*ч";
     ptrs[2]=" Наработка      %ч. ";
     ptrs[3]=" Контроль емкости   ";
     ptrs[4]=" Выравнивающий заряд";
     ptrs[5]=" Разряды            ";
     ptrs[6]=sm_exit;	
	if((a_ind . s_i-a_ind . i_s)>1)a_ind . i_s=a_ind . s_i-1;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par(	" БАТАРЕЙНЫЙ ЖУРНАЛ  ",
			"     БАТАРЕЯ N^     ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1]);
	pointer_set(2);	

	int2lcd(a_ind . s_i1+1,'^',0); 
	int2lcd(BAT_DAY_OF_ON[a_ind . s_i1],'!',0);
	sub_bgnd(sm_mont[BAT_MONTH_OF_ON[a_ind . s_i1]],'@',0);
	int2lcd(BAT_YEAR_OF_ON[a_ind . s_i1],'#',0); 
	int2lcd(BAT_C_NOM[a_ind . s_i1],'$',0);
	int2lcd(BAT_RESURS[a_ind . s_i1],'%',0);
	}




	
else if((a_ind . i==iSet_prl)||(a_ind . i==iK_prl))
	{
	bgnd_par("  Введите  пароль   ",sm_,sm_,sm_);
	int2lcdyx(parol[0],1,8,0);
     int2lcdyx(parol[1],1,9,0);
     int2lcdyx(parol[2],1,10,0);
     lcd_buffer[48+a_ind . s_i]='¤';
	}	
		

	
else if(a_ind . i==iSet)
	{

    	ptrs[0]=				" Источников        !";
	ptrs[1]=				" Максимальная длит- ";
    	ptrs[2]=				" сть процесса  0[:0]";
	ptrs[3]=				" Отображение времени";
	ptrs[4]=				" процесса          @";
	ptrs[5]=				" Отображение времени";
	ptrs[6]=				" на пульте         #";
	ptrs[7]=				" Измерение тока     ";
	ptrs[8]=				" нагрузки          $";
	ptrs[9]=				" Режим главного меню";
	ptrs[10]=				"                   %";
	ptrs[11]=				" Фиксированные      ";
	ptrs[12]=				"           настройки";
	ptrs[13]=				" Реле               ";
	ptrs[14]=				" токоограничения    ";
	ptrs[15]=				" Реле контроля      ";
	ptrs[16]=				" напряжения         ";
	ptrs[17]=				" Рестарт           ^";
	ptrs[18]=				" Ethernet           ";
	ptrs[19]=				" MODBUS ADRESS     <";
	ptrs[20]=				" MODBUS BAUDRATE    ";
	ptrs[21]=				"                  >0";
	ptrs[22]=				" Автореверс         ";
	ptrs[23]=				" Плавное нарастание ";
	ptrs[24]=				" тока          (сек.";
	ptrs[25]=				" Управление сухим   ";
	ptrs[26]=				" контактом          ";
	ptrs[27]=				" Настройка реле     ";
	ptrs[28]=				" Выключение по      ";
	ptrs[29]=				" счетчику амперчасов";
	ptrs[30]=				" Выключение по      ";
	ptrs[31]=				" снижению тока      ";
	ptrs[32]=				" Uавар           +B ";
	ptrs[35-2]=		" Выход              ";
	ptrs[35-1]=		" Калибровка         ";
	ptrs[35]=		" Тест ШИМ           ";
	ptrs[35+1]=		"                    ";
	ptrs[35+2]=		"                    ";	        
	
	if((a_ind . s_i-a_ind . i_s)>2)a_ind . i_s=a_ind . s_i-2;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par(	"     УСТАНОВКИ      ",
				ptrs[a_ind . i_s],
				ptrs[a_ind . i_s+1],
				ptrs[a_ind . i_s+2]);

	pointer_set(1);	
	





 

	int2lcd(NUMIST,'!',0);
	int2lcd((T_PROC_MAX/60)%60,']',0);
	int2lcd(T_PROC_MAX/3600,'[',0);
	if(TIME_VISION)
     	{
     	sub_bgnd("прямое",'@',-5);
     	}
	else sub_bgnd("обратное",'@',-7); 

	if(TIME_VISION_PULT)
     	{
     	sub_bgnd("чч:мм",'#',-4);
     	}
	else sub_bgnd("мм:сс",'#',-4);
	
	if(I_LOAD_MODE)
     	{
     	sub_bgnd("шунт",'$',-3);
     	}
	else sub_bgnd("суммIбпс",'$',-7);

	if(main_menu_mode==mmmIT) 	  	sub_bgnd("источник тока",'%',-12);
	else if(main_menu_mode==mmmIN) 	sub_bgnd("источник напряжения",'%',-18);
	else if(main_menu_mode==mmmITIN) 	sub_bgnd("ист.тока-ист.напр.",'%',-17);
	else 						sub_bgnd("ист.напр.-ист.тока",'%',-17);

	if(restart_enable==reON) 	  	sub_bgnd("ВКЛ.",'^',-3);
	else 						sub_bgnd("ВЫКЛ.",'^',-4);
	

	int2lcd(MODBUS_ADRESS,'<',0);
	int2lcd(MODBUS_BAUDRATE,'>',0);

	if(CURR_FADE_IN==0) 	  	sub_bgnd("ВЫКЛ.",'(',0);
	else 					int2lcd(CURR_FADE_IN,'(',0);

	int2lcd(UMAX,'+',1);

	
	
	}





else if(a_ind . i==iSet_T)
	{
	static char phase_cnt;
	if(++phase_cnt>=15)
	     {
	     phase_cnt=0;
	     if(++phase>=3)phase=0;
	     }
	ptrs[0]=sm_time;
	ptrs[1]=sm_;
	if(phase==0)ptrs[2]="     <> - выбор     ";
     if(phase==1)ptrs[2]="   ^v - установка   ";
     if(phase==2)ptrs[2]="     ¤  - выход     ";
	
	bgnd_par(" УСТАНОВКА  ВРЕМЕНИ ",ptrs[0],ptrs[1],ptrs[2]);
     if(a_ind . s_i==0)lcd_buffer[42]='^';
     else if(a_ind . s_i==1)lcd_buffer[45]='^';
     else if(a_ind . s_i==2)lcd_buffer[48]='^';
     else if(a_ind . s_i==3)lcd_buffer[51]='^';
     else if(a_ind . s_i==4)lcd_buffer[54]='^';
     else if(a_ind . s_i==5)lcd_buffer[58]='^';
  
 	int2lcd(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->SEC,'&',0);
 	int2lcd(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MIN,'^',0);
 	int2lcd(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->HOUR,'%',0);
 	
 	int2lcd(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->DOM,'<',0);
 	sub_bgnd(sm_mont[((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MONTH],'>',0);
 	int2lcd(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->YEAR,'{',0);
 	if(bFL2)
 	     {
 	     lcd_buffer[find(':')]=' ';
 	     lcd_buffer[find(':')]=' ';
 	     }  
	}  

else if (a_ind . i==iLan_set)
	{
	char sss[10]="abcdef";
	char i;
	 
	ptrs[0]=	" Ethernet         ! ";
	ptrs[1]=	" DHCPклиент       @ ";
	ptrs[2]=	" IPадрес            ";
	ptrs[3]=	"  000.000.000.00#   ";
	ptrs[4]=	" Маска подсети      ";
	ptrs[5]=	"  000.000.000.00$   ";
	ptrs[6]=	" Шлюз               ";
	ptrs[7]=	"  000.000.000.00)   ";
	ptrs[8]=	" Порт.чтения       [";
	ptrs[9]=	" Порт.записи       ]";
	ptrs[10]=	" Community <        ";
	ptrs[11]=	" Адресат для TRAP N1";
	ptrs[12]=	"  000.000.000.00%   ";
	ptrs[13]=	" Адресат для TRAP N2";
	ptrs[14]=	"  000.000.000.00^   ";
	ptrs[15]=	" Адресат для TRAP N3";
	ptrs[16]=	"  000.000.000.00&   ";
	ptrs[17]=	" Адресат для TRAP N4";
	ptrs[18]=	"  000.000.000.00*   ";
	ptrs[19]=	" Адресат для TRAP N5";
	ptrs[20]=	"  000.000.000.00(   ";
	ptrs[21]=	" Выход              ";

	
	if(!ETH_IS_ON || (lc640_read_int(2000+72)))
		{
		ptrs[1]=" Выход              ";
		ptrs[2]="                    ";
		ptrs[3]="                    ";
		}

	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;

     bgnd_par(	" УСТАНОВКИ Ethernet ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1],
			ptrs[a_ind . i_s+2]);
	
	pointer_set(1);
     if(ETH_IS_ON && (lc640_read_int(2000+72)!=1))
     	{
     	sub_bgnd("ВКЛ.",'!',-3);   
     	}
     else 
     	{
     	sub_bgnd("ВЫКЛ.",'!',-4);   
     	}

     if(ETH_DHCP_ON)
     	{
     	sub_bgnd("ВКЛ.",'@',-3);   
     	}
     else 
     	{
     	sub_bgnd("ВЫКЛ.",'@',-4);   
     	}
		  
	if(a_ind . s_i==2)	ip2lcd(ETH_IP_1,ETH_IP_2,ETH_IP_3,ETH_IP_4,'#',(a_ind . s_i1+1));
	else ip2lcd(ETH_IP_1,ETH_IP_2,ETH_IP_3,ETH_IP_4,'#',0);
	if(a_ind . s_i==4)	ip2lcd(ETH_MASK_1,ETH_MASK_2,ETH_MASK_3,ETH_MASK_4,'$',(a_ind . s_i1+1));
	else ip2lcd(ETH_MASK_1,ETH_MASK_2,ETH_MASK_3,ETH_MASK_4,'$',0);
	if(a_ind . s_i==6)	ip2lcd(ETH_GW_1,ETH_GW_2,ETH_GW_3,ETH_GW_4,')',(a_ind . s_i1+1));
	else ip2lcd(ETH_GW_1,ETH_GW_2,ETH_GW_3,ETH_GW_4,')',0);

	int2lcd(ETH_SNMP_PORT_READ,'[',0);
	int2lcd(ETH_SNMP_PORT_WRITE,']',0);

	if( (ETH_TRAP1_IP_1==255) && (ETH_TRAP1_IP_2==255) && (ETH_TRAP1_IP_3==255) && (ETH_TRAP1_IP_4==255) ) sub_bgnd("    неактивен    ",'%',-14);
	else
		{
		if(a_ind . s_i==11)	ip2lcd(ETH_TRAP1_IP_1,ETH_TRAP1_IP_2,ETH_TRAP1_IP_3,ETH_TRAP1_IP_4,'%',(a_ind . s_i1+1));
		else ip2lcd(ETH_TRAP1_IP_1,ETH_TRAP1_IP_2,ETH_TRAP1_IP_3,ETH_TRAP1_IP_4,'%',0);
		}

	if( (ETH_TRAP2_IP_1==255) && (ETH_TRAP2_IP_2==255) && (ETH_TRAP2_IP_3==255) && (ETH_TRAP2_IP_4==255) ) sub_bgnd("    неактивен    ",'^',-14);
	else
		{
		if(a_ind . s_i==13)	ip2lcd(ETH_TRAP2_IP_1,ETH_TRAP2_IP_2,ETH_TRAP2_IP_3,ETH_TRAP2_IP_4,'^',(a_ind . s_i1+1));
		else ip2lcd(ETH_TRAP2_IP_1,ETH_TRAP2_IP_2,ETH_TRAP2_IP_3,ETH_TRAP2_IP_4,'^',0);
		}

	if( (ETH_TRAP3_IP_1==255) && (ETH_TRAP3_IP_2==255) && (ETH_TRAP3_IP_3==255) && (ETH_TRAP3_IP_4==255) ) sub_bgnd("    неактивен    ",'&',-14);
	else
		{
		if(a_ind . s_i==15)	ip2lcd(ETH_TRAP3_IP_1,ETH_TRAP3_IP_2,ETH_TRAP3_IP_3,ETH_TRAP3_IP_4,'&',(a_ind . s_i1+1));
		else ip2lcd(ETH_TRAP3_IP_1,ETH_TRAP3_IP_2,ETH_TRAP3_IP_3,ETH_TRAP3_IP_4,'&',0);
		}

	if( (ETH_TRAP4_IP_1==255) && (ETH_TRAP4_IP_2==255) && (ETH_TRAP4_IP_3==255) && (ETH_TRAP4_IP_4==255) ) sub_bgnd("    неактивен    ",'*',-14);
	else
		{
		if(a_ind . s_i==17)	ip2lcd(ETH_TRAP4_IP_1,ETH_TRAP4_IP_2,ETH_TRAP4_IP_3,ETH_TRAP4_IP_4,'*',(a_ind . s_i1+1));
		else ip2lcd(ETH_TRAP4_IP_1,ETH_TRAP4_IP_2,ETH_TRAP4_IP_3,ETH_TRAP4_IP_4,'*',0);
		}

	if( (ETH_TRAP5_IP_1==255) && (ETH_TRAP5_IP_2==255) && (ETH_TRAP5_IP_3==255) && (ETH_TRAP5_IP_4==255) ) sub_bgnd("    неактивен    ",'(',-14);
	else
		{
		if(a_ind . s_i==19)	ip2lcd(ETH_TRAP5_IP_1,ETH_TRAP5_IP_2,ETH_TRAP5_IP_3,ETH_TRAP5_IP_4,'(',(a_ind . s_i1+1));
		else ip2lcd(ETH_TRAP5_IP_1,ETH_TRAP5_IP_2,ETH_TRAP5_IP_3,ETH_TRAP5_IP_4,'(',0);
		}




	
	
	
	

	for(i=0;i<9;i++)
		{
		sss[i]=snmp_Community[i];
		}
	sss[9]=0;		

	if(a_ind . s_i==10)community2lcd(sss,'<',a_ind . s_i1,1);
	else community2lcd(sss,'<',a_ind . s_i1,0);
	
	
	
	
	
	}

else if(a_ind . i==iExtCtrl)
	{
	if(SK_START==1)
	ptrs[0]=		" Активно            ";
	else 
	ptrs[0]=		" Неактивно          ";

	ptrs[1]=		" Включение       !  ";
	ptrs[2]=	    	" Выход              ";
	ptrs[3]=	    	"                    ";
	ptrs[4]=	    	"                    ";

	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>1) a_ind . i_s=a_ind . s_i-1;
				
	bgnd_par(		"     УПРАВЛЕНИЕ     ",
				" СУХИМ КОНТАКТОМ СК1",
				ptrs[a_ind . i_s],
				ptrs[a_ind . i_s+1]);

	pointer_set(2);
	     	
     if(SK_START_LEV==1)	sub_bgnd("ЗАМКН.",'!',-3);
	else 			sub_bgnd("РАЗОМКН.",'!',-5);
     
                   	      	   	    		
     }

else if(a_ind . i==iTst_pwm)
	{
	ptrs[0]=		" U=    [В  I=    ]А ";
	ptrs[1]=		" ШИМ напряж.=     ( ";
	ptrs[2]=		" ШИМ тока=        ) ";
	ptrs[3]=	    	" Выход              ";
	ptrs[4]=	    	"                    ";
	ptrs[5]=	    	"                    ";

	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;
				
	bgnd_par(		"      ТЕСТ ШИМ      ",
				ptrs[a_ind . i_s],
				ptrs[a_ind . i_s+1],
				ptrs[a_ind . i_s+2]);

	pointer_set(1);
	     	
     int2lcd(load_U,'[',1);
     int2lcd(load_I,']',1);
	int2lcd(tst_pwm_u,'(',0);
     int2lcd(tst_pwm_i,')',0);

     
                   	      	   	    		
     }
else if (a_ind . i==iCurr_contr_set)
	{ 
	ptrs[0]=		" Актив. сигн.      !";
	ptrs[1]=		" Tзад.вкл.      @сек";
	ptrs[2]=		" Tзад.сраб.     #сек";
	ptrs[3]=		" dU             <%  ";
	ptrs[4]=		" dI             >%  ";
	ptrs[5]=  	" Выход              ";
	ptrs[6]=  	"                    ";
	ptrs[7]=  	"                    ";
	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>1) a_ind . i_s=a_ind . s_i-1;
     bgnd_par(	"     УСТАНОВКИ      ",
			"РЕЛЕ ТОКООГРАНИЧЕНИЯ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1]);
	
	pointer_set(2);

	if(RELE_LOG_CURR==1)sub_bgnd("ЗМКН.",'!',-4);
	else 			sub_bgnd("РЗМКН.",'!',-5);


	int2lcd(T_DEL_REL_CURR_START,'@',0);
	int2lcd(T_DEL_REL_CURR_WRK,'#',0);
	int2lcd(DELT_REL_CURR_U,'<',0);
	int2lcd(DELT_REL_CURR_I,'>',0);
	}

else if (a_ind . i==iVolt_contr_set)
	{ 
	ptrs[0]=		" Актив. сигн.      !";
	ptrs[1]=		" Tзад.вкл.      @сек";
	ptrs[2]=		" Tзад.сраб.     #сек";
	ptrs[3]=		" Umax           <В  ";
	ptrs[4]=		" Umin           >В  ";
	ptrs[5]=  	" Выход              ";
	ptrs[6]=  	"                    ";
	ptrs[7]=  	"                    ";
	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>1) a_ind . i_s=a_ind . s_i-1;
     bgnd_par(	"   УСТАНОВКИ РЕЛЕ   ",
			"КОНТРОЛЯ НАПРЯЖЕНИЯ ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1]);
	
	pointer_set(2);

	if(RELE_LOG_VOLT==1)sub_bgnd("ЗМКН.",'!',-4);
	else 			sub_bgnd("РЗМКН.",'!',-5);

	int2lcd(T_DEL_REL_VOLT_START,'@',0);
	int2lcd(T_DEL_REL_VOLT_WRK,'#',0);
	int2lcd(REL_VOLT_UMAX,'<',0);
	int2lcd(REL_VOLT_UMIN,'>',0);
	}

else if (a_ind . i==iRele_sel)
	{ 
	


     bgnd_par(	"   НАСТРОЙКА РЕЛЕ   ",
			" Реле1              ",
			" Реле2              ",
			" Выход              ");
	
	pointer_set(1);

	}

else if (a_ind . i==iRele_set)
	{ 
	ptrs[0]=		" Выключено          ";
	ptrs[1]=		" Реверс             ";
	ptrs[2]=		" Токоограничение    ";
	ptrs[3]=		" Напряжение в норме ";
	ptrs[4]=		" Напряжение не выше ";
	ptrs[5]=		" Напряжение не ниже ";
	ptrs[6]=  	" Выход              ";
	ptrs[7]=  	"                    ";

	if(bFL2)
		{
		ptrs[RELE_FUNC[a_ind . s_i1]]="                    ";
		}

	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;
     bgnd_par(	" НАСТРОЙКА РЕЛЕ N!  ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1],
			ptrs[a_ind . i_s+2]);
	
	pointer_set(1);

	int2lcd(a_ind . s_i1+1,'!',0);
	
	


	
	
	
	
	
	}
else if (a_ind . i==iFiks_set)
	{ 
	ptrs[0]=		" U2          !В     ";
	ptrs[1]=		" U3          @В     ";
	ptrs[2]=		" I2	         #A     ";
	ptrs[3]=		" I3	         $A     ";
	ptrs[4]=  	" Выход              ";
	ptrs[6]=  	"                    ";
	ptrs[7]=  	"                    ";
	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>1) a_ind . i_s=a_ind . s_i-1;
     bgnd_par(	"   ФИКСИРОВАННЫЕ    ",
			"     НАСТРОЙКИ      ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1]);
	
	pointer_set(2);

	int2lcd(U_up2,'!',1);
	int2lcd(U_up3,'@',1);
	int2lcd(I_ug2,'#',1);
	int2lcd(I_ug3,'$',1);
	}

else if (a_ind . i==iExt_set_3U)
	{ 
	ptrs[0]=		" Сухой контакт №1   ";
	ptrs[1]=		" Сухой контакт №2   ";
	ptrs[2]=		" Сухой контакт №3   ";
	ptrs[3]=		" Сухой контакт №4   ";
	ptrs[NUMSK]=  	" Выход              ";
	ptrs[NUMSK+1]= "                    ";
	ptrs[NUMSK+2]=	"                    ";
	ptrs[NUMSK+3]=	"                    ";
		
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;
     bgnd_par("     УСТАНОВКИ      ",ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2]);
	
	pointer_set(1);
	}



else if (a_ind . i==iExt_sk_3U)
	{ 
	ptrs[0]=" состояние - @      ";
	ptrs[1]=" аварийное          ";
	ptrs[2]=" состояние - #      ";
	ptrs[3]=" Звук            ]  ";
	ptrs[4]=" Дисплей         (  ";
	ptrs[5]=sm_exit;
	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;
     bgnd_par("  СУХОЙ КОНТАКТ N!  ",ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2]);
	
	pointer_set(1);
	int2lcd(a_ind . s_i1+1,'!',0);
	if(sk_stat[a_ind . s_i1]==ssON)sub_bgnd("замкнут",'@',0);
	else sub_bgnd("разомк.",'@',0);
	if(!SK_SIGN[a_ind . s_i1])sub_bgnd("замкнут",'#',0);
	else sub_bgnd("незамк.",'#',0);
	if(!SK_ZVUK_EN[a_ind . s_i1])sub_bgnd("вкл.",']',-2);
	else sub_bgnd("выкл.",']',-2);
	if(!SK_LCD_EN[a_ind . s_i1])sub_bgnd("вкл.",'(',-2);
	else sub_bgnd("выкл.",'(',-2);
	}		

else if (a_ind . i==iExt_sk_GLONASS)
	{ 
	ptrs[0]=" состояние - @      ";
	ptrs[1]=" аварийное          ";
	ptrs[2]=" состояние - #      ";
	ptrs[3]=" Звук            ]  ";
	ptrs[4]=" Дисплей         (  ";
	ptrs[5]=sm_exit;
	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;
     bgnd_par("  СУХОЙ КОНТАКТ N!  ",ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2]);
	
	pointer_set(1);
	int2lcd(a_ind . s_i1+1,'!',0);
	if(sk_stat[a_ind . s_i1]==ssON)sub_bgnd("замкнут",'@',0);
	else sub_bgnd("разомк.",'@',0);
	if(!SK_SIGN[a_ind . s_i1])sub_bgnd("замкнут",'#',0);
	else sub_bgnd("незамк.",'#',0);
	if(!SK_ZVUK_EN[a_ind . s_i1])sub_bgnd("вкл.",']',-2);
	else sub_bgnd("выкл.",']',-2);
	if(!SK_LCD_EN[a_ind . s_i1])sub_bgnd("вкл.",'(',-2);
	else sub_bgnd("выкл.",'(',-2);
	}		



else if (a_ind . i==iExt_ddi)
	{ 
	ptrs[0]=" состояние - @      ";
	ptrs[1]=" аварийное          ";
	ptrs[2]=" состояние - #      ";
	ptrs[3]=" Реле            [  ";
	ptrs[4]=" Дисплей         (  ";
	ptrs[5]=sm_exit;
	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;
     bgnd_par("   ДАТЧИК ДЫМА      ",ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2]);
	
	pointer_set(1);
	
	if(sk_stat[1]==ssON)sub_bgnd("замкнут",'@',0);
	else sub_bgnd("разомк.",'@',0);
	if(!SK_SIGN[1])sub_bgnd("замкнут",'#',0);
	else sub_bgnd("незамк.",'#',0);
	if(SK_REL_EN[1])sub_bgnd("вкл.",'[',-2);
	else sub_bgnd("выкл.",'[',-2);
	if(SK_LCD_EN[1])sub_bgnd("вкл.",'(',-2);
	else sub_bgnd("выкл.",'(',-2);
	}	

else if (a_ind . i==iExt_dud)
	{ 
	ptrs[0]=" состояние - @      ";
	ptrs[1]=" аварийное          ";
	ptrs[2]=" состояние - #      ";
	ptrs[3]=" Реле            [  ";
	ptrs[4]=" Дисплей         (  ";
	ptrs[5]=sm_exit;
	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;
     bgnd_par("   ДАТЧИК УДАРА     ",ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2]);
	
	pointer_set(1);
	
	if(sk_stat[2]==ssON)sub_bgnd("замкнут",'@',0);
	else sub_bgnd("разомк.",'@',0);
	if(!SK_SIGN[2])sub_bgnd("замкнут",'#',0);
	else sub_bgnd("незамк.",'#',0);
	if(SK_REL_EN[2])sub_bgnd("вкл.",'[',-2);
	else sub_bgnd("выкл.",'[',-2);
	if(SK_LCD_EN[2])sub_bgnd("вкл.",'(',-2);
	else sub_bgnd("выкл.",'(',-2);
	}


else if (a_ind . i==iExt_dp)
	{ 
	ptrs[0]=" состояние - @      ";
	ptrs[1]=" аварийное          ";
	ptrs[2]=" состояние - #      ";
	ptrs[3]=" Реле            [  ";
     ptrs[4]=" Дисплей         (  ";
	ptrs[5]=sm_exit;
	
	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>2) a_ind . i_s=a_ind . s_i-2;
     bgnd_par("ДАТЧИК ПЕРЕВОРАЧИВ. ",ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2]);
	
	pointer_set(1);

	if(sk_stat[3]==ssON)sub_bgnd("замкнут",'@',0);
	else sub_bgnd("разомк.",'@',0);
	if(!SK_SIGN[3])sub_bgnd("замкнут",'#',0);
	else sub_bgnd("незамк.",'#',0);
	if(!SK_REL_EN[3])sub_bgnd("вкл.",'[',-2);
	else sub_bgnd("выкл.",'[',-2);
	if(!SK_LCD_EN[3])sub_bgnd("вкл.",'(',-2);
	else sub_bgnd("выкл.",'(',-2);


    


 
	}

else if(a_ind . i==iK)
	{
	char i;
	i=0;
	
	ptrs[i++]=	" Нагрузка           ";
	ptrs[i++]=	" БПС                ";
    	ptrs[i++]=	" Предельные пар.-ры ";
	ptrs[i++]=	" Выходная характ.-ка";
	ptrs[i++]=	" Реверс            !";
    	ptrs[i++]=	" Выход              ";
    	
    	ptrs[i++]=	"                    ";

	if((a_ind . s_i-a_ind . i_s)>2)a_ind . i_s=a_ind . s_i-2;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par("     КАЛИБРОВКА     ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1],
			ptrs[a_ind . i_s+2]);

	pointer_set(1);	
	
	if(REV_IS_ON)sub_bgnd("ЕСТЬ",'!',-3);
	else sub_bgnd("НЕТ",'!',-2); 
	}    	


else if(a_ind . i==iK_viz_sel)
	{
	char i;
	i=0;
	
	ptrs[i++]=	" по напряжению      ";
	ptrs[i++]=	" по току            ";
    	ptrs[i++]=	" Выход              ";
    	ptrs[i++]=	"                    ";

	if((a_ind . s_i-a_ind . i_s)>2)a_ind . i_s=a_ind . s_i-2;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par("ВЫХОДНАЯ ХАРАКТ.-КА ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1],
			ptrs[a_ind . i_s+2]);

	pointer_set(1);	 
	}   


else if(a_ind . i==iK_viz_u)
	{
	
	
	
	if(viz_stat!=vsON)
		{
		ptrs[0]=		" U=    [В  I=    ]А ";
		ptrs[1]=		" Пуск               ";
	    	ptrs[2]=		" Выход              ";
	    	ptrs[3]=		"                    ";
		}
	else 
		{
		ptrs[0]=		" U=    [В  I=    ]А ";
		ptrs[1]=		" Шаг    <  ШИМ    > ";
	    	ptrs[2]=		" Стоп               ";
	    	ptrs[3]=		"                    ";
		}

	if((a_ind . s_i-a_ind . i_s)>2)a_ind . i_s=a_ind . s_i-2;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par("ВЫХ. ХАР. ПО НАПРЯЖ.",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1],
			ptrs[a_ind . i_s+2]);

	if(viz_stat!=vsON)pointer_set(2);	 
	else pointer_set(3);

	int2lcd(load_U,'[',1);
     int2lcd(load_I,']',1);
	int2lcd(tst_pwm_u,'>',0);
     int2lcd(viz_stat_cnt/50+1,'<',0);
	}   

else if(a_ind . i==iK_viz_i)
	{
	
	
	
	if(viz_stat!=vsON)
		{
		ptrs[0]=		" U=    [В  I=    ]А ";
		ptrs[1]=		" Пуск               ";
	    	ptrs[2]=		" Выход              ";
	    	ptrs[3]=		"                    ";
		}
	else 
		{
		ptrs[0]=		" U=    [В  I=    ]А ";
		ptrs[1]=		" Шаг    <  ШИМ    > ";
	    	ptrs[2]=		" Стоп               ";
	    	ptrs[3]=		"                    ";
		}

	if((a_ind . s_i-a_ind . i_s)>2)a_ind . i_s=a_ind . s_i-2;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par("ВЫХ. ХАР. ПО ТОКУ   ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1],
			ptrs[a_ind . i_s+2]);

	if(viz_stat!=vsON)pointer_set(2);	 
	else pointer_set(3);

	int2lcd(load_U,'[',1);
     int2lcd(load_I,']',1);
	int2lcd(tst_pwm_i,'>',0);
     int2lcd(viz_stat_cnt/50+1,'<',0);
	}   


else if(a_ind . i==iK_load)
	{

	bgnd_par(		" КАЛИБРОВКА НАГРУЗКИ",
					" Uвых=     @В       ",
					" Iвых=     !A       ",
					" Выход              ");

	pointer_set(1);	
	int2lcd(load_U,'@',1);
	int2lcd(load_I,'!',1);







 
    }


else if(a_ind . i==iK_max_param)
	{
	ptrs[0]=  	" Uист.max.      !В  ";				   
    ptrs[1]=  	" Uист.min.      @B  ";
    ptrs[2]=  	" Iист.max.      #A  ";
    ptrs[3]=  	" Iист.min.      $A  ";
   	ptrs[4]=	" tсигн=         <°C ";
	ptrs[5]=	" tmax=          %°C ";
    ptrs[6]=	" Выход              ";
	ptrs[7]=    "                    ";
	
	if((a_ind . s_i-a_ind . i_s)>1)a_ind . i_s=a_ind . s_i-1;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par(		"    МАКСМАЛЬНЫЕ     ",
					"  ПАРАМЕТРЫ РАБОТЫ  ",
					ptrs[a_ind . i_s],
					ptrs[a_ind . i_s+1]);

	pointer_set(2);	
	int2lcd(U_MAX/10,'!',0);
	int2lcd(U_MIN/10,'@',0);
	int2lcd(I_MAX,'#',1);
	int2lcd(I_MIN,'$',1);
	int2lcd(T_MAX,'%',0);
	int2lcd(T_SIGN,'<',0);
	
	}


	

else if(a_ind . i==iK_bps_sel)
	{
	ptrs[0]=						" БПС N1             ";
    ptrs[1]=						" БПС N2             ";
    ptrs[2]=						" БПС N3             ";
	ptrs[3]=						" БПС N4             ";
    ptrs[4]=						" БПС N5             ";
    ptrs[5]=						" БПС N6             ";
	ptrs[6]=						" БПС N7             ";
    ptrs[7]=						" БПС N8             ";
    ptrs[8]=						" БПС N9             ";
	ptrs[9]=						" БПС N10            ";
    ptrs[10]=						" БПС N11            ";
    ptrs[11]=						" БПС N12            "; 
    ptrs[12]=						" БПС N13            ";
	ptrs[13]=						" БПС N14            ";
    ptrs[14]=						" БПС N15            ";
    ptrs[15]=						" БПС N16            ";
	ptrs[16]=						" БПС N17            ";
    ptrs[17]=						" БПС N18            ";
    ptrs[18]=						" БПС N19            ";
	ptrs[19]=						" БПС N20            ";
    ptrs[20]=						" БПС N21            ";
    ptrs[21]=						" БПС N22            ";
    ptrs[22]=						" БПС N23            ";
	ptrs[23]=						" БПС N24            ";
    ptrs[24]=						" БПС N25            ";
    ptrs[25]=						" БПС N26            ";
	ptrs[26]=						" БПС N27            ";
    ptrs[27]=						" БПС N28            ";
    ptrs[28]=						" БПС N29            ";
	ptrs[29]=						" БПС N30            ";
    ptrs[30]=						" БПС N31            ";
    ptrs[31]=						" БПС N32            ";		              
	ptrs[NUMIST]=					" Выход              ";
	ptrs[1+NUMIST]=				"                    ";
	ptrs[2+NUMIST]=				"                    ";

	if((a_ind . s_i-a_ind . i_s)>2)a_ind . i_s=a_ind . s_i-2;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par("  КАЛИБРОВКА БПСов  ",ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2]);
	pointer_set(1);
	
     }     

else if(a_ind . i==iK_bps)
	{
	
	ptrs[0]=" Uист =    @В       ";
     ptrs[1]=" откалибруйте Uист  ";
     ptrs[2]="  нажатием љ или њ  "; 
	ptrs[3]=" Iист =     %А      ";
	if(phase==0)
          {
          ptrs[4]=	"   нажмите ¤ для    ";
          ptrs[5]=	"калибровки нуля Iист";
          }
     else
     	{
          ptrs[4]=" откалибруйте Iист  ";
          ptrs[5]="  нажатием љ или њ  ";     	
     	} 
     	
     ptrs[6]=" tист =   ^°C       ";    
	ptrs[7]=" откалибруйте tист  ";
     ptrs[8]="  нажатием љ или њ  ";
     ptrs[9]=sm_exit;
     ptrs[10]=sm_;
     ptrs[11]=sm_;     	     	    
	

     if((a_ind . s_i==0)||(a_ind . s_i==1)||(a_ind . s_i==2))a_ind . i_s=0;
	else if((a_ind . s_i==3)||(a_ind . s_i==4)||(a_ind . s_i==5))a_ind . i_s=3;
	else if((a_ind . s_i==6)||(a_ind . s_i==7)||(a_ind . s_i==8))a_ind . i_s=6;
	else if((a_ind . s_i==9)||(a_ind . s_i==10)||(a_ind . s_i==11))a_ind . i_s=9;
	else if((a_ind . s_i==12)||(a_ind . s_i==13)||(a_ind . s_i==14))a_ind . i_s=12;	
	else a_ind . i_s=15;
	
	bgnd_par(" КАЛИБРОВКА БПС N! ",ptrs[a_ind . i_s],ptrs[a_ind . i_s+1],ptrs[a_ind . i_s+2]);

	pointer_set(1);	
	int2lcd(a_ind . s_i1+1,'!',0);
	int2lcd(bps[a_ind . s_i1]._Uii,'@',1);
	int2lcd(bps[a_ind . s_i1]._Uin,'#',1);
	int2lcd(U_AVT,'$',1);
	int2lcd(bps[a_ind . s_i1]._Ii,'%',1);
	int2lcd(bps[a_ind . s_i1]._Ti,'^',0); 
	 
	
     if((a_ind . s_i==0)||(a_ind . s_i==3))
		{
		mess_send(205,208,(1<<a_ind . s_i1),10);
		mess_send(200,201,0,10);
	    	mess_send(225,229,1000,10);
          }
     if(a_ind . s_i==6)
		{
          mess_send(205,208,(1<<a_ind . s_i1),10);
          mess_send(200,201,0,40);
          mess_send(190,191,U_AVT,10);
	    	mess_send(225,230,0,10);

          }

     if(a_ind . s_i==9)
		{
		if(phase==0)
			{
          	mess_send(205,208,~(1<<a_ind . s_i1),10);
          	}
      	else if(phase==1)
			{
          	mess_send(205,208,(1<<a_ind . s_i1),10);
			mess_send(200,201,0,10);
          	}
          mess_send(225,229,1000,10);
          }
	
    	if(a_ind . s_i==12)
		{
          }	
          
          
	if(mess_find( (215)) && (mess_data[0]==217) )
		{
		show_mess("     Установка      ",
	          	"    напряжения      ",
	          	" автономной работы  ",
	          	"    произведена     ",3000);
		}	     
	     
	
	






 






	 }

else if(a_ind . i==iK_power_net)
	{
	ptrs[0]=" Uввод=    @В       ";
	ptrs[1]=" Uпэс =    #В       ";
     ptrs[2]=" Выход              ";
	ptrs[3]="                    ";
	
	if((a_ind . s_i-a_ind . i_s)>1)a_ind . i_s=a_ind . s_i-1;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par( "      КАЛИБРОВКА    ",
               "   СИЛОВЫХ ВВОДОВ   ",
               ptrs[a_ind . i_s],
               ptrs[a_ind . i_s+1]);

	pointer_set(2);	
	int2lcd(Uvv[0],'@',0);
     int2lcd(Uvv[1],'#',0);
	
	
	
     }


else if(a_ind . i==iK_power_net3)
	{
     ptrs[0]=  		" Ввод ф.A    !В     ";
	ptrs[1]=  		" Ввод ф.B    @В     ";
	ptrs[2]=  		" Ввод ф.C    #В     ";
     ptrs[3]=  	     " ПЭС  ф.A    &В     ";
     ptrs[4]=  	     " ПЭС  ф.B    *В     ";
     ptrs[5]=  	     " ПЭС  ф.C    (В     ";		            
     ptrs[6]=" Выход              ";
	ptrs[7]="                    ";
	
	if((a_ind . s_i-a_ind . i_s)>1)a_ind . i_s=a_ind . s_i-1;
	else if(a_ind . s_i<a_ind . i_s)a_ind . i_s=a_ind . s_i;
	bgnd_par( "      КАЛИБРОВКА    ",
               "   СИЛОВЫХ ВВОДОВ   ",
               ptrs[a_ind . i_s],
               ptrs[a_ind . i_s+1]);

	pointer_set(2);	
	int2lcd(Uvv_eb2[0],'!',0);
	int2lcd(Uvv_eb2[1],'@',0);
	int2lcd(Uvv_eb2[2],'#',0);
	int2lcd(Upes_eb2[0],'&',0);
	int2lcd(Upes_eb2[1],'*',0);
	int2lcd(Upes_eb2[2],'(',0);
	
	
	
     }


	 
			
if(a_ind . i==iDeb)
     {
     if(a_ind . s_i==0)
     	{


         	bgnd_par("*0000*000000*       ",
     	         "                    ",
     	         "                    ",
     	         "      ********      ");

	int2lcdyx(1051,0,4,0);
	long2lcdyx_mmm(21112UL,0,11,0);

	
	
	int2lcdyx(lc640_read_int(0x08),0,19,0);

	int2lcdyx(modbus_tcp_plazma[0],2,2,0);
	int2lcdyx(modbus_tcp_plazma[1],2,8,0);
	int2lcdyx(modbus_tcp_plazma[2],3,2,0);
	int2lcdyx(modbus_tcp_plazma[3],3,8,0);

	int2lcdyx(plazma_modbus_tcp[9],2,14,0);
	int2lcdyx(plazma_modbus_tcp[10],2,19,0);
	int2lcdyx(plazma_modbus_tcp[11],3,14,0);
	int2lcdyx(plazma_modbus_tcp[12],3,19,0);
	
	
	

	
	
	
	
	

	

	

	


 

	
	













 		
		
	

 			
		
	














 
	






 



     	
 






















 

		  



	
















 
      

     	}     

    	else if(a_ind . s_i==1) 
     	{
     	bgnd_par(" EEPROM_CNT         ",
     	         " TCP_STATE          ",
     	         "                    ",
     	         "                    ");

		int2lcdyx(tcp_get_state(socket_tcp),1,14,0);
		int2lcdyx(EE_WRITE_CNT,0,14,0);
 		}

 

    else if(a_ind . s_i==2)
     	{
     	bgnd_par(	"AB                  ",
     		    	"                    ",
     		    	"                    ",
     		    	"                    ");



		
		char2lcdbyx(rele_stat[0],1,7);
		
		int2lcdyx(sk_av_stat[0],0,19,0);
		int2lcdyx(sk_av_stat[1],1,19,0);
		int2lcdyx(sk_av_stat[2],2,19,0);

		int2lcdyx(SK_REL_EN[0]&0x000f,0,16,0);
		int2lcdyx(SK_REL_EN[1]&0x000f,1,16,0);
		int2lcdyx(SK_REL_EN[2]&0x000f,2,16,0);

		int2lcdyx(SK_SIGN[0]&0x000f,0,10,0);
		int2lcdyx(SK_SIGN[1]&0x000f,1,10,0);
		int2lcdyx(SK_SIGN[2]&0x000f,2,10,0);

		int2lcdyx(SK_LCD_EN[0]&0x000f,0,13,0);
		int2lcdyx(SK_LCD_EN[1]&0x000f,1,13,0);
		int2lcdyx(SK_LCD_EN[2]&0x000f,2,13,0);
		
		
		
		}  

	else if(a_ind . s_i==3)
     	{
     	bgnd_par("КЕ                  ",
     	         "                    ",
     	         "                   ^",
     	         "                   &");


	
		








 


		   
		    

































































 
		}

	else if(a_ind . s_i==4)
     	{
     	bgnd_par(" АВАРИИ             ",
     	         "                    ",
     	         "                    ",
     	         "                    ");

		int2lcdyx(main_10Hz_cnt,0,7,0);
		

 		long2lcdhyx(avar_stat,1,7);
		long2lcdhyx(avar_stat_old,2,7);
		

		long2lcdhyx(avar_stat_new,2,19);
		long2lcdhyx(avar_stat_offed,3,19);



	
	









 

		}
   else if(a_ind . s_i==5)
     	{
     	bgnd_par("**                  ",
     		    "                    ",
     		    "                    ",
     		    "                    ");
     		    


     	
     	int2lcdyx(vz_cnt_s_,0,6,0);
		int2lcdyx(vz_cnt_s,1,6,0);
		int2lcdyx(vz_cnt_h,2,6,0);
		int2lcdyx(vz_cnt_h_,3,6,0);

     	int2lcdyx(__ee_vz_cnt,3,12,0);

	










 

	





 

     	


 

    		}
    else if(a_ind . s_i==6)
     	{
     	bgnd_par("                    ",
     		    "                    ",
     		    "                    ",
     		    "                    ");
     		    
     	














 

		int2lcdyx(adc_buff_[0],0,4,0);
    		int2lcdyx(adc_buff_[1],0,9,0);
     	int2lcdyx(adc_buff_[2],0,14,0);
     	int2lcdyx(adc_buff_[3],0,19,0); 
     	int2lcdyx(adc_buff_[4],1,4,0);	
     	int2lcdyx(adc_buff_[5],1,9,0);
     	int2lcdyx(adc_buff_[6],1,14,0);
     	int2lcdyx(adc_buff_[7],1,19,0); 
     	int2lcdyx(adc_buff_[8],2,4,0);
     	int2lcdyx(adc_buff_[9],2,9,0);
     	int2lcdyx(adc_buff_[10],2,14,0);
     	int2lcdyx(adc_buff_[11],2,19,0);
     	int2lcdyx(adc_buff_[12],3,4,0);
     	int2lcdyx(adc_buff_[13],3,9,0);
     	int2lcdyx(adc_buff_[14],3,14,0);
     	int2lcdyx(adc_buff_[15],3,19,0);
    	}  		  		

   else if(a_ind . s_i==7)
     	{
     	bgnd_par("7                   ",
     		    "                    ",
     		    "                    ",
     		    "                    ");
     		    
		int2lcdyx(main_vent_pos,0,19,0);
		int2lcdyx(TBOXMAX,1,2,0);
		int2lcdyx(TBOXREG,2,2,0);
		int2lcdyx(t_box,3,2,0);

		int2lcdyx(adc_buff_ext_[0],1,10,0);
		int2lcdyx(adc_buff_ext_[1],2,10,0);
		int2lcdyx(adc_buff_ext_[2],3,10,0);
    		}
    else if(a_ind . s_i==8)
     	{
     	bgnd_par("                    ",
     		    "                    ",
     		    "                    ",
     		    "                    ");
     	int2lcdyx(ibt._T[0],0,2,0);
		int2lcdyx(ibt._T[1],1,2,0);
     	int2lcdyx(ibt._T[2],2,2,0);
		int2lcdyx(ibt._T[3],3,2,0);
		
     	int2lcdyx(ibt._nd[0],0,4,0);
		int2lcdyx(ibt._nd[1],1,4,0);
     	int2lcdyx(ibt._nd[2],2,4,0);
		int2lcdyx(ibt._nd[3],3,4,0);	    

     	int2lcdyx(ibt._T_dispers[0],0,7,0);
		int2lcdyx(ibt._T_dispers[1],1,7,0);
     	int2lcdyx(ibt._T_dispers[2],2,7,0);
		int2lcdyx(ibt._T_dispers[3],3,7,0);
			    
		int2lcdyx(ibt._avg1,0,19,0);
		int2lcdyx(ibt._max_dispers_num,1,19,0);
		int2lcdyx(t_box,3,19,0);
     	}		     	
     			
     }

else if((a_ind . i==iAv_view)||(a_ind . i==iAv_view_avt))
	{


	
	bgnd_par(sm_,sm_,sm_,sm_);
	if(a_ind . s_i==0)
		{	
		if(avar_stat&0x00000001)
			{
			bgnd_par(	"    Авария  сети    ",
				    	"    не устранена    ",
				    	sm_,sm_); 
			int2lcd(net_U,']',0);
			}
    		else 
			{
	    		bgnd_par(	"    Авария  сети    ",
	    				"     устранена      ",
					sm_,sm_); 
			}
		}
	else if((a_ind . s_i==1)||(a_ind . s_i==2))
		{
		if(avar_stat&(1<<a_ind . s_i))
			{
			bgnd_par(	"   Авария бат. N!   ",
				    	"    не устранена    ",
				    	sm_,sm_); 
			}
    		else 
			{
	    		bgnd_par(	"   Авария бат. N!   ",
	    				"     устранена      ",
					sm_,sm_); 
		
		     }
		int2lcd(a_ind . s_i,'!',0);
		} 
     
	else if((a_ind . s_i>=3)&&(a_ind . s_i<=14))
		{
		if((a_ind . s_i-2)<=9)					ptrs[0]=	"   Авария БПС N+    ";
		else 							ptrs[0]=	"   Авария БПС N +   ";
		if(bps[a_ind . s_i-3]._last_avar==0)		ptrs[1]=	"     перегрев!!!    ";
		else if(bps[a_ind . s_i-3]._last_avar==1)	ptrs[1]=	"  завышено Uвых!!!  ";	
		else if(bps[a_ind . s_i-3]._last_avar==2)	ptrs[1]=	"  занижено Uвых!!!  ";	
		else if(bps[a_ind . s_i-3]._last_avar==3)	ptrs[1]=	"    отключился!!!   ";
		if(avar_stat&(1<<a_ind . s_i)) 			ptrs[2]=	"    не устранена    ";
		else								ptrs[2]=	"     устранена      ";	
										ptrs[3]=	"                    ";

		bgnd_par(ptrs[0],ptrs[1],ptrs[2],ptrs[3]);
		int2lcd((a_ind . s_i-2),'+',0);
          
		

		} 
		
	else if(a_ind . s_i==25)
		{ 

		if(sk_av_stat[0]==sasON)
			{
			bgnd_par(	"   Авария СК. N1    ",
				    	"    не устранена    ",
				    	sm_,sm_); 
			}
    		else 
			{
	    		bgnd_par(	"   Авария СК. N1    ",
	    				"     устранена      ",
					sm_,sm_); 
		
		     }

		}

	else if(a_ind . s_i==26)
		{ 

		if(sk_av_stat[1]==sasON)
			{
			bgnd_par(	"   Авария СК. N2    ",
				    	"    не устранена    ",
				    	sm_,sm_); 
			}
    		else 
			{
	    		bgnd_par(	"   Авария СК. N2    ",
	    				"     устранена      ",
					sm_,sm_); 
		
		     }

		}

	else if(a_ind . s_i==27)
		{ 

		if(sk_av_stat[2]==sasON)
			{
			bgnd_par(	"   Авария СК. N3    ",
				    	"    не устранена    ",
				    	sm_,sm_); 
			}
    		else 
			{
	    		bgnd_par(	"   Авария СК. N3    ",
	    				"     устранена      ",
					sm_,sm_); 
		
		     }

		}

	else if(a_ind . s_i==28)
		{ 

		if(sk_av_stat[3]==sasON)
			{
			bgnd_par(	"   Авария СК. N4    ",
				    	"    не устранена    ",
				    	sm_,sm_); 
			}
    		else 
			{
	    		bgnd_par(	"   Авария СК. N4    ",
	    				"     устранена      ",
					sm_,sm_); 
		
		     }

		}


	else if(a_ind . s_i==5)
		{

		}

	else if(a_ind . s_i==6)
		{

		}

	else if(a_ind . s_i==7)
		{

		} 
		
	else if(a_ind . s_i==8)
		{

		}

	else if(a_ind . s_i==9)
		{

		}

	else if(a_ind . s_i==10)
		{

		}
	    		     
	else if(a_ind . s_i==11)
		{

		} 
		
	else if(a_ind . s_i==12)
		{

		}

	else if(a_ind . s_i==13)
		{

		}

	else if(a_ind . s_i==14)
		{

		}

	else if(a_ind . s_i==15)
		{

		} 
					
	} 

else if(a_ind . i==iAch_off)
	{
	if(ACH_OFF_EN==1) {
	ptrs[0]=		" Активно            ";
	ptrs[1]=	    	" Qmax          !А*ч ";
	ptrs[2]=	    	" Выход              ";

	} else {
	ptrs[0]=		" Неактивно          ";
	ptrs[1]=	    	" Выход              ";
	ptrs[2]=		"                    ";
	}

	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>1) a_ind . i_s=a_ind . s_i-1;
				
	bgnd_par(		"   ВЫКЛЮЧЕНИЕ ПО    ",
				"СЧЕТЧИКУ АМПЕРЧАСОВ ",
				ptrs[a_ind . i_s],
				ptrs[a_ind . i_s+1]);

	pointer_set(2);
	     	
     int2lcd(ACH_OFF_LEVEL,'!',1);
     
                   	      	   	    		
     }
else if(a_ind . i==iCurr_off)
	{
	if(CURR_OFF_EN==1) {
	ptrs[0]=		" Активно            ";
	ptrs[1]=	    	" Iнагр/Iуст       !%";
	ptrs[2]=	    	" Tнеактивн.    @сек.";
	ptrs[3]=	    	" Tсрабатыв.    #сек.";
	ptrs[4]=	    	" Выход              ";

	} else {
	ptrs[0]=		" Неактивно          ";
	ptrs[1]=	    	" Выход              ";
	ptrs[2]=		"                    ";
	}

	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>1) a_ind . i_s=a_ind . s_i-1;
				
	bgnd_par(		"   ВЫКЛЮЧЕНИЕ ПО    ",
				"   СНИЖЕНИЮ ТОКА    ",
				ptrs[a_ind . i_s],
				ptrs[a_ind . i_s+1]);

	pointer_set(2);
	     	
     int2lcd(CUR_OFF_LEVEL_RELATIV,'!',0);
	int2lcd(CUR_OFF_LEVEL_ABSOLUT,'$',0);
	int2lcd(CUR_OFF_T_OFF,'@',0);
	int2lcd(CUR_OFF_T_ON,'#',0);
     
                   	      	   	    		
     }

else if (a_ind . i==iProcIsComplete)
	{ 
	if(a_ind . s_i==0)
		{
		bgnd_par(	
			"       ПРОЦЕСС      ",
			"      ЗАВЕРШЕН      ",
			"         ПО         ",
			"       ВРЕМЕНИ      ");
		}
	else if(a_ind . s_i==1)
		{
		bgnd_par(	
			"       ПРОЦЕСС      ",
			"      ЗАВЕРШЕН      ",
			"         ПО         ",
			"     АМПЕРЧАСАМ     ");
		}
	else if(a_ind . s_i==2)
		{
		bgnd_par(	
			"       ПРОЦЕСС      ",
			"      ЗАВЕРШЕН      ",
			"         ПО         ",
			"    СНИЖЕНИЮ ТОКА   ");
		}
	}


else if(a_ind . i==iAvz)
	{
	
 	if(AVZ==AVZ_1) 		ptrs[0]=	" раз в месяц        ";
	else if(AVZ==AVZ_2) 	ptrs[0]=	" раз в 2 месяца     ";
	else if(AVZ==AVZ_3) 	ptrs[0]=	" раз в 3 месяца     "; 
	else if(AVZ==AVZ_6) 	ptrs[0]=	" раз в полгода      ";
	else if(AVZ==AVZ_12) 	ptrs[0]=	" раз в год          ";
	else 				ptrs[0]=	" выключен           "; 
	
	ptrs[1]=						" Длительность    (ч.";
	if(AVZ!=AVZ_OFF)
		{
		ptrs[2]=					" очередное включение";
		ptrs[3]=					"  0%  &0^  0@:0#:0$ ";
		ptrs[4]=					sm_exit;
		}
	else ptrs[2]=						sm_exit;

	if(a_ind . s_i<a_ind . i_s) a_ind . i_s=a_ind . s_i;
	else if((a_ind . s_i-a_ind . i_s)>1) a_ind . i_s=a_ind . s_i-1;
	if((a_ind . s_i==2)&&(AVZ!=AVZ_OFF)) a_ind . i_s=2;
	
	bgnd_par(	"   АВТОМАТИЧЕСКИЙ   ",
			"ВЫРАВНИВАЮЩИЙ ЗАРЯД ",
			ptrs[a_ind . i_s],
			ptrs[a_ind . i_s+1]);

	pointer_set(2);
		
	int2lcd(HOUR_AVZ,'@',0);
	int2lcd(MIN_AVZ,'#',0);
	int2lcd(SEC_AVZ,'$',0);
	int2lcd(DATE_AVZ,'%',0);
	int2lcd(YEAR_AVZ,'^',0);

	sub_bgnd(sm_mont[MONTH_AVZ],'&',-2);

	int2lcd(AVZ_TIME,'(',0);
	
	}













 
























 



 

















 

}							    



void sk_in_drv(void)
{


if(adc_buff_[11]<2000)sk_in_drv_cnt++;
else sk_in_drv_cnt--;
gran(&sk_in_drv_cnt,-10,10);

if(sk_in_drv_cnt>=10)sk_in_drv_stat=1;
else if(sk_in_drv_cnt>=-10)sk_in_drv_stat=-1;

if((sk_in_drv_stat!=sk_in_drv_stat_old)&&(main_cnt>2))
	{
	if(SK_START)
		{
		if(SK_START_LEV)
			{
			if(sk_in_drv_stat==1)
				{
				if(main_menu_mode==mmmIT)
					{
					if(work_stat!=wsGS)
						{
						start_GS();
						}
					}
				else if(main_menu_mode==mmmIN)
					{
					if(work_stat!=wsPS)
						{
						start_PS();
						}
					}
				}
			else if(sk_in_drv_stat==-1)
				{
				stop_proc();
				}
			}
		if(!SK_START_LEV)
			{
			if(sk_in_drv_stat==-1)
				{
				if(main_menu_mode==mmmIT)
					{
					if(work_stat!=wsGS)
						{
						start_GS();
						}
					}
				else if(main_menu_mode==mmmIN)
					{
					if(work_stat!=wsPS)
						{
						start_PS();
						}
					}
				}
			else if(sk_in_drv_stat==1)
				{
				stop_proc();
				}
			}
		}
	}
sk_in_drv_stat_old=sk_in_drv_stat;

}




#line 4262 "main.c"




#line 4284 "main.c"





void but_drv(void)
{
char i;
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIODIR|=(1<<21);
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN&=~(1<<21);
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIODIR&=~((1<<22)|(1<<23)|(1<<24)|(1<<25)|(1<<26));
((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE3&=~((1<<12)|(1<<13)|(1<<14)|(1<<15)|(1<<16)|(1<<17)|(1<<18)|(1<<19)|(1<<20)|(1<<21));

((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00040) )->FIODIR|=(1<<8);
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00040) )->FIOPIN&=~(1<<8);
for(i=0;i<200;i++)
{
__nop();
__nop();
__nop();
__nop();
__nop();
__nop();
__nop();
__nop();
}

			((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00040) )->FIODIR|=(1<<8);
			((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00040) )->FIOPIN|=(1<<8);

but_n=((((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN|(~((1<<22)|(1<<23)|(1<<24)|(1<<25)|(1<<26))))>>22) ;



if((but_n==1023UL)||(but_n!=but_s))
 	{
	speed=0;
 
   	if (((but0_cnt>=4)||(but1_cnt!=0))&&(!l_but))
  		{
   	     n_but=1;
          but=but_s;

          }
   	if (but1_cnt>=but_onL_temp)
  		{
   	     n_but=1;
 
          but=but_s&0x7f;
          }
    	l_but=0;
   	but_onL_temp=20;
    	but0_cnt=0;
  	but1_cnt=0;          
     goto but_drv_out;
  	}
else if(but_n==but_s)
 	{
  	but0_cnt++;
  	if(but0_cnt>=4)
  		{
   		but0_cnt=0;
   		but1_cnt++;
   		if(but1_cnt>=but_onL_temp)
   			{              
    			but=but_s&0x7f;
    			but1_cnt=0;
    			n_but=1;
    			     
    			l_but=1;
			if(speed)
				{
    				but_onL_temp=but_onL_temp>>1;
        			if(but_onL_temp<=2) but_onL_temp=2;
				}    
   			}
  		}
 	}
but_drv_out: 
but_s=but_n; 
   
}


void but_an(void)
{
signed short temp_SS;




if(!n_but)goto but_an_end;




 
av_beep=0x0000;
av_rele=0x0000;
mnemo_cnt=MNEMO_TIME;
if((main_1Hz_cnt<10)&&((but==253)||(but==125)||(but==251)||(but==123)||(but==247)||(but==119)||(but==239)||(but==111)||(but==254)||(but==126)))
	{
	__ee_spc_stat=spcOFF;
	spc_stat=spcOFF;
	}
if(but==249)
     {
     if(a_ind . i!=iDeb)
          {
		c_ind=a_ind;
		tree_up(iDeb,1,0,0);
		
          }
     else 
          {
		tree_down(0,0);
          }
		
		     
     }




 
else if(but==121)
     {
	}

else if(but==122)
     {
	if(!bCAN_OFF)bCAN_OFF=1;
	else bCAN_OFF=0;
	speed=0;
	}

else if(work_stat==wsCAP)work_stat=wsOFF;

else if(a_ind . i==iDeb)
	{
	if(but==239)
		{
		a_ind . s_i++;
		a_ind . i_s=0;
		gran_ring_char(&a_ind . s_i,0,9);
		}
	else if(but==247)
		{
		a_ind . s_i--;
		a_ind . i_s=0;
		gran_ring_char(&a_ind . s_i,0,9);
		}
		
	else if(a_ind . s_i==1)
		{
		if(but==253)
	     	{
	     	a_ind . s_i1--;
	     	gran_char(&a_ind . s_i1,0,31);
	     	}
		if(but==251)
	     	{
	     	a_ind . s_i1++;
	     	gran_char(&a_ind . s_i1,0,31);
	     	}
	     
		if(but==254)
	     	{
	     	

 

			 




			 }
		if(but==254)
	     	{
			
			ind_pointer=0;
			a_ind . i=(i_enum)0;
			a_ind . s_i=0;
			a_ind . s_i1=0;
			a_ind . s_i2=0;
			a_ind . i_s=0;
			}
	     
			
		}
		
	 else if(a_ind . s_i==5)
	 	{
		if(but==126)
		{
		
		
		((LPC_CAN_TypeDef *) ((0x40000000UL) + 0x44000) )->MOD&=~(1<<0);
		}
		}
		
		
		
			
     else if(but==253)
	     {
	     a_ind . i_s--;
	     gran_char(&a_ind . i_s,0,4);
	     
	     }	
     else if(but==251)
	     {
	     a_ind . i_s++;
	     gran_char(&a_ind . i_s,0,4); 
	     
	     }	
     else if(but==254)
         	{
          
          mcp2515_transmit(1,2,3,4,5,6,7,8);
          }   
          
     else if(but==126)
         	{
          
          can1_out_adr(TXBUFF,3);
          }                      				
	}

else if(a_ind . i==iMn)
	{
	
     
 
	

	
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    
	if(main_menu_mode==mmmIT)
		{
		if(but==251)
			{
			a_ind . s_i++;
			if(a_ind . s_i==3)
				{
				a_ind . s_i++;
				}
	



 
			
			gran_char(&a_ind . s_i,0,7);
			}
			
		else if(but==253)
			{
			a_ind . s_i--;
			if(a_ind . s_i==3)
				{
				a_ind . s_i--;
				}
	



 
						
			gran_char(&a_ind . s_i,0,7);
			}	
		
	



 
		else if(a_ind . s_i==0)
			{
			if(but==254)
				{
				if(work_stat!=wsGS)
					{
					start_GS();
				


 
					a_ind . i_s=0;
					


 
					}			
				else 
					{
					stop_proc();
				
 
					}
				}
			if((but==239)&&(REV_IS_ON))
				{
				if(work_stat!=wsGS)
					{
					if(REV_STAT!=rsFF)
						{
						REV_STAT=rsFF;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
			if((but==247)&&(REV_IS_ON))
				{
				if(work_stat!=wsGS)
					{
					if(REV_STAT!=rsREW)
						{
						REV_STAT=rsREW;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
		  	}
	
		else if(a_ind . s_i==1) {
			if((REV_IS_ON)&&(AVT_REV_IS_ON)) {
				if(work_stat==wsGS) { 








































 
				}
			} else if(fiks_stat_I==0){
				if(but==239) {
			    	if(I_ug<1000)I_ug++;
					else I_ug=((I_ug/10)+1)*10;
			    	gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed__=0;
				} else if(but==111) {
					speed__++;
					if(speed__<50)	{
						if(I_ug<1000)I_ug=((I_ug/5)+1)*5;
						else I_ug=((I_ug/10)+1)*10;
			    			gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
						if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
						eepromRamSwitch=0;
						speed=1;
					} else {
						I_ug=((I_ug/50)+1)*50;
			    			gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
						if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
						eepromRamSwitch=0;
						speed=1;
					}
					speed=1;
				} else if(but==247) {
					if(I_ug<1000)I_ug--;
					else I_ug=((I_ug/10)-1)*10;
			    		gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed__=0;
				} else if(but==119) {
					speed__++;
					if(speed__<50)	{
						if(I_ug<1000)I_ug=((I_ug/5)-1)*5;
						else I_ug=((I_ug/10)-1)*10;
			    			gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
						if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
						eepromRamSwitch=0;
						speed=1;
					} else {
						I_ug=((I_ug/50)-1)*50;
			    			gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
						if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
						eepromRamSwitch=0;
						speed=1;
					}
					speed=1;
				}
			}
			if(but==254) {
				if(work_stat!=wsGS)	{
					start_GS();
				


 
					a_ind . i_s=0;
					



 
				} else {
					stop_proc();
				
 
				}
			}
			if(but==231)	{
				if(work_stat==wsGS)	{
					fiks_stat_I++;
					gran_ring(&fiks_stat_I,0,2);
				}
			}
			speed=1;
		}
	
		else if(a_ind . s_i==2)
			{
			if(but==239)
				{
				T_PROC_GS++;
				speed__=0;
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_GS=(((T_PROC_GS/10L)+1L)*10L);
					}
				else 
					{
					T_PROC_GS=(((T_PROC_GS/60L)+1L)*60L);
					}
				speed=1;
				}
			else if(but==247)
				{
				T_PROC_GS--;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_GS=(((T_PROC_GS/10L)-1L)*10L);
					
					}
				else 
					{
					T_PROC_GS=(((T_PROC_GS/60L)-1L)*60L);
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsGS)
					{
					start_GS();
					



 
					a_ind . i_s=0;
					


 
					}			
				else
					{
					stop_proc();
					

 
					}
				}

			
			if(T_PROC_GS>T_PROC_MAX)								 	
				{												
				T_PROC_GS=T_PROC_MAX+1;								
				if(T_PROC_GS_MODE!=1)								
					{											
					T_PROC_GS_MODE=1;								
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);	
					}											
				}												
	
			else if(T_PROC_GS<30)
				{
				T_PROC_GS=29;
				if(T_PROC_GS_MODE!=1)
					{
					T_PROC_GS_MODE=1;
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);
					}
				}
			else 
				{
				if(T_PROC_GS_MODE!=0)
					{
					T_PROC_GS_MODE=0;
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);
					}
				}
												
			
			lc640_write_long(0x10+100+100,T_PROC_GS);
			
			}

		else if((a_ind . s_i==4)&&(work_stat==wsOFF)) {
			temp_SS=lc640_read_int(0x10+100+2);
		     if(but==239) {
				if(temp_SS<1000) {
					temp_SS++;
				} else {
					temp_SS=((temp_SS/10)+1)*10;
				}	
		     }
		     else if(but==111) {
		     	temp_SS=((temp_SS/10)+1)*10;
		     }	
		     else if(but==247) {
				if(temp_SS<1000) {
					temp_SS--;
				} else {
					temp_SS=((temp_SS/10)-1)*10;
				}	
			}
		     else if(but==119) {
		     	temp_SS=((temp_SS/10)-1)*10;
		     }
		    	gran(&temp_SS,U_MIN,U_MAX);
			lc640_write_int(0x10+100+2,temp_SS);					
			speed=1;	
		}
		else if(a_ind . s_i==5)
		    	{
			if(but==254)a_ind . s_i=0;
		    	}
		else if(a_ind . s_i==6)
		    	{
			if(but==254)
				{
				tree_up(iSet_prl,0,0,0);
				parol_init();
				}
		    	}
		else if(a_ind . s_i==7)
		    	{
			if(but==254)
				{
				tree_up(iBps,0,0,0);
				parol_init();
				}
		    	}
		else if(a_ind . s_i==7)
		    	{
			if(but==254)
				{
				tree_up(iK_prl,0,0,0);
				parol_init();
				}
		    	}
		}

	else if(main_menu_mode==mmmIN)
		{
		if(but==251)
			{
			a_ind . s_i++;
			if(a_ind . s_i==3)
				{
				a_ind . s_i++;
				}
	
			gran_char(&a_ind . s_i,0,7);
			}
			
		else if(but==253)
			{
			a_ind . s_i--;
			if(a_ind . s_i==3)
				{
				a_ind . s_i--;
				}
		
			gran_char(&a_ind . s_i,0,7);
			}	
	
	
	


 
	
		else if(a_ind . s_i==0)
			{
			if(but==254)
				{
				if(work_stat!=wsPS)
					{
					


 
					a_ind . i_s=0;
					


 
					start_PS();
					}			
				else
					{
					stop_proc();
					
 
					}
				}

			if((but==239)&&(REV_IS_ON))
				{
				if(work_stat!=wsPS)
					{
					if(REV_STAT!=rsFF)
						{
						REV_STAT=rsFF;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
			if((but==247)&&(REV_IS_ON))
				{
				if(work_stat!=wsPS)
					{
					if(REV_STAT!=rsREW)
						{
						REV_STAT=rsREW;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
		  	}
		else if(a_ind . s_i==1)
			{
			if(but==239)
				{
		    	U_up++;
		    	gran(&U_up,U_MIN,U_MAX);
				if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
				speed__=0;
				eepromRamSwitch=0;
				find_U_curve(U_up);
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<50)
					{
					U_up=((U_up/5)+1)*5;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
					}
				else 
					{
					U_up=((U_up/50)+1)*50;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
					}
				speed=1;
				}

			else if(but==247)
				{
		    	U_up--;
		    	gran(&U_up,U_MIN,U_MAX);
				if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
				eepromRamSwitch=0;
				speed__=0;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<50)
					{
					U_up=((U_up/5)-1)*5;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
					}
				else 
					{
					U_up=((U_up/50)-1)*50;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsPS)
					{
					start_PS();
					



 
					a_ind . i_s=0;
					


 
					}			
				else
					{
					stop_proc();
					

 
					}
				}
			else if(but==231)
				{
				if(work_stat==wsPS)
					{
					fiks_stat_U++;
					gran_ring(&fiks_stat_U,0,2);
					}
				}
			speed=1;
			}
	
		else if(a_ind . s_i==2)
			{
			if(but==239)
				{
				T_PROC_PS++;
				speed__=0;
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_PS=(((T_PROC_PS/10L)+1L)*10L);
					}
				else 
					{
					T_PROC_PS=(((T_PROC_PS/60L)+1L)*60L);
					}
				speed=1;
				}
			else if(but==247)
				{
				T_PROC_PS--;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_PS=(((T_PROC_PS/10L)-1L)*10L);
					
					}
				else 
					{
					T_PROC_PS=(((T_PROC_PS/60L)-1L)*60L);
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsPS)
					{
					start_PS();
					



 
					a_ind . i_s=0;
					


 
					}			
				else
					{
					stop_proc();
					

 
					}
				}

			
			if(T_PROC_PS>T_PROC_MAX)								 	
				{												
				T_PROC_PS=T_PROC_MAX+1;								
				if(T_PROC_PS_MODE!=1)								
					{											
					T_PROC_PS_MODE=1;								
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);	
					}											
				}												
	
			else if(T_PROC_PS<30)
				{
				T_PROC_PS=29;
				if(T_PROC_PS_MODE!=1)
					{
					T_PROC_PS_MODE=1;
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);
					}
				}
			else 
				{
				if(T_PROC_PS_MODE!=0)
					{
					T_PROC_PS_MODE=0;
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);
					}
				}
												
			
			lc640_write_long(0x10+100+104,T_PROC_PS);
			
			}

		else if((a_ind . s_i==4)&&(work_stat==wsOFF)) {
			if(but==239) {
		    		if(I_maxp<1000)I_maxp++;
				else I_maxp=((I_maxp/10)+1)*10;
				gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+4,I_maxp);
				speed__=0;
			} else if(but==111) {
				speed__++;
				if(speed__<50)	{
					if(I_maxp<1000)I_maxp=((I_maxp/5)+1)*5;
					else I_maxp=((I_maxp/10)+1)*10;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				} else {
					I_maxp=((I_maxp/50)+1)*50;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				}
				speed=1;
			} else if(but==247) {
		    		if(I_maxp<1000)I_maxp--;
				else I_maxp=((I_maxp/10)-1)*10;
		    		gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+4,I_maxp);
				speed__=0;
			} else if(but==119) {
				speed__++;
				if(speed__<50)	{
					if(I_maxp<1000)I_maxp=((I_maxp/5)-1)*5;
					else I_maxp=((I_maxp/10)-1)*10;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				} else {
					I_maxp=((I_maxp/50)-1)*50;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				}
				speed=1;
			}
		}
		else if(a_ind . s_i==5)
		    	{
			if(but==254)a_ind . s_i=0;
		    	}
		else if(a_ind . s_i==6)
		    	{
			if(but==254)
				{
				tree_up(iSet_prl,0,0,0);
				parol_init();
				}
		    	}
		else if(a_ind . s_i==7)
		    	{
			if(but==254)
				{
				tree_up(iBps,0,0,0);
				parol_init();
				}
		    	}
		else if(a_ind . s_i==7)
		    	{
			if(but==254)
				{
				tree_up(iK_prl,0,0,0);
				parol_init();
				}
		    	}
		}
	else if(main_menu_mode==mmmITIN)
		{
		if(but==251)
			{
			a_ind . s_i++;
			if(a_ind . s_i==3)
				{
				a_ind . s_i++;
				}
	
			if(a_ind . s_i==7)
				{
				a_ind . s_i++;
				}
			
			gran_char(&a_ind . s_i,0,12);
			}
			
		else if(but==253)
			{
			a_ind . s_i--;
			if(a_ind . s_i==3)
				{
				a_ind . s_i--;
				}
	
			if(a_ind . s_i==7)
				{
				a_ind . s_i--;
				}
						
			gran_char(&a_ind . s_i,0,12);
			}	
	
	
	


 
		else if(a_ind . s_i==0)
			{
			if(but==254)
				{
				if(work_stat!=wsGS)
					{
					start_GS();
					



 
					a_ind . i_s=0;
					




 
					}			
				else 
					{
					stop_proc();
					


 
					}
				}

			if((but==239)&&(REV_IS_ON))
				{
				if(work_stat!=wsGS)
					{
					if(REV_STAT!=rsFF)
						{
						REV_STAT=rsFF;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
			if((but==247)&&(REV_IS_ON))
				{
				if(work_stat!=wsGS)
					{
					if(REV_STAT!=rsREW)
						{
						REV_STAT=rsREW;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
		  	}
	
		else if(a_ind . s_i==1)
			{
			if(but==239)
				{
		    		I_ug++;
		    		gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
				if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
				eepromRamSwitch=0;
				speed__=0;
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<50)
					{
					I_ug=((I_ug/5)+1)*5;
		    			gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed=1;
					}
				else 
					{
					I_ug=((I_ug/50)+1)*50;
		    			gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed=1;
					}
				speed=1;
				}

			else if(but==247)
				{
		    		I_ug--;
		    		gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
				if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
				eepromRamSwitch=0;
				speed__=0;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<50)
					{
					I_ug=((I_ug/5)-1)*5;
		    			gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed=1;
					}
				else 
					{
					I_ug=((I_ug/50)-1)*50;
		    		gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed=1;
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsGS)
					{
					start_GS();
					



 
					a_ind . i_s=0;
					




 
					}			
				else
					{
					stop_proc();
					


 
					}
				}
			if(but==231)	{
				if(work_stat==wsGS)	{
					fiks_stat_I++;
					gran_ring(&fiks_stat_I,0,2);
				}
			}
			speed=1;
			}
	
		else if(a_ind . s_i==2)
			{
			if(but==239)
				{
				T_PROC_GS++;
				speed__=0;
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_GS=(((T_PROC_GS/10L)+1L)*10L);
					}
				else 
					{
					T_PROC_GS=(((T_PROC_GS/60L)+1L)*60L);
					}
				speed=1;
				}
			else if(but==247)
				{
				T_PROC_GS--;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_GS=(((T_PROC_GS/10L)-1L)*10L);
					
					}
				else 
					{
					T_PROC_GS=(((T_PROC_GS/60L)-1L)*60L);
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsGS)
					{
					start_GS();
					



 
					a_ind . i_s=0;
					





 
					}			
				else
					{
					stop_proc();
					


 
					}
				}

			
			if(T_PROC_GS>T_PROC_MAX)								 	
				{												
				T_PROC_GS=T_PROC_MAX+1;								
				if(T_PROC_GS_MODE!=1)								
					{											
					T_PROC_GS_MODE=1;								
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);	
					}											
				}												
	
			else if(T_PROC_GS<30)
				{
				T_PROC_GS=29;
				if(T_PROC_GS_MODE!=1)
					{
					T_PROC_GS_MODE=1;
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);
					}
				}
			else 
				{
				if(T_PROC_GS_MODE!=0)
					{
					T_PROC_GS_MODE=0;
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);
					}
				}
												
			
			lc640_write_long(0x10+100+100,T_PROC_GS);
			
			}
	
		else if(a_ind . s_i==4)
			{
			if(but==254)
				{
				if(work_stat!=wsPS)
					{
					start_PS();
					



 
					a_ind . i_s=4;
					




 
					}			
				else
					{
					stop_proc();
					

 
					}
				}

			if((but==239)&&(REV_IS_ON))
				{
				if(work_stat!=wsPS)
					{
					if(REV_STAT!=rsFF)
						{
						REV_STAT=rsFF;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
			if((but==247)&&(REV_IS_ON))
				{
				if(work_stat!=wsPS)
					{
					if(REV_STAT!=rsREW)
						{
						REV_STAT=rsREW;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}


		  	}
		else if(a_ind . s_i==5) {
			if(but==239) {
		    	if(U_up<1000)U_up++;
				else U_up=((U_up/10)+1)*10;
		    	gran(&U_up,U_MIN,U_MAX);
				if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
				eepromRamSwitch=0;
				speed__=0;
			} else if(but==111) {
				speed__++;
				if(speed__<50)	{
					if(U_up<1000)U_up=((U_up/5)+1)*5;
					else U_up=((U_up/10)+1)*10;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
				} else {
					U_up=((U_up/50)+1)*50;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
				}
				speed=1;
			} else if(but==247) {
		    	if(U_up<1000)U_up--;
				else U_up=((U_up/10)-1)*10;
		    	gran(&U_up,U_MIN,U_MAX);
				if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
				eepromRamSwitch=0;
				speed__=0;
			} else if(but==119) {
				speed__++;
				if(speed__<50)	{
					if(U_up<1000)U_up=((U_up/5)-1)*5;
					else U_up=((U_up/10)-1)*10;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
				} else {
					U_up=((U_up/50)-1)*50;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
				}
				speed=1;
			} else if(but==254) {
				if(work_stat!=wsPS)	{
					start_PS();
					



 
					a_ind . i_s=4;
					




 
				} else {
					stop_proc();
					

 
				}
			}
			else if(but==231)
				{
				if(work_stat==wsPS)
					{
					fiks_stat_U++;
					gran_ring(&fiks_stat_U,0,2);
					}
				}
			speed=1;
		}
	
		else if(a_ind . s_i==6)
			{
			if(but==239)
				{
				T_PROC_PS++;
				speed__=0;
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_PS=(((T_PROC_PS/10L)+1L)*10L);
					}
				else 
					{
					T_PROC_PS=(((T_PROC_PS/60L)+1L)*60L);
					}
				speed=1;
				}
			else if(but==247)
				{
				T_PROC_PS--;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_PS=(((T_PROC_PS/10L)-1L)*10L);
					
					}
				else 
					{
					T_PROC_PS=(((T_PROC_PS/60L)-1L)*60L);
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsPS)
					{
					start_PS();
					



 
					a_ind . i_s=4;
					




 
					}			
				else
					{
					stop_proc();
					

 
					}
				}

			
			if(T_PROC_PS>T_PROC_MAX)								 	
				{												
				T_PROC_PS=T_PROC_MAX+1;								
				if(T_PROC_PS_MODE!=1)								
					{											
					T_PROC_PS_MODE=1;								
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);	
					}											
				}												
	
			else if(T_PROC_PS<30)
				{
				T_PROC_PS=29;
				if(T_PROC_PS_MODE!=1)
					{
					T_PROC_PS_MODE=1;
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);
					}
				}
			else 
				{
				if(T_PROC_PS_MODE!=0)
					{
					T_PROC_PS_MODE=0;
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);
					}
				}
												
			
			lc640_write_long(0x10+100+104,T_PROC_PS);
			
			}

		else if((a_ind . s_i==8)&&(work_stat==wsOFF)) {
			temp_SS=lc640_read_int(0x10+100+2);
		     if(but==239) {
				if(temp_SS<1000) {
					temp_SS++;
				} else {
					temp_SS=((temp_SS/10)+1)*10;
				}	
		     }
		     else if(but==111) {
		     	temp_SS=((temp_SS/10)+1)*10;
		     }	
		     else if(but==247) {
				if(temp_SS<1000) {
					temp_SS--;
				} else {
					temp_SS=((temp_SS/10)-1)*10;
				}	
			}
		     else if(but==119) {
		     	temp_SS=((temp_SS/10)-1)*10;
		     }
		    	gran(&temp_SS,U_MIN,U_MAX);
			lc640_write_int(0x10+100+2,temp_SS);					
			speed=1;	
		}
		else if((a_ind . s_i==9)&&(work_stat==wsOFF)){
			if(but==239) {
		    		if(I_maxp<1000)I_maxp++;
				else I_maxp=((I_maxp/10)+1)*10;
				gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+4,I_maxp);
				speed__=0;
			} else if(but==111) {
				speed__++;
				if(speed__<50)	{
					if(I_maxp<1000)I_maxp=((I_maxp/5)+1)*5;
					else I_maxp=((I_maxp/10)+1)*10;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				} else {
					I_maxp=((I_maxp/50)+1)*50;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				}
				speed=1;
			} else if(but==247) {
		    		if(I_maxp<1000)I_maxp--;
				else I_maxp=((I_maxp/10)-1)*10;
		    		gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+4,I_maxp);
				speed__=0;
			} else if(but==119) {
				speed__++;
				if(speed__<50)	{
					if(I_maxp<1000)I_maxp=((I_maxp/5)-1)*5;
					else I_maxp=((I_maxp/10)-1)*10;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				} else {
					I_maxp=((I_maxp/50)-1)*50;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				}
				speed=1;
			}
		}
		else if(a_ind . s_i==10)
		    {
			if(but==254)a_ind . s_i=0;
		    }
		else if(a_ind . s_i==11)
		    {
			if(but==254)
				{
				tree_up(iSet_prl,0,0,0);
				parol_init();
				}
		    }
		else if(a_ind . s_i==12)
		    	{
			if(but==254)
				{
				tree_up(iBps,0,0,0);
				parol_init();
				}
		    	}
		else if(a_ind . s_i==12)
		    {
			if(but==254)
				{
				tree_up(iK_prl,0,0,0);
				parol_init();
				}
		    	}
		}
	else  
		{
		if(but==251)
			{
			a_ind . s_i++;
			if(a_ind . s_i==3)
				{
				a_ind . s_i++;
				}
	
			if(a_ind . s_i==7)
				{
				a_ind . s_i++;
				}
			
			gran_char(&a_ind . s_i,0,12);
			}
			
		else if(but==253)
			{
			a_ind . s_i--;
			if(a_ind . s_i==3)
				{
				a_ind . s_i--;
				}
	
			if(a_ind . s_i==7)
				{
				a_ind . s_i--;
				}
						
			gran_char(&a_ind . s_i,0,12);
			}	
	
	



 
		else if(a_ind . s_i==0)
			{
			if(but==254)
				{
				if(work_stat!=wsPS)
					{
					start_PS();
					



 
					a_ind . i_s=0;
					



 
					}			
				else
					{
					stop_proc();
					


 
					}
				}

			if((but==239)&&(REV_IS_ON))
				{
				if(work_stat!=wsPS)
					{
					if(REV_STAT!=rsFF)
						{
						REV_STAT=rsFF;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
			if((but==247)&&(REV_IS_ON))
				{
				if(work_stat!=wsPS)
					{
					if(REV_STAT!=rsREW)
						{
						REV_STAT=rsREW;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
		  	}
		else if(a_ind . s_i==1) {
			if(but==239) {
		    	if(U_up<1000)U_up++;
				else U_up=((U_up/10)+1)*10;
		    	gran(&U_up,U_MIN,U_MAX);
				if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
				eepromRamSwitch=0;
				speed__=0;
			} else if(but==111) {
				speed__++;
				if(speed__<50)	{
					if(U_up<1000)U_up=((U_up/5)+1)*5;
					else U_up=((U_up/10)+1)*10;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
				} else {
					U_up=((U_up/50)+1)*50;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
				}
				speed=1;
			} else if(but==247) {
		    	if(U_up<1000)U_up--;
				else U_up=((U_up/10)-1)*10;
		    	gran(&U_up,U_MIN,U_MAX);
				if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
				eepromRamSwitch=0;
				speed__=0;
			} else if(but==119) {
				speed__++;
				if(speed__<50)	{
					if(U_up<1000)U_up=((U_up/5)-1)*5;
					else U_up=((U_up/10)-1)*10;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
				} else {
					U_up=((U_up/50)-1)*50;
		    		gran(&U_up,U_MIN,U_MAX);
					if(eepromRamSwitch==0)lc640_write_int(0x10+18,U_up);
					eepromRamSwitch=0;
					speed=1;
				}
				speed=1;
			} else if(but==254) {
				if(work_stat!=wsPS)
					{
					start_PS();
					



 
					a_ind . i_s=0;
					




 
					}			
				else
					{
					stop_proc();
					

 
					}
			}
			else if(but==231)
				{
				if(work_stat==wsPS)
					{
					fiks_stat_U++;
					gran_ring(&fiks_stat_U,0,2);
					}
				}

			speed=1;
		}
	
		else if(a_ind . s_i==2)
			{
			if(but==239)
				{
				T_PROC_PS++;
				speed__=0;
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_PS=(((T_PROC_PS/10L)+1L)*10L);
					}
				else 
					{
					T_PROC_PS=(((T_PROC_PS/60L)+1L)*60L);
					}
				speed=1;
				}
			else if(but==247)
				{
				T_PROC_PS--;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_PS=(((T_PROC_PS/10L)-1L)*10L);
					
					}
				else 
					{
					T_PROC_PS=(((T_PROC_PS/60L)-1L)*60L);
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsPS)
					{
					start_PS();
					



 
					a_ind . i_s=0;
					




 
					}			
				else
					{
					stop_proc();
					

 
					}
				}

			
			if(T_PROC_PS>T_PROC_MAX)								 	
				{												
				T_PROC_PS=T_PROC_MAX+1;								
				if(T_PROC_PS_MODE!=1)								
					{											
					T_PROC_PS_MODE=1;								
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);	
					}											
				}												
	
			else if(T_PROC_PS<30)
				{
				T_PROC_PS=29;
				if(T_PROC_PS_MODE!=1)
					{
					T_PROC_PS_MODE=1;
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);
					}
				}
			else 
				{
				if(T_PROC_PS_MODE!=0)
					{
					T_PROC_PS_MODE=0;
					lc640_write_int(0x10+100+124,T_PROC_PS_MODE);
					}
				}
												
			
			lc640_write_long(0x10+100+104,T_PROC_PS);
			
			}
	
		else if(a_ind . s_i==4)
			{
			if(but==254)
				{
				if(work_stat!=wsGS)
					{
					start_GS();
					



 
					a_ind . i_s=4;
					




 
					}			
				else 
					{
					stop_proc();
					

 
					}
				}
			if((but==239)&&(REV_IS_ON))
				{
				if(work_stat!=wsGS)
					{
					if(REV_STAT!=rsFF)
						{
						REV_STAT=rsFF;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}
			if((but==247)&&(REV_IS_ON))
				{
				if(work_stat!=wsGS)
					{
					if(REV_STAT!=rsREW)
						{
						REV_STAT=rsREW;
						lc640_write_int(0x10+100+144,REV_STAT);
						}
					}
				}

		  	}
		else if(a_ind . s_i==5)
			{
			if(but==239)
				{
		    	I_ug++;
		    	gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
				if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
				eepromRamSwitch=0;
				speed__=0;
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<50)
					{
					I_ug=((I_ug/5)+1)*5;
		    		gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed=1;
					}
				else 
					{
					I_ug=((I_ug/50)+1)*50;
		    		gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed=1;
					}
				speed=1;
				}

			else if(but==247)
				{
		    	I_ug--;
		    	gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
				if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
				eepromRamSwitch=0;
				speed__=0;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<50)
					{
					I_ug=((I_ug/5)-1)*5;
		    		gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed=1;
					}
				else 
					{
					I_ug=((I_ug/50)-1)*50;
		    		gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					if(eepromRamSwitch==0)lc640_write_int(0x10+16,I_ug);
					eepromRamSwitch=0;
					speed=1;
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsGS)
					{
					start_GS();
					



 
					a_ind . i_s=4;
					




 
					}			
				else
					{
					stop_proc();
					
 
					}
				}
			if(but==231)	{
				if(work_stat==wsGS)	{
					fiks_stat_I++;
					gran_ring(&fiks_stat_I,0,2);
				}
			}
			speed=1;
			}
	
		else if(a_ind . s_i==6)
			{
			if(but==239)
				{
				T_PROC_GS++;
				speed__=0;
				}
			else if(but==111)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_GS=(((T_PROC_GS/10L)+1L)*10L);
					}
				else 
					{
					T_PROC_GS=(((T_PROC_GS/60L)+1L)*60L);
					}
				speed=1;
				}
			else if(but==247)
				{
				T_PROC_GS--;
				}
			else if(but==119)
				{
				speed__++;
				if(speed__<20)
					{
					T_PROC_GS=(((T_PROC_GS/10L)-1L)*10L);
					
					}
				else 
					{
					T_PROC_GS=(((T_PROC_GS/60L)-1L)*60L);
					}
				speed=1;
				}

			else if(but==254)
				{
				if(work_stat!=wsGS)
					{
					start_GS();
					



 
					a_ind . i_s=4;
					




 
					}			
				else
					{
					stop_proc();
					

 
					}
				}

			
			if(T_PROC_GS>T_PROC_MAX)								 	
				{												
				T_PROC_GS=T_PROC_MAX+1;								
				if(T_PROC_GS_MODE!=1)								
					{											
					T_PROC_GS_MODE=1;								
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);	
					}											
				}												
	
			else if(T_PROC_GS<30)
				{
				T_PROC_GS=29;
				if(T_PROC_GS_MODE!=1)
					{
					T_PROC_GS_MODE=1;
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);
					}
				}
			else 
				{
				if(T_PROC_GS_MODE!=0)
					{
					T_PROC_GS_MODE=0;
					lc640_write_int(0x10+100+122,T_PROC_GS_MODE);
					}
				}
												
			
			lc640_write_long(0x10+100+100,T_PROC_GS);
			
			}

		else if((a_ind . s_i==8)&&(work_stat==wsOFF)) {
			temp_SS=lc640_read_int(0x10+100+2);
		     if(but==239) {
				if(temp_SS<1000) {
					temp_SS++;
				} else {
					temp_SS=((temp_SS/10)+1)*10;
				}	
		     }
		     else if(but==111) {
		     	temp_SS=((temp_SS/10)+1)*10;
		     }	
		     else if(but==247) {
				if(temp_SS<1000) {
					temp_SS--;
				} else {
					temp_SS=((temp_SS/10)-1)*10;
				}	
			}
		     else if(but==119) {
		     	temp_SS=((temp_SS/10)-1)*10;
		     }
		    	gran(&temp_SS,U_MIN,U_MAX);
			lc640_write_int(0x10+100+2,temp_SS);					
			speed=1;	
		}
		else if((a_ind . s_i==9)&&(work_stat==wsOFF)) {
			if(but==239) {
		    		if(I_maxp<1000)I_maxp++;
				else I_maxp=((I_maxp/10)+1)*10;
				gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+4,I_maxp);
				speed__=0;
			} else if(but==111) {
				speed__++;
				if(speed__<50)	{
					if(I_maxp<1000)I_maxp=((I_maxp/5)+1)*5;
					else I_maxp=((I_maxp/10)+1)*10;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				} else {
					I_maxp=((I_maxp/50)+1)*50;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				}
				speed=1;
			} else if(but==247) {
		    		if(I_maxp<1000)I_maxp--;
				else I_maxp=((I_maxp/10)-1)*10;
		    		gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+4,I_maxp);
				speed__=0;
			} else if(but==119) {
				speed__++;
				if(speed__<50)	{
					if(I_maxp<1000)I_maxp=((I_maxp/5)-1)*5;
					else I_maxp=((I_maxp/10)-1)*10;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				} else {
					I_maxp=((I_maxp/50)-1)*50;
		    			gran(&I_maxp,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+4,I_maxp);
					speed=1;
				}
				speed=1;
			}
		}
		else if(a_ind . s_i==10)
		    	{
			if(but==254)a_ind . s_i=0;
		    	}
		else if(a_ind . s_i==11)
		    	{
			if(but==254)
				{
				tree_up(iSet_prl,0,0,0);
				parol_init();
				}
		    	}
		else if(a_ind . s_i==12)
		    	{
			if(but==254)
				{
				tree_up(iBps,0,0,0);
				parol_init();
				}
		    	}
		else if(a_ind . s_i==12)
		    {
			if(but==254)
				{
				tree_up(iK_prl,0,0,0);
				parol_init();
				}
		    	}
		}
	}




else if(a_ind . i==iBps)
	{
	ret(1000);
	if (but==253)
		{      
		a_ind . s_i--;
		 gran_char(&a_ind . s_i,0,NUMIST-2);
		
		}
		
	else if (but==251)
		{
		a_ind . s_i++;
		 gran_char(&a_ind . s_i,0,NUMIST-2);
		
		
		}

	else if(but==247)
		{
	     tree_down(0,0);
	     ret(0);
		}

	else if((but==254)&&((a_ind . s_i==(NUMIST-2)))||((NUMIST==1)&&(a_ind . s_i==0)))
		{
	     tree_down(0,0);
	     ret(0);
		}
	}
else if(a_ind . i==iEnerg)
	{
	ret(1000);
	if (but==253)
		{      
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,4);
		}
		
	else if (but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,4);		
		}

	else if((but==254)&&(a_ind . s_i==4))
		{
	     tree_down(0,0);
	     ret(0);
		}
     }

else if(a_ind . i==iEnerg3)
	{
	ret(1000);
	if (but==253)
		{      
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,8);
		}
		
	else if (but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,8);		
		}

	else if((but==254)&&(a_ind . s_i==8))
		{
	     tree_down(0,0);
	     ret(0);
		}
     }

else if((a_ind . i==iSet_prl)||(a_ind . i==iK_prl))
	{
	ret(50);
	if(but==239)
		{
		a_ind . s_i++;
		gran_ring_char(&a_ind . s_i,0,2);
		}
	else if(but==247)
		{
		a_ind . s_i--;
		gran_ring_char(&a_ind . s_i,0,2);
		}	
	else if(but==253)
		{
		parol[a_ind . s_i]++;
		gran_ring_char(&parol[a_ind . s_i],0,9);
		}	
	else if(but==251)
		{
		parol[a_ind . s_i]--;
		gran_ring_char(&parol[a_ind . s_i],0,9);
		}	
	else if(but==254)
		{
		unsigned short tempU;
		tempU=parol[2]+(parol[1]*10U)+(parol[0]*100U);
		
		if(a_ind . i==iSet_prl)
			{
	     	if(tempU==184) 
				{
				tree_down(0,0);
				tree_up(iSet,0,0,0);
				ret(1000);
				}
			else 
				{
		          tree_down(0,0);
	    	          show_mess("                    ",
	          			"       Пароль       ",
	          			"     неверный!!!    ",
	          			"                    ",1000);
				}
			}
		else	if(a_ind . i==iK_prl)
			{
	     	if(tempU==873) 
				{
				tree_down(0,0);
				tree_up(iK,0,0,0);
				ret(1000);
				
				}
			else 
				{
		          tree_down(0,0);
	    	          show_mess("                    ",
	          			"       Пароль       ",
	          			"     неверный!!!    ",
	          			"                    ",1000);
				}
			} 
	
		else	if(a_ind . i==iAusw_prl)
			{
	     	if(tempU==949) 
				{
				tree_down(0,0);
				tree_up(iAusw_set,1,0,0);
				default_temp=10;
				ret(0);
				}
			else 
				{
		          tree_down(0,0);
	    	          show_mess("                    ",
	          			"       Пароль       ",
	          			"     неверный!!!    ",
	          			"                    ",1000);
				}
			} 	
			
		else	if(a_ind . i==iSet_st_prl)
			{
	     	if(tempU==295) 
				{
	
				a_ind . s_i=1;
				a_ind . i_s=0;
				default_temp=10;
				}
			else 
				{
		          tree_down(0,0);
	    	          show_mess("                    ",
	          			"       Пароль       ",
	          			"     неверный!!!    ",
	          			"                    ",1000);
				}
			} 
						

		else if(a_ind . i==iSpc_prl_ke)
			{
			if(tempU==125) 
				{
				char temp;
				temp=a_ind . s_i1;
				tree_down(0,0);
				tree_up(iKe,0,0,temp);
				ret(1000);
				}
	  		else 
				{	
		          tree_down(0,0);
	    	          show_mess("                    ",
	          			"       Пароль       ",
	          			"     неверный!!!    ",
	          			"                    ",1000);
				}
			}
		else if(a_ind . i==iSpc_prl_vz)
			{
			if(tempU==126) 
				{
				tree_down(0,0);
				tree_up(iVz,0,0,0);
				ret(1000);
				}
	  		else 
				{
		          tree_down(0,0);
	    	          show_mess("                    ",
	          			"       Пароль       ",
	          			"     неверный!!!    ",
	          			"                    ",1000);
				}     	          
			}
		}
	}

else if(a_ind . i==iSpc)
	{
	
	
	ret(1000);
	if (but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,4);
		}
	else if (but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,4);
		}
	else if(but==254)
		{
		if(a_ind . s_i==0)
			{   
               tree_up(iSpc_prl_vz,0,0,0);
			parol_init();
			}
		else if(a_ind . s_i==1)
			{
               tree_up(iAvz,0,0,0);
               parol_init();
			}			
		else if((a_ind . s_i==2)||(a_ind . s_i==3))
			{
               tree_up(iSpc_prl_ke,0,0,a_ind . s_i-2);
              	parol_init();
			} 
	






 						
		else if(a_ind . s_i==4)
			{
			tree_down(0,0);
			ret(0);
			}	
		}
	else if(but==247)
		{
		tree_down(0,0);
		ret(0);
		}			
	}

else if(a_ind . i==iVz)
	{
	ret_ind(0,0,0);
	
	if (but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,2);
		}
	else if (but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,2);
		}
	else if(a_ind . s_i==0)
		{
		if(spc_stat!=spcVZ)
			{
			if(but==239)
				{
				VZ_HR++;
				}
			else if(but==247)
				{
				VZ_HR--;
				}
			gran(&VZ_HR,1,24);
			lc640_write_int(0x10+100+76,VZ_HR);
			}			
          }
	else if(a_ind . s_i==1)
		{
          if(spc_stat!=spcVZ)
          	{
          	char temp=0;
          	
          	if(temp==22) 
          		{
          		a_ind . s_i=22;
          		ret_ind(iVz,1,5);
          		} 
			else if(temp==33) 
          		{
          		a_ind . s_i=33;
          		ret_ind(iVz,1,5);
          		}          		
          	}    
         	else if(spc_stat==spcVZ)
          	{
          	
          	}             	 
		}			
	else if(a_ind . s_i==2)
		{                 
		if(but==254)
			{
			tree_down(0,0);
			}
          } 
	}





else if(a_ind . i==iSet)
	{

	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		if(a_ind . s_i==2)
			{
			a_ind . s_i=3;
			a_ind . i_s=2;
			}
		if(a_ind . s_i==4)
			{
			a_ind . s_i=5;
			a_ind . i_s=4;
			}
		if(a_ind . s_i==6)
			{
			a_ind . s_i=7;
			a_ind . i_s=6;
			}
		if(a_ind . s_i==8)
			{
			a_ind . s_i=9;
			a_ind . i_s=8;
			}
          if(a_ind . s_i==10)
               {
			a_ind . s_i=11;
			a_ind . i_s=10;
               }
          if(a_ind . s_i==12)
               {
			a_ind . s_i=13;
			a_ind . i_s=12;
               }
          if(a_ind . s_i==14)
               {
			a_ind . s_i=15;
			a_ind . i_s=14;
               }
          if(a_ind . s_i==16)
               {
			a_ind . s_i=17;
			
               }
          if(a_ind . s_i==20)
               {
               a_ind . i_s=19;
               }
          if(a_ind . s_i==21)
               {
               a_ind . s_i=22;
               
               }
          if(a_ind . s_i==23)
               {
			
			a_ind . i_s=22;
               }
          if(a_ind . s_i==24)
               {
			a_ind . s_i=25;
			a_ind . i_s=24;
               }
         	if(a_ind . s_i==26)
               {
			a_ind . s_i=27;
			
               }
          if(a_ind . s_i==27)
               {
			a_ind . i_s=26;
               }
          if(a_ind . s_i==29)
               {
			a_ind . s_i=30;
			a_ind . i_s=29;
               }
          


 
          if(a_ind . s_i==31)
               {
			a_ind . s_i=32;
			a_ind . i_s=29;
               }
														
		gran_char(&a_ind . s_i,0,35);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		if(a_ind . s_i==2)
			{
			a_ind . s_i=1;
			}
		if(a_ind . s_i==4)
			{
			a_ind . s_i=3;
			
			}
		if(a_ind . s_i==6)
			{
			a_ind . s_i=5;
			
			}
		if(a_ind . s_i==8)
			{
			a_ind . s_i=7;
			
			}
		if(a_ind . s_i==10)
			{
			a_ind . s_i=9;
			
			}
		if(a_ind . s_i==12)
			{
			a_ind . s_i=11;
			
			}
		if(a_ind . s_i==14)
			{
			a_ind . s_i=13;
			
			}
		if(a_ind . s_i==16)
			{
			a_ind . s_i=15;
			
			}
		if(a_ind . s_i==21)
			{
			a_ind . s_i=20;
			a_ind . i_s=19;
			}




 
		if(a_ind . s_i==24)
			{
			a_ind . s_i=23;
			
			}
		if(a_ind . s_i==26)
			{
			a_ind . s_i=25;
			
			}
          if(a_ind . s_i==29)
               {
			a_ind . s_i=28;
			a_ind . i_s=28;
               }
          if(a_ind . s_i==31)
               {
			a_ind . s_i=30;
			a_ind . i_s=30;
               }
		gran_char(&a_ind . s_i,0,35);
		}
	else if(but==123)
		{
		a_ind . s_i=35-2;
		}

     else if(a_ind . s_i==0)
	     {
	     if((but==239)||(but==111))
	     	{
	     	NUMIST++;
	     	gran(&NUMIST,1,32);
	     	lc640_write_int(0x10+100+36,NUMIST);
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	NUMIST--;
	     	gran(&NUMIST,1,32);
	     	lc640_write_int(0x10+100+36,NUMIST);
	     	}
          }

     else if(a_ind . s_i==1)
	     {
		if(but==239)
			{
			T_PROC_MAX=(((T_PROC_MAX/60L)+1L)*60L);
			speed=1;
			}
		else if(but==111)
			{
			T_PROC_MAX=(((T_PROC_MAX/300L)+1L)*300L);
			speed=1;
			}
		else if(but==247)
			{
			T_PROC_MAX=(((T_PROC_MAX/60L)-1L)*60L);
			speed=1;
			}

		else if(but==119)
			{
			T_PROC_MAX=(((T_PROC_MAX/60L)-5L)*60L);
			speed=1;
			}						
		gran_long(&T_PROC_MAX,300L,86400L);
		lc640_write_long(0x10+100+108,T_PROC_MAX);
		
		}					
     else if(a_ind . s_i==3)
	     {
	     if((but==239)||(but==111))
	     	{
	     	TIME_VISION=1;
	     	lc640_write_int(0x10+100+112,TIME_VISION);
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	TIME_VISION=0;
	     	lc640_write_int(0x10+100+112,TIME_VISION);
	     	}
          }
     else if(a_ind . s_i==5)
	     {
	     if((but==239)||(but==111))
	     	{
	     	TIME_VISION_PULT=1;
	     	lc640_write_int(0x10+100+114,TIME_VISION_PULT);
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	TIME_VISION_PULT=0;
	     	lc640_write_int(0x10+100+114,TIME_VISION_PULT);
	     	}
          }
     else if(a_ind . s_i==7)
	     {
	     if((but==239)||(but==111))
	     	{
	     	I_LOAD_MODE=1;
	     	lc640_write_int(0x10+100+116,I_LOAD_MODE);
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	I_LOAD_MODE=0;
	     	lc640_write_int(0x10+100+116,I_LOAD_MODE);
	     	}
          }

     else if(a_ind . s_i==9)
	     {
	     if((but==239)||(but==111))
	     	{
	     	if(main_menu_mode==mmmIT)main_menu_mode=mmmIN;
			else if(main_menu_mode==mmmIN)main_menu_mode=mmmITIN;
			else if(main_menu_mode==mmmITIN)main_menu_mode=mmmINIT;
			else main_menu_mode=mmmIT;
			lc640_write_int(0x10+100+118,main_menu_mode);
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	if(main_menu_mode==mmmIT)main_menu_mode=mmmINIT;
			else if(main_menu_mode==mmmINIT)main_menu_mode=mmmITIN;
			else if(main_menu_mode==mmmITIN)main_menu_mode=mmmIN;
			else main_menu_mode=mmmIT;
			lc640_write_int(0x10+100+118,main_menu_mode);
	     	}
          }

	else if(a_ind . s_i==11)
	    	{
		if(but==254)
			{
			tree_up(iFiks_set,0,0,0);
			}
	    	}

	else if(a_ind . s_i==13)
	    	{
		if(but==254)
			{
			tree_up(iCurr_contr_set,0,0,0);
			}
	    	}

	else if(a_ind . s_i==15)
	    	{
		if(but==254)
			{
			tree_up(iVolt_contr_set,0,0,0);
			}
	    	}

     else if(a_ind . s_i==17)
	     {
	     if((but==239)||(but==111))
	     	{
	     	if(restart_enable==reON)restart_enable=reOFF;
			else restart_enable=reON;
	     	lc640_write_int(0x10+100+120,restart_enable);
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	if(restart_enable==reOFF)restart_enable=reON;
			else restart_enable=reOFF;
	     	lc640_write_int(0x10+100+120,restart_enable);
	     	}
          }

	else if(a_ind . s_i==18)
	    	{
		if(but==254)
			{
			tree_up(iLan_set,0,0,0);
			}
	    	}

     else if(a_ind . s_i==19)
	     {
	     if((but==239)||(but==111))
	     	{
	     	MODBUS_ADRESS++;
	     	gran(&MODBUS_ADRESS,1,100);
	     	lc640_write_int(0x10+100+128,MODBUS_ADRESS);
			speed=1;
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	MODBUS_ADRESS--;
	     	gran(&MODBUS_ADRESS,1,100);
	     	lc640_write_int(0x10+100+128,MODBUS_ADRESS);
			speed=1;
	     	}
          }
     else if(a_ind . s_i==20)
	     {
	     if((but==239)||(but==111))
	     	{
			if(MODBUS_BAUDRATE==120)MODBUS_BAUDRATE=240;
			else if(MODBUS_BAUDRATE==240)MODBUS_BAUDRATE=480;
	     	else if(MODBUS_BAUDRATE==480)MODBUS_BAUDRATE=960;
			else if(MODBUS_BAUDRATE==960)MODBUS_BAUDRATE=1920;
			else if(MODBUS_BAUDRATE==1920)MODBUS_BAUDRATE=3840;
			
			else if(MODBUS_BAUDRATE==3840)MODBUS_BAUDRATE=5760;
			else if(MODBUS_BAUDRATE==5760)MODBUS_BAUDRATE=120;
			else MODBUS_BAUDRATE=960;
	     	gran(&MODBUS_BAUDRATE,120,5760);
	     	lc640_write_int(0x10+100+130,MODBUS_BAUDRATE);

			sc16is700_init((uint32_t)(MODBUS_BAUDRATE*10UL));

	     	}
	     
	     else if((but==247)||(but==119))
	     	{
			if(MODBUS_BAUDRATE==120)MODBUS_BAUDRATE=5760;
			else if(MODBUS_BAUDRATE==240)MODBUS_BAUDRATE=120;
	     	else if(MODBUS_BAUDRATE==480)MODBUS_BAUDRATE=240;
			else if(MODBUS_BAUDRATE==960)MODBUS_BAUDRATE=480;
			else if(MODBUS_BAUDRATE==1920)MODBUS_BAUDRATE=960;
			else if(MODBUS_BAUDRATE==3840)MODBUS_BAUDRATE=1920;
			
			else if(MODBUS_BAUDRATE==5760)MODBUS_BAUDRATE=3840;
			else MODBUS_BAUDRATE=960;
	     	gran(&MODBUS_BAUDRATE,120,5760);
	     	lc640_write_int(0x10+100+130,MODBUS_BAUDRATE);

			sc16is700_init((uint32_t)(MODBUS_BAUDRATE*10UL));

	     	}
          }
	else if(a_ind . s_i==22)
	    	{
		if(but==254)
			{
			tree_up(iAvtRev,0,0,0);
			}
	    	}

     else if(a_ind . s_i==23)
	     {
	     if((but==239)||(but==111))
	     	{
	     	CURR_FADE_IN++;
	     	gran(&CURR_FADE_IN,0,500);
	     	lc640_write_int(0x10+100+164,CURR_FADE_IN);
			speed=1;
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	CURR_FADE_IN--;
	     	gran(&CURR_FADE_IN,0,500);
	     	lc640_write_int(0x10+100+164,CURR_FADE_IN);
			speed=1;
	     	}
		}
	else if(a_ind . s_i==25)
	    	{
		if(but==254)
			{
			tree_up(iExtCtrl,0,0,0);
			}
	    	}
	else if(a_ind . s_i==27)
	    	{
		if(but==254)
			{
			tree_up(iRele_sel,0,0,0);
			}
	    	}
	else if(a_ind . s_i==28)
	    	{
		if(but==254)
			{
			tree_up(iAch_off,0,0,0);
			}
	    	}
	else if(a_ind . s_i==30)
	    	{
		if(but==254)
			{
			tree_up(iCurr_off,0,0,0);
			}
	    	}
	else if(a_ind . s_i==32)
		{
		temp_SS=lc640_read_int(0x10+58);
	     if(but==239)
	     	{
		    temp_SS=((temp_SS/10)+1)*10;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS=((temp_SS/10)+10)*10;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS=((temp_SS/10)-1)*10;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS=((temp_SS/10)-10)*10;
	     	}
	    gran(&temp_SS,(U_MAX*11)/10,(U_MAX*14)/10);
		lc640_write_int(0x10+58,temp_SS);					
		speed=1;	
					
		}
	else if(a_ind . s_i==35-2)
	    	{
		if(but==254)
			{
			tree_down(0,0);
			a_ind . s_i=0;
			}
	    	}
	else if(a_ind . s_i==35-1)
	    	{
		if(but==254)
			{
			tree_up(iK_prl,0,0,0);
			parol_init();
			}
	    	}	
	else if(a_ind . s_i==35)
	    {
		if(but==254)
			{
			tree_up(iTst_pwm,1,0,0);
			tst_pwm_u=100;
			tst_pwm_i=200;
			}
	    }	
     }



else if(a_ind . i==iSet_T)
	{
	signed char temp;
	if(but==239)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,5);
		}
	else if(but==247)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,5);
		}
	else if(but==254)
		{
		tree_down(0,0);
		}	
	else if(a_ind . s_i==0)
	     {
	     temp=((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->HOUR;
	     if((but==253)||(but==125))
	          {
	          temp++;
	          gran_ring_char(&temp,0,23);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->HOUR=temp;
	          }
          else if((but==251)||(but==123))
	          {
	          temp--;
	          gran_ring_char(&temp,0,23);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->HOUR=temp;
	          }	
	     speed=1;               
	     }
     else if(a_ind . s_i==1)
	     {
	     temp=((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MIN;
	     if((but==253)||(but==125))
	          {
	          temp++;
	          gran_ring_char(&temp,0,59);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MIN=temp;
	          }
          else if((but==251)||(but==123))
	          {
	          temp--;
	          gran_ring_char(&temp,0,59);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MIN=temp;
	          }	
	     speed=1;               
	     }
     else if(a_ind . s_i==2)
	     {
	     temp=((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->SEC;
	     if((but==253)||(but==125))
	          {
	          temp=0;
	          gran_ring_char(&temp,0,59);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->SEC=temp;
	          }
          else if((but==251)||(but==123))
	          {
	          temp=0;
	          gran_ring_char(&temp,0,59);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->SEC=temp;
	          }	
	     speed=1;               
	     }

     else if(a_ind . s_i==3)
	     {
	     temp=((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->DOM;
	     if((but==253)||(but==125))
	          {
	          temp++;
	          gran_ring_char(&temp,1,31);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->DOM=temp;
	          }
          else if((but==251)||(but==123))
	          {
	          temp--;
	          gran_ring_char(&temp,1,31);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->DOM=temp;
	          }	
	     speed=1;               
	     }
     else if(a_ind . s_i==4)
	     {
	     temp=((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MONTH;
	     if((but==253)||(but==125))
	          {
	          temp++;
	          gran_ring_char(&temp,1,12);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MONTH=temp;
	          }
          else if((but==251)||(but==123))
	          {
	          temp--;
	          gran_ring_char(&temp,1,12);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MONTH=temp;
	          }	
	     speed=1;               
	     }	  
     else if(a_ind . s_i==5)
	     {
	     temp=((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->YEAR;
	     if((but==253)||(but==125))
	          {
	          temp++;
	          gran_ring_char(&temp,0,99);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->YEAR=temp;
	          }
          else if((but==251)||(but==123))
	          {
	          temp--;
	          gran_ring_char(&temp,0,99);
	          ((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->YEAR=temp;
	          }	
	     speed=1;               
	     }		        
	}  
































































 
else if(a_ind . i==iStr)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		if(a_ind . s_i==2)a_ind . i_s=1;
		if(a_ind . s_i==3)a_ind . s_i++;
		gran_char(&a_ind . s_i,1,5);	

		}
	else if(but==253)
		{
		a_ind . s_i--;
		if(a_ind . s_i==3)a_ind . s_i--;
		gran_char(&a_ind . s_i,1,5);	 
		}
	else if(but==123)
		{
 		a_ind . s_i=5;		  
		}				
     else if(a_ind . s_i==1)
	     {
	     if((but==239)||(but==111))
	     	{
	     	NUMIST++;
	     	gran(&NUMIST,0,30);
	     	lc640_write_int(0x10+100+36,NUMIST);
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	NUMIST--;
	     	gran(&NUMIST,0,30);
	     	lc640_write_int(0x10+100+36,NUMIST);
	     	}
          }	
 















 	
 
      else if(a_ind . s_i==3)   
	     {
	     if((but==239)||(but==111))
	     	{
	     	NUMAVT++;
	     	gran(&NUMAVT,0,12);
	     	lc640_write_int(3000+98,NUMAVT);
	     	}
	     
	     else if((but==247)||(but==119))
	     	{
	     	NUMAVT--;
	     	gran(&NUMAVT,0,12);
	     	lc640_write_int(3000+98,NUMAVT);
	     	}
          }	
          
     else if(a_ind . s_i==5)	   
	     {
	     if(but==254)
	          {
			tree_down(0,0);
	          }
          }	          
	}

   


else if (a_ind . i==iLan_set)
	{
	char si_max;
	ret(1000);

	si_max=1;
	if(ETH_IS_ON!=0)si_max=21;

	if(but==251)
		{
		a_ind . s_i++;

		if((a_ind . s_i==2)&&(a_ind . i_s==0))
			{
			a_ind . i_s=1;
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==3) 
			{
			a_ind . s_i=4;
			a_ind . i_s=3;
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==5) 
			{
			a_ind . s_i=6;
			a_ind . i_s=5;
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==7) 
			{
			a_ind . s_i=8;
			
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==10) 
			{
			
			
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==11) 
			{
			
			a_ind . i_s=10;
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==12) 
			{
			a_ind . s_i++;
			}
		if(a_ind . s_i==13) 
			{
			
			a_ind . i_s=12;
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==14) 
			{
			a_ind . s_i++;
			}
		if(a_ind . s_i==15) 
			{
			
			a_ind . i_s=14;
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==16) 
			{
			a_ind . s_i++;
			}
		if(a_ind . s_i==17) 
			{
			
			a_ind . i_s=16;
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==18) 
			{
			a_ind . s_i++;
			}
		if(a_ind . s_i==19) 
			{
			
			a_ind . i_s=18;
			a_ind . s_i1=0;
			}
		if(a_ind . s_i==20) 
			{
			a_ind . s_i++;
			}
		gran_char(&a_ind . s_i,0,si_max);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,si_max);
		if(a_ind . s_i==20) 
			{
			a_ind . s_i--;
			}		
		if(a_ind . s_i==18) 
			{
			a_ind . s_i--;
			}		
		if(a_ind . s_i==16) 
			{
			a_ind . s_i--;
			}
		if(a_ind . s_i==14) 
			{
			a_ind . s_i--;
			}
		if(a_ind . s_i==12) 
			{
			a_ind . s_i--;
			}
		if(a_ind . s_i==7) 
			{
			a_ind . s_i--;
			}
		if(a_ind . s_i==5) 
			{
			a_ind . s_i--;
			}
		if(a_ind . s_i==3) 
			{
			a_ind . s_i--;
			}
		}
	else if(but==123)
		{
		a_ind . s_i=si_max;
		}
	else if(but==103)
		{
		lc640_write_int(2000,1);
		lc640_write_int(2000+72,0);
		lc640_write_int(2000+2,0);
		lc640_write_int(2000+4,192);
		lc640_write_int(2000+6,168);
		lc640_write_int(2000+8,1);
		lc640_write_int(2000+10,237);
		lc640_write_int(2000+12,255);
		lc640_write_int(2000+14,255);
		lc640_write_int(2000+16,255);
		lc640_write_int(2000+18,0);
		lc640_write_int(2000+64,192);
		lc640_write_int(2000+66,168);
		lc640_write_int(2000+68,1);
		lc640_write_int(2000+70,254);
		lc640_write_int(2000+60,161);
		lc640_write_int(2000+62,162);
		lc640_write_int(2000+270,'1');
		lc640_write_int(2000+270+2,'2');
		lc640_write_int(2000+270+4,'3');
		lc640_write_int(2000+270+6,0);
		lc640_write_int(2000+270+8,0);
		lc640_write_int(2000+20,255);
		lc640_write_int(2000+22,255);
		lc640_write_int(2000+24,255);
		lc640_write_int(2000+26,255);
		lc640_write_int(2000+28,255);
		lc640_write_int(2000+30,255);
		lc640_write_int(2000+32,255);
		lc640_write_int(2000+34,255);
		lc640_write_int(2000+36,255);
		lc640_write_int(2000+38,255);
		lc640_write_int(2000+40,255);
		lc640_write_int(2000+42,255);
		lc640_write_int(2000+44,255);
		lc640_write_int(2000+46,255);
		lc640_write_int(2000+48,255);
		lc640_write_int(2000+50,255);
		lc640_write_int(2000+52,255);
		lc640_write_int(2000+54,255);
		lc640_write_int(2000+56,255);
		lc640_write_int(2000+58,255);
		}					
	else if(a_ind . s_i==0)
	     {
	     if((but==254)||(but==247)||(but==239))
	     	{
	     	if(ETH_IS_ON)lc640_write_int(2000,0);
			else 
				{
				lc640_write_int(2000,1);
				lc640_write_int(2000+72,0);
				}
	     	}
	     }	
     else if((a_ind . s_i==1)&&(ETH_IS_ON))
	     {
		if((but==254)||(but==247)||(but==239))
	     	{
	     	if(ETH_DHCP_ON)lc640_write_int(2000+2,0);
			else lc640_write_int(2000+2,1);
	     	}
		}	
     else if(a_ind . s_i==2)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,3);
	     	}
		else if(a_ind . s_i1==0)
			{
			if((but==239)||(but==111))
				{
				ETH_IP_1++;
				gran_ring(&ETH_IP_1,0,255);
				lc640_write_int(2000+4,ETH_IP_1);
				}
			else if((but==247)||(but==119))
				{
				ETH_IP_1--;
				gran_ring(&ETH_IP_1,0,255);
				lc640_write_int(2000+4,ETH_IP_1);
				}
			speed=1;
			}
		else if(a_ind . s_i1==1)
			{
			if((but==239)||(but==111))
				{
				ETH_IP_2++;
				gran_ring(&ETH_IP_2,0,255);
				lc640_write_int(2000+6,ETH_IP_2);
				}
			else if((but==247)||(but==119))
				{
				ETH_IP_2--;
				gran_ring(&ETH_IP_2,0,255);
				lc640_write_int(2000+6,ETH_IP_2);
				}
			speed=1;
			}
		else if(a_ind . s_i1==2)
			{
			if((but==239)||(but==111))
				{
				ETH_IP_3++;
				gran_ring(&ETH_IP_3,0,255);
				lc640_write_int(2000+8,ETH_IP_3);
				}
			else if((but==247)||(but==119))
				{
				ETH_IP_3--;
				gran_ring(&ETH_IP_3,0,255);
				lc640_write_int(2000+8,ETH_IP_3);
				}
			speed=1;
			}
		else if(a_ind . s_i1==3)
			{
			if((but==239)||(but==111))
				{
				ETH_IP_4++;
				gran_ring(&ETH_IP_4,0,255);
				lc640_write_int(2000+10,ETH_IP_4);
				}
			else if((but==247)||(but==119))
				{
				ETH_IP_4--;
				gran_ring(&ETH_IP_4,0,255);
				lc640_write_int(2000+10,ETH_IP_4);
				}
			speed=1;
			}

          }
     else if(a_ind . s_i==4)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,3);
	     	}
		else if(a_ind . s_i1==0)
			{
			if((but==239)||(but==111))
				{
				ETH_MASK_1++;
				gran_ring(&ETH_MASK_1,0,255);
				lc640_write_int(2000+12,ETH_MASK_1);
				}
			else if((but==247)||(but==119))
				{
				ETH_MASK_1--;
				gran_ring(&ETH_MASK_1,0,255);
				lc640_write_int(2000+12,ETH_MASK_1);
				}
			speed=1;
			}
		else if(a_ind . s_i1==1)
			{
			if((but==239)||(but==111))
				{
				ETH_MASK_2++;
				gran_ring(&ETH_MASK_2,0,255);
				lc640_write_int(2000+14,ETH_MASK_2);
				}
			else if((but==247)||(but==119))
				{
				ETH_MASK_2--;
				gran_ring(&ETH_MASK_2,0,255);
				lc640_write_int(2000+14,ETH_MASK_2);
				}
			speed=1;
			}
		else if(a_ind . s_i1==2)
			{
			if((but==239)||(but==111))
				{
				ETH_MASK_3++;
				gran_ring(&ETH_MASK_3,0,255);
				lc640_write_int(2000+16,ETH_MASK_3);
				}
			else if((but==247)||(but==119))
				{
				ETH_MASK_3--;
				gran_ring(&ETH_MASK_3,0,255);
				lc640_write_int(2000+16,ETH_MASK_3);
				}
			speed=1;
			}
		else if(a_ind . s_i1==3)
			{
			if((but==239)||(but==111))
				{
				ETH_MASK_4++;
				gran_ring(&ETH_MASK_4,0,255);
				lc640_write_int(2000+18,ETH_MASK_4);
				}
			else if((but==247)||(but==119))
				{
				ETH_MASK_4--;
				gran_ring(&ETH_MASK_4,0,255);
				lc640_write_int(2000+18,ETH_MASK_4);
				}
			speed=1;
			}
		}
     else if(a_ind . s_i==6)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,3);
	     	}
		else if(a_ind . s_i1==0)
			{
			if((but==239)||(but==111))
				{
				ETH_GW_1++;
				gran_ring(&ETH_GW_1,0,255);
				lc640_write_int(2000+64,ETH_GW_1);
				}
			else if((but==247)||(but==119))
				{
				ETH_GW_1--;
				gran_ring(&ETH_GW_1,0,255);
				lc640_write_int(2000+64,ETH_GW_1);
				}
			speed=1;
			}
		else if(a_ind . s_i1==1)
			{
			if((but==239)||(but==111))
				{
				ETH_GW_2++;
				gran_ring(&ETH_GW_2,0,255);
				lc640_write_int(2000+66,ETH_GW_2);
				}
			else if((but==247)||(but==119))
				{
				ETH_GW_2--;
				gran_ring(&ETH_GW_2,0,255);
				lc640_write_int(2000+66,ETH_GW_2);
				}
			speed=1;
			}
		else if(a_ind . s_i1==2)
			{
			if((but==239)||(but==111))
				{
				ETH_GW_3++;
				gran_ring(&ETH_GW_3,0,255);
				lc640_write_int(2000+68,ETH_GW_3);
				}
			else if((but==247)||(but==119))
				{
				ETH_GW_3--;
				gran_ring(&ETH_GW_3,0,255);
				lc640_write_int(2000+68,ETH_GW_3);
				}
			speed=1;
			}
		else if(a_ind . s_i1==3)
			{
			if((but==239)||(but==111))
				{
				ETH_GW_4++;
				gran_ring(&ETH_GW_4,0,255);
				lc640_write_int(2000+70,ETH_GW_4);
				}
			else if((but==247)||(but==119))
				{
				ETH_GW_4--;
				gran_ring(&ETH_GW_4,0,255);
				lc640_write_int(2000+70,ETH_GW_4);
				}
			speed=1;
			}
		}
      else if(a_ind . s_i==8)
	     {
		if(but==239)ETH_SNMP_PORT_READ++;
		else if(but==111)ETH_SNMP_PORT_READ+=2;
		else if(but==247)ETH_SNMP_PORT_READ--;
		else if(but==119)ETH_SNMP_PORT_READ-=2;
		speed=1;
		lc640_write_int(2000+60,ETH_SNMP_PORT_READ);
		}

     else if(a_ind . s_i==9)
	     {
		if(but==239)ETH_SNMP_PORT_WRITE++;
		else if(but==111)ETH_SNMP_PORT_WRITE+=2;
		else if(but==247)ETH_SNMP_PORT_WRITE--;
		else if(but==119)ETH_SNMP_PORT_WRITE-=2;
		speed=1;
		lc640_write_int(2000+62,ETH_SNMP_PORT_WRITE);
		}					
     else if(a_ind . s_i==10)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,8);
	     	}
		if((but==239)||(but==111))
			{
			snmp_Community[a_ind . s_i1]++;
			if(snmp_Community[a_ind . s_i1]<32) snmp_Community[a_ind . s_i1]=32;
			else if ((snmp_Community[a_ind . s_i1]>32)&&(snmp_Community[a_ind . s_i1]<48)) snmp_Community[a_ind . s_i1]=48;
			else if ((snmp_Community[a_ind . s_i1]>57)&&(snmp_Community[a_ind . s_i1]<65)) snmp_Community[a_ind . s_i1]=65;
			else if ((snmp_Community[a_ind . s_i1]>90)&&(snmp_Community[a_ind . s_i1]<97)) snmp_Community[a_ind . s_i1]=97;
			else if (snmp_Community[a_ind . s_i1]>122) snmp_Community[a_ind . s_i1]=32;
				
			lc640_write_int(2000+270+(a_ind . s_i1*2),snmp_Community[a_ind . s_i1]);
			speed=1;
			}
		if((but==247)||(but==119))
			{
			snmp_Community[a_ind . s_i1]--;
			if(snmp_Community[a_ind . s_i1]<32) snmp_Community[a_ind . s_i1]=122;
			else if ((snmp_Community[a_ind . s_i1]>32)&&(snmp_Community[a_ind . s_i1]<48)) snmp_Community[a_ind . s_i1]=32;
			else if ((snmp_Community[a_ind . s_i1]>57)&&(snmp_Community[a_ind . s_i1]<65)) snmp_Community[a_ind . s_i1]=57;
			else if ((snmp_Community[a_ind . s_i1]>90)&&(snmp_Community[a_ind . s_i1]<97)) snmp_Community[a_ind . s_i1]=90;
			else if (snmp_Community[a_ind . s_i1]>122) snmp_Community[a_ind . s_i1]=122;
			
			lc640_write_int(2000+270+(a_ind . s_i1*2),snmp_Community[a_ind . s_i1]);
			speed=1;
			}
		}
 
     else if(a_ind . s_i==11)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,3);
	     	}
		else if(a_ind . s_i1==0)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP1_IP_1++;
				gran_ring(&ETH_TRAP1_IP_1,0,255);
				lc640_write_int(2000+20,ETH_TRAP1_IP_1);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP1_IP_1--;
				gran_ring(&ETH_TRAP1_IP_1,0,255);
				lc640_write_int(2000+20,ETH_TRAP1_IP_1);
				}
			speed=1;
			}
		else if(a_ind . s_i1==1)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP1_IP_2++;
				gran_ring(&ETH_TRAP1_IP_2,0,255);
				lc640_write_int(2000+22,ETH_TRAP1_IP_2);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP1_IP_2--;
				gran_ring(&ETH_TRAP1_IP_2,0,255);
				lc640_write_int(2000+22,ETH_TRAP1_IP_2);
				}
			speed=1;
			}
		else if(a_ind . s_i1==2)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP1_IP_3++;
				gran_ring(&ETH_TRAP1_IP_3,0,255);
				lc640_write_int(2000+24,ETH_TRAP1_IP_3);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP1_IP_3--;
				gran_ring(&ETH_TRAP1_IP_3,0,255);
				lc640_write_int(2000+24,ETH_TRAP1_IP_3);
				}
			speed=1;
			}
		else if(a_ind . s_i1==3)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP1_IP_4++;
				gran_ring(&ETH_TRAP1_IP_4,0,255);
				lc640_write_int(2000+26,ETH_TRAP1_IP_4);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP1_IP_4--;
				gran_ring(&ETH_TRAP1_IP_4,0,255);
				lc640_write_int(2000+26,ETH_TRAP1_IP_4);
				}
			speed=1;
			}
		}	
     else if(a_ind . s_i==13)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,3);
	     	}
		else if(a_ind . s_i1==0)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP2_IP_1++;
				gran_ring(&ETH_TRAP2_IP_1,0,255);
				lc640_write_int(2000+28,ETH_TRAP2_IP_1);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP2_IP_1--;
				gran_ring(&ETH_TRAP2_IP_1,0,255);
				lc640_write_int(2000+28,ETH_TRAP2_IP_1);
				}
			speed=1;
			}
		else if(a_ind . s_i1==1)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP2_IP_2++;
				gran_ring(&ETH_TRAP2_IP_2,0,255);
				lc640_write_int(2000+30,ETH_TRAP2_IP_2);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP2_IP_2--;
				gran_ring(&ETH_TRAP2_IP_2,0,255);
				lc640_write_int(2000+30,ETH_TRAP2_IP_2);
				}
			speed=1;
			}
		else if(a_ind . s_i1==2)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP2_IP_3++;
				gran_ring(&ETH_TRAP2_IP_3,0,255);
				lc640_write_int(2000+32,ETH_TRAP2_IP_3);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP2_IP_3--;
				gran_ring(&ETH_TRAP2_IP_3,0,255);
				lc640_write_int(2000+32,ETH_TRAP2_IP_3);
				}
			speed=1;
			}
		else if(a_ind . s_i1==3)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP2_IP_4++;
				gran_ring(&ETH_TRAP2_IP_4,0,255);
				lc640_write_int(2000+34,ETH_TRAP2_IP_4);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP2_IP_4--;
				gran_ring(&ETH_TRAP2_IP_4,0,255);
				lc640_write_int(2000+34,ETH_TRAP2_IP_4);
				}
			speed=1;
			}
		}	
     else if(a_ind . s_i==15)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,3);
	     	}
		else if(a_ind . s_i1==0)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP3_IP_1++;
				gran_ring(&ETH_TRAP3_IP_1,0,255);
				lc640_write_int(2000+36,ETH_TRAP3_IP_1);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP3_IP_1--;
				gran_ring(&ETH_TRAP3_IP_1,0,255);
				lc640_write_int(2000+36,ETH_TRAP3_IP_1);
				}
			speed=1;
			}
		else if(a_ind . s_i1==1)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP3_IP_2++;
				gran_ring(&ETH_TRAP3_IP_2,0,255);
				lc640_write_int(2000+38,ETH_TRAP3_IP_2);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP3_IP_2--;
				gran_ring(&ETH_TRAP3_IP_2,0,255);
				lc640_write_int(2000+38,ETH_TRAP3_IP_2);
				}
			speed=1;
			}
		else if(a_ind . s_i1==2)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP3_IP_3++;
				gran_ring(&ETH_TRAP3_IP_3,0,255);
				lc640_write_int(2000+40,ETH_TRAP3_IP_3);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP3_IP_3--;
				gran_ring(&ETH_TRAP3_IP_3,0,255);
				lc640_write_int(2000+40,ETH_TRAP3_IP_3);
				}
			speed=1;
			}
		else if(a_ind . s_i1==3)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP3_IP_4++;
				gran_ring(&ETH_TRAP3_IP_4,0,255);
				lc640_write_int(2000+42,ETH_TRAP3_IP_4);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP3_IP_4--;
				gran_ring(&ETH_TRAP3_IP_4,0,255);
				lc640_write_int(2000+42,ETH_TRAP3_IP_4);
				}
			speed=1;
			}
		}	
     else if(a_ind . s_i==17)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,3);
	     	}
		else if(a_ind . s_i1==0)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP4_IP_1++;
				gran_ring(&ETH_TRAP4_IP_1,0,255);
				lc640_write_int(2000+44,ETH_TRAP4_IP_1);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP4_IP_1--;
				gran_ring(&ETH_TRAP4_IP_1,0,255);
				lc640_write_int(2000+44,ETH_TRAP4_IP_1);
				}
			speed=1;
			}
		else if(a_ind . s_i1==1)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP4_IP_2++;
				gran_ring(&ETH_TRAP4_IP_2,0,255);
				lc640_write_int(2000+46,ETH_TRAP4_IP_2);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP4_IP_2--;
				gran_ring(&ETH_TRAP4_IP_2,0,255);
				lc640_write_int(2000+46,ETH_TRAP4_IP_2);
				}
			speed=1;
			}
		else if(a_ind . s_i1==2)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP4_IP_3++;
				gran_ring(&ETH_TRAP4_IP_3,0,255);
				lc640_write_int(2000+48,ETH_TRAP4_IP_3);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP4_IP_3--;
				gran_ring(&ETH_TRAP4_IP_3,0,255);
				lc640_write_int(2000+48,ETH_TRAP4_IP_3);
				}
			speed=1;
			}
		else if(a_ind . s_i1==3)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP4_IP_4++;
				gran_ring(&ETH_TRAP4_IP_4,0,255);
				lc640_write_int(2000+50,ETH_TRAP4_IP_4);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP4_IP_4--;
				gran_ring(&ETH_TRAP4_IP_4,0,255);
				lc640_write_int(2000+50,ETH_TRAP4_IP_4);
				}
			speed=1;
			}
		}	
     else if(a_ind . s_i==19)
	     {
		if(but==126)
	     	{
	     	a_ind . s_i1++;
			gran_ring_char(&a_ind . s_i1,0,3);
	     	}
		else if(a_ind . s_i1==0)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP5_IP_1++;
				gran_ring(&ETH_TRAP5_IP_1,0,255);
				lc640_write_int(2000+52,ETH_TRAP5_IP_1);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP5_IP_1--;
				gran_ring(&ETH_TRAP5_IP_1,0,255);
				lc640_write_int(2000+52,ETH_TRAP5_IP_1);
				}
			speed=1;
			}
		else if(a_ind . s_i1==1)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP5_IP_2++;
				gran_ring(&ETH_TRAP5_IP_2,0,255);
				lc640_write_int(2000+54,ETH_TRAP5_IP_2);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP5_IP_2--;
				gran_ring(&ETH_TRAP5_IP_2,0,255);
				lc640_write_int(2000+54,ETH_TRAP5_IP_2);
				}
			speed=1;
			}
		else if(a_ind . s_i1==2)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP5_IP_3++;
				gran_ring(&ETH_TRAP5_IP_3,0,255);
				lc640_write_int(2000+56,ETH_TRAP5_IP_3);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP5_IP_3--;
				gran_ring(&ETH_TRAP5_IP_3,0,255);
				lc640_write_int(2000+56,ETH_TRAP5_IP_3);
				}
			speed=1;
			}
		else if(a_ind . s_i1==3)
			{
			if((but==239)||(but==111))
				{
				ETH_TRAP5_IP_4++;
				gran_ring(&ETH_TRAP5_IP_4,0,255);
				lc640_write_int(2000+58,ETH_TRAP5_IP_4);
				}
			else if((but==247)||(but==119))
				{
				ETH_TRAP5_IP_4--;
				gran_ring(&ETH_TRAP5_IP_4,0,255);
				lc640_write_int(2000+58,ETH_TRAP5_IP_4);
				}
			speed=1;
			}
		}													          
    else if(a_ind . s_i==si_max)
	     {
	     if(but==254)
	          {
	          tree_down(0,0);
	          }
          }	          	
	}

else if(a_ind . i==iExtCtrl)
	{
	ret(3000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,2);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,2);
		}
	else if(but==123)
		{
		a_ind . s_i=2;
		}

    	else if(a_ind . s_i==0)
		{
		if((but==239)||(but==111))
			{
			SK_START=1;
			lc640_write_int(0x10+100+166,SK_START);
			}
		else if((but==247)||(but==119))
			{
			SK_START=0;
			lc640_write_int(0x10+100+166,SK_START);
			}
		speed=0;
          }

    	else if(a_ind . s_i==1)
		{
		if((but==239)||(but==111))
			{
			SK_START_LEV=1;
			lc640_write_int(0x10+100+168,SK_START_LEV);
			}
		else if((but==247)||(but==119))
			{
			SK_START_LEV=0;
			lc640_write_int(0x10+100+168,SK_START_LEV);
			}
		speed=0;
          }

    	else if(a_ind . s_i==2)
	     {
	     if(but==254)
	          {
	          tree_down(0,0);
	          }
          }
	}

else if(a_ind . i==iTst_pwm)
	{
	ret(3000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,1,3);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		if(a_ind . s_i==1)a_ind . i_s=0;
		gran_char(&a_ind . s_i,1,3);
		}
	else if(but==123)
		{
		a_ind . s_i=3;
		}

    	else if(a_ind . s_i==1)
	     {
		if(but==126)
			{
			if(tst_pwm_u)tst_pwm_u=0;
			else tst_pwm_u=1022;
			}
		else if(but==239)
			{
			tst_pwm_u++;
			gran(&tst_pwm_u,0,1022);
			}
		else if(but==111)
			{
			tst_pwm_u+=5;
			gran(&tst_pwm_u,0,1022);
			}
		else if(but==247)
			{
			tst_pwm_u--;
			gran(&tst_pwm_u,0,1022);
			}
		else if(but==119)
			{
			tst_pwm_u-=5;
			gran(&tst_pwm_u,0,1022);
			}
		speed=1;
          }

    	else if(a_ind . s_i==2)
		{
		if(but==126)
			{
			if(tst_pwm_i)tst_pwm_i=0;
			else tst_pwm_i=1022;
			}
		else if(but==239)
			{
			tst_pwm_i++;
			gran(&tst_pwm_i,0,1022);
			}
		else if(but==111)
			{
			tst_pwm_i+=5;
			gran(&tst_pwm_i,0,1022);
			}
		else if(but==247)
			{
			tst_pwm_i--;
			gran(&tst_pwm_i,0,1022);
			}
		else if(but==119)
			{
			tst_pwm_i-=5;
			gran(&tst_pwm_i,0,1022);
			}
		speed=1;
          }

    	else if(a_ind . s_i==3)
	     {
	     if(but==254)
	          {
	          tree_down(0,0);
	          }
          }

	}
	     
else if(a_ind . i==iK)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,5);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,5);
		}
	else if(but==123)
		{
		a_ind . s_i=5;
		}
	else if(a_ind . s_i==4)
		{
		if(but==239)
			{
			REV_IS_ON=1;
			lc640_write_int(0x10+100+146,REV_IS_ON);
			}
		else if(but==247)
			{
			REV_IS_ON=0;
			lc640_write_int(0x10+100+146,REV_IS_ON);
			}					
		}			
	else if(but==254)
		{
		if(a_ind . s_i==0)
			{
			tree_up(iK_load,0,0,0);
			phase=1;	
			ret(1000);		
			}
		else if(a_ind . s_i==1)
			{
			tree_up(iK_bps_sel,0,0,0);	
			ret(1000);
			}
		else if(a_ind . s_i==2)
			{
			tree_up(iK_max_param,0,0,0);	
			ret(1000);
			}
		else if(a_ind . s_i==3)
			{
			tree_up(iK_viz_sel,0,0,0);	
			ret(1000);
			}
	   	else if(a_ind . s_i==5)	   
			{
	        tree_down(0,0);
	        ret(0);
            }	               			
		}					
	}


else if(a_ind . i==iK_bps_sel)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,NUMIST);
		phase=0;
		mcp2515_transmit(a_ind . s_i,a_ind . s_i,0x16,0x63,0,0,0,0);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,NUMIST);
		phase=0;
		mcp2515_transmit(a_ind . s_i,a_ind . s_i,0x16,0x63,0,0,0,0);
		}
	else if(but==123)
		{
		a_ind . s_i=1+NUMIST;
		}	
	else if((but==254)&&(NUMIST)&&(a_ind . s_i<NUMIST))
		{
		tree_up(iK_bps,0,0,a_ind . s_i);	
		
		ret(1000);
		}	
	else if(a_ind . s_i==(NUMIST))
		{
		if(but==254)
			{
			tree_down(0,0);
			ret(0);
			}
		}				
	}


else if(a_ind . i==iK_bps)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		if((a_ind . s_i==1)||(a_ind . s_i==2))a_ind . s_i=3;
		else if((a_ind . s_i==4)||(a_ind . s_i==5))a_ind . s_i=6;
		else if((a_ind . s_i==7)||(a_ind . s_i==8))a_ind . s_i=9;
		else if((a_ind . s_i==10)||(a_ind . s_i==11))a_ind . s_i=12;
		else if((a_ind . s_i==13)||(a_ind . s_i==14))a_ind . s_i=15;
		gran_char(&a_ind . s_i,0,9);
		phase=0;
		}
	else if(but==253)
		{
		a_ind . s_i--;
		if((a_ind . s_i==1)||(a_ind . s_i==2))a_ind . s_i=0;
		else if((a_ind . s_i==4)||(a_ind . s_i==5))a_ind . s_i=3;
		else if((a_ind . s_i==7)||(a_ind . s_i==8))a_ind . s_i=6;
		else if((a_ind . s_i==10)||(a_ind . s_i==11))a_ind . s_i=9;
		else if((a_ind . s_i==13)||(a_ind . s_i==14))a_ind . s_i=12;		
		gran_char(&a_ind . s_i,0,9);
		phase=0;
		}
	else if(but==123)
		{
		a_ind . s_i=9;
		}
	else if (a_ind . s_i == 0)
		{
		if(but==231) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(0*16)+1,(0*16)+1,0,0,0);
	     else if(but==239) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(0*16)+2,(0*16)+2,0,0,0);
		else if(but==111)	mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(0*16)+3,(0*16)+3,0,0,0);
    		else if(but==247) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(0*16)+4,(0*16)+4,0,0,0); 
		else if(but==119) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(0*16)+5,(0*16)+5,0,0,0);
		speed=1;
		}	
		









































 	
		
	else if (a_ind . s_i == 3)
		{
		if(but==254)
			{
			mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(2*16)+1,(2*16)+1,0,0,0);
			phase=1;
			}
	     else if(but==239) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(2*16)+2,(2*16)+2,0,0,0);
		else if(but==111)	mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(2*16)+3,(2*16)+3,0,0,0);
    		else if(but==247) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(2*16)+4,(2*16)+4,0,0,0); 
		else if(but==119) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(2*16)+5,(2*16)+5,0,0,0);
		speed=1;
		}		
		
	else if (a_ind . s_i == 6)
		{
		if(but==239) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(3*16)+2,(3*16)+2,0,0,0);
		else if(but==111)	mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(3*16)+3,(3*16)+3,0,0,0);
    		else if(but==247) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(3*16)+4,(3*16)+4,0,0,0); 
		else if(but==119) mcp2515_transmit(a_ind . s_i1,a_ind . s_i1,0xEE,(3*16)+5,(3*16)+5,0,0,0);
		speed=1;
		}								
			

	else if(a_ind . s_i==9)
		{
		if(but==254)
			{
			
			
			tree_down(0,1);
			ret(0);
			}
		}			
	}		


else if(a_ind . i==iK_load)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,2);
		if(a_ind . s_i==0)phase=1;
		if(a_ind . s_i==1)phase=0;
		if(a_ind . s_i==2)phase=0;
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,2);
		if(a_ind . s_i==0)phase=1;
		if(a_ind . s_i==1)phase=0;
		if(a_ind . s_i==2)phase=0;
		}
	else if(a_ind . s_i==0)
		{
		temp_SS=lc640_read_int(0x10+20);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS+=2;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS-=2;
	     	}
	    gran(&temp_SS,100,30000);
		lc640_write_int(0x10+20,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==1)
		{
		temp_SS=lc640_read_int(0x10+6);
	     if(but==254)
	     	{
			lc640_write_int(0x10+4,ad7705_buff_[0]);
			phase=1;
	     	}
	     else if(but==239)
	     	{
			phase=1;
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
			phase=1;
	     	temp_SS+=5;
	     	}	
	     else if(but==247)
	     	{
			phase=1;
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
			phase=1;
	     	temp_SS-=5;
	     	}
	    gran(&temp_SS,50,30000);
		lc640_write_int(0x10+6,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==2)
		{
		if(but==254)
			{
			tree_down(0,1);
			ret(0);
			}
		}			
	}


else if(a_ind . i==iK_max_param)
	{

	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,6);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,6);
		}
	else if(a_ind . s_i==0)
		{
		temp_SS=lc640_read_int(0x10+8);
	     if(but==239)
	     	{
		    temp_SS=((temp_SS/10)+1)*10;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS=((temp_SS/10)+10)*10;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS=((temp_SS/10)-1)*10;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS=((temp_SS/10)-10)*10;
	     	}
	    gran(&temp_SS,50,20000);
		lc640_write_int(0x10+8,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==1)
		{
		temp_SS=lc640_read_int(0x10+10);
	     if(but==239)
	     	{
		    temp_SS=((temp_SS/10)+1)*10;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS=((temp_SS/10)+10)*10;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS=((temp_SS/10)-1)*10;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS=((temp_SS/10)-10)*10;
	     	}
	    gran(&temp_SS,10,1000);
		lc640_write_int(0x10+10,temp_SS);					
		speed=1;	
		}

	else if(a_ind . s_i==2)
		{
		temp_SS=lc640_read_int(0x10+12);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS+=5;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS-=5;
	     	}
	    gran(&temp_SS,10,2000);
		lc640_write_int(0x10+12,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==3)
		{
		temp_SS=lc640_read_int(0x10+14);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS+=5;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS-=5;
	     	}
	    gran(&temp_SS,1,2000);
		lc640_write_int(0x10+14,temp_SS);					
		speed=1;	
		}

	else if(a_ind . s_i==4)
		{
		temp_SS=lc640_read_int(0x10+24);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS+=1;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS-=1;
	     	}
	    gran(&temp_SS,5,100);
		lc640_write_int(0x10+24,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==5)
		{
		temp_SS=lc640_read_int(0x10+22);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS+=1;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS-=1;
	     	}
	    gran(&temp_SS,5,100);
		lc640_write_int(0x10+22,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==6)
		{
		if(but==254)
			{
			tree_down(0,1);
			ret(0);
			}
		}			
	}

else if(a_ind . i==iK_viz_sel)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,2);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,2);
		}
	else if(a_ind . s_i==0)
		{
		if(but==254)
			{
			tree_up(iK_viz_u,0,0,0);
			show_mess	(	"     Установите     ",
	          			" ток нагрузки 5-20% ",
	          			"  от максимального  ",
	          			"   и нажмите пуск   ",3000);	
			viz_stat=vsOFF;
			viz_stat_cnt=0;
			
			}	
		}
	else if(a_ind . s_i==1)
		{
		if(but==254)
			{
			tree_up(iK_viz_i,0,0,0);
			show_mess	(	"     Установите     ",
	          			" ток нагрузки 100% ",
	          			"  от максимального  ",
	          			"   и нажмите пуск   ",3000);	
			viz_stat=vsOFF;
			viz_stat_cnt=0;
			
			}	
		}
 	else if(a_ind . s_i==2)
		{
		if(but==254)
			{
			tree_down(0,0);
			ret(0);
			}
		}				 
	} 

else if(a_ind . i==iK_viz_u)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,1);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,1);
		}
	else if(a_ind . s_i==0)
		{
		if(but==254)
			{
			if(viz_stat!=vsON)
				{
				viz_stat=vsON;
				viz_stat_cnt=0;
				ret(0);
				}
			else viz_stat=vsOFF;
			}	
		}







 
 	else if(a_ind . s_i==1)
		{
		if(but==254)
			{
			tree_down(0,0);
			ret(0);
			}
		}				 
	} 

else if(a_ind . i==iK_viz_i)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,1);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,1);
		}
	else if(a_ind . s_i==0)
		{
		if(but==254)
			{
			if(viz_stat!=vsON)
				{
				viz_stat=vsON;
				viz_stat_cnt=0;
				ret(0);
				}
			else viz_stat=vsOFF;
			}	
		}







 
 	else if(a_ind . s_i==1)
		{
		if(but==254)
			{
			tree_down(0,0);
			ret(0);
			}
		}				 
	} 

else if(a_ind . i==iK_t_ext_6U)
	{
	ret(1000);
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,NUMDT);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,NUMDT);
		}
	else if(a_ind . s_i==0)
		{
		temp_SS=lc640_read_int(0x10+100+50);
	     if(but==239)
	     	{
		     temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS+=2;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS-=2;
	     	}
	     gran(&temp_SS,1900,3000);
		lc640_write_int(0x10+100+50,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==1)
		{
		temp_SS=lc640_read_int(0x10+100+52);
	     if(but==239)
	     	{
		     temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS+=2;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS-=2;
	     	}
	     gran(&temp_SS,1900,3000);
		lc640_write_int(0x10+100+52,temp_SS);					
		speed=1;	
					
		}
	else if(a_ind . s_i==2)
		{
		temp_SS=lc640_read_int(0x10+100+54);
	     if(but==239)
	     	{
		     temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS+=2;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS-=2;
	     	}
	     gran(&temp_SS,1900,3000);
		lc640_write_int(0x10+100+54,temp_SS);					
		speed=1;	
					
		}
 	if(a_ind . s_i==NUMDT)
		{
		if(but==254)
			{
			tree_down(0,1);
			ret(0);
			}
		}			
	}
			


else if(a_ind . i==iBatLogVz)
	{
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,av_j_si_max);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,av_j_si_max);
		}
	else if(but==254)
		{
		if(a_ind . s_i==av_j_si_max)
			{
			tree_down(0,0);
			}
		} 
	else if(but==247)
		{
		tree_down(0,0);
		}		
    
	
		
	}

else if(a_ind . i==iBatLogKe)
	{
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,av_j_si_max);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,av_j_si_max);
		}
	else if(but==254)
		{
		if(a_ind . s_i==av_j_si_max)
			{
			tree_down(0,0);
			}
		} 
	else if(but==247)
		{
		tree_down(0,0);
		}		
    
	}

else if(a_ind . i==iBatLogWrk)
	{
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,av_j_si_max);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,av_j_si_max);
		}
	else if(but==254)
		{
		if(a_ind . s_i==av_j_si_max)
			{
			tree_down(0,0);
			}
		else if(a_ind . s_i<=av_j_si_max)
			{
			
			
			a_ind . i_s=0;
			
			}	
		} 
	else if(but==247)
		{
		tree_down(0,0);
		}		
	else if(but==239)
		{
	    

		} 
	}

else if(a_ind . i==iCurr_contr_set)
	{
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,5);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,5);
		}
	else if(but==254)
		{
		if(a_ind . s_i==5)
			{
			tree_down(0,0);
			}
		} 

	else if(a_ind . s_i==0)
		{
		if(but==239)
			{
			RELE_LOG_CURR=1;
			lc640_write_int(0x10+100+174,RELE_LOG_CURR);
			}
		else if(but==247)
			{
			RELE_LOG_CURR=0;
			lc640_write_int(0x10+100+174,RELE_LOG_CURR);
			}
		} 
	else if(a_ind . s_i==1)
		{
		temp_SS=lc640_read_int(0x10+100+134);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS++;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS--;
	     	}
	    	gran(&temp_SS,0,1000);
		lc640_write_int(0x10+100+134,temp_SS);					
		speed=1;	
		}
	else if(a_ind . s_i==2)
		{
		temp_SS=lc640_read_int(0x10+100+136);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS++;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS--;
	     	}
	    	gran(&temp_SS,0,1000);
		lc640_write_int(0x10+100+136,temp_SS);					
		speed=1;	
		}

	else if(a_ind . s_i==3)
		{
		temp_SS=lc640_read_int(0x10+100+138);
	     if(but==239)
	     	{
		    	temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS++;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS--;
	     	}
	    	gran(&temp_SS,1,50);
		lc640_write_int(0x10+100+138,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==4)
		{
		temp_SS=lc640_read_int(0x10+100+140);
	     if(but==239)
	     	{
		    	temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS++;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS--;
	     	}
	    	gran(&temp_SS,1,50);
		lc640_write_int(0x10+100+140,temp_SS);					
		speed=1;	
		}




 		
    
	}

else if(a_ind . i==iVolt_contr_set)
	{
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,5);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,5);
		}
	else if(but==254)
		{
		if(a_ind . s_i==5)
			{
			tree_down(0,0);
			}
		} 

	else if(a_ind . s_i==0)
		{
		if(but==239)
			{
			RELE_LOG_VOLT=1;
			lc640_write_int(0x10+100+176,RELE_LOG_VOLT);
			}
		else if(but==247)
			{
			RELE_LOG_VOLT=0;
			lc640_write_int(0x10+100+176,RELE_LOG_VOLT);
			}
		} 
	else if(a_ind . s_i==1)
		{
		temp_SS=lc640_read_int(0x10+100+178);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS++;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS--;
	     	}
	    	gran(&temp_SS,1,1000);
		lc640_write_int(0x10+100+178,temp_SS);					
		speed=1;	
		}
	else if(a_ind . s_i==2)
		{
		temp_SS=lc640_read_int(0x10+100+180);
	     if(but==239)
	     	{
		    temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS++;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS--;
	     	}
	    	gran(&temp_SS,1,1000);
		lc640_write_int(0x10+100+180,temp_SS);					
		speed=1;	
		}

	else if(a_ind . s_i==3)
		{
		temp_SS=lc640_read_int(0x10+100+182);
	     if(but==239)
	     	{
		    	temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS++;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS--;
	     	}
	    	gran(&temp_SS,1,(U_MAX/10)+100);
		lc640_write_int(0x10+100+182,temp_SS);					
		speed=1;	
					
		}

	else if(a_ind . s_i==4)
		{
		temp_SS=lc640_read_int(0x10+100+184);
	     if(but==239)
	     	{
		    	temp_SS++;
	     	}
	     else if(but==111)
	     	{
	     	temp_SS++;
	     	}	
	     else if(but==247)
	     	{
	     	temp_SS--;
	     	}
	     else if(but==119)
	     	{
	     	temp_SS--;
	     	}
	    	gran(&temp_SS,1,(U_MAX/10)+100);
		lc640_write_int(0x10+100+184,temp_SS);					
		speed=1;	
		}




 		
    
	}

else if (a_ind . i==iRele_sel)
	{ 
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,2);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,2);
		}
	else if(but==254)
		{
		if(a_ind . s_i==2)
			{
			tree_down(0,0);
			}
		else if((a_ind . s_i==0)||(a_ind . s_i==1))
			{
			tree_up(iRele_set,0,0,a_ind . s_i);
			}
		} 
	}

else if(a_ind . i==iRele_set)
	{
	if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,6);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,6);
		}
	else if(but==254)
		{
		if(a_ind . s_i==6)
			{
			tree_down(0,0);
			}
		else 
			{
			lc640_write_int(0x10+100+170+a_ind . s_i1*2,a_ind . s_i);
			}
		} 
	}






































































































































































































































 






































































































































































































 









































































 
else if(a_ind . i==iFiks_set)
	{
	if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,4);
		}
	else if(but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,4);
		}
	else if(a_ind . s_i==0)
		{
		if(but==239)
			{
		    	U_up2++;
		    	gran(&U_up2,U_MIN,U_MAX);
			lc640_write_int(0x10+54,U_up2);
			speed__=0;
			
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<50)
				{
				U_up2=((U_up2/5)+1)*5;
		    		gran(&U_up2,U_MIN,U_MAX);
				lc640_write_int(0x10+54,U_up2);
				speed=1;
				}
			else 
				{
				U_up2=((U_up2/50)+1)*50;
		    		gran(&U_up2,U_MIN,U_MAX);
				lc640_write_int(0x10+54,U_up2);
				speed=1;
				}
			speed=1;
			}

		else if(but==247)
			{
			U_up2--;
		    	gran(&U_up2,U_MIN,U_MAX);
			lc640_write_int(0x10+54,U_up2);
			speed__=0;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<50)
				{
				U_up2=((U_up2/5)-1)*5;
		    		gran(&U_up2,U_MIN,U_MAX);
				lc640_write_int(0x10+54,U_up2);
				speed=1;
				}
			else 
				{
				U_up2=((U_up2/50)-1)*50;
		    		gran(&U_up2,U_MIN,U_MAX);
				lc640_write_int(0x10+54,U_up2);
				speed=1;
				}
			speed=1;
			}
	  	}

	else if(a_ind . s_i==1)
		{
		if(but==239)
			{
		    	U_up3++;
		    	gran(&U_up3,U_MIN,U_MAX);
			lc640_write_int(0x10+56,U_up3);
			speed__=0;
			
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<50)
				{
				U_up3=((U_up3/5)+1)*5;
		    		gran(&U_up3,U_MIN,U_MAX);
				lc640_write_int(0x10+56,U_up3);
				speed=1;
				}
			else 
				{
				U_up3=((U_up3/50)+1)*50;
		    		gran(&U_up3,U_MIN,U_MAX);
				lc640_write_int(0x10+56,U_up3);
				speed=1;
				}
			speed=1;
			}

		else if(but==247)
			{
			U_up3--;
		    	gran(&U_up3,U_MIN,U_MAX);
			lc640_write_int(0x10+56,U_up3);
			speed__=0;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<50)
				{
				U_up3=((U_up3/5)-1)*5;
		    		gran(&U_up3,U_MIN,U_MAX);
				lc640_write_int(0x10+56,U_up3);
				speed=1;
				}
			else 
				{
				U_up3=((U_up3/50)-1)*50;
		    		gran(&U_up3,U_MIN,U_MAX);
				lc640_write_int(0x10+56,U_up3);
				speed=1;
				}
			speed=1;
			}
	  	}
	else if(a_ind . s_i==2)
		{
		if(but==239)
			{
			I_ug2++;
		    	gran(&I_ug2,I_MIN_IPS,I_MAX_IPS);
			lc640_write_int(0x10+50,I_ug2);
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<50)
				{
				I_ug2=((I_ug2/5)+1)*5;
		    		gran(&I_ug2,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+50,I_ug2);
				speed=1;
				}
			else 
				{
				I_ug2=((I_ug2/50)+1)*50;
		    		gran(&I_ug2,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+50,I_ug2);
				speed=1;
				}
			speed=1;
			}
		else if(but==247)
			{
		    	I_ug2--;
		    	gran(&I_ug2,I_MIN_IPS,I_MAX_IPS);
			lc640_write_int(0x10+50,I_ug2);
			speed__=0;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<50)
				{
				I_ug2=((I_ug2/5)-1)*5;
		    		gran(&I_ug2,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+50,I_ug2);
				speed=1;
				}
			else 
				{
				I_ug2=((I_ug2/50)-1)*50;
		    		gran(&I_ug2,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+50,I_ug2);
				speed=1;
				}
			speed=1;
			}
	  	}

	else if(a_ind . s_i==3)
		{
		if(but==239)
			{
			I_ug3++;
		    	gran(&I_ug3,I_MIN_IPS,I_MAX_IPS);
			lc640_write_int(0x10+52,I_ug3);
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<50)
				{
				I_ug3=((I_ug3/5)+1)*5;
		    		gran(&I_ug3,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+52,I_ug3);
				speed=1;
				}
			else 
				{
				I_ug3=((I_ug3/50)+1)*50;
		    		gran(&I_ug3,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+52,I_ug3);
				speed=1;
				}
			speed=1;
			}
		else if(but==247)
			{
		    	I_ug3--;
		    	gran(&I_ug3,I_MIN_IPS,I_MAX_IPS);
			lc640_write_int(0x10+52,I_ug3);
			speed__=0;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<50)
				{
				I_ug3=((I_ug3/5)-1)*5;
		    		gran(&I_ug3,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+52,I_ug3);
				speed=1;
				}
			else 
				{
				I_ug3=((I_ug3/50)-1)*50;
		    		gran(&I_ug3,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+52,I_ug3);
				speed=1;
				}
			speed=1;
			}
	  	}
	else if(a_ind . s_i==4)
		{
		tree_down(0,0);
		}
	}

else if(a_ind . i==iAvtRev)
	{
	ret(1000);
	if (but==253)
		{      
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,8);
		}
		
	else if (but==251)
		{
		a_ind . s_i++;
		gran_char(&a_ind . s_i,0,8);		
		}
	else if(a_ind . s_i==0)
		{
		if((but==239)||(but==111))
			{
			AVT_REV_IS_ON=1;
			}
		else if((but==247)||(but==119))
			{
			AVT_REV_IS_ON=0;
			}
		if(AVT_REV_IS_ON!=lc640_read_int(0x10+100+148))lc640_write_int(0x10+100+148,AVT_REV_IS_ON);	
		}
	else if(a_ind . s_i==1)
		{
		if(but==239)
			{
			AVT_REV_TIME_FF++;
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<20)
				{
				AVT_REV_TIME_FF=(((AVT_REV_TIME_FF/10L)+1L)*10L);
				}
			else 
				{
				AVT_REV_TIME_FF=(((AVT_REV_TIME_FF/60L)+1L)*60L);
				}
			speed=1;
			}
		else if(but==247)
			{
			AVT_REV_TIME_FF--;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<20)
				{
				AVT_REV_TIME_FF=(((AVT_REV_TIME_FF/10L)-1L)*10L);
				}
			else 
				{
				AVT_REV_TIME_FF=(((AVT_REV_TIME_FF/60L)-1L)*60L);
				}
			speed=1;
			}

		gran(&AVT_REV_TIME_FF,30,T_PROC_MAX);
		if(AVT_REV_TIME_FF!=lc640_read_int(0x10+100+150))lc640_write_int(0x10+100+150,AVT_REV_TIME_FF);	
		}

	else if(a_ind . s_i==2)
		{
		if(but==239)
			{
			AVT_REV_TIME_REW++;
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<20)
				{
				AVT_REV_TIME_REW=(((AVT_REV_TIME_REW/10L)+1L)*10L);
				}
			else 
				{
				AVT_REV_TIME_REW=(((AVT_REV_TIME_REW/60L)+1L)*60L);
				}
			speed=1;
			}
		else if(but==247)
			{
			AVT_REV_TIME_REW--;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<20)
				{
				AVT_REV_TIME_REW=(((AVT_REV_TIME_REW/10L)-1L)*10L);
				}
			else 
				{
				AVT_REV_TIME_REW=(((AVT_REV_TIME_REW/60L)-1L)*60L);
				}
			speed=1;
			}

		gran(&AVT_REV_TIME_REW,30,T_PROC_MAX);
		if(AVT_REV_TIME_REW!=lc640_read_int(0x10+100+152))lc640_write_int(0x10+100+152,AVT_REV_TIME_REW);	
		}
	else if(a_ind . s_i==3)
		{
		if(but==239)
			{
			AVT_REV_TIME_PAUSE++;
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<20)
				{
				AVT_REV_TIME_PAUSE=(((AVT_REV_TIME_PAUSE/10L)+1L)*10L);
				}
			else 
				{
				AVT_REV_TIME_PAUSE=(((AVT_REV_TIME_PAUSE/60L)+1L)*60L);
				}
			speed=1;
			}
		else if(but==247)
			{
			AVT_REV_TIME_PAUSE--;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<20)
				{
				AVT_REV_TIME_PAUSE=(((AVT_REV_TIME_PAUSE/10L)-1L)*10L);
				}
			else 
				{
				AVT_REV_TIME_PAUSE=(((AVT_REV_TIME_PAUSE/60L)-1L)*60L);
				}
			speed=1;
			}

		gran(&AVT_REV_TIME_PAUSE,2,600);
		if(AVT_REV_TIME_PAUSE!=lc640_read_int(0x10+100+154))lc640_write_int(0x10+100+154,AVT_REV_TIME_PAUSE);	
		}

	else if(a_ind . s_i==4)
		{
		if(but==239)
			{
			AVT_REV_I_NOM_FF++;
		    	gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
			lc640_write_int(0x10+100+156,AVT_REV_I_NOM_FF);
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<50)
				{
				AVT_REV_I_NOM_FF=((AVT_REV_I_NOM_FF/5)+1)*5;
		    		gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+156,AVT_REV_I_NOM_FF);
				speed=1;
				}
			else 
				{
				AVT_REV_I_NOM_FF=((AVT_REV_I_NOM_FF/50)+1)*50;
		    		gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+156,AVT_REV_I_NOM_FF);
				speed=1;
				}
			speed=1;
			}
		else if(but==247)
			{
		    	AVT_REV_I_NOM_FF--;
		    	gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
			lc640_write_int(0x10+100+156,AVT_REV_I_NOM_FF);
			speed__=0;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<50)
				{
				AVT_REV_I_NOM_FF=((AVT_REV_I_NOM_FF/5)-1)*5;
		    		gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+156,AVT_REV_I_NOM_FF);
				speed=1;
				}
			else 
				{
				AVT_REV_I_NOM_FF=((AVT_REV_I_NOM_FF/50)-1)*50;
		    		gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+156,AVT_REV_I_NOM_FF);
				speed=1;
				}
			speed=1;
			}
	  	}
	else if(a_ind . s_i==5)
		{
		if(but==239)
			{
			AVT_REV_I_NOM_REW++;
		    	gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
			lc640_write_int(0x10+100+158,AVT_REV_I_NOM_REW);
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<50)
				{
				AVT_REV_I_NOM_REW=((AVT_REV_I_NOM_REW/5)+1)*5;
		    		gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+158,AVT_REV_I_NOM_REW);
				speed=1;
				}
			else 
				{
				AVT_REV_I_NOM_REW=((AVT_REV_I_NOM_REW/50)+1)*50;
		    		gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+158,AVT_REV_I_NOM_REW);
				speed=1;
				}
			speed=1;
			}
		else if(but==247)
			{
		    	AVT_REV_I_NOM_REW--;
		    	gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
			lc640_write_int(0x10+100+158,AVT_REV_I_NOM_REW);
			speed__=0;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<50)
				{
				AVT_REV_I_NOM_REW=((AVT_REV_I_NOM_REW/5)-1)*5;
		    		gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+158,AVT_REV_I_NOM_REW);
				speed=1;
				}
			else 
				{
				AVT_REV_I_NOM_REW=((AVT_REV_I_NOM_REW/50)-1)*50;
		    		gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
				lc640_write_int(0x10+100+158,AVT_REV_I_NOM_REW);
				speed=1;
				}
			speed=1;
			}
	  	}
	else if(a_ind . s_i==6)
		{
		if(but==239)
			{
			AVT_REV_U_NOM_FF++;
		    	gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
			lc640_write_int(0x10+100+160,AVT_REV_U_NOM_FF);
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<50)
				{
				AVT_REV_U_NOM_FF=((AVT_REV_U_NOM_FF/5)+1)*5;
		    		gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
				lc640_write_int(0x10+100+160,AVT_REV_U_NOM_FF);
				speed=1;
				}
			else 
				{
				AVT_REV_U_NOM_FF=((AVT_REV_U_NOM_FF/50)+1)*50;
		    		gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
				lc640_write_int(0x10+100+160,AVT_REV_U_NOM_FF);
				speed=1;
				}
			speed=1;
			}
		else if(but==247)
			{
		    	AVT_REV_U_NOM_FF--;
		    	gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
			lc640_write_int(0x10+100+160,AVT_REV_U_NOM_FF);
			speed__=0;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<50)
				{
				AVT_REV_U_NOM_FF=((AVT_REV_U_NOM_FF/5)-1)*5;
		    		gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
				lc640_write_int(0x10+100+160,AVT_REV_U_NOM_FF);
				speed=1;
				}
			else 
				{
				AVT_REV_U_NOM_FF=((AVT_REV_U_NOM_FF/50)-1)*50;
		    		gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
				lc640_write_int(0x10+100+160,AVT_REV_U_NOM_FF);
				speed=1;
				}
			speed=1;
			}
	  	}
	else if(a_ind . s_i==7)
		{
		if(but==239)
			{
			AVT_REV_U_NOM_REW++;
		    	gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
			lc640_write_int(0x10+100+162,AVT_REV_U_NOM_REW);
			speed__=0;
			}
		else if(but==111)
			{
			speed__++;
			if(speed__<50)
				{
				AVT_REV_U_NOM_REW=((AVT_REV_U_NOM_REW/5)+1)*5;
		    		gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
				lc640_write_int(0x10+100+162,AVT_REV_U_NOM_REW);
				speed=1;
				}
			else 
				{
				AVT_REV_U_NOM_REW=((AVT_REV_U_NOM_REW/50)+1)*50;
		    		gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
				lc640_write_int(0x10+100+162,AVT_REV_U_NOM_REW);
				speed=1;
				}
			speed=1;
			}
		else if(but==247)
			{
		    	AVT_REV_U_NOM_REW--;
		    	gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
			lc640_write_int(0x10+100+162,AVT_REV_U_NOM_REW);
			speed__=0;
			}
		else if(but==119)
			{
			speed__++;
			if(speed__<50)
				{
				AVT_REV_U_NOM_REW=((AVT_REV_U_NOM_REW/5)-1)*5;
		    		gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
				lc640_write_int(0x10+100+162,AVT_REV_U_NOM_REW);
				speed=1;
				}
			else 
				{
				AVT_REV_U_NOM_REW=((AVT_REV_U_NOM_REW/50)-1)*50;
		    		gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
				lc640_write_int(0x10+100+162,AVT_REV_U_NOM_REW);
				speed=1;
				}
			speed=1;
			}
	  	}
	else if((but==254)&&(a_ind . s_i==8))
		{
	     tree_down(0,0);
	     ret(0);
		}
     }

else if(a_ind . i==iAch_off)
	{
	if(but==251)
		{
		a_ind . s_i++;
		if(ACH_OFF_EN)gran_char(&a_ind . s_i,0,2);
		else gran_char(&a_ind . s_i,0,1);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,2);
		}
	else if(ACH_OFF_EN)
		{
		if(a_ind . s_i==0)
			{
			if((but==247)||(but==119))
				{
				ACH_OFF_EN=0;
				lc640_write_int(0x10+100+186,0);
				}
			}
		if(a_ind . s_i==1)
			{
			if((but==239)||(but==111))
				{
				ACH_OFF_LEVEL++;
				if(but==111)ACH_OFF_LEVEL+=4;
				gran(&ACH_OFF_LEVEL,1,20000);
				lc640_write_int(0x10+100+188,ACH_OFF_LEVEL);
				}
			else if((but==247)||(but==119))
				{
				ACH_OFF_LEVEL--;
				if(but==119)ACH_OFF_LEVEL-=4;
				gran(&ACH_OFF_LEVEL,1,20000);
				lc640_write_int(0x10+100+188,ACH_OFF_LEVEL);
				}
			speed=1;
			}
		if(a_ind . s_i==2)
			{
			if(but==254)
				{
				tree_down(0,0);
				}
			}
		}
	else if(!ACH_OFF_EN)
		{
 		if(a_ind . s_i==0)
			{
			if((but==239)||(but==111))
				{
				ACH_OFF_EN=1;
				lc640_write_int(0x10+100+186,1);
				}
			}
		if(a_ind . s_i==1)
			{
			if(but==254)
				{
				tree_down(0,0);
				}
			}
		}		
	}
else if(a_ind . i==iCurr_off)
	{
	if(but==251)
		{
		a_ind . s_i++;
		if(CURR_OFF_EN)gran_char(&a_ind . s_i,0,4);
		else gran_char(&a_ind . s_i,0,1);
		}
	else if(but==253)
		{
		a_ind . s_i--;
		gran_char(&a_ind . s_i,0,4);
		}
	else if(CURR_OFF_EN)
		{
		if(a_ind . s_i==0)
			{
			if((but==247)||(but==119))
				{
				CURR_OFF_EN=0;
				lc640_write_int(0x10+100+190,0);
				}
			}
		if(a_ind . s_i==1)
			{
			if((but==239)||(but==111))
				{
				CUR_OFF_LEVEL_RELATIV++;
				
				gran(&CUR_OFF_LEVEL_RELATIV,10,100);
				lc640_write_int(0x10+100+192,CUR_OFF_LEVEL_RELATIV);
				}
			else if((but==247)||(but==119))
				{
				CUR_OFF_LEVEL_RELATIV--;
				
				gran(&CUR_OFF_LEVEL_RELATIV,10,100);
				lc640_write_int(0x10+100+192,CUR_OFF_LEVEL_RELATIV);
				}
			speed=1;
			}
		if(a_ind . s_i==2)
			{
			if((but==239)||(but==111))
				{
				CUR_OFF_T_OFF++;
				if(but==111)CUR_OFF_T_OFF+=4;
				gran(&CUR_OFF_T_OFF,1,1000);
				lc640_write_int(0x10+100+196,CUR_OFF_T_OFF);
				}
			else if((but==247)||(but==119))
				{
				CUR_OFF_T_OFF--;
				if(but==111)CUR_OFF_T_OFF-=4;
				gran(&CUR_OFF_T_OFF,1,1000);
				lc640_write_int(0x10+100+196,CUR_OFF_T_OFF);
				}
			speed=1;
			}
		if(a_ind . s_i==3)
			{
			if((but==239)||(but==111))
				{
				CUR_OFF_T_ON++;
				if(but==111)CUR_OFF_T_ON+=4;
				gran(&CUR_OFF_T_ON,1,1000);
				lc640_write_int(0x10+100+198,CUR_OFF_T_ON);
				}
			else if((but==247)||(but==119))
				{
				CUR_OFF_T_ON--;
				if(but==111)CUR_OFF_T_ON-=4;
				gran(&CUR_OFF_T_ON,1,1000);
				lc640_write_int(0x10+100+198,CUR_OFF_T_ON);
				}
			speed=1;
			}

		if(a_ind . s_i==4)
			{
			if(but==254)
				{
				tree_down(0,0);
				}
			}
		}
	else  
		{
 		if(a_ind . s_i==0)
			{
			if((but==239)||(but==111))
				{
				CURR_OFF_EN=1;
				lc640_write_int(0x10+100+190,1);
				}
			}
		if(a_ind . s_i==1)
			{
			if(but==254)
				{
				tree_down(0,0);
				}
			}
		}		
	}
else if (a_ind . i==iProcIsComplete)
	{
	tree_down(0,0);
	}
but_an_end:
n_but=0;


}


void watchdog_enable (void) 
{
((LPC_WDT_TypeDef *) ((0x40000000UL) + 0x00000) )->WDTC=2000000;
((LPC_WDT_TypeDef *) ((0x40000000UL) + 0x00000) )->WDCLKSEL=0;
((LPC_WDT_TypeDef *) ((0x40000000UL) + 0x00000) )->WDMOD=3;
((LPC_WDT_TypeDef *) ((0x40000000UL) + 0x00000) )->WDFEED=0xaa;
((LPC_WDT_TypeDef *) ((0x40000000UL) + 0x00000) )->WDFEED=0x55;
}


void watchdog_reset (void) 
{
((LPC_WDT_TypeDef *) ((0x40000000UL) + 0x00000) )->WDFEED=0xaa;
((LPC_WDT_TypeDef *) ((0x40000000UL) + 0x00000) )->WDFEED=0x55;
}







void SysTick_Handler (void) 	  
{

b2000Hz=1;

if(bTPS)
	{
	((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIODIR|=(1UL<<26);
	((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN^=(1UL<<26);
	}

if(++t0cnt4>=2)
	{
t0cnt4=0;
b1000Hz=1;

	bFF=(char)(( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ((0xffffffff>>(32-1))<<27)) >> 27));
	if(bFF!=bFF_) hz_out++;
	bFF_=bFF;

if(modbus_timeout_cnt<modbusTimeoutInMills)
	{
	modbus_timeout_cnt++;
	if(modbus_timeout_cnt>=modbusTimeoutInMills)
		{
		bMODBUS_TIMEOUT=1;
		
		}
	}
else if (modbus_timeout_cnt>modbusTimeoutInMills)
	{
	modbus_timeout_cnt=0;
	bMODBUS_TIMEOUT=0;
	}


if(++t0cnt5>=20)
     {
     t0cnt5=0;
     b50Hz=1;
     }
     
if(++t0cnt>=10)
     {
     t0cnt=0;
     b100Hz=1;

     hz_out_cnt++;
     if(hz_out_cnt>=500)
	     {	
	     hz_out_cnt=0;
	     net_F=hz_out;
	     hz_out=0;
	     }

     if(++t0cnt0>=10)
	     {
	     t0cnt0=0;
	     b10Hz=1;
		beep_drv();
		if(main_10Hz_cnt<10000) main_10Hz_cnt++;
	     }

     if(t0cnt0==5)
	     {
		
		ind_fl_cnt++;
		if(ind_fl_cnt>=6)ind_fl_cnt=0;
	     }

     if(++t0cnt1>=20)
	     {
	     t0cnt1=0;
	     b5Hz=1;
		if(bFL5)bFL5=0;
		else bFL5=1;  
		bFL34++;
		if(bFL34>=6)bFL34=0;   
	     }

     if(++t0cnt2>=50)
	     {
	     t0cnt2=0;
	     b2Hz=1;
		if(bFL2)bFL2=0;
		else bFL2=1;
	     }         

     if(++t0cnt3>=100)
	     {
	     t0cnt3=0;
	     b1Hz=1;
		 if(main_1Hz_cnt<10000) main_1Hz_cnt++;

		if(bFL_REV)bFL_REV=0;
		else bFL_REV=1;
	     }
     }

	}








}



__irq void timer0_interrupt(void) 
{	




 
}





int main (void) 
{
char ind_reset_cnt=0;

char mac_adr[6] = { 0x00,0x73,0x04,50,60,70 };




SystemInit();

bTPS=1;



((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD = (SystemFrequency / 2000) - 1;
((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL = 0x07;




((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR & ~((0xffffffff>>(32-1))<<27)) | ((unsigned)0 << 27) );
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00040) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00040) )->FIODIR & ~((0xffffffff>>(32-1))<<7)) | ((unsigned)1 << 7) );
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00040) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00040) )->FIODIR & ~((0xffffffff>>(32-1))<<8)) | ((unsigned)1 << 8) );

	;








ad7705_reset();
{long xx; xx=(unsigned long)20 * 12000UL; while(xx)xx--;};

ad7705_write(0x21);
ad7705_write((((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9) & 0xf | ((0x1101) | 0x1101>>3 | 0x1101>>6 | 0x1101>>9)>>12 & 0xf0)); 
ad7705_write(0x11);
ad7705_write(0x44);


ad7705_buff[0][1]=0x7fff;
ad7705_buff[0][2]=0x7fff;
ad7705_buff[0][3]=0x7fff;
ad7705_buff[0][4]=0x7fff;
ad7705_buff[0][5]=0x7fff;
ad7705_buff[0][6]=0x7fff;
ad7705_buff[0][7]=0x7fff;
ad7705_buff[0][8]=0x7fff;
ad7705_buff[0][9]=0x7fff;
ad7705_buff[0][10]=0x7fff;
ad7705_buff[0][11]=0x7fff;
ad7705_buff[0][12]=0x7fff;
ad7705_buff[0][13]=0x7fff;
ad7705_buff[0][14]=0x7fff;
ad7705_buff[0][15]=0x7fff;
ad7705_buff[1][1]=0x7fff;
ad7705_buff[1][2]=0x7fff;
ad7705_buff[1][3]=0x7fff;
ad7705_buff[1][4]=0x7fff;
ad7705_buff[1][5]=0x7fff;
ad7705_buff[1][6]=0x7fff;
ad7705_buff[1][7]=0x7fff;
ad7705_buff[1][8]=0x7fff;
ad7705_buff[1][9]=0x7fff;
ad7705_buff[1][10]=0x7fff;
ad7705_buff[1][11]=0x7fff;
ad7705_buff[1][12]=0x7fff;
ad7705_buff[1][13]=0x7fff;
ad7705_buff[1][14]=0x7fff;
ad7705_buff[1][15]=0x7fff;

ad7705_buff_[0]=0x7fff;
ad7705_buff_[1]=0x7fff;


















 




lcd_init();  
lcd_on();
lcd_clear();
		

rtc_init();

a_ind . i=iMn;



memo_read();

#line 11278 "main.c"


AUSW_MAIN_NUMBER=1000;
AUSW_MAIN_NUMBER=1001;
AUSW_MAIN_NUMBER=1002;

mac_adr[5]=*((char*)&AUSW_MAIN_NUMBER);
mac_adr[4]=*(((char*)&AUSW_MAIN_NUMBER)+1);
mac_adr[3]=*(((char*)&AUSW_MAIN_NUMBER)+2);
mem_copy (own_hw_adr, mac_adr, 6);

snmp_Community[0]=(char)lc640_read_int(2000+270); 

snmp_Community[1]=(char)lc640_read_int(2000+270+2);
if((snmp_Community[1]==0)||(snmp_Community[1]==' '))snmp_Community[1]=0;
snmp_Community[2]=(char)lc640_read_int(2000+270+4);
if((snmp_Community[2]==0)||(snmp_Community[2]==' '))snmp_Community[2]=0;
snmp_Community[3]=(char)lc640_read_int(2000+270+6);
if((snmp_Community[3]==0)||(snmp_Community[3]==' '))snmp_Community[3]=0;
snmp_Community[4]=(char)lc640_read_int(2000+270+8);
if((snmp_Community[4]==0)||(snmp_Community[4]==' '))snmp_Community[4]=0;
snmp_Community[5]=(char)lc640_read_int(2000+270+10);
if((snmp_Community[5]==0)||(snmp_Community[5]==' '))snmp_Community[5]=0;
snmp_Community[6]=(char)lc640_read_int(2000+270+12);
if((snmp_Community[6]==0)||(snmp_Community[6]==' '))snmp_Community[6]=0;
snmp_Community[7]=(char)lc640_read_int(2000+270+14);
if((snmp_Community[7]==0)||(snmp_Community[7]==' '))snmp_Community[7]=0;
snmp_Community[8]=(char)lc640_read_int(2000+270+16);
if((snmp_Community[8]==0)||(snmp_Community[8]==' '))snmp_Community[8]=0;
snmp_Community[9]=0;  

if(lc640_read_int(2000)==1)
	{
	bgnd_par(		"                    ",
     		"    Инициализация   ",
     		"      Ethernet      ",
     		"                    ");
	bitmap_hndl();
	lcd_out(lcd_bitmap);
	init_TcpNet ();
	lcd_out(lcd_bitmap);
	init_ETH();
	

	}
























 





adc_init();

((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR|=(1<<11);
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOSET|=(1<<11);






UARTInit(0, 9600);	 



ind_reset_cnt=58;

plazma_restart=1;

if(lc640_read_int(0x10+100+120)==reON)
	{
	plazma_restart=2;
	if(lc640_read_long(0x10+100+92))
		{
		plazma_restart=3;
		time_proc=lc640_read_long(0x10+100+92);
		time_proc_remain=lc640_read_long(0x10+100+100)-time_proc;
		a_ind . i=iMn;
		if(lc640_read_int(0x10+100+118)==mmmIT)
			{
			a_ind . i_s=1;
			}
		else if(lc640_read_int(0x10+100+118)==mmmITIN)
			{
			a_ind . i_s=1;
			}
		else if(lc640_read_int(0x10+100+118)==mmmINIT)
			{
			a_ind . i_s=3;
			}
		work_stat=wsGS;
		plazma_restart=4;
		}
	if(lc640_read_long(0x10+100+96))
		{
		time_proc=lc640_read_long(0x10+100+96);
		time_proc_remain=lc640_read_long(0x10+100+104)-time_proc;
		a_ind . i=iMn;
		if(lc640_read_int(0x10+100+118)==mmmIN)
			{
			a_ind . i_s=1;
			}
		else if(lc640_read_int(0x10+100+118)==mmmITIN)
			{
			a_ind . i_s=3;
			}
		else if(lc640_read_int(0x10+100+118)==mmmINIT)
			{
			a_ind . i_s=1;
			}
		work_stat=wsPS;
		}
	}


can_mcp2515_init();



sc16is700_init((uint32_t)(MODBUS_BAUDRATE*10UL));

main_cnt=0;

modbusTimeoutInMills=3000/MODBUS_BAUDRATE;
if(modbusTimeoutInMills<2)modbusTimeoutInMills=2;
modbusTimeoutInMills+=2;

watchdog_enable();
{
short temp;
temp=lc640_read_int(0x08);
temp++;
if(temp<0)temp=0;
if(temp>1000)temp=0;
lc640_write_int(0x08,temp);
}

socket_tcp = tcp_get_socket (0x01, 0, 10, tcp_callback);
if (socket_tcp != 0) 
	{
    tcp_listen (socket_tcp, 502);
  	}
		
while (1)  
	{
	bTPS=0; 
     
     main_TcpNet ();


	if(bMCP2515_IN)
		{
		bMCP2515_IN=0;
		can_in_an1();
		}


	if(bMODBUS_TIMEOUT)
		{
		bMODBUS_TIMEOUT=0;
		
		modbus_in();
		}
	if(bRXIN0) 
		{
		bRXIN0=0;
	
		uart_in0();
		} 
	





  
     if(b10000Hz)
		{
		b10000Hz=0; 
		

		}

     if(b2000Hz)
		{

		if(adc_window_cnt<200)adc_window_cnt++;

		b2000Hz=0; 
		
		
		}

	if(b1000Hz)
		{
		b1000Hz=0;
		adc_drv7();


		can_mcp2515_hndl();
		



		sc16is700_uart_hndl();


		}
	
	if(b100Hz)
		{
		b100Hz=0;

		
		

		if(!bRESET)but_drv();
		but_an();
		sk_in_drv();
		}
		 
	if(b50Hz)
		{
		b50Hz=0;

		net_drv();
		}

	if(b10Hz)
		{
		char i;

     timer_tick ();
     tick = 1;

		b10Hz=0;
				
		for(i=0;i<NUMIST;i++)bps_drv(i);		
		
		bps_hndl();

						
		

		
		
		ind_hndl(); 

		bitmap_hndl();
		if(!bRESET)
			{
			lcd_out(lcd_bitmap);
			}

		
		

		adc_window_cnt=0;  

		ret_hndl();  
		mess_hndl();
		ret_hndl();
		
		if(speed__==speed__old)
			{
			speed_cnt++;
			if(speed_cnt>5)
				{
				speed_cnt=0;
				speed__=0;
				speed__old=0;
				}
			}
		
		speed__old=speed__;

		viz_hndl();
		current_stab_hndl();
		volt_contr_hndl();
		cap_time_hndl();
		
		volt_contr_hndl();
		rele_hndl();
		rele_drv();
		}

	if(b5Hz)
		{
		b5Hz=0;

		if(!bRESET)
			{
			ad7705_drv();
			}
		if(!bRESET)
			{
			memo_read();
			}
		((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIODIR|=(1UL<<26);
		matemat();
		
		
		snmp_data();
		
		
		pult_data_hndl();
		can2_out(33,*((char*)(&pult_u)),*(((char*)(&pult_u))+1),*((char*)(&pult_i)),*(((char*)(&pult_i))+1),(char)pult_work_stat,*((char*)(&pult_u_set)),*(((char*)(&pult_u_set))+1));
		can2_out(34,*((char*)(&pult_time)),*(((char*)(&pult_time))+1),*((char*)(&pult_time_set)),*(((char*)(&pult_time_set))+1),0,*((char*)(&pult_i_set)),*(((char*)(&pult_i_set))+1));
		

  		}

	if(b2Hz)
		{
		b2Hz=0;

				
		modbus_buf[0]=0x01;
		modbus_buf[1]=0x03;
		modbus_buf[2]=0x00;
		modbus_buf[3]=0x05;
		modbus_buf[4]=0x00;
		modbus_buf[5]=0x01;
		
		
		modbus_crc16=CRC16_2((char*)modbus_buf,6);
		
  		}

	if(b1Hz)
		{
		b1Hz=0;
		if(!bRESET)
			{
			watchdog_reset();
			}

		beep_hndl();
				
		plazma_plazma_plazma++;

		if(++ind_reset_cnt>=60)
			{
			ind_reset_cnt=0;
			lcd_init();
			lcd_on();
			lcd_clear();
			}
               
          
		
		
		if(t_ext_can_nd<10) t_ext_can_nd++;
		
		


		

		time_hndl();

		
		
		if(main_cnt<1000)main_cnt++;



		ach_off_hndl(); 	
		curr_off_hndl();	

		avg_hndl();			
		ramModbusCnt_hndl();
		}
	if(b1min)
		{
		b1min=0;









 

		
		}
	
	




 
		
	if(bCAN1_INIT)
		{
		
		bCAN1_INIT=0;
		can1_init(0x009c0018); 
		FullCAN_SetFilter(1,0x18a);
		FullCAN_SetFilter(0,0x18e);
		}  
	}
}
