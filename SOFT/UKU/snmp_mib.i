#line 1 "SNMP_MIB.c"









 

#line 1 "C:\\Keil\\ARM\\RV31\\INC\\Net_Config.h"









 




#line 1 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"









 




 

 


#line 27 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"







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

#line 54 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"

#line 66 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"



 





 
typedef U32 OS_SEM[2];

 

typedef U32 OS_MBX[];

 
typedef U32 OS_MUT[3];

 
typedef U32 OS_TID;

 
typedef void *OS_ID;

 
typedef U32 OS_RESULT;

 












 




#line 194 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"



 



 
extern void      os_set_env    (void);
extern void      rt_sys_init   (void (*task)(void), U8 priority, void *stk);
extern void      rt_tsk_pass   (void);
extern OS_TID    rt_tsk_self   (void);
extern OS_RESULT rt_tsk_prio   (OS_TID task_id, U8 new_prio);
extern OS_TID    rt_tsk_create (void (*task)(void), U8 priority, void *stk, void *argv);
extern OS_RESULT rt_tsk_delete (OS_TID task_id);

#line 230 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"

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

 




 

 



 






 
#line 415 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"

 
#line 428 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"

 





 
#line 442 "C:\\Keil\\ARM\\RV31\\INC\\RTL.h"

 




 



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






 
  

 
#line 16 "C:\\Keil\\ARM\\RV31\\INC\\Net_Config.h"

 



                                   





 




 




 
#line 50 "C:\\Keil\\ARM\\RV31\\INC\\Net_Config.h"

 





 
#line 73 "C:\\Keil\\ARM\\RV31\\INC\\Net_Config.h"

 





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







 



#line 13 "SNMP_MIB.c"
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

#line 14 "SNMP_MIB.c"
#line 1 "main.H"






#line 8 "main.H"












#line 33 "main.H"





#line 44 "main.H"


#line 56 "main.H"

#line 64 "main.H"

#line 75 "main.H"









#line 90 "main.H"







#line 115 "main.H"





#line 129 "main.H"





























































#line 218 "main.H"







		










#line 254 "main.H"

#line 270 "main.H"





















#line 304 "main.H"

#line 318 "main.H"










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



 
#line 15 "SNMP_MIB.c"
#line 1 "control.H"







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


#line 16 "SNMP_MIB.c"
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



extern signed short snmp_bps_number[16];
extern signed short snmp_bps_voltage[16];
extern signed short snmp_bps_current[16];
extern signed short snmp_bps_temperature[16];
extern signed short snmp_bps_stat[16];










extern signed short snmp_spc_stat;
extern char snmp_spc_trap_message[100];
extern signed short snmp_spc_trap_value_0,snmp_spc_trap_value_1,snmp_spc_trap_value_2;


extern signed short snmp_energy_vvod_phase_a;
extern signed short snmp_energy_vvod_phase_b;
extern signed short snmp_energy_vvod_phase_c;
extern signed short snmp_energy_pes_phase_a;
extern signed short snmp_energy_pes_phase_b;
extern signed short snmp_energy_pes_phase_c;


extern signed long snmp_energy_total_energy;
extern signed short snmp_energy_current_energy;


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



 
#line 17 "SNMP_MIB.c"

 
extern U8   get_button (void);
extern void LED_out (U32 val);
extern BOOL LCDupdate;
extern U8   lcd_text[2][16+1];

 
extern U32  snmp_SysUpTime;

 



 
static const U8 sysServices = 79;
static const U16 sysMainsVoltage = 220;
static const U8 displayPsuQauntity = 2;
static const U8 TestForTableValues = 57;

 char* const aaa = "Novosibirsk, Russia";

int a_;
char aa_;
char* aaa_="abc";

 






 

 MIB_ENTRY snmp_mib[] = {

   

   
  { 0x04 | 0x80,	     8, {(1*40 + 3), 6, 1, 2, 1, 1, 1, 0},      sizeof("First ARM SNMP agent for SibPromAutomatika")-1, "First ARM SNMP agent for SibPromAutomatika",     ((void *) 0) },
   
  { 0x06 | 0x80,	     8, {(1*40 + 3), 6, 1, 2, 1, 1, 2, 0},	    sizeof("\x2b\x06\x01\x04\x01\x82\x83\x1F")-1, "\x2b\x06\x01\x04\x01\x82\x83\x1F",    ((void *) 0) },
   
  { 0x43 | 0x80,     8, {(1*40 + 3), 6, 1, 2, 1, 1, 3, 0},    4, &snmp_SysUpTime,    ((void *) 0) },
   
  { 0x04 | 0x80,	     8, {(1*40 + 3), 6, 1, 2, 1, 1, 4, 0},    sizeof("Skype:danilov_aa")-1, "Skype:danilov_aa",    ((void *) 0) },
   
  { 0x04 | 0x80,		    8, {(1*40 + 3), 6, 1, 2, 1, 1, 5, 0},    sizeof("UKU203LAN")-1, "UKU203LAN",    ((void *) 0) },
   
  { 0x04 | 0x80,		     8, {(1*40 + 3), 6, 1, 2, 1, 1, 6, 0},    sizeof("Novosibirsk, Russia")-1, "Novosibirsk, Russia",    ((void *) 0) },
   
  { 0x02 | 0x80,			    8, {(1*40 + 3), 6, 1, 2, 1, 1, 7, 0},    sizeof(sysServices), (void *)&sysServices,    ((void *) 0) },

   





 

	
 	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 2, 1, 0},  		sizeof(snmp_out_voltage), (void *)&snmp_out_voltage,  		((void *) 0)},   					
 	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 2, 2, 0},  		sizeof(snmp_out_current), (void *)&snmp_out_current,  		((void *) 0)},   					

	
	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 1, 0},  				sizeof(snmp_num_of_psu), (void *)&snmp_num_of_psu,  		snmp_num_of_psu_write}, 			
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 2, 0},  		sizeof(snmp_max_time_of_process), (void *)&snmp_max_time_of_process,  snmp_max_time_of_process_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 3, 0},  		sizeof(snmp_time_visualisation), (void *)&snmp_time_visualisation,  snmp_time_visualisation_write},  
	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 4, 0},  			sizeof(snmp_pult_time_mode), (void *)&snmp_pult_time_mode,  		snmp_pult_time_mode_write}, 			
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 5, 0},  	sizeof(snmp_load_current_measure_mode), (void *)&snmp_load_current_measure_mode,  snmp_load_current_measure_mode_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 6, 0},  			sizeof(snmp_main_menu_mode), (void *)&snmp_main_menu_mode,  snmp_main_menu_mode_write},  

	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 7, 0},  			sizeof(snmp_restart_enabled), (void *)&snmp_restart_enabled,  snmp_restart_enabled_write},  

	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 8, 0},  		sizeof(snmp_modbus_adress), (void *)&snmp_modbus_adress,  snmp_modbus_adress_write},  

	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 5, 9, 0},		sizeof(snmp_modbus_baudrate), (void *)&snmp_modbus_baudrate,  snmp_modbus_baudrate_write},  









 


  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 1, 0},  		sizeof(snmp_reverse_state), (void *)&snmp_reverse_state,  snmp_reverse_state_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 2, 0},  	sizeof(snmp_avtoreverse_enable), (void *)&snmp_avtoreverse_enable,  snmp_avtoreverse_enable_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 3, 0},  	sizeof(snmp_avtoreverse_ff_time), (void *)&snmp_avtoreverse_ff_time,  snmp_avtoreverse_ff_time_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 4, 0},  	sizeof(snmp_avtoreverse_rew_time), (void *)&snmp_avtoreverse_rew_time,  snmp_avtoreverse_rew_time_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 5, 0},  	sizeof(snmp_avtoreverse_pause_time), (void *)&snmp_avtoreverse_pause_time,  snmp_avtoreverse_pause_time_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 6, 0},  	sizeof(snmp_avtoreverse_ff_i), (void *)&snmp_avtoreverse_ff_i,  snmp_avtoreverse_ff_i_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 7, 0},  	sizeof(snmp_avtoreverse_rew_i), (void *)&snmp_avtoreverse_rew_i,  snmp_avtoreverse_rew_i_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 8, 0},  	sizeof(snmp_avtoreverse_ff_u), (void *)&snmp_avtoreverse_ff_u,  snmp_avtoreverse_ff_u_write},  
  	
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 7, 9, 0},  	sizeof(snmp_avtoreverse_rew_u), (void *)&snmp_avtoreverse_rew_u,  snmp_avtoreverse_rew_u_write},  



	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 6, 1, 0},			sizeof(snmp_U_up), (void *)&snmp_U_up,  snmp_U_up_write},  
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 6, 2, 0},			sizeof(snmp_I_ug), (void *)&snmp_I_ug,  snmp_I_ug_write},  
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 6, 3, 0},				sizeof(snmp_U_maxg), (void *)&snmp_U_maxg,  snmp_U_maxg_write},  
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 6, 4, 0},				sizeof(snmp_I_maxp), (void *)&snmp_I_maxp,  snmp_I_maxp_write},  
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 6, 5, 0},	sizeof(snmp_time_p), (void *)&snmp_time_p,  snmp_time_p_write},  
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 6, 6, 0},	sizeof(snmp_time_g), (void *)&snmp_time_g,  snmp_time_g_write},  








 



 
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 1},  			sizeof(snmp_bps_number[0]), (void *)&snmp_bps_number[0],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 2},  			sizeof(snmp_bps_number[1]), (void *)&snmp_bps_number[1],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 3},  			sizeof(snmp_bps_number[2]), (void *)&snmp_bps_number[2],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 4},  			sizeof(snmp_bps_number[3]), (void *)&snmp_bps_number[3],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 5},  			sizeof(snmp_bps_number[4]), (void *)&snmp_bps_number[4],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 6},  			sizeof(snmp_bps_number[5]), (void *)&snmp_bps_number[5],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 7},  			sizeof(snmp_bps_number[6]), (void *)&snmp_bps_number[6],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 8},  			sizeof(snmp_bps_number[7]), (void *)&snmp_bps_number[7],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 9},  			sizeof(snmp_bps_number[8]), (void *)&snmp_bps_number[8],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 10},  			sizeof(snmp_bps_number[9]), (void *)&snmp_bps_number[9],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 11},  			sizeof(snmp_bps_number[10]), (void *)&snmp_bps_number[10],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,1, 12},  			sizeof(snmp_bps_number[11]), (void *)&snmp_bps_number[11],  	((void *) 0)},	



 

	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 1},  			sizeof(snmp_bps_voltage[0]), (void *)&snmp_bps_voltage[0],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 2},  			sizeof(snmp_bps_voltage[1]), (void *)&snmp_bps_voltage[1],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 3},  			sizeof(snmp_bps_voltage[2]), (void *)&snmp_bps_voltage[2],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 4},  			sizeof(snmp_bps_voltage[3]), (void *)&snmp_bps_voltage[3],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 5},  			sizeof(snmp_bps_voltage[4]), (void *)&snmp_bps_voltage[4],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 6},  			sizeof(snmp_bps_voltage[5]), (void *)&snmp_bps_voltage[5],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 7},  			sizeof(snmp_bps_voltage[6]), (void *)&snmp_bps_voltage[6],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 8},  			sizeof(snmp_bps_voltage[7]), (void *)&snmp_bps_voltage[7],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 9},  			sizeof(snmp_bps_voltage[8]), (void *)&snmp_bps_voltage[8],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 10},  			sizeof(snmp_bps_voltage[9]), (void *)&snmp_bps_voltage[9],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 11},  			sizeof(snmp_bps_voltage[10]), (void *)&snmp_bps_voltage[10],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,2, 12},  			sizeof(snmp_bps_voltage[11]), (void *)&snmp_bps_voltage[11],  	((void *) 0)},	



 

	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 1},  			sizeof(snmp_bps_current[0]), (void *)&snmp_bps_current[0],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 2},  			sizeof(snmp_bps_current[1]), (void *)&snmp_bps_current[1],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 3},  			sizeof(snmp_bps_current[2]), (void *)&snmp_bps_current[2],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 4},  			sizeof(snmp_bps_current[3]), (void *)&snmp_bps_current[3],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 5},  			sizeof(snmp_bps_current[4]), (void *)&snmp_bps_current[4],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 6},  			sizeof(snmp_bps_current[5]), (void *)&snmp_bps_current[5],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 7},  			sizeof(snmp_bps_current[6]), (void *)&snmp_bps_current[6],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 8},  			sizeof(snmp_bps_current[7]), (void *)&snmp_bps_current[7],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 9},  			sizeof(snmp_bps_current[8]), (void *)&snmp_bps_current[8],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 10},  			sizeof(snmp_bps_current[9]), (void *)&snmp_bps_current[9],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 11},  			sizeof(snmp_bps_current[10]), (void *)&snmp_bps_current[10],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,3, 12},  			sizeof(snmp_bps_current[11]), (void *)&snmp_bps_current[11],  	((void *) 0)},	



 

	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 1},  		sizeof(snmp_bps_temperature[0]), (void *)&snmp_bps_temperature[0],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 2},  		sizeof(snmp_bps_temperature[1]), (void *)&snmp_bps_temperature[1],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 3},  		sizeof(snmp_bps_temperature[2]), (void *)&snmp_bps_temperature[2],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 4},  		sizeof(snmp_bps_temperature[3]), (void *)&snmp_bps_temperature[3],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 5},  		sizeof(snmp_bps_temperature[4]), (void *)&snmp_bps_temperature[4],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 6},  		sizeof(snmp_bps_temperature[5]), (void *)&snmp_bps_temperature[5],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 7},  		sizeof(snmp_bps_temperature[6]), (void *)&snmp_bps_temperature[6],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 8},  		sizeof(snmp_bps_temperature[7]), (void *)&snmp_bps_temperature[7],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 9},  		sizeof(snmp_bps_temperature[8]), (void *)&snmp_bps_temperature[8],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 10},  		sizeof(snmp_bps_temperature[9]), (void *)&snmp_bps_temperature[9],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 11},  		sizeof(snmp_bps_temperature[10]), (void *)&snmp_bps_temperature[10],  ((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,4, 12},  		sizeof(snmp_bps_temperature[11]), (void *)&snmp_bps_temperature[11],  ((void *) 0)},	



 

	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 1},  			sizeof(snmp_bps_stat[0]), (void *)&snmp_bps_stat[0],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 2},  			sizeof(snmp_bps_stat[1]), (void *)&snmp_bps_stat[1],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 3},  			sizeof(snmp_bps_stat[2]), (void *)&snmp_bps_stat[2],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 4},  			sizeof(snmp_bps_stat[3]), (void *)&snmp_bps_stat[3],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 5},  			sizeof(snmp_bps_stat[4]), (void *)&snmp_bps_stat[4],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 6},  			sizeof(snmp_bps_stat[5]), (void *)&snmp_bps_stat[5],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 7},  			sizeof(snmp_bps_stat[6]), (void *)&snmp_bps_stat[6],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 8},  			sizeof(snmp_bps_stat[7]), (void *)&snmp_bps_stat[7],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 9},  			sizeof(snmp_bps_stat[8]), (void *)&snmp_bps_stat[8],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 10},  			sizeof(snmp_bps_stat[9]), (void *)&snmp_bps_stat[9],  ((void *) 0)},			
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 11},  			sizeof(snmp_bps_stat[10]), (void *)&snmp_bps_stat[10],  ((void *) 0)},		
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 3, 1,5, 12},  			sizeof(snmp_bps_stat[11]), (void *)&snmp_bps_stat[11],  ((void *) 0)},		



 


	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1, 0},						sizeof(snmp_command), (void *)&snmp_command,  	snmp_command_execute},		


	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 1},  			sizeof(snmp_avt_number[0]), (void *)&snmp_avt_number[0],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 2},  			sizeof(snmp_avt_number[1]), (void *)&snmp_avt_number[1],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 3},  			sizeof(snmp_avt_number[2]), (void *)&snmp_avt_number[2],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 4},  			sizeof(snmp_avt_number[3]), (void *)&snmp_avt_number[3],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 5},  			sizeof(snmp_avt_number[4]), (void *)&snmp_avt_number[4],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 6},  			sizeof(snmp_avt_number[5]), (void *)&snmp_avt_number[5],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 7},  			sizeof(snmp_avt_number[6]), (void *)&snmp_avt_number[6],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 8},  			sizeof(snmp_avt_number[7]), (void *)&snmp_avt_number[7],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 9},  			sizeof(snmp_avt_number[8]), (void *)&snmp_avt_number[8],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 10},  			sizeof(snmp_avt_number[9]), (void *)&snmp_avt_number[9],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 11},  			sizeof(snmp_avt_number[10]), (void *)&snmp_avt_number[10],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,1, 12},  			sizeof(snmp_avt_number[11]), (void *)&snmp_avt_number[11],  	((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 1},  			sizeof(snmp_avt_stat[0]), (void *)&snmp_avt_stat[0],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 2},  			sizeof(snmp_avt_stat[1]), (void *)&snmp_avt_stat[1],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 3},  			sizeof(snmp_avt_stat[2]), (void *)&snmp_avt_stat[2],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 4},  			sizeof(snmp_avt_stat[3]), (void *)&snmp_avt_stat[3],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 5},  			sizeof(snmp_avt_stat[4]), (void *)&snmp_avt_stat[4],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 6},  			sizeof(snmp_avt_stat[5]), (void *)&snmp_avt_stat[5],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 7},  			sizeof(snmp_avt_stat[6]), (void *)&snmp_avt_stat[6],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 8},  			sizeof(snmp_avt_stat[7]), (void *)&snmp_avt_stat[7],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 9},  			sizeof(snmp_avt_stat[8]), (void *)&snmp_avt_stat[8],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 10},  			sizeof(snmp_avt_stat[9]), (void *)&snmp_avt_stat[9],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 11},  			sizeof(snmp_avt_stat[10]), (void *)&snmp_avt_stat[10],  		((void *) 0)},	
	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 11, 1,2, 12},  			sizeof(snmp_avt_stat[11]), (void *)&snmp_avt_stat[11],  		((void *) 0)},	

	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 12, 1, 0},		sizeof(snmp_energy_vvod_phase_a), (void *)&snmp_energy_vvod_phase_a, ((void *) 0)},	
	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 12, 2, 0},		sizeof(snmp_energy_vvod_phase_b), (void *)&snmp_energy_vvod_phase_b, ((void *) 0)},	
	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 12, 3, 0},		sizeof(snmp_energy_vvod_phase_c), (void *)&snmp_energy_vvod_phase_c, ((void *) 0)},	
	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 12, 4, 0},		sizeof(snmp_energy_pes_phase_a), (void *)&snmp_energy_pes_phase_a, ((void *) 0)},	
	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 12, 5, 0},		sizeof(snmp_energy_pes_phase_b), (void *)&snmp_energy_pes_phase_b, ((void *) 0)},	
	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 12, 6, 0},		sizeof(snmp_energy_pes_phase_c), (void *)&snmp_energy_pes_phase_c, ((void *) 0)},	
	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 12, 7, 0},		sizeof(snmp_energy_total_energy), (void *)&snmp_energy_total_energy, ((void *) 0)},	
	{ 0x02 | 0x80,  	12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 12, 8, 0},		sizeof(snmp_energy_current_energy), (void *)&snmp_energy_current_energy, ((void *) 0)},	



	{ 0x02 | 0x80,  	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 1, 2, 4, 1, 0},  sizeof(NUMBAT), (void *)&NUMBAT,  ((void *) 0)},	

	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 1, 2, 7, 4, 0},	     sizeof("Novosibirsk, Russia")-1, "Novosibirsk, Russia",     ((void *) 0)},
	{ 0x02, 			13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 1, 2, 7, 5, 0},	     sizeof(displayPsuQauntity), (void *)&displayPsuQauntity,     ((void *) 0)},
 

 
  
	


	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 1},  			sizeof(&snmp_log[0][0])-1, &snmp_log[0][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 2},  			sizeof(&snmp_log[1][0])-1, &snmp_log[1][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 3},  			sizeof(&snmp_log[2][0])-1, &snmp_log[2][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 4},  			sizeof(&snmp_log[3][0])-1, &snmp_log[3][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 5},  			sizeof(&snmp_log[4][0])-1, &snmp_log[4][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 6},  			sizeof(&snmp_log[5][0])-1, &snmp_log[5][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 7},  			sizeof(&snmp_log[6][0])-1, &snmp_log[6][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 8},  			sizeof(&snmp_log[7][0])-1, &snmp_log[7][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 9},  			sizeof(&snmp_log[8][0])-1, &snmp_log[8][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 10},  			sizeof(&snmp_log[9][0])-1, &snmp_log[9][0],  	((void *) 0)},	

	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 11},  			sizeof(&snmp_log[10][0])-1, &snmp_log[10][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 12},  			sizeof(&snmp_log[11][0])-1, &snmp_log[11][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 13},  			sizeof(&snmp_log[12][0])-1, &snmp_log[12][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 14},  			sizeof(&snmp_log[13][0])-1, &snmp_log[13][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 15},  			sizeof(&snmp_log[14][0])-1, &snmp_log[14][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 16},  			sizeof(&snmp_log[15][0])-1, &snmp_log[15][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 17},  			sizeof(&snmp_log[16][0])-1, &snmp_log[16][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 18},  			sizeof(&snmp_log[17][0])-1, &snmp_log[17][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 19},  			sizeof(&snmp_log[18][0])-1, &snmp_log[18][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 20},  			sizeof(&snmp_log[19][0])-1, &snmp_log[19][0],  	((void *) 0)},	

	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 21},  			sizeof(&snmp_log[20][0])-1, &snmp_log[20][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 22},  			sizeof(&snmp_log[21][0])-1, &snmp_log[21][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 23},  			sizeof(&snmp_log[22][0])-1, &snmp_log[22][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 24},  			sizeof(&snmp_log[23][0])-1, &snmp_log[23][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 25},  			sizeof(&snmp_log[24][0])-1, &snmp_log[24][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 26},  			sizeof(&snmp_log[25][0])-1, &snmp_log[25][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 27},  			sizeof(&snmp_log[26][0])-1, &snmp_log[26][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 28},  			sizeof(&snmp_log[27][0])-1, &snmp_log[27][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 29},  			sizeof(&snmp_log[28][0])-1, &snmp_log[28][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 30},  			sizeof(&snmp_log[29][0])-1, &snmp_log[29][0],  	((void *) 0)},	

	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 31},  			sizeof(&snmp_log[30][0])-1, &snmp_log[30][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 32},  			sizeof(&snmp_log[31][0])-1, &snmp_log[31][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 33},  			sizeof(&snmp_log[32][0])-1, &snmp_log[32][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 34},  			sizeof(&snmp_log[33][0])-1, &snmp_log[33][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 35},  			sizeof(&snmp_log[34][0])-1, &snmp_log[34][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 36},  			sizeof(&snmp_log[35][0])-1, &snmp_log[35][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 37},  			sizeof(&snmp_log[36][0])-1, &snmp_log[36][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 38},  			sizeof(&snmp_log[37][0])-1, &snmp_log[37][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 39},  			sizeof(&snmp_log[38][0])-1, &snmp_log[38][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 40},  			sizeof(&snmp_log[39][0])-1, &snmp_log[39][0],  	((void *) 0)},	

	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 41},  			sizeof(&snmp_log[40][0])-1, &snmp_log[40][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 42},  			sizeof(&snmp_log[41][0])-1, &snmp_log[41][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 43},  			sizeof(&snmp_log[42][0])-1, &snmp_log[42][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 44},  			sizeof(&snmp_log[43][0])-1, &snmp_log[43][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 45},  			sizeof(&snmp_log[44][0])-1, &snmp_log[44][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 46},  			sizeof(&snmp_log[45][0])-1, &snmp_log[45][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 47},  			sizeof(&snmp_log[46][0])-1, &snmp_log[46][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 48},  			sizeof(&snmp_log[47][0])-1, &snmp_log[47][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 49},  			sizeof(&snmp_log[48][0])-1, &snmp_log[48][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 50},  			sizeof(&snmp_log[49][0])-1, &snmp_log[49][0],  	((void *) 0)},	

	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 51},  			sizeof(&snmp_log[50][0])-1, &snmp_log[50][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 52},  			sizeof(&snmp_log[51][0])-1, &snmp_log[51][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 53},  			sizeof(&snmp_log[52][0])-1, &snmp_log[52][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 54},  			sizeof(&snmp_log[53][0])-1, &snmp_log[53][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 55},  			sizeof(&snmp_log[54][0])-1, &snmp_log[54][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 56},  			sizeof(&snmp_log[55][0])-1, &snmp_log[55][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 57},  			sizeof(&snmp_log[56][0])-1, &snmp_log[56][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 58},  			sizeof(&snmp_log[57][0])-1, &snmp_log[57][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 59},  			sizeof(&snmp_log[58][0])-1, &snmp_log[58][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 60},  			sizeof(&snmp_log[59][0])-1, &snmp_log[59][0],  	((void *) 0)},	

	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 61},  			sizeof(&snmp_log[60][0])-1, &snmp_log[60][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 62},  			sizeof(&snmp_log[61][0])-1, &snmp_log[61][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 63},  			sizeof(&snmp_log[62][0])-1, &snmp_log[62][0],  	((void *) 0)},	
	{ 0x04 | 0x80, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 9, 1,1, 64},  			sizeof(&snmp_log[63][0])-1, &snmp_log[63][0],  	((void *) 0)},	


	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 40, 0},				sizeof(snmp_zv_en), (void *)&snmp_zv_en,  		snmp_zv_on_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 41, 0},				sizeof(snmp_alarm_auto_disable), (void *)&snmp_alarm_auto_disable,snmp_alarm_auto_disable_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 42, 0},				sizeof(snmp_bat_test_time), (void *)&snmp_bat_test_time,	snmp_bat_test_time_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 49, 0},						sizeof(snmp_u_max), (void *)&snmp_u_max,		snmp_u_max_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 50, 0},					sizeof(snmp_u_0_grad), (void *)&snmp_u_0_grad,		snmp_u_0_grad_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 51, 0},					sizeof(snmp_u_20_grad), (void *)&snmp_u_20_grad,		snmp_u_20_grad_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 52, 0},					sizeof(snmp_u_sign), (void *)&snmp_u_sign,		snmp_u_sign_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 53, 0},				sizeof(snmp_u_min_power), (void *)&snmp_u_min_power,	snmp_u_min_power_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 54, 0},				sizeof(snmp_u_withouth_bat), (void *)&snmp_u_withouth_bat,	snmp_u_withouth_bat_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 55, 0},						sizeof(snmp_control_current), (void *)&snmp_control_current,snmp_control_current_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 56, 0},						sizeof(snmp_max_charge_current), (void *)&snmp_max_charge_current,	snmp_max_charge_current_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 57, 0},						sizeof(snmp_max_current), (void *)&snmp_max_current,	snmp_max_current_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 58, 0},						sizeof(snmp_max_current_koef), (void *)&snmp_max_current_koef,	snmp_max_current_koef_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 59, 0},						sizeof(snmp_up_charge_koef), (void *)&snmp_up_charge_koef,	snmp_up_charge_koef_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 60, 0},						sizeof(snmp_powerup_psu_timeout), (void *)&snmp_powerup_psu_timeout,	snmp_powerup_psu_timeout_write},		
	{ 0x02,  			12, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 40, 10, 61, 0},						sizeof(snmp_max_temperature), (void *)&snmp_max_temperature,	snmp_max_temperature_write},		

















 


	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 1, 1},    sizeof(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->HOUR), (void *)&((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->HOUR,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 1, 2},    sizeof(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->YEAR), (void *)&((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->YEAR,    ((void *) 0)},				  
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 2, 1},    sizeof(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MIN), (void *)&((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MIN,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 2, 2},    sizeof(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->YEAR), (void *)&((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->YEAR,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 3, 1},     sizeof(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->SEC), (void *)&((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->SEC,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 3, 2},    sizeof(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MONTH), (void *)&((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->MONTH,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 4, 1},     sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 4, 2},    sizeof(((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->HOUR), (void *)&((LPC_RTC_TypeDef *) ((0x40000000UL) + 0x24000) )->HOUR,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 5, 1},     sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},	    
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 5, 2},    sizeof(sysServices), (void *)&sysServices,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 6, 1},     sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 6, 2},    sizeof(sysServices), (void *)&sysServices,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 7, 1},     sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 7, 2},    sizeof(TestForTableValues), (void *)&TestForTableValues,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 8, 1},     sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 8, 2},    sizeof(TestForTableValues), (void *)&TestForTableValues,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 9, 1},     sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 9, 2},    sizeof(TestForTableValues), (void *)&TestForTableValues,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 10, 1},     sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 10, 2},    sizeof(TestForTableValues), (void *)&TestForTableValues,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 11, 1},    sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,     ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 11, 2},    sizeof(TestForTableValues), (void *)&TestForTableValues,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 12, 1},     sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 12, 2},    sizeof(TestForTableValues), (void *)&TestForTableValues,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 13, 1},    sizeof(sysMainsVoltage), (void *)&sysMainsVoltage,    ((void *) 0)},
	{ 0x02, 	13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 4, 2, 1, 13, 2},    sizeof(TestForTableValues), (void *)&TestForTableValues,    ((void *) 0)},
	{ 0x04, 13, {(1*40 + 3), 6, 1, 4, 1, 130, 131, 31, 1, 2, 7, 4, 0},  sizeof("Proverka sviazi. Проверка связи.")-1, "Proverka sviazi. Проверка связи.",   ((void *) 0)},

	};
const int snmp_mib_size = (sizeof(snmp_mib) / sizeof(MIB_ENTRY));





























 
