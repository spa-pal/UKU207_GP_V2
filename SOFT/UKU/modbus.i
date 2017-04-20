#line 1 "modbus.c"
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



 


#line 2 "modbus.c"
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



#line 3 "modbus.c"

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



 
#line 5 "modbus.c"
#line 1 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"
 
 
 





 






 









#line 34 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 125 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 944 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"



 
#line 6 "modbus.c"
#line 1 "eeprom_map.h"






#line 39 "eeprom_map.h"

#line 134 "eeprom_map.h"





#line 153 "eeprom_map.h"



#line 165 "eeprom_map.h"


#line 176 "eeprom_map.h"


#line 185 "eeprom_map.h"








#line 231 "eeprom_map.h"








#line 7 "modbus.c"
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
#line 8 "modbus.c"
#line 1 "gran.h"

void gran_ring_char(signed char *adr, signed char min, signed char max) ;
void gran_char(signed char *adr, signed char min, signed char max);
void gran(signed short *adr, signed short min, signed short max);
void gran_ring(signed short *adr, signed short min, signed short max);
void gran_long(signed long *adr, signed long min, signed long max); 
#line 9 "modbus.c"
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


#line 10 "modbus.c"
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

#line 11 "modbus.c"
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


#line 12 "modbus.c"
#line 1 "modbus_tcp.h"

extern char plazma_modbus_tcp[20];
extern short modbus_tcp_plazma[10];

U16 tcp_callback (U8 soc, U8 evt, U8 *ptr, U16 par);

extern char modbus_tcp_func;
extern char modbus_tcp_unit;
extern short modbus_tcp_rx_arg0;
extern short modbus_tcp_rx_arg1;



extern char* modbus_tcp_out_ptr;

#line 13 "modbus.c"
	
#line 1 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
 
 
 
 




 








 











#line 37 "C:\\Keil\\ARM\\RV31\\INC\\string.h"


  
  typedef unsigned int size_t;








extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 184 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 200 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 223 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 238 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 261 "C:\\Keil\\ARM\\RV31\\INC\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 493 "C:\\Keil\\ARM\\RV31\\INC\\string.h"



 
#line 15 "modbus.c"

unsigned char modbus_buf[20];
short modbus_crc16;
char modbus_timeout_cnt;
char bMODBUS_TIMEOUT;
unsigned char modbus_rx_buffer[30];	
unsigned char modbus_an_buffer[30];    	
unsigned char modbus_rx_buffer_ptr;	
unsigned char modbus_rx_counter;		
signed short modbusTimeoutInMills;
short modbus_plazma;				
short modbus_plazma1;				
short modbus_plazma2;				
short modbus_plazma3;				
char modbus_cmnd_cnt,modbus_cmnd,modbus_self_cmnd_cnt=33;

char modbus_registers[200];



extern int  mem_copy (void *dp, void *sp, int len);


unsigned short CRC16_2(char* buf, short len)
{
unsigned short crc = 0xFFFF;
short pos;
short i;

for (pos = 0; pos < len; pos++)
  	{
    	crc ^= (unsigned short)buf[pos];          

    	for ( i = 8; i != 0; i--) 
		{    
      	if ((crc & 0x0001) != 0) 
			{      
        		crc >>= 1;                    
        		crc ^= 0xA001;
      		}
      	else  crc >>= 1;                    
    		}
  	}
  
return crc;
}


void modbus_in(void)
{
short crc16_calculated;		
short crc16_incapsulated;	
unsigned short modbus_rx_arg0;		
unsigned short modbus_rx_arg1;		


unsigned char modbus_func;			



memcpy(modbus_an_buffer,modbus_rx_buffer,modbus_rx_buffer_ptr);
modbus_rx_counter=modbus_rx_buffer_ptr;
modbus_rx_buffer_ptr=0;
bMODBUS_TIMEOUT=0;

	
crc16_calculated  = CRC16_2((char*)modbus_an_buffer, modbus_rx_counter-2);
crc16_incapsulated = *((short*)&modbus_an_buffer[modbus_rx_counter-2]);








if((modbus_an_buffer[0]=='r')&&(modbus_an_buffer[1]=='e')&&(modbus_an_buffer[2]=='a')&&(modbus_an_buffer[3]=='d')&&(modbus_an_buffer[6]==crc_87(modbus_an_buffer,6))&&(modbus_an_buffer[7]==crc_95(modbus_an_buffer,6)))
	{
	unsigned short ptr;
	unsigned long data1,data2;
	char temp_out[20];
	pvlk++;
	ptr=modbus_an_buffer[4]+(modbus_an_buffer[5]*256U);
	data1=lc640_read_long(ptr);
	data2=lc640_read_long(ptr+4);
	temp_out[0]='r';
	temp_out[1]='e';
	temp_out[2]='a';
	temp_out[3]='d';
	temp_out[4]=*((char*)&ptr);
	temp_out[5]=*(((char*)&ptr)+1);	
	temp_out[6]=*((char*)&data1);
	temp_out[7]=*(((char*)&data1)+1);		
	temp_out[8]=*(((char*)&data1)+2);	
	temp_out[9]=*(((char*)&data1)+3);		
	temp_out[10]=*((char*)&data2);
	temp_out[11]=*(((char*)&data2)+1);		
	temp_out[12]=*(((char*)&data2)+2);	
	temp_out[13]=*(((char*)&data2)+3);	
	temp_out[14]=crc_87(temp_out,14);	
	temp_out[15]=crc_95(temp_out,14);			
	
	temp_out[17]=0;
	for (i=0;i<16;i++)
		{
		putchar_sc16is700(temp_out[i]);
		temp_out[17]^=temp_out[i];
		}
	putchar_sc16is700(16);
	putchar_sc16is700(temp_out[17]^16);
	putchar_sc16is700(0x0a);
	}




































 



modbus_func=modbus_an_buffer[1];
modbus_rx_arg0=(((unsigned short)modbus_an_buffer[2])*((unsigned short)256))+((unsigned short)modbus_an_buffer[3]);
modbus_rx_arg1=(((unsigned short)modbus_an_buffer[4])*((unsigned short)256))+((unsigned short)modbus_an_buffer[5]);


modbus_cmnd=(modbus_rx_arg1>>8)&0x7f;
modbus_cmnd_cnt=(modbus_rx_arg1)&0x0f;

modbus_plazma3=modbus_cmnd;
modbus_plazma2=modbus_cmnd_cnt;
modbus_plazma1=modbus_self_cmnd_cnt;

if(crc16_calculated==crc16_incapsulated)
	{
	if(modbus_self_cmnd_cnt==33)modbus_self_cmnd_cnt=modbus_cmnd_cnt;
	modbus_plazma=modbus_an_buffer[0];
	if(modbus_an_buffer[0]==200)	 
		{
		if(modbus_func==4)		
			{
			modbus_for_pult_registers_transmit(7);
			}
		else if(modbus_func==6) 	
			{
			
				{
				modbus_for_pult_registers_transmit(7);
				tumbler_stat=(enum_tumbler_stat)(modbus_rx_arg1>>15);
				if((tumbler_stat!=tumbler_stat_old))
					{
					if(tumbler_stat==tsU)
						{
						lc640_write_int(0x10+100+118,mmmIN);
						}
					else lc640_write_int(0x10+100+118,mmmIT);
					
					if(main_cnt>3)
						{
						work_stat=wsOFF;
						restart_off();
						}
					}
				tumbler_stat_old=tumbler_stat;
				
				}
			 
			 	{
				
				if((modbus_cmnd==61)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					if(I_ug<1000)I_ug++;
					else I_ug=((I_ug/10)+1)*10;
					gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					I_ug_block_cnt=10;
					
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					}
				
				else if((modbus_cmnd==62)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					if(I_ug<1000)I_ug--;
					else I_ug=((I_ug/10)-1)*10;
					gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					I_ug_block_cnt=10;
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					}
				else if((modbus_cmnd==63)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					if(I_ug<1000)I_ug=((I_ug/10)+1)*10;
					else I_ug=((I_ug/10)+5)*10;
					gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					I_ug_block_cnt=10;
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					}
				
				else if((modbus_cmnd==64)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					if(I_ug<1000)I_ug=((I_ug/10)-1)*10;
					else I_ug=((I_ug/10)-5)*10;
					gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					I_ug_block_cnt=10;
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					}
				
				else if((modbus_cmnd==71)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					U_up++;
					gran(&U_up,U_MIN,U_MAX);
					U_up_block_cnt=10;
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					}
				
				else if((modbus_cmnd==72)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					U_up--;
					gran(&U_up,U_MIN,U_MAX);
					U_up_block_cnt=10;
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
				
					}
				else if((modbus_cmnd==73)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					U_up=((U_up/10)+1)*10;
					gran(&U_up,U_MIN,U_MAX);
					U_up_block_cnt=10;
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					}
				
				else if((modbus_cmnd==74)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					U_up=((U_up/10)-1)*10;
					gran(&U_up,U_MIN,U_MAX);
					U_up_block_cnt=10;
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					}
				
				
				else if((modbus_cmnd==51)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))	
					{
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					if((main_menu_mode==mmmIT)&&(work_stat==wsOFF))
						{
						if(TIME_VISION_PULT)
							{
							T_PROC_GS=(((T_PROC_GS/60L)+1L)*60L);
							T_PROC_GS_block_cnt=10;
							}
						else
							{
							T_PROC_GS++;
							T_PROC_GS_block_cnt=10;
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
						}
					else if((main_menu_mode==mmmIN)&&(work_stat==wsOFF))
						{
						if(TIME_VISION_PULT)
							{
							T_PROC_PS=(((T_PROC_PS/60L)+1L)*60L);
							T_PROC_PS_block_cnt=10;
							}
						else
							{
							T_PROC_PS++;
							T_PROC_PS_block_cnt=10;
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
						}
					}
				else if((modbus_cmnd==53)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))	
					{
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					if((main_menu_mode==mmmIT)&&(work_stat==wsOFF))
						{
						if(TIME_VISION_PULT)
							{
							T_PROC_GS=(((T_PROC_GS/600L)+1L)*600L);
							T_PROC_GS_block_cnt=10;
							}
						else
							{
							T_PROC_GS=(((T_PROC_GS/10L)+1L)*10L);
							T_PROC_GS_block_cnt=10;
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
						}
					else if((main_menu_mode==mmmIN)&&(work_stat==wsOFF))
						{
						if(TIME_VISION_PULT)
							{
							T_PROC_PS=(((T_PROC_PS/600L)+1L)*600L);
							T_PROC_PS_block_cnt=10;
							}
						else
							{
							T_PROC_PS=(((T_PROC_PS/10L)+1L)*10L);
							T_PROC_PS_block_cnt=10;
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
						}
					}
				
				else if((modbus_cmnd==52)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))	
					{
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					if((main_menu_mode==mmmIT)&&(work_stat==wsOFF))
						{
						if(TIME_VISION_PULT)
							{
							T_PROC_GS=(((T_PROC_GS/60L)-1L)*60L);
							T_PROC_GS_block_cnt=10;
							}
						else
							{
							T_PROC_GS--;
							T_PROC_GS_block_cnt=10;
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
							
						}
					else if((main_menu_mode==mmmIN)&&(work_stat==wsOFF))
						{
						if(TIME_VISION_PULT)
							{
							T_PROC_PS=(((T_PROC_PS/60L)-1L)*60L);
							T_PROC_PS_block_cnt=10;
							}
						else
							{
							T_PROC_PS--;
							T_PROC_PS_block_cnt=10;
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
						}
					}
				else if((modbus_cmnd==54)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))	
					{
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					if((main_menu_mode==mmmIT)&&(work_stat==wsOFF))
						{
						if(TIME_VISION_PULT)
							{
							T_PROC_GS=(((T_PROC_GS/600L)-1L)*600L);
							T_PROC_GS_block_cnt=10;
							}
						else
							{
							T_PROC_GS=(((T_PROC_GS/10L)-1L)*10L);
							T_PROC_GS_block_cnt=10;
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
										
						}
					else if((main_menu_mode==mmmIN)&&(work_stat==wsOFF))
						{
						if(TIME_VISION_PULT)
							{
							T_PROC_PS=(((T_PROC_PS/600L)-1L)*600L);
							T_PROC_PS_block_cnt=10;
							}
						else
							{
							T_PROC_PS=(((T_PROC_PS/10L)-1L)*10L);
							T_PROC_PS_block_cnt=10;
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
						}
					}
				
				
			
			else if((modbus_cmnd==1)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					modbus_self_cmnd_cnt=modbus_cmnd_cnt;
					if(tumbler_stat==tsI)
						{
						if(work_stat!=wsGS)
							{
							work_stat=wsGS;
							time_proc=0;
							time_proc_remain=T_PROC_GS;
							a_ind . i_s=0;
							restart_on_GS();
							}			
						else 
							{
							work_stat=wsOFF;
							restart_off();
							}
						}
				
					if(tumbler_stat==tsU)
						{
						if(work_stat!=wsPS)
							{
							work_stat=wsPS;
							time_proc=0;
							time_proc_remain=T_PROC_PS;
							a_ind . i_s=0;
							restart_on_PS();
							}			
						else
							{
							work_stat=wsOFF;
							restart_off();
							}
						}
					}
				}
			}
		}

	if(modbus_an_buffer[0]==MODBUS_ADRESS)
		{
		if(modbus_func==3)		
			{
			if((modbus_rx_arg0>=50)&&(modbus_rx_arg0<80)) modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_func, modbus_rx_arg0,modbus_rx_arg1, 0);
			}
		else if(modbus_func==4)		
			{
			modbus_input_registers_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0, modbus_rx_arg1, 0);
			}

		else if(modbus_func==6) 	
			{
			if(modbus_rx_arg0==50)		
				{
				I_ug=modbus_rx_arg1;
				lc640_write_int(0x10+16,I_ug);
				}
			if(modbus_rx_arg0==51)		
				{
				U_up=modbus_rx_arg1;
				lc640_write_int(0x10+18,U_up);
				}
			if(modbus_rx_arg0==52)		
				{
				U_maxg=modbus_rx_arg1;
				lc640_write_int(0x10+100+2,U_maxg);
				}
			if(modbus_rx_arg0==53)		
				{
				I_maxp=modbus_rx_arg1;
				lc640_write_int(0x10+100+4,I_maxp);
				}								
			if(modbus_rx_arg0==54)		
				{
				signed long sec,min,hour;
				sec=(signed long)modbus_rx_arg1;
				min=(T_PROC_GS/60L)%60L;
				hour=T_PROC_GS/3600L;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(0x10+100+100,T_PROC_GS);
				}
			if(modbus_rx_arg0==55)		
				{
				signed long sec,min,hour;
				sec=T_PROC_GS%60L;
				min=(signed long)modbus_rx_arg1;
				hour=T_PROC_GS/3600L;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(0x10+100+100,T_PROC_GS);
				}
			if(modbus_rx_arg0==56)		
				{
				signed long sec,min,hour;
				sec=T_PROC_GS%60L;
				min=(T_PROC_GS/60L)%60L;
				hour=(signed long)modbus_rx_arg1;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(0x10+100+100,T_PROC_GS);
				}
			if(modbus_rx_arg0==57)		
				{
				signed long sec,min,hour;
				sec=(signed long)modbus_rx_arg1;
				min=(T_PROC_PS/60L)%60L;
				hour=T_PROC_PS/3600L;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(0x10+100+104,T_PROC_PS);
				}

			if(modbus_rx_arg0==58)		
				{
				signed long sec,min,hour;
				sec=T_PROC_PS%60L;
				min=(signed long)modbus_rx_arg1;
				hour=T_PROC_PS/3600L;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(0x10+100+104,T_PROC_PS);
				}

			if(modbus_rx_arg0==59)		
				{
				signed long sec,min,hour;
				sec=T_PROC_PS%60L;
				min=(T_PROC_PS/60L)%60L;
				hour=(signed long)modbus_rx_arg1;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(0x10+100+104,T_PROC_PS);
				}

			if(modbus_rx_arg0==60)		
				{
				if(modbus_rx_arg1==1)
					{
					if(work_stat!=wsPS)
						{
						work_stat=wsPS;
						time_proc=0;
						time_proc_remain=T_PROC_PS;
						restart_on_PS();
						lc640_write_int(0x10+100+118,mmmIN);
						}
					}
				if(modbus_rx_arg1==0)
					{
					if(work_stat==wsPS)
						{
						work_stat=wsOFF;
						restart_off();
						}
					}
				}
			if(modbus_rx_arg0==61)		
				{
				if(modbus_rx_arg1==1)
					{
					if(work_stat!=wsGS)
						{
						work_stat=wsGS;
						time_proc=0;
						time_proc_remain=T_PROC_GS;
						lc640_write_int(0x10+100+118,mmmIT);
						}
					}
				if(modbus_rx_arg1==0)
					{
					if(work_stat==wsGS)
						{
						work_stat=wsOFF;
						restart_off();
						}
					}
				}

			if(modbus_rx_arg0==62)		
				{
					{
					if(work_stat==wsOFF)
						{
						if(modbus_rx_arg1==0)REV_STAT=rsFF;
						if(modbus_rx_arg1==1)REV_STAT=rsREW;
						}
					}
				}
			if(modbus_rx_arg0==63)		
				{
					{
					if((work_stat==wsOFF)&&(REV_IS_ON))
						{
						if(modbus_rx_arg1==1)AVT_REV_IS_ON=1;
						if(modbus_rx_arg1==0)AVT_REV_IS_ON=0;
						lc640_write_int(0x10+100+148,AVT_REV_IS_ON);
						}
					}
				}
			if(modbus_rx_arg0==64)		
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_FF=modbus_rx_arg1;
					gran(&AVT_REV_TIME_FF,30,T_PROC_MAX);
					lc640_write_int(0x10+100+150,AVT_REV_TIME_FF);	
					}
				}
			if(modbus_rx_arg0==65)		
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_REW=modbus_rx_arg1;
					gran(&AVT_REV_TIME_REW,30,T_PROC_MAX);
					lc640_write_int(0x10+100+152,AVT_REV_TIME_REW);	
					}
				}
			if(modbus_rx_arg0==66)		
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_PAUSE=modbus_rx_arg1;
					gran(&AVT_REV_TIME_PAUSE,2,600);
					lc640_write_int(0x10+100+154,AVT_REV_TIME_PAUSE);	
					}
				}

			if(modbus_rx_arg0==67)		
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_I_NOM_FF=modbus_rx_arg1;
		    			gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+156,AVT_REV_I_NOM_FF);	
					}
				}

			if(modbus_rx_arg0==68)		
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_I_NOM_REW=modbus_rx_arg1;
		    			gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(0x10+100+158,AVT_REV_I_NOM_REW);	
					}
				}
			if(modbus_rx_arg0==69)		
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_U_NOM_FF=modbus_rx_arg1;
		    			gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
					lc640_write_int(0x10+100+160,AVT_REV_U_NOM_FF);					
					}
				}

			if(modbus_rx_arg0==70)		
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_U_NOM_REW=modbus_rx_arg1;
		    			gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
					lc640_write_int(0x10+100+162,AVT_REV_U_NOM_REW);					
					}
				}

			if(modbus_rx_arg0==71)		
				{
				if(work_stat==wsOFF)
					{
					CAP_ZAR_TIME=modbus_rx_arg1;
		    			gran(&CAP_ZAR_TIME,10,9999);
					lc640_write_int(0x10+450,CAP_ZAR_TIME);					
					}
				}
			if(modbus_rx_arg0==72)		
				{
				if(work_stat==wsOFF)
					{
					CAP_PAUSE1_TIME=modbus_rx_arg1;
		    			gran(&CAP_PAUSE1_TIME,10,9999);
					lc640_write_int(0x10+450+2,CAP_PAUSE1_TIME);					
					}
				}
			if(modbus_rx_arg0==73)		
				{
				if(work_stat==wsOFF)
					{
					CAP_RAZR_TIME=modbus_rx_arg1;
		    			gran(&CAP_RAZR_TIME,10,9999);
					lc640_write_int(0x10+450+4,CAP_RAZR_TIME);					
					}
				}
			if(modbus_rx_arg0==74)		
				{
				if(work_stat==wsOFF)
					{
					CAP_PAUSE2_TIME=modbus_rx_arg1;
		    			gran(&CAP_PAUSE2_TIME,10,9999);
					lc640_write_int(0x10+450+6,CAP_PAUSE2_TIME);					
					}
				}

			if(modbus_rx_arg0==75)		
				{
				if(work_stat==wsOFF)
					{
					CAP_MAX_VOLT=modbus_rx_arg1;
		    			gran(&CAP_MAX_VOLT,1,100);
					lc640_write_int(0x10+450+8,CAP_MAX_VOLT);					
					}
				}
			if(modbus_rx_arg0==76)		
				{
				if(work_stat==wsOFF)
					{
					CAP_WRK_CURR=modbus_rx_arg1;
		    			gran(&CAP_WRK_CURR,1,150);
					lc640_write_int(0x10+450+10,CAP_WRK_CURR);					
					}
				}

			if(modbus_rx_arg0==77)		
				{
				if(modbus_rx_arg1==0x11)
					{
					start_CAP();
					}
				if(modbus_rx_arg1==0x12)
					{
					pause_CAP();
					}
				if(modbus_rx_arg1==0x13)
					{
					stop_CAP();
					}
				if(modbus_rx_arg1==0x14)
					{
					reset_CAP();
					}

				if(modbus_rx_arg1==0x21)
					{
					if(work_stat==wsOFF)
						{
						CAP_ZAR_TIME++;
		    				gran(&CAP_ZAR_TIME,10,9999);
						lc640_write_int(0x10+450,CAP_ZAR_TIME);					
						}
					}
				if(modbus_rx_arg1==0x22)
					{
					if(work_stat==wsOFF)
						{
						CAP_ZAR_TIME--;
		    				gran(&CAP_ZAR_TIME,10,9999);
						lc640_write_int(0x10+450,CAP_ZAR_TIME);					
						}
					}

				if(modbus_rx_arg1==0x31)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE1_TIME++;
		    				gran(&CAP_PAUSE1_TIME,10,9999);
						lc640_write_int(0x10+450+2,CAP_PAUSE1_TIME);					
						}
					}
				if(modbus_rx_arg1==0x32)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE1_TIME--;
		    				gran(&CAP_PAUSE1_TIME,10,9999);
						lc640_write_int(0x10+450+2,CAP_PAUSE1_TIME);					
						}
					}

				if(modbus_rx_arg1==0x41)
					{
					if(work_stat==wsOFF)
						{
						CAP_RAZR_TIME++;
		    				gran(&CAP_RAZR_TIME,10,9999);
						lc640_write_int(0x10+450+4,CAP_RAZR_TIME);					
						}
					}
				if(modbus_rx_arg1==0x42)
					{
					if(work_stat==wsOFF)
						{
						CAP_RAZR_TIME--;
		    				gran(&CAP_RAZR_TIME,10,9999);
						lc640_write_int(0x10+450+4,CAP_RAZR_TIME);					
						}
					}

				if(modbus_rx_arg1==0x51)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE2_TIME++;
		    				gran(&CAP_PAUSE2_TIME,10,9999);
						lc640_write_int(0x10+450+6,CAP_PAUSE2_TIME);					
						}
					}
				if(modbus_rx_arg1==0x52)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE2_TIME--;
		    				gran(&CAP_PAUSE2_TIME,10,9999);
						lc640_write_int(0x10+450+6,CAP_PAUSE2_TIME);					
						}
					}

				if(modbus_rx_arg1==0x61)
					{
					if(work_stat==wsOFF)
						{
						CAP_MAX_VOLT++;
		    				gran(&CAP_MAX_VOLT,1,100);
						lc640_write_int(0x10+450+8,CAP_MAX_VOLT);					
						}
					}
				if(modbus_rx_arg1==0x62)
					{
					if(work_stat==wsOFF)
						{
						CAP_MAX_VOLT--;
		    				gran(&CAP_MAX_VOLT,1,100);
						lc640_write_int(0x10+450+8,CAP_MAX_VOLT);					
						}
					}

				if(modbus_rx_arg1==0x71)
					{
					if(work_stat==wsOFF)
						{
						CAP_WRK_CURR++;
		    				gran(&CAP_WRK_CURR,1,150);
						lc640_write_int(0x10+450+10,CAP_WRK_CURR);					
						}
					}
				if(modbus_rx_arg1==0x72)
					{
					if(work_stat==wsOFF)
						{
						CAP_WRK_CURR--;
		    				gran(&CAP_WRK_CURR,1,150);
						lc640_write_int(0x10+450+10,CAP_WRK_CURR);					
						}
					}

				}

			
			if((T_PROC_GS>T_PROC_MAX)||(T_PROC_GS<30))
				{
				if(T_PROC_GS>T_PROC_MAX)T_PROC_GS=T_PROC_MAX+1;
				else if(T_PROC_GS<30)T_PROC_GS=29;
				lc640_write_int(0x10+100+100,T_PROC_GS);
				T_PROC_GS_MODE=1;	
				lc640_write_int(0x10+100+122,T_PROC_GS_MODE);
				}
			if((T_PROC_GS<=T_PROC_MAX)&&(T_PROC_GS>=30))
				{
				T_PROC_GS_MODE=0;	
				lc640_write_int(0x10+100+122,T_PROC_GS_MODE);
				}
			
			if((T_PROC_PS>T_PROC_MAX)||(T_PROC_PS<30))
				{
				if(T_PROC_PS>T_PROC_MAX)T_PROC_PS=T_PROC_MAX+1;
				else if(T_PROC_PS<30)T_PROC_PS=29;
				lc640_write_int(0x10+100+104,T_PROC_PS);
				T_PROC_PS_MODE=1;	
				lc640_write_int(0x10+100+124,T_PROC_PS_MODE);
				}
			if((T_PROC_PS<=T_PROC_MAX)&&(T_PROC_PS>=30))
				{
				T_PROC_PS_MODE=0;	
				lc640_write_int(0x10+100+124,T_PROC_PS_MODE);
				}

			modbus_hold_register_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0);


			


			}
		} 
	
	}


}


void modbus_input_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short reg_quantity, char prot)
{

char modbus_tx_buff[200];
unsigned short crc_temp;
char i;







 

modbus_registers[0]=(char)(load_U/256);					
modbus_registers[1]=(char)(load_U%256);
modbus_registers[2]=(char)(load_I/256);					
modbus_registers[3]=(char)(load_I%256);
modbus_registers[4]=(char)((time_proc%60)/256);			
modbus_registers[5]=(char)((time_proc%60)%256);
modbus_registers[6]=(char)(((time_proc/60)%60)/256);		
modbus_registers[7]=(char)(((time_proc/60)%60)%256);
modbus_registers[8]=(char)((time_proc/3600)/256);			
modbus_registers[9]=(char)((time_proc/3600)%256);		 	
modbus_registers[10]=(char)((time_proc_remain%60)/256);	
modbus_registers[11]=(char)((time_proc_remain%60)%256);
modbus_registers[12]=(char)(((time_proc_remain/60)%60)/256);
modbus_registers[13]=(char)(((time_proc_remain/60)%60)%256);
modbus_registers[14]=(char)((time_proc_remain/3600)/256);	
modbus_registers[15]=(char)((time_proc_remain/3600)%256);
modbus_registers[16]=(char)((CAP_COUNTER)/256);			
modbus_registers[17]=(char)((CAP_COUNTER)%256);
modbus_registers[18]=(char)((CAP_TIME_SEC)/256);			
modbus_registers[19]=(char)((CAP_TIME_SEC)%256);
modbus_registers[20]=(char)((CAP_TIME_MIN)/256);			
modbus_registers[21]=(char)((CAP_TIME_MIN)%256);
modbus_registers[22]=(char)((CAP_TIME_HOUR)/256);			
modbus_registers[23]=(char)((CAP_TIME_HOUR)%256);
modbus_registers[24]=0;
modbus_registers[25]=0;										
if(bVOLT_IS_NOT_DOWN)	modbus_registers[25]=1;
modbus_registers[26]=0;
modbus_registers[27]=0;										
if(bVOLT_IS_NOT_UP)	modbus_registers[27]=1;
								

































 
if(prot==0)
	{
	modbus_tx_buff[0]=adr;
	modbus_tx_buff[1]=func;
	modbus_tx_buff[2]=(char)(reg_quantity*2);
	
	memcpy((char*)&modbus_tx_buff[3],(char*)&modbus_registers[(reg_adr-1)*2],reg_quantity*2);
	
	crc_temp=CRC16_2(modbus_tx_buff,(reg_quantity*2)+3);
	
	modbus_tx_buff[3+(reg_quantity*2)]=crc_temp%256;
	modbus_tx_buff[4+(reg_quantity*2)]=crc_temp/256;
	
	for (i=0;i<(5+(reg_quantity*2));i++)
		{
		putchar0(modbus_tx_buff[i]);
		}
	for (i=0;i<(5+(reg_quantity*2));i++)
		{
		putchar_sc16is700(modbus_tx_buff[i]);
		}
	}
else if(prot==1)
	{
	modbus_tcp_out_ptr=(char*)&modbus_registers[(reg_adr-1)*2];
	}
}



void modbus_for_pult_registers_transmit(unsigned short reg_quantity)
{
char modbus_registers[20];
char modbus_tx_buff[30];
unsigned short crc_temp;
char i;




modbus_registers[0]=(char)(pult_u%256);
modbus_registers[1]=(char)(pult_u/256);					
modbus_registers[2]=(char)(pult_i%256);
modbus_registers[3]=(char)(pult_i/256);					
modbus_registers[4]=(char)(pult_work_stat%256);
modbus_registers[5]=(char)(pult_work_stat/256);			
modbus_registers[6]=(char)(pult_u_set%256);
modbus_registers[7]=(char)(pult_u_set/256);				
modbus_registers[8]=(char)(pult_time%256);
modbus_registers[9]=(char)(pult_time/256);				
modbus_registers[10]=(char)(pult_time_set%256);		 	
modbus_registers[11]=(char)(pult_time_set/256);			
modbus_registers[12]=(char)(pult_i_set%256);
modbus_registers[13]=(char)(pult_i_set/256);				


modbus_tx_buff[0]=201;
modbus_tx_buff[1]=4;
modbus_tx_buff[2]=(char)(reg_quantity*2);

memcpy((char*)&modbus_tx_buff[3],(char*)modbus_registers,reg_quantity*2);

crc_temp=CRC16_2(modbus_tx_buff,(reg_quantity*2)+3);

modbus_tx_buff[3+(reg_quantity*2)]=crc_temp%256;
modbus_tx_buff[4+(reg_quantity*2)]=crc_temp/256;

for (i=0;i<(5+(reg_quantity*2));i++)
	{
	putchar0(modbus_tx_buff[i]);
	}
for (i=0;i<(5+(reg_quantity*2));i++)
	{
	putchar_sc16is700(modbus_tx_buff[i]);
	}

}



















































































 



void modbus_hold_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr)
{
char modbus_registers[120];
char modbus_tx_buff[100];
unsigned short crc_temp;
char i;

modbus_registers[0]=(char)(I_ug/256);					
modbus_registers[1]=(char)(I_ug%256);
modbus_registers[2]=(char)(U_up/256);					
modbus_registers[3]=(char)(U_up%256);
modbus_registers[4]=(char)(U_maxg/256);					
modbus_registers[5]=(char)(U_maxg%256);
modbus_registers[6]=(char)(I_maxp/256);					
modbus_registers[7]=(char)(I_maxp%256);
modbus_registers[8]=(char)((T_PROC_GS%60)/256);			
modbus_registers[9]=(char)((T_PROC_GS%60)%256);
modbus_registers[10]=(char)(((T_PROC_GS/60)%60)/256);		
modbus_registers[11]=(char)(((T_PROC_GS/60)%60)%256);
modbus_registers[12]=(char)((T_PROC_GS/3600)/256);		
modbus_registers[13]=(char)((T_PROC_GS/3600)%256);
modbus_registers[14]=(char)((T_PROC_PS%60)/256);			
modbus_registers[15]=(char)((T_PROC_PS%60)%256);
modbus_registers[16]=(char)(((T_PROC_PS/60)%60)/256);		
modbus_registers[17]=(char)(((T_PROC_PS/60)%60)%256);
modbus_registers[18]=(char)((T_PROC_PS/3600)/256);		
modbus_registers[19]=(char)((T_PROC_PS/3600)%256);
modbus_registers[20]=0;								
modbus_registers[21]=0;
if(work_stat==wsPS)modbus_registers[21]=1;
modbus_registers[22]=0;								
modbus_registers[23]=0;
if(work_stat==wsGS)modbus_registers[23]=1;
modbus_registers[24]=0;								
modbus_registers[25]=0;
if(REV_STAT==rsREW)modbus_registers[25]=1;
modbus_registers[26]=0;								
modbus_registers[27]=0;
if(AVT_REV_IS_ON)modbus_registers[27]=1;
modbus_registers[28]=(char)((AVT_REV_TIME_FF)/256);		
modbus_registers[29]=(char)((AVT_REV_TIME_FF)%256);
modbus_registers[30]=(char)((AVT_REV_TIME_REW)/256);		
modbus_registers[31]=(char)((AVT_REV_TIME_REW)%256);
modbus_registers[32]=(char)((AVT_REV_TIME_PAUSE)/256);		
modbus_registers[33]=(char)((AVT_REV_TIME_PAUSE)%256);
modbus_registers[34]=(char)((AVT_REV_I_NOM_FF)/256);		
modbus_registers[35]=(char)((AVT_REV_I_NOM_FF)%256);
modbus_registers[36]=(char)((AVT_REV_I_NOM_REW)/256);		
modbus_registers[37]=(char)((AVT_REV_I_NOM_REW)%256);
modbus_registers[38]=(char)((AVT_REV_U_NOM_FF)/256);		
modbus_registers[39]=(char)((AVT_REV_U_NOM_FF)%256);
modbus_registers[40]=(char)((AVT_REV_U_NOM_REW)/256);		
modbus_registers[41]=(char)((AVT_REV_U_NOM_REW)%256);
modbus_registers[42]=(char)((CAP_ZAR_TIME)/256);			
modbus_registers[43]=(char)((CAP_ZAR_TIME)%256);
modbus_registers[44]=(char)((CAP_PAUSE1_TIME)/256);		
modbus_registers[45]=(char)((CAP_PAUSE1_TIME)%256);
modbus_registers[46]=(char)((CAP_RAZR_TIME)/256);			
modbus_registers[47]=(char)((CAP_RAZR_TIME)%256);
modbus_registers[48]=(char)((CAP_PAUSE2_TIME)/256);		
modbus_registers[49]=(char)((CAP_PAUSE2_TIME)%256);
modbus_registers[50]=(char)((CAP_MAX_VOLT)/256);			
modbus_registers[51]=(char)((CAP_MAX_VOLT)%256);
modbus_registers[52]=(char)((CAP_WRK_CURR)/256);			
modbus_registers[53]=(char)((CAP_WRK_CURR)%256);

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
modbus_tx_buff[2]=(char)(reg_adr/256);
modbus_tx_buff[3]=(char)(reg_adr%256);




memcpy((char*)&modbus_tx_buff[4],(char*)&modbus_registers[(reg_adr-1)*2],2);

crc_temp=CRC16_2(modbus_tx_buff,6);

modbus_tx_buff[6]=crc_temp%256;
modbus_tx_buff[7]=crc_temp/256;

for (i=0;i<8;i++)
	{
	putchar0(modbus_tx_buff[i]);
	}
for (i=0;i<8;i++)
	{
	putchar_sc16is700(modbus_tx_buff[i]);
	}
}	



void modbus_hold_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short reg_quantity, char prot)
{

char modbus_tx_buff[200];
unsigned short crc_temp;
char i;





modbus_registers[0]=(char)(lc640_read_int(0x10+16)/256);
modbus_registers[1]=(char)(lc640_read_int(0x10+16)%256);
modbus_registers[2]=(char)(lc640_read_int(0x10+18)/256);
modbus_registers[3]=(char)(lc640_read_int(0x10+18)%256);
modbus_registers[4]=(char)(U_maxg/256);					
modbus_registers[5]=(char)(U_maxg%256);
modbus_registers[6]=(char)(I_maxp/256);					
modbus_registers[7]=(char)(I_maxp%256);
modbus_registers[8]=(char)((T_PROC_GS%60)/256);			
modbus_registers[9]=(char)((T_PROC_GS%60)%256);
modbus_registers[10]=(char)(((T_PROC_GS/60)%60)/256);		
modbus_registers[11]=(char)(((T_PROC_GS/60)%60)%256);
modbus_registers[12]=(char)((T_PROC_GS/3600)/256);		
modbus_registers[13]=(char)((T_PROC_GS/3600)%256);
modbus_registers[14]=(char)((T_PROC_PS%60)/256);			
modbus_registers[15]=(char)((T_PROC_PS%60)%256);
modbus_registers[16]=(char)(((T_PROC_PS/60)%60)/256);		
modbus_registers[17]=(char)(((T_PROC_PS/60)%60)%256);
modbus_registers[18]=(char)((T_PROC_PS/3600)/256);		
modbus_registers[19]=(char)((T_PROC_PS/3600)%256);
modbus_registers[20]=0;								
modbus_registers[21]=0;
if(work_stat==wsPS)modbus_registers[21]=1;
modbus_registers[22]=0;								
modbus_registers[23]=0;
if(work_stat==wsGS)modbus_registers[23]=1;
modbus_registers[24]=0;								
modbus_registers[25]=0;
if(REV_STAT==rsREW)modbus_registers[25]=1;
modbus_registers[26]=0;								
modbus_registers[27]=0;
if(AVT_REV_IS_ON)modbus_registers[27]=1;
modbus_registers[28]=(char)((AVT_REV_TIME_FF)/256);		
modbus_registers[29]=(char)((AVT_REV_TIME_FF)%256);
modbus_registers[30]=(char)((AVT_REV_TIME_REW)/256);		
modbus_registers[31]=(char)((AVT_REV_TIME_REW)%256);
modbus_registers[32]=(char)((AVT_REV_TIME_PAUSE)/256);		
modbus_registers[33]=(char)((AVT_REV_TIME_PAUSE)%256);
modbus_registers[34]=(char)((AVT_REV_I_NOM_FF)/256);		
modbus_registers[35]=(char)((AVT_REV_I_NOM_FF)%256);
modbus_registers[36]=(char)((AVT_REV_I_NOM_REW)/256);		
modbus_registers[37]=(char)((AVT_REV_I_NOM_REW)%256);
modbus_registers[38]=(char)((AVT_REV_U_NOM_FF)/256);		
modbus_registers[39]=(char)((AVT_REV_U_NOM_FF)%256);
modbus_registers[40]=(char)((AVT_REV_U_NOM_REW)/256);		
modbus_registers[41]=(char)((AVT_REV_U_NOM_REW)%256);
modbus_registers[42]=(char)((CAP_ZAR_TIME)/256);			
modbus_registers[43]=(char)((CAP_ZAR_TIME)%256);
modbus_registers[44]=(char)((CAP_PAUSE1_TIME)/256);		
modbus_registers[45]=(char)((CAP_PAUSE1_TIME)%256);
modbus_registers[46]=(char)((CAP_RAZR_TIME)/256);			
modbus_registers[47]=(char)((CAP_RAZR_TIME)%256);
modbus_registers[48]=(char)((CAP_PAUSE2_TIME)/256);		
modbus_registers[49]=(char)((CAP_PAUSE2_TIME)%256);
modbus_registers[50]=(char)((CAP_MAX_VOLT)/256);			
modbus_registers[51]=(char)((CAP_MAX_VOLT)%256);
modbus_registers[52]=(char)((CAP_WRK_CURR)/256);			
modbus_registers[53]=(char)((CAP_WRK_CURR)%256);

modbus_registers[80]=(char)((I_ug_ram)/256);			
modbus_registers[81]=(char)((I_ug_ram)%256);
modbus_registers[82]=(char)((U_up_ram)/256);			
modbus_registers[83]=(char)((U_up_ram)%256);

if(prot==0)
	{
	modbus_tx_buff[0]=adr;
	modbus_tx_buff[1]=func;
	modbus_tx_buff[2]=(char)(reg_quantity*2);
	
	memcpy((char*)&modbus_tx_buff[3],(char*)&modbus_registers[(reg_adr-50)*2],reg_quantity*2);
							   
	crc_temp=CRC16_2(modbus_tx_buff,(reg_quantity*2)+3);
	
	modbus_tx_buff[3+(reg_quantity*2)]=crc_temp%256;
	modbus_tx_buff[4+(reg_quantity*2)]=crc_temp/256;
	
	for (i=0;i<(5+(reg_quantity*2));i++)
		{
		putchar0(modbus_tx_buff[i]);
		}
	for (i=0;i<(5+(reg_quantity*2));i++)
		{
		putchar_sc16is700(modbus_tx_buff[i]);
		}
	}
else if(prot==1)
	{
	modbus_tcp_out_ptr=(char*)&modbus_registers[(reg_adr-50)*2];
	}


}


