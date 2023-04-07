#line 1 "control.c"
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
#line 2 "control.c"
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

extern signed char net_in_drv_cnt_B,net_in_drv_cnt_C;
extern char net_in_drv_stat_B, net_in_drv_stat_C;



extern signed short RELE_FUNC[2];
extern char rele_ext_cntrl[2];

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


#line 3 "control.c"
#line 1 "mess.h"










		





void mess_hndl(void);
void mess_send(char _mess, short par0, short par1, char _time);
char mess_find(char _mess);
char mess_find_unvol(char _mess);

#line 4 "control.c"
#line 1 "gran.h"

void gran_ring_char(signed char *adr, signed char min, signed char max) ;
void gran_char(signed char *adr, signed char min, signed char max);
void gran(signed short *adr, signed short min, signed short max);
void gran_ring(signed short *adr, signed short min, signed short max);
void gran_long(signed long *adr, signed long min, signed long max); 
void gran_ring_long(signed long *adr, signed long min, signed long max);
void gran_u(unsigned short *adr, unsigned short min, unsigned short max);
#line 5 "control.c"
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

#line 6 "control.c"
#line 1 "eeprom_map.h"







#line 43 "eeprom_map.h"

#line 113 "eeprom_map.h"

#line 138 "eeprom_map.h"






#line 158 "eeprom_map.h"



#line 170 "eeprom_map.h"


#line 181 "eeprom_map.h"


#line 190 "eeprom_map.h"








#line 236 "eeprom_map.h"










#line 7 "control.c"
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



#line 8 "control.c"
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







 






#line 155 "main.h"










































#line 225 "main.h"







		










#line 261 "main.h"

#line 277 "main.h"





















#line 311 "main.h"

#line 325 "main.h"










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
	iFWabout}i_enum;

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
extern signed short MODBUS_BAUDRATE, MODBUS_BAUDRATEA, MODBUS_BAUDRATEB;
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
extern signed short UOUT_OFF_EN;	
extern signed short UOUT_OFF_LEVEL;	
extern signed short UOUT_OFF_DELAY;	







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
	char _uout_avar_cnt;
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
extern signed long T_PROC_GS;			
extern signed short T_PROC_GS_block_cnt;
extern signed short T_PROC_GS_MODE;	
extern signed long T_PROC_PS;			
extern signed short T_PROC_PS_block_cnt;
extern signed short T_PROC_PS_MODE;	
extern unsigned short	T_PROC_MAX;		
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

extern long gp_av_stat;

extern short pvlk;

extern char eepromRamSwitch; 	
extern short ramModbusCnt;		



extern signed short pwm_u_reg;
extern signed short pwm_i_reg;
extern signed short pwm_t_reg;

extern short plazma_umax;

extern short modbus_tcp_plazma_pavlik[4];


 
#line 9 "control.c"
#line 1 "beep.h"

extern unsigned long beep_stat_temp,beep_stat;
extern char beep_stat_cnt;
extern char beep_cnt;
extern char bU_BAT2REL_AV_BAT;

void beep_drv(void);
void beep_init(long zvuk,char fl);
void beep_hndl(void);
#line 10 "control.c"

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








 

     
#line 12 "control.c"
#line 1 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.h"




















 









 

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







 
#line 97 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.h"
#line 1 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\system_LPC17xx.h"




















 









extern uint32_t SystemFrequency;     










 
extern void SystemInit (void);





#line 98 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.h"


 
 
 


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



 
 
 
 
#line 924 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.h"

 
#line 945 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.h"

 
#line 959 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.h"

 
#line 972 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.h"

 







 
 
 
#line 1031 "C:\\Keil\\ARM\\INC\\NXP\\LPC17xx\\LPC17xx.h"

#line 13 "control.c"









extern signed short u_necc,u_necc_,u_necc_up,u_necc_dn;
extern signed short main_cnt_5Hz;
extern signed short num_necc;
extern signed short num_necc_Imax;
extern signed short num_necc_Imin;




extern signed mat_temper;






typedef struct  
	{
     unsigned int bAN:1; 
     unsigned int bAB1:1; 
     unsigned int bAB2:1;
     unsigned int bAS1:1;
     unsigned int bAS2:1;
     unsigned int bAS3:1;
     unsigned int bAS4:1;
     unsigned int bAS5:1;
     unsigned int bAS6:1;
     unsigned int bAS7:1;
     unsigned int bAS8:1;
     unsigned int bAS9:1;
     unsigned int bAS10:1;
     unsigned int bAS11:1;
     unsigned int bAS12:1;
     }avar_struct;
     
extern union 
{
avar_struct av;
int avar_stat;
}a__,a_;



long adc_buff[16][32];
signed short adc_buff_max[12],adc_buff_min[12]={5000,5000,5000,5000,5000,5000,5000,5000,5000,5000},unet_buff_max,unet_buff_min=5000;
char adc_self_ch_cnt,adc_ch_net;
short adc_buff_[16];
short adc_buff__[16];
char adc_cnt,adc_cnt1,adc_ch,adc_ch_cnt;
short zero_cnt;
enum_adc_stat adc_stat=asCH;
unsigned short net_buff[32],net_buff_;
char net_buff_cnt;
short ADWR,period_cnt,non_zero_cnt;

char bRELE_OUT;
signed short adc_self_ch_buff[3],adc_self_ch_disp[3];
long main_power_buffer[8],main_power_buffer_;
short adc_result;
short main_power_buffer_cnt;
short adc_gorb_cnt,adc_zero_cnt;
char adc_window_flag;
short adc_window_cnt;
short adc_net_buff_cnt;


extern int mess_par0[10],mess_par1[10],mess_data[2];

extern signed short TBAT;
extern signed short Kunet;
extern signed short Kubat[2];
extern unsigned short ad7705_buff[2][16],ad7705_buff_[2];
extern unsigned short Kibat0[2];
extern signed short Kibat1[2];
extern signed short Ktbat[2];

short adc_buff_out_[3];
extern char kb_full_ver;
extern signed short Kuload;

signed short bat_ver_cnt=150;
extern signed short Isumm;
extern signed short Isumm_;
extern char ND_out[3];



short plazma_adc_cnt;
short plazma_sk;
extern char cntrl_plazma;





signed char vent_stat=0;



signed short cntrl_stat_U=1000;
signed short cntrl_stat_I=1000;
signed short cntrl_stat_old=600;
signed short cntrl_stat_new;
signed short Ibmax;
unsigned char unh_cnt0,unh_cnt1,b1Hz_unh;
unsigned char	ch_cnt0,b1Hz_ch,i,iiii;
unsigned short IZMAX_;




signed short samokalibr_cnt;





signed short 	main_kb_cnt;
signed short 	kb_cnt_1lev;
signed short 	kb_cnt_2lev;
char 		kb_full_ver;
char kb_start[2];



char num_of_wrks_bps;
char bps_all_off_cnt,bps_mask_off_cnt,bps_mask_on_off_cnt;
char bps_hndl_2sec_cnt;
unsigned short bps_on_mask,bps_off_mask;
char num_necc_up,num_necc_down;
unsigned char sh_cnt0,b1Hz_sh,sh_cnt1;



enum_spc_stat spc_stat;
char spc_bat;
char spc_phase;
unsigned short vz_cnt_s,vz_cnt_s_,vz_cnt_h,vz_cnt_h_;
char bAVZ;
enum_ke_start_stat ke_start_stat;
short cnt_end_ke;
unsigned long ke_date[2];
short __ee_vz_cnt;
short __ee_spc_stat;
short __ee_spc_bat;
short __ee_spc_phase;



extern unsigned avar_stat;	 	
extern unsigned avar_ind_stat; 	
extern unsigned avar_stat_old;
extern unsigned avar_stat_new,avar_stat_offed;









short cntrl_stat_blok_cnt,cntrl_stat_blok_cnt_,cntrl_stat_blok_cnt_plus[2],cntrl_stat_blok_cnt_minus[2];



const char sk_buff_KONTUR[4]={13,11,15,14};
const char sk_buff_RSTKM[4]={13,11,15,14};
const char sk_buff_GLONASS[4]={11,13,15,14};
const char sk_buff_3U[4]={11,13,15,14};
const char sk_buff_6U[4]={11,13,15,14};
const char sk_buff_220[4]={11,13,15,14};

char	plazma_inv[4];
char plazma_bat;



char bFAST_REG;
char bU_VALID;
char bU_VALID_VALID;
char bPRECESSION_REG;


signed short cnt_volt_contr;
signed short cnt_rel_volt_umin;
signed short cnt_rel_volt_umax;

char bVOLT_IS_NOT_DOWN;
char bVOLT_IS_NOT_UP;
char bVOLT_IS_NORM;

enum_rele_stat rele_stat[2];



signed char net_in_drv_cnt_B,net_in_drv_cnt_C;
char net_in_drv_stat_B, net_in_drv_stat_C;

signed long temp_temp_SL;



signed short RELE_FUNC[2];
char rele_ext_cntrl[2];


void kb_init(void)
{
main_kb_cnt=(TBAT*60)-60 ;
}







void samokalibr_init(void)
{
samokalibr_cnt=1785;
}

void samokalibr_hndl(void)
{
if(++samokalibr_cnt>=1800)samokalibr_cnt=0;

if(samokalibr_cnt>=1785U)
	{
	mess_send(210,100,1,15);
	mess_send(215,216,0,15);
	mess_send(220,216,0,15);
	} 

if(samokalibr_cnt==1799U)
	{
	if(Kiload0!=ad7705_buff_[0]) lc640_write_int(0x10+4,ad7705_buff_[0]);
	}	 	
}











 


void unet_drv(void)
{
if((adc_buff_[5]>3500)||(adc_buff_[10]>3500))
	{
	if(unet_drv_cnt<20)unet_drv_cnt++;
	}
else if(unet_drv_cnt)unet_drv_cnt--;

gran(&unet_drv_cnt,0,20);
}


void matemat(void)
{

signed long temp_SL ;
char  i;


temp_SL=(signed long)adc_buff_[0];
temp_SL*=Kuload;
temp_SL/=500L;
load_U=(signed short)temp_SL;

temp_SL=(signed long)adc_buff__[0];
temp_SL*=Kuload;
temp_SL/=500L;
load_U_=(signed short)temp_SL;


temp_SL=(signed long)ad7705_buff_[0];
temp_SL-=(signed long)Kiload0;
temp_SL*=(signed long)Kiload1;
temp_SL/=5000L;
load_I=(signed short)temp_SL;


temp_SL-=(signed long)Kiload0;
temp_SL*=(signed long)Kiload1;
temp_SL/=5000L;
load_I_=(signed short)temp_SL;

if(I_LOAD_MODE==0)
	{
	temp_SL=0;
	for(i=0;i<NUMIST;i++)
		{
		temp_SL+=bps[i]._Ii;
		}
	
	
	load_I=(signed short)temp_SL;
	load_I_=(signed short)temp_SL;
	}

if(load_I<0)load_I=0;


for(i=0;i<32;i++)
	{
	if(bps[i]._cnt<25)
	     {
	     bps[i]._Ii=bps[i]._buff[0]+(bps[i]._buff[1]*256);
	     bps[i]._Uin=bps[i]._buff[2]+(bps[i]._buff[3]*256);
	     bps[i]._Uii=bps[i]._buff[4]+(bps[i]._buff[5]*256);
	     bps[i]._Ti=(signed)(bps[i]._buff[6]);
	     bps[i]._adr_ee=bps[i]._buff[0];
	     bps[i]._flags_tm=bps[i]._buff[8];
		bps[i]._rotor=bps[i]._buff[10]+(bps[i]._buff[11]*256);    
	     } 
	else 
	     {
	     bps[i]._Uii=0; 
	     bps[i]._Ii=0;
	     bps[i]._Uin=0;
	     bps[i]._Ti=0;
	     bps[i]._flags_tm=0; 
		bps[i]._rotor=0;    
	     }
	}

I_MAX_IPS=I_MAX*NUMIST;
I_MIN_IPS=I_MIN*NUMIST;
}




void adc_init(void)
{

((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL1 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL1 & ~((0xffffffff>>(32-2))<<(25-16)*2)) | ((unsigned)1 << (25-16)*2) );
((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL1 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL1 & ~((0xffffffff>>(32-2))<<(24-16)*2)) | ((unsigned)1 << (24-16)*2) );
((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL1 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL1 & ~((0xffffffff>>(32-2))<<(23-16)*2)) | ((unsigned)1 << (23-16)*2) );


((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE1 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE1 & ~((0xffffffff>>(32-2))<<(25-16)*2)) | ((unsigned)2 << (25-16)*2) );
((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE1 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE1 & ~((0xffffffff>>(32-2))<<(24-16)*2)) | ((unsigned)2 << (24-16)*2) );
((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE1 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINMODE1 & ~((0xffffffff>>(32-2))<<(23-16)*2)) | ((unsigned)2 << (23-16)*2) );

((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-3))<<24)) | ((unsigned)0 << 24) );

((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-1))<<21)) | ((unsigned)1 << 21) );
((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-1))<<16)) | ((unsigned)0 << 16) );
((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-8))<<8)) | ((unsigned)1 << 8) );



	
	 
     
 

((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADINTEN     =  (1<< 8);       

NVIC_EnableIRQ(ADC_IRQn);              


}


void net_in_drv(void)
{
if(adc_buff_[10]<3500)
	{
	if(net_in_drv_cnt_B	< 20)
		{
		net_in_drv_cnt_B++;
		}
	else if(net_in_drv_cnt_B>20)net_in_drv_cnt_B=0; 
	}
else
	{
	if(net_in_drv_cnt_B)
		{
		net_in_drv_cnt_B--;
		}
	}			 
if(net_in_drv_cnt_B>=19) 
	{
	net_in_drv_stat_B=1;
	gp_av_stat&=~0x00000001;
	}
else if(net_in_drv_cnt_B<=2) 
	{
	net_in_drv_stat_B=0;
	gp_av_stat|=0x00000001;
		
	}

if(adc_buff_[5]<3500)
	{
	if(net_in_drv_cnt_C	< 20)
		{
		net_in_drv_cnt_C++;
		}
	else if(net_in_drv_cnt_C>20)net_in_drv_cnt_C=0; 
	}
else
	{
	if(net_in_drv_cnt_C)
		{
		net_in_drv_cnt_C--;
		}
	}			 
if(net_in_drv_cnt_C>=19) 
	{
	net_in_drv_stat_C=1;
	gp_av_stat&=~0x00000002;
	}
else if(net_in_drv_cnt_C<=2) 
	{
	net_in_drv_stat_C=0;
	gp_av_stat|=0x00000002;
	}
}	   


void adc_drv7(void) 
{




adc_self_ch_disp[0]=abs_pal(adc_self_ch_buff[1]-adc_self_ch_buff[0]);
adc_self_ch_disp[1]=abs_pal(adc_self_ch_buff[2]-adc_self_ch_buff[1]);
adc_self_ch_disp[2]=abs_pal(adc_self_ch_buff[2]-adc_self_ch_buff[0]);






if(adc_self_ch_disp[2]<300)
	{
	adc_result=adc_self_ch_buff[2];
	} 
else if(adc_self_ch_disp[1]<300)
	{
	adc_result=adc_self_ch_buff[1];
	}
else if(adc_self_ch_disp[0]<300)
	{
	adc_result=adc_self_ch_buff[0];
	}
    

if(adc_ch_net)
	{

	main_power_buffer[0]+=(long)(adc_result);
	main_power_buffer[1]+=(long)(adc_result);
	main_power_buffer[2]+=(long)(adc_result);
	main_power_buffer[3]+=(long)(adc_result);

	adc_net_buff_cnt++;
	if(adc_net_buff_cnt>=0x1000)
		{
		adc_net_buff_cnt=0;
		}
	if((adc_net_buff_cnt&0x03ff)==0)
		{



		net_buff_=(short)((main_power_buffer[adc_net_buff_cnt>>10])>>8);

		main_power_buffer[adc_net_buff_cnt>>10]=0;
		}


	} 
else if(!adc_ch_net)
	{
	adc_buff[adc_ch][adc_ch_cnt]=(long)adc_result;
	
	if((adc_ch_cnt&0x03)==0)
		{
		long temp_L;
		char i;
		temp_L=0;
		for(i=0;i<32;i++)
			{
			temp_L+=adc_buff[adc_ch][i];
			}
		adc_buff_[adc_ch]= (short)(temp_L>>5);
		adc_buff__[adc_ch]= adc_buff[adc_ch][adc_ch_cnt];
		
		}
	if(++adc_ch>=16) 
		{
		adc_ch=0;
		adc_ch_cnt++;
		if(adc_ch_cnt>=32)adc_ch_cnt=0;
		}
	}

  

adc_self_ch_cnt=0;

adc_ch_net++;
adc_ch_net&=1;




if(adc_ch_net)
	{
	
	
	((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-8))<<0)) | ((unsigned)1<<2 << 0) );
	}
else
	{
	
	
	if(!(adc_ch&(1<<3)))((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-8))<<0)) | ((unsigned)1<<0 << 0) );
	else 			((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-8))<<0)) | ((unsigned)1<<1 << 0) );


	((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR & ~((0xffffffff>>(32-1))<<28)) | ((unsigned)1 << 28) );
	((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIODIR & ~((0xffffffff>>(32-1))<<30)) | ((unsigned)1 << 30) );
	((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIODIR & ~((0xffffffff>>(32-1))<<26)) | ((unsigned)1 << 26) );

	if(!(adc_ch&(1<<0)))((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<28)) | ((unsigned)0 << 28) );
	else 			((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<28)) | ((unsigned)1 << 28) );

	if(!(adc_ch&(1<<1)))((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN & ~((0xffffffff>>(32-1))<<30)) | ((unsigned)0 << 30) );
	else 			((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN & ~((0xffffffff>>(32-1))<<30)) | ((unsigned)1 << 30) );

	if(!(adc_ch&(1<<2)))((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIOPIN & ~((0xffffffff>>(32-1))<<26)) | ((unsigned)0 << 26) );
	else 			((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIOPIN & ~((0xffffffff>>(32-1))<<26)) | ((unsigned)1 << 26) );
	}
	



((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR |=  (1<<24);

}


void avg_hndl(void)
{ 
char i;




if(avg_main_cnt)
	{
	avg_main_cnt--;
	goto avg_hndl_end;
	}                 

avg_main_cnt=10;

avg_num=0;
num_of_dumm_src=100;
num_of_max_src=100;

for(i=0;i<NUMIST;i++)
	{
	if( (bps[i]._cnt<20))avg_num++;
	}



 

	
if(avg_num<2)
	{
	goto avg_hndl_end;
	
	}
	
else if(bU_VALID_VALID)
	{
	i_avg_min=5000;
	i_avg_max=0;
	i_avg_summ=0;
	for(i=0;i<NUMIST;i++)
		{
		if(bps[i]._state==bsWRK)
			{
			if(bps[i]._Ii>i_avg_max)
				{
				i_avg_max=bps[i]._Ii;
				num_of_max_src=i;
				}
			if(bps[i]._Ii<i_avg_min)
				{
				i_avg_min=bps[i]._Ii;
				num_of_dumm_src=i;
				}
			
			i_avg_summ+=bps[i]._Ii;
			}
		}
	i_avg=i_avg_summ/avg_num;	
	
	if(i_avg_min==0)i_avg_min=1;

	

	avg=i_avg_max;
	avg*=100;
	avg/=i_avg_min;
	
	if(avg>160) bAVG=1;
	if(avg<120) bAVG=0;

	if(bAVG==1)
		{
		
			
		
				
				
				 
				if(bAVG_CNT==0)
					{
					bAVG_CNT=1;
					if(num_of_dumm_src<NUMIST) bps[num_of_dumm_src]._xu_++;
					}
				else
					{
					bAVG_CNT=0;
					if(num_of_max_src<NUMIST) bps[num_of_max_src]._xu_--;
					}
			
				if(bps[i]._xu_<-50)bps[i]._xu_=-50;
				if(bps[i]._xu_>50)bps[i]._xu_=50;	
			
			
		}			
	}   	 


avg_hndl_end:
__nop();  
}


void adc_drv6(void) 
{




adc_self_ch_disp[0]=abs_pal(adc_self_ch_buff[1]-adc_self_ch_buff[0]);
adc_self_ch_disp[1]=abs_pal(adc_self_ch_buff[2]-adc_self_ch_buff[1]);
adc_self_ch_disp[2]=abs_pal(adc_self_ch_buff[2]-adc_self_ch_buff[0]);






if(adc_self_ch_disp[2]<300)
	{
	adc_result=adc_self_ch_buff[2];
	} 
else if(adc_self_ch_disp[1]<300)
	{
	adc_result=adc_self_ch_buff[1];
	}
else if(adc_self_ch_disp[0]<300)
	{
	adc_result=adc_self_ch_buff[0];
	}
    

if(adc_ch_net)
	{

	if(adc_window_flag)
		{
		main_power_buffer[0]+=(long)(adc_result>>2);
		main_power_buffer[1]+=(long)(adc_result>>2);
		main_power_buffer[2]+=(long)(adc_result>>2);
		main_power_buffer[3]+=(long)(adc_result>>2);
		}







	if(adc_result<100)
		{
		adc_zero_cnt++;
		}
	else adc_zero_cnt=0;

	if(adc_zero_cnt>=2000)
		{
		adc_zero_cnt=2000;
		main_power_buffer[0]=0;
		main_power_buffer[1]=0;
		main_power_buffer[2]=0;
		main_power_buffer[3]=0;
		net_buff_=0;
		}

	if(adc_zero_cnt==5)
		{
		
		if(adc_window_flag)
			{
			adc_gorb_cnt++;
			if(adc_gorb_cnt>=512)
				{
				adc_gorb_cnt=0;
				
				
			   	}

			if((adc_gorb_cnt&0x007f)==0)
				{
				net_buff_=main_power_buffer[adc_gorb_cnt>>7]>>8;
				main_power_buffer[adc_gorb_cnt>>7]=0;
				}
			}

		
		

		if((adc_window_cnt>150)&&(adc_window_flag))
			{
			adc_window_flag=0;

			
			}
		if((adc_window_cnt>30)&&(adc_window_cnt<70)&&(!adc_window_flag))
			{
			adc_window_flag=1;

			
			
			}
		}
	} 
else if(!adc_ch_net)
	{
	adc_buff[adc_ch][adc_ch_cnt]=(long)adc_result;
	
	if((adc_ch_cnt&0x03)==0)
		{
		long temp_L;
		char i;
		temp_L=0;
		for(i=0;i<16;i++)
			{
			temp_L+=adc_buff[adc_ch][i];
			}
		adc_buff_[adc_ch]= (short)(temp_L>>4);

		
		}
	if(++adc_ch>=16) 
		{
		adc_ch=0;
		adc_ch_cnt++;
		if(adc_ch_cnt>=16)adc_ch_cnt=0;
		}
	}
















 


		  

adc_self_ch_cnt=0;

adc_ch_net++;
adc_ch_net&=1;




if(adc_ch_net)
	{
	
	
	((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-8))<<0)) | ((unsigned)1<<2 << 0) );
	}
else
	{
	
	
	if(!(adc_ch&(1<<3)))((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-8))<<0)) | ((unsigned)1<<0 << 0) );
	else 			((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR = ( (((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR & ~((0xffffffff>>(32-8))<<0)) | ((unsigned)1<<1 << 0) );


	((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR & ~((0xffffffff>>(32-1))<<28)) | ((unsigned)1 << 28) );
	((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIODIR & ~((0xffffffff>>(32-1))<<30)) | ((unsigned)1 << 30) );
	((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIODIR & ~((0xffffffff>>(32-1))<<26)) | ((unsigned)1 << 26) );

	if(!(adc_ch&(1<<0)))((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<28)) | ((unsigned)0 << 28) );
	else 			((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<28)) | ((unsigned)1 << 28) );

	if(!(adc_ch&(1<<1)))((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN & ~((0xffffffff>>(32-1))<<30)) | ((unsigned)0 << 30) );
	else 			((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00020) )->FIOPIN & ~((0xffffffff>>(32-1))<<30)) | ((unsigned)1 << 30) );

	if(!(adc_ch&(1<<2)))((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIOPIN & ~((0xffffffff>>(32-1))<<26)) | ((unsigned)0 << 26) );
	else 			((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00060) )->FIOPIN & ~((0xffffffff>>(32-1))<<26)) | ((unsigned)1 << 26) );
	}
	



((LPC_ADC_TypeDef *) ((0x40000000UL) + 0x34000) )->ADCR |=  (1<<24);

}
 































































 















 



void ach_off_hndl(void)
{

if((work_stat!=wsOFF)&&(ACH_OFF_EN))
	{
	milliAmperSecunda+=((long)load_I);
	if(milliAmperSecunda>=3600L)
		{
		milliAmperSecunda-=3600L;
		AMPERCHAS+=1;
		lc640_write_long(3000+100,AMPERCHAS);

		if(AMPERCHAS>=ACH_OFF_LEVEL)
			{
			work_stat=wsOFF;
			restart_off();
			tree_up(iProcIsComplete,1,0,0);
			ret(0);
			}
		}
	}
else 
	{
	milliAmperSecunda=0;
	}

}
 	


void curr_off_hndl(void)
{

if((work_stat!=wsOFF)&&(CURR_OFF_EN))
	{
	if(curr_off_start_cnt<CUR_OFF_T_OFF)curr_off_start_cnt++;
	else
		{
		signed int temp_I=0;
		if(work_stat==wsGS)
			{
			temp_I=(signed int)I_ug_temp;
			}
		else if(work_stat==wsPS)
			{
			temp_I=(signed int)I_maxp;
			}
		temp_I*=(signed int)CUR_OFF_LEVEL_RELATIV;
		temp_I/=100;
		curr_off_temp=(short)temp_I;
		if(load_I<curr_off_temp)
			{
			curr_off_stop_cnt++;
			if(curr_off_stop_cnt>=CUR_OFF_T_ON)
				{
				work_stat=wsOFF;
				restart_off();
				tree_up(iProcIsComplete,2,0,0);
				ret(0);
				}
			}
		else curr_off_stop_cnt=0;
		}
	}
else 
	{
	curr_off_start_cnt=0;
	curr_off_stop_cnt=0;
	}
}	


void time_hndl(void)  
{
if((REV_IS_ON)&&(AVT_REV_IS_ON))
	{

	}




if(work_stat==wsGS)
	{
	time_proc++;
	if(((time_proc%600L)==0)&&(restart_enable==reON))
		{
		lc640_write_long(0x10+100+92,time_proc);
		}
	if(time_proc_remain)
		{
		time_proc_remain--;
		}
	if((!time_proc_remain)&&(!T_PROC_GS_MODE))
		{
		work_stat=wsOFF;
		restart_off();
		tree_up(iProcIsComplete,0,0,0);
		ret(0);
		}
	if((REV_IS_ON)&&(AVT_REV_IS_ON)){
		time_proc_phase++;
		
		if(proc_phase==ppFF) {
			REV_STAT=rsFF;
			if(time_proc_phase>=AVT_REV_TIME_FF) {
				proc_phase=ppFF_P_REW;	
				time_proc_phase=0;
			}
		} else if(proc_phase==ppFF_P_REW) {
			if(time_proc_phase<AVT_REV_TIME_PAUSE)REV_STAT=rsFF;
			else REV_STAT=rsREW;
			if(time_proc_phase>=AVT_REV_TIME_PAUSE) {
				proc_phase=ppREW;	
				time_proc_phase=0;
			}
		} else if(proc_phase==ppREW) {
			REV_STAT=rsREW;
			if(time_proc_phase>=AVT_REV_TIME_REW) {
				proc_phase=ppREW_P_FF;	
				time_proc_phase=0;
			}
		} else if(proc_phase==ppREW_P_FF) {
			if(time_proc_phase<AVT_REV_TIME_PAUSE)REV_STAT=rsREW;
			else REV_STAT=rsFF;
			if(time_proc_phase>=AVT_REV_TIME_PAUSE) {
				proc_phase=ppFF;	
				time_proc_phase=0;
			}
		}
	}
	}


if(work_stat==wsPS)
	{
	time_proc++;
	if(((time_proc%600L)==0)&&(restart_enable==reON))
		{
		lc640_write_long(0x10+100+96,time_proc);
		}
	if(time_proc_remain)
		{
		time_proc_remain--;
		}
	if((!time_proc_remain)&&(!T_PROC_PS_MODE))
		{
		work_stat=wsOFF;
		restart_off();
		tree_up(iProcIsComplete,0,0,0);
		ret(0);
		}
	if((REV_IS_ON)&&(AVT_REV_IS_ON)){
		time_proc_phase++;
		
		if(proc_phase==ppFF) {
			REV_STAT=rsFF;
			if(time_proc_phase>=AVT_REV_TIME_FF) {
				proc_phase=ppFF_P_REW;	
				time_proc_phase=0;
			}
		} else if(proc_phase==ppFF_P_REW) {
			if(time_proc_phase<AVT_REV_TIME_PAUSE)REV_STAT=rsFF;
			else REV_STAT=rsREW;
			if(time_proc_phase>=AVT_REV_TIME_PAUSE) {
				proc_phase=ppREW;	
				time_proc_phase=0;
			}
		} else if(proc_phase==ppREW) {
			REV_STAT=rsREW;
			if(time_proc_phase>=AVT_REV_TIME_REW) {
				proc_phase=ppREW_P_FF;	
				time_proc_phase=0;
			}
		} else if(proc_phase==ppREW_P_FF) {
			if(time_proc_phase<AVT_REV_TIME_PAUSE)REV_STAT=rsREW;
			else REV_STAT=rsFF;
			if(time_proc_phase>=AVT_REV_TIME_PAUSE) {
				proc_phase=ppFF;	
				time_proc_phase=0;
			}
		}
	}
	}



}


void cap_time_hndl(void)  
{

if(work_stat==wsCAP)
	{
	cap_time_proc++;
	if(cap_time_proc>=(CAP_ZAR_TIME+CAP_PAUSE1_TIME+CAP_RAZR_TIME+CAP_PAUSE2_TIME))
		{
		cap_time_proc=0;
		CAP_COUNTER++;
		}

	if(cap_time_proc>=CAP_ZAR_TIME)bOFF=1;
	else bOFF=0;

	if((cap_time_proc>=(CAP_ZAR_TIME+CAP_PAUSE1_TIME))&&(cap_time_proc<(CAP_ZAR_TIME+CAP_PAUSE1_TIME+CAP_RAZR_TIME)))bRAZR=1;
	else bRAZR=0;


	CAP_TIME_SEC++;
	if(CAP_TIME_SEC>=600)
		{
		CAP_TIME_SEC=0;
		
		CAP_TIME_MIN++;
		if(CAP_TIME_MIN>=60)
			{
			CAP_TIME_MIN=0;
	
			CAP_TIME_HOUR++;
			if(CAP_TIME_HOUR>=24)
				{
				CAP_TIME_HOUR=0;
				}
			}
		}
	}

}



void restart_on_GS(void)
{
lc640_write_long(0x10+100+92,1);
}


void restart_on_PS(void)
{
lc640_write_long(0x10+100+96,1);
}


void restart_off(void)
{
lc640_write_long(0x10+100+92,0);
lc640_write_long(0x10+100+96,0);
}


void start_GS(void) {

	if(SK_START==2)
		{
		if(SK_START_LEV)
			{
			if(sk_in_drv_stat==1)
				{
				return;
				}
			}
		if(!SK_START_LEV)
			{
			if(sk_in_drv_stat==-1)
				{
				return;
				}
			}
		}

	work_stat=wsGS;
	time_proc=0;
	time_proc_remain=T_PROC_GS;
	
	restart_on_GS();
	bFAST_REG=1;
	bU_VALID=0;
	bU_VALID_VALID=0;
	
	if((REV_IS_ON)&&(AVT_REV_IS_ON)){
		time_proc_phase=0;
		proc_phase=ppFF;
		REV_STAT=rsFF;	
	}

	milliAmperSecunda=0L;
	AMPERCHAS=0L;
	lc640_write_long(3000+100,AMPERCHAS);
}



void start_PS(void) {

	if(SK_START==2)
		{
		if(SK_START_LEV)
			{
			if(sk_in_drv_stat==1)
				{
				return;
				}
			}
		if(!SK_START_LEV)
			{
			if(sk_in_drv_stat==-1)
				{
				return;
				}
			}
		}

	work_stat=wsPS;
	time_proc=0;
	time_proc_remain=T_PROC_PS;
	
	restart_on_PS();
	bFAST_REG=1;
	bU_VALID=0;
	bU_VALID_VALID=0;
	
	if((REV_IS_ON)&&(AVT_REV_IS_ON)){
		time_proc_phase=0;
		proc_phase=ppFF;
		REV_STAT=rsFF;	
	}
	milliAmperSecunda=0L;
	AMPERCHAS=0L;
	lc640_write_long(3000+100,AMPERCHAS);
}


void start_CAP(void) {
	work_stat=wsCAP;
}


void pause_CAP(void) {
	work_stat=wsOFF;
}


void stop_CAP(void) {
	work_stat=wsOFF;

}


void ramModbusCnt_hndl(void)  
{
if(ramModbusCnt) ramModbusCnt--;
else 
	{
	I_ug_ram=0;
	U_up_ram=0;
	}	
}


void reset_CAP(void) {
	work_stat=wsOFF;
	cap_time_proc=0;
	CAP_COUNTER=0;
	CAP_TIME_SEC=0;
	CAP_TIME_MIN=0;
	CAP_TIME_HOUR=0;
}


void stop_proc(void)
{
work_stat=wsOFF;
restart_off();
}


short find_U_curve(signed short in)
{
short ii,i=0,out=0;

ii=0;

if(lc640_read_int(500+(ii*2)) >= in)
	{
	out=0;
	}
else 
	{
	for (ii=0;ii<=200;ii+=10)
		{
		if(lc640_read_int(500+(ii*2)) <= in)
			{
			i=ii;
			}
		else continue;
		}
	if(i<200)
		{
		for (ii=i;ii<i+10;ii++)
			{
			if(lc640_read_int(500+(ii*2)) <= in)
				{
				out=ii;
				}
			else continue;
			}
		}
	else 
		{
		for (ii=200;ii<=202;ii++)
			{
			if(lc640_read_int(500+(ii*2)) <= in)
				{
				out=ii;
				}
			else continue;
			}
	
	
		}
	}

return out;
}


short find_I_curve(signed short in)
{
short ii,i=0,out=0;

ii=0;

if(lc640_read_int(1000+(ii*2)) >= in)
	{
	out=0;
	}
else 
	{
	for (ii=0;ii<=200;ii+=10)
		{
		if(lc640_read_int(1000+(ii*2)) <= in)
			{
			i=ii;
			}
		else continue;
		}
	
	if(i<200)
		{
		for (ii=i;ii<i+10;ii++)
			{
			if(lc640_read_int(1000+(ii*2)) <= in)
				{
				out=ii;
				}
			else continue;
			}
		}
	else 
		{
		for (ii=200;ii<=202;ii++)
			{
			if(lc640_read_int(1000+(ii*2)) <= in)
				{
				out=ii;
				}
			else continue;
			}
		}
	}
return out;
}



void viz_hndl(void)
{
if(a_ind . i==iK_viz_u)
	{
	if(viz_stat==vsON)
		{
		viz_stat_cnt++;
		if(viz_stat_cnt>=10221)
			{
			viz_stat=vsOFF;
			lc640_write_int(0x10+100+56,0xabcd);
			
			tree_down(0,0);
			}
		tst_pwm_i=1022;
		tst_pwm_u=(viz_stat_cnt/50)*5;
		if(viz_stat_cnt%50==49)
			{
			lc640_write_int(500+((viz_stat_cnt/50)*2),load_U);
			}
		}
	}

if(a_ind . i==iK_viz_i)
	{
	if(viz_stat==vsON)
		{
		viz_stat_cnt++;
		if(viz_stat_cnt>=10221)
			{
			viz_stat=vsOFF;
			lc640_write_int(0x10+100+58,0xabcd);
			
			tree_down(0,0);
			}
		tst_pwm_u=1022;
		tst_pwm_i=(viz_stat_cnt/50)*5;
		if(viz_stat_cnt%50==49)
			{
			lc640_write_int(1000+((viz_stat_cnt/50)*2),load_I);
			}
		}
	}
}




void bps_hndl(void)  
{
char  i;

if((REV_IS_ON)&&(AVT_REV_IS_ON)) {
	if(work_stat==wsGS) {
		if(REV_STAT==rsFF) 	I_ug_temp=AVT_REV_I_NOM_FF;
		else if (REV_STAT==rsREW) I_ug_temp=AVT_REV_I_NOM_REW;
	} else if (work_stat==wsPS) {
		if(REV_STAT==rsFF) 	U_up_temp=AVT_REV_U_NOM_FF;
		else if (REV_STAT==rsREW) U_up_temp=AVT_REV_U_NOM_REW;
	} else {
		U_up_temp=AVT_REV_U_NOM_FF;
		I_ug_temp=AVT_REV_I_NOM_FF;
	}
} else {

if(fiks_stat_I==2)I_ug_temp=I_ug3;
else if(fiks_stat_I==1)I_ug_temp=I_ug2;
else I_ug_temp=I_ug;

if(fiks_stat_U==2)U_up_temp=U_up3;
	else if(fiks_stat_U==1)U_up_temp=U_up2;
	else U_up_temp=U_up;

}
	
gran(&I_ug_temp,0 ,I_MAX_IPS);
gran(&U_up_temp,0 ,U_MAX);

if(sh_cnt0<10) {
	sh_cnt0++;
	if(sh_cnt0>=10) {
		sh_cnt0=0;
		b1Hz_sh=1;
		if(sh_cnt1<5) {
			sh_cnt1++;
			if(sh_cnt1>=5) {
			 	sh_cnt1=0;
				bPRECESSION_REG=1;
			}
		}
	}
}

if(a_ind . i==iK_load)
	{
	if(a_ind . s_i==0)		 
		{
		cntrl_stat_U=1022;
		cntrl_stat_I=1022;
		bps_stat=stON;

		for(i=0;i<NUMIST;i++)
			{
			bps[i]._vol_u=1022;
			bps[i]._vol_i=1022;
			bps[i]._flags_tu=0;
			}
		}
	else if(a_ind . s_i==1)
		{
		if(phase==0)
			{
  			cntrl_stat_U=0;
			cntrl_stat_I=0;
			bps_stat=stOFF;

			for(i=0;i<NUMIST;i++)
				{
				bps[i]._vol_u=0;
				bps[i]._vol_i=0;
				bps[i]._flags_tu=1;
				}
			}
		else if(phase==1)
			{
  			cntrl_stat_U=1022;
			cntrl_stat_I=1022;
			bps_stat=stON;

			for(i=0;i<NUMIST;i++)
				{
				bps[i]._vol_u=1022;
				bps[i]._vol_i=1022;
				bps[i]._flags_tu=0;
				}
			}
		}
	else 
		{
		bps_stat=stOFF;

		bps[0]._vol_u=0;
		bps[0]._vol_i=0;
		bps[0]._flags_tu=1;
		}
	}
else if((a_ind . i==iK_bps)||(a_ind . i==iK_bps_v2))
	{
	if((a_ind . s_i==0)||(a_ind . s_i==3))
		{
		cntrl_stat_U=1022;
		cntrl_stat_I=1022;
		bps_stat=stON;

		bps[0]._vol_u=0;
		bps[0]._vol_i=0;
		bps[0]._flags_tu=1;

		bps[1]._vol_u=0;
		bps[1]._vol_i=0;
		bps[1]._flags_tu=1;

		bps[1]._vol_u=0;
		bps[1]._vol_i=0;
		bps[1]._flags_tu=1;

		bps[2]._vol_u=0;
		bps[2]._vol_i=0;
		bps[2]._flags_tu=1;

		bps[3]._vol_u=0;
		bps[3]._vol_i=0;
		bps[3]._flags_tu=1;

		bps[4]._vol_u=0;
		bps[4]._vol_i=0;
		bps[4]._flags_tu=1;

		bps[5]._vol_u=0;
		bps[5]._vol_i=0;
		bps[5]._flags_tu=1;

		bps[6]._vol_u=0;
		bps[6]._vol_i=0;
		bps[6]._flags_tu=1;

		bps[7]._vol_u=0;
		bps[7]._vol_i=0;
		bps[7]._flags_tu=1;

		bps[8]._vol_u=0;
		bps[8]._vol_i=0;
		bps[8]._flags_tu=1;
		
		bps[9]._vol_u=0;
		bps[9]._vol_i=0;
		bps[9]._flags_tu=1;

		bps[10]._vol_u=0;
		bps[10]._vol_i=0;
		bps[10]._flags_tu=1;

		bps[11]._vol_u=0;
		bps[11]._vol_i=0;
		bps[11]._flags_tu=1;
 		
		bps[a_ind . s_i1]._vol_u=1022;
		bps[a_ind . s_i1]._vol_i=1022;
		bps[a_ind . s_i1]._flags_tu=0;
		}

	else if(a_ind . s_i==6)
		{
		if(phase==0)
			{
  			cntrl_stat_U=0;
			cntrl_stat_I=0;
			bps_stat=stOFF;
			bps[0]._vol_u=0;
			bps[0]._vol_i=0;
			bps[0]._flags_tu=1;
	
			bps[1]._vol_u=0;
			bps[1]._vol_i=0;
			bps[1]._flags_tu=1;
	
			bps[1]._vol_u=0;
			bps[1]._vol_i=0;
			bps[1]._flags_tu=1;
	
			bps[2]._vol_u=0;
			bps[2]._vol_i=0;
			bps[2]._flags_tu=1;
	
			bps[3]._vol_u=0;
			bps[3]._vol_i=0;
			bps[3]._flags_tu=1;
	
			bps[4]._vol_u=0;
			bps[4]._vol_i=0;
			bps[4]._flags_tu=1;
	
			bps[5]._vol_u=0;
			bps[5]._vol_i=0;
			bps[5]._flags_tu=1;
	
			bps[6]._vol_u=0;
			bps[6]._vol_i=0;
			bps[6]._flags_tu=1;
	
			bps[7]._vol_u=0;
			bps[7]._vol_i=0;
			bps[7]._flags_tu=1;
	
			bps[8]._vol_u=0;
			bps[8]._vol_i=0;
			bps[8]._flags_tu=1;
			
			bps[9]._vol_u=0;
			bps[9]._vol_i=0;
			bps[9]._flags_tu=1;
	
			bps[10]._vol_u=0;
			bps[10]._vol_i=0;
			bps[10]._flags_tu=1;
	
			bps[11]._vol_u=0;
			bps[11]._vol_i=0;
			bps[11]._flags_tu=1;

			}
		else if(phase==1)
			{
  			cntrl_stat_U=1022;
			cntrl_stat_I=1022;
			bps_stat=stON;

			bps[0]._vol_u=0;
			bps[0]._vol_i=0;
			bps[0]._flags_tu=1;
	
			bps[1]._vol_u=0;
			bps[1]._vol_i=0;
			bps[1]._flags_tu=1;
	
			bps[1]._vol_u=0;
			bps[1]._vol_i=0;
			bps[1]._flags_tu=1;
	
			bps[2]._vol_u=0;
			bps[2]._vol_i=0;
			bps[2]._flags_tu=1;
	
			bps[3]._vol_u=0;
			bps[3]._vol_i=0;
			bps[3]._flags_tu=1;
	
			bps[4]._vol_u=0;
			bps[4]._vol_i=0;
			bps[4]._flags_tu=1;
	
			bps[5]._vol_u=0;
			bps[5]._vol_i=0;
			bps[5]._flags_tu=1;
	
			bps[6]._vol_u=0;
			bps[6]._vol_i=0;
			bps[6]._flags_tu=1;
	
			bps[7]._vol_u=0;
			bps[7]._vol_i=0;
			bps[7]._flags_tu=1;
	
			bps[8]._vol_u=0;
			bps[8]._vol_i=0;
			bps[8]._flags_tu=1;
			
			bps[9]._vol_u=0;
			bps[9]._vol_i=0;
			bps[9]._flags_tu=1;
	
			bps[10]._vol_u=0;
			bps[10]._vol_i=0;
			bps[10]._flags_tu=1;
	
			bps[11]._vol_u=0;
			bps[11]._vol_i=0;
			bps[11]._flags_tu=1;



			bps[a_ind . s_i1]._vol_u=1022;
			bps[a_ind . s_i1]._vol_i=1022;
			bps[a_ind . s_i1]._flags_tu=0;
			}
		}
	else 
		{
		bps_stat=stOFF;

		bps[0]._vol_u=0;
		bps[0]._vol_i=0;
		bps[0]._flags_tu=1;

		bps[1]._vol_u=0;
		bps[1]._vol_i=0;
		bps[1]._flags_tu=1;

		bps[1]._vol_u=0;
		bps[1]._vol_i=0;
		bps[1]._flags_tu=1;

		bps[2]._vol_u=0;
		bps[2]._vol_i=0;
		bps[2]._flags_tu=1;

		bps[3]._vol_u=0;
		bps[3]._vol_i=0;
		bps[3]._flags_tu=1;

		bps[4]._vol_u=0;
		bps[4]._vol_i=0;
		bps[4]._flags_tu=1;

		bps[5]._vol_u=0;
		bps[5]._vol_i=0;
		bps[5]._flags_tu=1;

		bps[6]._vol_u=0;
		bps[6]._vol_i=0;
		bps[6]._flags_tu=1;

		bps[7]._vol_u=0;
		bps[7]._vol_i=0;
		bps[7]._flags_tu=1;

		bps[8]._vol_u=0;
		bps[8]._vol_i=0;
		bps[8]._flags_tu=1;
		
		bps[9]._vol_u=0;
		bps[9]._vol_i=0;
		bps[9]._flags_tu=1;

		bps[10]._vol_u=0;
		bps[10]._vol_i=0;
		bps[10]._flags_tu=1;

		bps[11]._vol_u=0;
		bps[11]._vol_i=0;
		bps[11]._flags_tu=1;

		}
	}

else if(a_ind . i==iTst_pwm)
	{
	char i;

	for(i=0;i<NUMIST;i++)
		{
		bps[i]._vol_u=tst_pwm_u;
		bps[i]._vol_i=tst_pwm_i;
		bps[i]._flags_tu=0;
		}
	}

else if(a_ind . i==iK_viz_u)
	{
	char i;

	if(viz_stat!=vsON)
		{
		for(i=0;i<NUMIST;i++)
			{
			bps[i]._vol_u=1022;
			bps[i]._vol_i=1022;
			bps[i]._flags_tu=0;
			}
		}
	else 
		{
		for(i=0;i<NUMIST;i++)
			{
			bps[i]._vol_u=tst_pwm_u;
			bps[i]._vol_i=tst_pwm_i;
			bps[i]._flags_tu=0;
			}
		}
	}

else if(a_ind . i==iK_viz_i)
	{
	char i;

	if(viz_stat!=vsON)
		{
		for(i=0;i<NUMIST;i++)
			{
			bps[i]._vol_u=1022;
			bps[i]._vol_i=1022;
			bps[i]._flags_tu=0;
			}
		}
	else 
		{
		for(i=0;i<NUMIST;i++)
			{
			bps[i]._vol_u=tst_pwm_u;
			bps[i]._vol_i=tst_pwm_i;
			bps[i]._flags_tu=0;
			}
		}
	}

else if(work_stat==wsGS)
	{
	signed long temp_SL_U,temp_SL_I;
	
	if((CURR_FADE_IN) && (time_proc<CURR_FADE_IN))
		{
		signed long temp_SL_;
		
		temp_SL_=	(signed long)I_ug_temp;
		temp_SL_*= (signed long)time_proc;
		temp_SL_/= (signed long)CURR_FADE_IN;

		

		I_ug_temp= (signed short)temp_SL_;
		}	
	
	if(b1Hz_sh) {




		if(!((REV_IS_ON)&&(AVT_REV_IS_ON)&&((proc_phase==ppFF_P_REW)||(proc_phase==ppREW_P_FF)))) {
	 		if(load_I<I_ug_temp)_x_++;
   			else if(load_I>I_ug_temp)_x_--;
			
			gran(&_x_,-50,50); 

	 		if(load_U<U_maxg)_xu_++;
   			else if(load_U>U_maxg)_xu_--;
			
			gran(&_xu_,-50,50); 
		}
	}

	temp_SL_U=1022;
	temp_SL_U*=(signed long)U_maxg;
	temp_SL_U/=(signed long)U_MAX;

	temp_SL_I=1022;
	
	temp_SL_I*=(signed long)I_ug_temp;
	temp_SL_I/=(signed long)I_MAX_IPS;

	if(lc640_read_int(0x10+100+56)==0xabcd)
		{
		temp_SL_U=find_U_curve(U_maxg)*5;
		}
	 
	if(lc640_read_int(0x10+100+58)==0xabcd)
		{
		temp_SL_I=find_I_curve(I_ug_temp)*5;
		}

	for(i=0;i<NUMIST;i++)
		{
		if((REV_IS_ON)&&(AVT_REV_IS_ON)&&((proc_phase==ppFF_P_REW)||(proc_phase==ppREW_P_FF))) {
		 	bps[i]._vol_u=0;
			bps[i]._vol_i=0;
			bps[i]._flags_tu=1;
		} else {
			bps[i]._vol_u=(short)temp_SL_U + _xu_ ;
			if(bps[i]._vol_u<0)bps[i]._vol_u=0;
			if(bps[i]._vol_u>1022)bps[i]._vol_u=1022;
			bps[i]._vol_i=((short)temp_SL_I + _x_);
			if(bps[i]._vol_i<0)bps[i]._vol_i=0;
			if(bps[i]._vol_i>1022)bps[i]._vol_i=1022;
			bps[i]._flags_tu=0;
		}
	}

	}
else if(work_stat==wsPS)
	{
	signed long temp_SL_U,temp_SL_I;
	

 
	if(load_U_>5)bU_VALID=1;
	else bU_VALID=0;

	temp_SL_U=(long)U_up_temp/100L;
	if(temp_SL_U<=0)temp_SL_U=1;
	if((abs(load_U_-U_up_temp))<(signed short)temp_SL_U) bU_VALID_VALID=1;
	else bU_VALID_VALID=0;

 

	bFAST_REG=0;

	if(bU_VALID_VALID)
		{
		if(bPRECESSION_REG)
			{
			bPRECESSION_REG=0;
			if(load_U_<U_up_temp)_xu_++;
   			else if(load_U_>U_up_temp)_xu_--;
			gran(&_xu_,-50,50);
			}
		}
	else if((b1Hz_sh&&bU_VALID)||(bFAST_REG&&bU_VALID))
		{
	 	if(load_I<I_maxp)_x_++;
   		else if(load_I>I_maxp)_x_--;
		gran(&_x_,-50,50); 

	 	if(load_U_<U_up_temp)_xu_++;
   		else if(load_U_>U_up_temp)_xu_--;
		gran(&_xu_,-50,50); 

		}


	temp_SL_U=900;
	temp_SL_U*=(signed long)U_up_temp;
	temp_SL_U/=(signed long)U_MAX;
	temp_SL_U+=50;

	if(lc640_read_int(0x10+100+56)==0xabcd)
		{	
		temp_SL_U=find_U_curve(U_up_temp)*5;
		}
	
	 
	temp_SL_I=1022;
	
	temp_SL_I*=(signed long)I_maxp;
	temp_SL_I/=(signed long)I_MAX_IPS;

	if(lc640_read_int(0x10+100+58)==0xabcd)
		{
		temp_SL_I=find_I_curve(I_maxp)*5;
		}

	for(i=0;i<NUMIST;i++) {

		if((REV_IS_ON)&&(AVT_REV_IS_ON)&&((proc_phase==ppFF_P_REW)||(proc_phase==ppREW_P_FF))) {
		 	bps[i]._vol_u=0;
			bps[i]._vol_i=0;
			bps[i]._flags_tu=1;
		} else {
			bps[i]._vol_u=(short)temp_SL_U + _xu_+bps[i]._xu_;
			if(bps[i]._vol_u<0)bps[i]._vol_u=0;
			if(bps[i]._vol_u>1022)bps[i]._vol_u=1022;
			bps[i]._vol_i=((short)temp_SL_I + _x_);
			if(bps[i]._vol_i<0)bps[i]._vol_i=0;
			if(bps[i]._vol_i>1022)bps[i]._vol_i=1022;
			bps[i]._flags_tu=0;
		}
	}







 
	
	plazma_vol_u_0=temp_SL_U;
	plazma_vol_u_1=bps[0]._vol_u;
	}

else if(work_stat==wsCAP)
	{
	signed long temp_SL_U=0,temp_SL_I=0;






	if(b1Hz_sh) {
		if(!bOFF) {
	 		if(load_I<(CAP_WRK_CURR*10))_x_++;
   			else if(load_I>(CAP_WRK_CURR*10))_x_--;
			gran(&_x_,-temp_SL_I,1022-temp_SL_I);
			gran(&_x_,-50,50); 

	 		if(load_U<(CAP_MAX_VOLT*10))_xu_++;
   			else if(load_U>(CAP_MAX_VOLT*10))_xu_--;
			gran(&_x_,-temp_SL_U,1022-temp_SL_U);
			gran(&_xu_,-50,50); 
		}
	}

	temp_SL_U=10220L;
	temp_SL_U*=(signed long)CAP_MAX_VOLT;
	temp_SL_U/=(signed long)U_MAX;

	temp_SL_I=10220L;
	
	temp_SL_I*=(signed long)CAP_WRK_CURR;
	temp_SL_I/=(signed long)I_MAX_IPS;

	if(lc640_read_int(0x10+100+56)==0xabcd)
		{
		temp_SL_U=find_U_curve(CAP_MAX_VOLT*10)*5;
		}
	 
	if(lc640_read_int(0x10+100+58)==0xabcd)
		{
		temp_SL_I=find_I_curve(CAP_WRK_CURR*10)*5;
		} 



	for(i=0;i<NUMIST;i++)
		{
		if(bOFF) {
		 	bps[i]._vol_u=0;
			bps[i]._vol_i=0;
			bps[i]._flags_tu=1;
		} else {
			bps[i]._vol_u=(short)temp_SL_U + _xu_;
			if(bps[i]._vol_u<0)bps[i]._vol_u=0;
			if(bps[i]._vol_u>1022)bps[i]._vol_u=1022;
			bps[i]._vol_i=((short)temp_SL_I + _x_);
			if(bps[i]._vol_i<0)bps[i]._vol_i=0;
			if(bps[i]._vol_i>1022)bps[i]._vol_i=1022;
			bps[i]._flags_tu=0;
		}
	}

	}
else 
	{
	bps_stat=stOFF;

	for(i=0;i<NUMIST;i++)
		{
		bps[i]._vol_u=0;
		bps[i]._vol_i=0;
		bps[i]._flags_tu=1;
		}
	_x_=0;
	_xu_=0;
	}




if(pwm_t_reg)
	{
	if(--pwm_t_reg==0)
		{
		pwm_u_reg=0;
		pwm_i_reg=0;
		}
	for(i=0;i<NUMIST;i++) 
		{
		bps[i]._vol_u=pwm_u_reg;
		bps[i]._vol_i=pwm_i_reg;
		bps[i]._flags_tu=0;
		}
	}


for(i=0;i<NUMIST;i++) 
	{
	if(bps[i]._av&0x8f)
		{
		bps[i]._vol_u=0;
		bps[i]._vol_i=0;
		bps[i]._flags_tu=1;
		}
	}

b1Hz_sh=0;
}










void bps_drv(char in)
{
char temp;

if (bps[in]._device!=dSRC) return;
temp=bps[in]._flags_tm;
if(temp&(1<<1))
	{
	if(bps[in]._temp_av_cnt<10) 
		{
		bps[in]._temp_av_cnt++;
		if(bps[in]._temp_av_cnt>=10)
			{
			bps[in]._temp_av_cnt=10;
			bps[in]._av|=(1<<0);
		   	
			}
		}
	}

else if(!(temp&(1<<1)))
	{
	if(bps[in]._temp_av_cnt) 
		{
		bps[in]._temp_av_cnt--;
		if(!bps[in]._temp_av_cnt)
			{
			bps[in]._av&=~(1<<0);
			
			}
		} 	

	}

if((temp&(1<<3)))
	{
	if(bps[in]._umax_av_cnt<10) 
		{
		bps[in]._umax_av_cnt++;
		if(bps[in]._umax_av_cnt>=10)
			{ 
			bps[in]._umax_av_cnt=10;
			bps[in]._av|=(1<<1);
			
		  	






 
						
			}
		} 
	}		
else if(!(temp&(1<<3)))
	{
	if(bps[in]._umax_av_cnt>0) 
		{
		bps[in]._umax_av_cnt--;
		if(bps[in]._umax_av_cnt==0)
			{
			bps[in]._umax_av_cnt=0;
			bps[in]._av&=~(1<<1);
			
	 
	
	 
			}
		}
	else if(bps[in]._umax_av_cnt<0) bps[in]._umax_av_cnt=0;		 
	}

if(temp&(1<<4))
	{
	if(bps[in]._umin_av_cnt<10) 
		{
		bps[in]._umin_av_cnt++;
		if(bps[in]._umin_av_cnt>=10)
			{ 
			bps[in]._umin_av_cnt=10;
			bps[in]._av|=(1<<2);
			
		  	






 				
			}
		} 
	}	
	
else if(!(temp&(1<<4)))
	{
	if(bps[in]._umin_av_cnt) 
		{
		bps[in]._umin_av_cnt--;
		if(bps[in]._umin_av_cnt==0)
			{
			bps[in]._umin_av_cnt=0;
			bps[in]._av&=~(1<<2);
		
		
		
		
			}
		}
	else if(bps[in]._umin_av_cnt>10)bps[in]._umin_av_cnt--;	 
	}




if(((work_stat==wsGS) || (work_stat==wsPS))&&(UOUT_OFF_EN))
	{
	short tempU;
	long tempL;

	tempU= U_maxg;
	if(work_stat==wsPS)tempU= U_up_temp;

	tempL=((long)tempU)*((long)(100+UOUT_OFF_LEVEL));
	tempL/=100L;

	tempU=(short)tempL;
	plazma_umax=tempU;

	if(bps[in]._Uii>tempU)
		{
		if(bps[in]._uout_avar_cnt<(UOUT_OFF_DELAY*10))
			{
			bps[in]._uout_avar_cnt++;
			if(bps[in]._uout_avar_cnt>=(UOUT_OFF_DELAY*10))
				{
				bps[in]._av|=0x80;
				}
			}
		}
	else 
		{
		if(bps[in]._uout_avar_cnt) bps[in]._uout_avar_cnt--;
		}





	}



if (bps[in]._av&0x8f)					bps[in]._state=bsAV;
else if ( (net_av) && (bps[in]._cnt>20)
 )				bps[in]._state=bsOFF_AV_NET;
else if (bps[in]._flags_tm&(((0x100000) | 0x100000>>3 | 0x100000>>6 | 0x100000>>9) & 0xf | ((0x100000) | 0x100000>>3 | 0x100000>>6 | 0x100000>>9)>>12 & 0xf0))	bps[in]._state=bsRDY;
else if (bps[in]._cnt<20)				bps[in]._state=bsWRK;























     















  


if(bps[in]._cnt>=10) 
	{
	bps[in]._flags_tu|=(((0x10000000) | 0x10000000>>3 | 0x10000000>>6 | 0x10000000>>9) & 0xf | ((0x10000000) | 0x10000000>>3 | 0x10000000>>6 | 0x10000000>>9)>>12 & 0xf0);
	bps[in]._av|=(1<<3);
	}
else 
	{
	bps[in]._flags_tu&=(((0x1111111) | 0x1111111>>3 | 0x1111111>>6 | 0x1111111>>9) & 0xf | ((0x1111111) | 0x1111111>>3 | 0x1111111>>6 | 0x1111111>>9)>>12 & 0xf0);
	bps[in]._av&=~(1<<3);
	}
bps[in]._vol_u=cntrl_stat_U;	
bps[in]._vol_i=cntrl_stat_I;
 
}




void zar_superviser_start(void)
{
sign_U[0]=1;
sign_I[0]=1;
sign_U[1]=1;
sign_I[1]=1;

}


void volt_contr_hndl(void)
{
if(work_stat==wsOFF)
	{
	cnt_volt_contr=0;
	}
else 
	{
	if(cnt_volt_contr<(T_DEL_REL_VOLT_START*10))
		{
		cnt_volt_contr++;
		}
	}

	
	if(load_U>REL_VOLT_UMIN*10)
		{
		cnt_rel_volt_umin++;
		gran(&cnt_rel_volt_umin,0,30000);
		}
	else cnt_rel_volt_umin=0;
	if((cnt_rel_volt_umin>=T_DEL_REL_VOLT_WRK*10)&&(cnt_volt_contr>=(T_DEL_REL_VOLT_START*10))) 	bVOLT_IS_NOT_DOWN=1;
	else if(cnt_rel_volt_umin==0)							  							bVOLT_IS_NOT_DOWN=0;

	if(load_U<REL_VOLT_UMAX*10)
		{
		cnt_rel_volt_umax++;
		gran(&cnt_rel_volt_umax,0,30000);
		}
	else cnt_rel_volt_umax=0;
	if((cnt_rel_volt_umax>=T_DEL_REL_VOLT_WRK*10)&&(cnt_volt_contr>=(T_DEL_REL_VOLT_START*10))) 	bVOLT_IS_NOT_UP=1;
	else if(cnt_rel_volt_umax==0)							  							bVOLT_IS_NOT_UP=0;
	
	if(bVOLT_IS_NOT_UP && bVOLT_IS_NOT_DOWN) bVOLT_IS_NORM=1;
	else bVOLT_IS_NORM=0;


}


void current_stab_hndl(void)
{

if(work_stat==wsPS)
	{
	delta_U_abs=abs_pal(load_U-U_up);
	delta_U_rel=(delta_U_abs*100)/U_up;

	delta_I_abs=abs_pal(load_I-I_maxp);
	delta_I_rel=(delta_I_abs*100)/I_maxp;
	}

else if(work_stat==wsGS)
	{
	delta_U_abs=abs_pal(load_U-U_maxg);
	delta_U_rel=(delta_U_abs*100)/U_maxg;

	delta_I_abs=abs_pal(load_I-I_ug_temp);
	delta_I_rel=(delta_I_abs*100)/I_ug_temp;
	}
else 
	{
	cnt_del_rel=0;
	}

if((delta_U_rel>DELT_REL_CURR_U)&&(delta_I_rel<DELT_REL_CURR_I))
	{
	cnt_del_rel++;
	}
else
	{
	cnt_del_rel--;
	}

gran(&cnt_del_rel,0,(T_DEL_REL_CURR_WRK*10)+10);

if(work_stat==wsOFF) cnt_del_rel=0;


if ( (time_proc>=(T_DEL_REL_CURR_START)) &&
	(cnt_del_rel>(T_DEL_REL_CURR_WRK*10)) )
	{
	bCURRENT_STAB=1;
	}
if ( (time_proc<(T_DEL_REL_CURR_START)) ||
	(cnt_del_rel<=(T_DEL_REL_CURR_WRK*10)) )
	{
	bCURRENT_STAB=0;
	}



















 

}


void revers_hndl(void)
{
((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0 & ~((0xffffffff>>(32-2))<<4*2)) | ((unsigned)0 << 4*2) );
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR & ~((0xffffffff>>(32-1))<<4)) | ((unsigned)1 << 4) );


if(work_stat==wsCAP) 
	{
	if(bRAZR) ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<4)) | ((unsigned)0 << 4) );
	else ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<4)) | ((unsigned)1 << 4) );
	} 
else 
	{
	if(REV_STAT==rsREW)
		{
		((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<4)) | ((unsigned)0 << 4) );
		}
	else 	
		{
		((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<4)) | ((unsigned)1 << 4) );
		}
	}
}


void rele_hndl(void)
{

if(RELE_FUNC[0]==0)rele_stat[0]=rsOFF; 		
else if(RELE_FUNC[0]==1)					
	{
	if(work_stat==wsCAP) 
		{
		if(bRAZR) rele_stat[0]=rsOFF;
		else 	rele_stat[0]=rsON;
		} 
	else 
		{
		if(REV_STAT==rsREW)	rele_stat[0]=rsOFF;
		else 			rele_stat[0]=rsON;
		}
	}
else if(RELE_FUNC[0]==2)					
	{
	if(RELE_LOG_CURR==0)
		{
		if(bCURRENT_STAB==0)	rele_stat[0]=rsON;
		else 				rele_stat[0]=rsOFF;
		}
	else if(RELE_LOG_CURR==1)
		{
		if(bCURRENT_STAB==0)	rele_stat[0]=rsOFF;
		else 				rele_stat[0]=rsON;
		}
	}									
else if(RELE_FUNC[0]==3)					
	{
	if(RELE_LOG_VOLT==0)
		{
		if(bVOLT_IS_NORM==0)	rele_stat[0]=rsON;
		else 				rele_stat[0]=rsOFF;
		}
	else if(RELE_LOG_VOLT==1)
		{
		if(bVOLT_IS_NORM==0)	rele_stat[0]=rsOFF;
		else 				rele_stat[0]=rsON;
		}
	}
else if(RELE_FUNC[0]==4)					
	{
	if(RELE_LOG_VOLT==0)
		{
		if(bVOLT_IS_NOT_UP==0)	rele_stat[0]=rsON;
		else 				rele_stat[0]=rsOFF;
		}
	else if(RELE_LOG_VOLT==1)
		{
		if(bVOLT_IS_NOT_UP==0)	rele_stat[0]=rsOFF;
		else 				rele_stat[0]=rsON;
		}
	}
else if(RELE_FUNC[0]==5)					
	{
	if(RELE_LOG_VOLT==0)
		{
		if(bVOLT_IS_NOT_DOWN==0)	rele_stat[0]=rsON;
		else 				rele_stat[0]=rsOFF;
		}
	else if(RELE_LOG_VOLT==1)
		{
		if(bVOLT_IS_NOT_DOWN==0)	rele_stat[0]=rsOFF;
		else 				rele_stat[0]=rsON;
		}
	}
else if(RELE_FUNC[0]==6)					
	{
	if(rele_ext_cntrl[0])	rele_stat[0]=rsON;
	else 				rele_stat[0]=rsOFF;
	}											

if(RELE_FUNC[1]==0)rele_stat[1]=rsOFF; 		
else if(RELE_FUNC[1]==1)					
	{
	if(work_stat==wsCAP) 
		{
		if(bRAZR) 		rele_stat[1]=rsOFF;
		else 			rele_stat[1]=rsON;
		} 
	else 
		{
		if(REV_STAT==rsREW)	rele_stat[1]=rsOFF;
		else 			rele_stat[1]=rsON;
		}
	}
else if(RELE_FUNC[1]==2)					
	{
	if(RELE_LOG_CURR==0)
		{
		if(bCURRENT_STAB==0)rele_stat[1]=rsON;
		else 			rele_stat[1]=rsOFF;
		}
	else if(RELE_LOG_CURR==1)
		{
		if(bCURRENT_STAB==0)rele_stat[1]=rsOFF;
		else 			rele_stat[1]=rsON;
		}
	}									
else if(RELE_FUNC[1]==3)					
	{
	if(RELE_LOG_VOLT==0)
		{
		if(bVOLT_IS_NORM==0)	rele_stat[1]=rsON;
		else 				rele_stat[1]=rsOFF;
		}
	else if(RELE_LOG_VOLT==1)
		{
		if(bVOLT_IS_NORM==0)	rele_stat[1]=rsOFF;
		else 				rele_stat[1]=rsON;
		}
	}
else if(RELE_FUNC[1]==4)					
	{
	if(RELE_LOG_VOLT==0)
		{
		if(bVOLT_IS_NOT_UP==0)	rele_stat[1]=rsON;
		else 				rele_stat[1]=rsOFF;
		}
	else if(RELE_LOG_VOLT==1)
		{
		if(bVOLT_IS_NOT_UP==0)	rele_stat[1]=rsOFF;
		else 				rele_stat[1]=rsON;
		}
	}
else if(RELE_FUNC[1]==5)					
	{
	if(RELE_LOG_VOLT==0)
		{
		if(bVOLT_IS_NOT_DOWN==0)	rele_stat[1]=rsON;
		else 				rele_stat[1]=rsOFF;
		}
	else if(RELE_LOG_VOLT==1)
		{
		if(bVOLT_IS_NOT_DOWN==0)	rele_stat[1]=rsOFF;
		else 				rele_stat[1]=rsON;
		}
	}
else if(RELE_FUNC[1]==6)					
	{
	if(rele_ext_cntrl[1])	rele_stat[1]=rsON;
	else 				rele_stat[1]=rsOFF;
	}	



										
}
 

void rele_drv(void)
{
#line 2693 "control.c"


((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0 & ~((0xffffffff>>(32-2))<<7*2)) | ((unsigned)0 << 7*2) );
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR & ~((0xffffffff>>(32-1))<<7)) | ((unsigned)1 << 7) );

if(rele_stat[0]==rsON) ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<7)) | ((unsigned)0 << 7) );
else ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<7)) | ((unsigned)1 << 7) );


((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0 = ( (((LPC_PINCON_TypeDef *) ((0x40000000UL) + 0x2C000) )->PINSEL0 & ~((0xffffffff>>(32-2))<<5*2)) | ((unsigned)0 << 5*2) );
((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIODIR & ~((0xffffffff>>(32-1))<<5)) | ((unsigned)1 << 5) );

if(rele_stat[1]==rsON) ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<5)) | ((unsigned)0 << 5) );
else ((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN = ( (((LPC_GPIO_TypeDef *) ((0x2009C000UL) + 0x00000) )->FIOPIN & ~((0xffffffff>>(32-1))<<5)) | ((unsigned)1 << 5) );


}



