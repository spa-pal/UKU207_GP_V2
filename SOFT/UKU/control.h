#ifndef _CONTROL_H_

#define _CONTROL_H_


//**********************************************
//������ � ������
extern char num_of_wrks_bps;
extern char bps_all_off_cnt,bps_mask_off_cnt,bps_mask_on_off_cnt;
extern char bps_hndl_2sec_cnt;
extern unsigned short bps_on_mask,bps_off_mask;
extern char num_necc_up,num_necc_down;
extern unsigned char sh_cnt0,b1Hz_sh,sh_cnt1;


extern short cntrl_stat_blok_cnt,cntrl_stat_blok_cnt_,cntrl_stat_blok_cnt_plus[2],cntrl_stat_blok_cnt_minus[2];

//***********************************************
//��� 
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
//extern char rele_stat;
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
//-----------------------------------------------
void net_in_drv(void);
void adc_drv5(void);
void adc_drv_(void);
void avg_hndl(void);
//void bp_on(char in);
//void bp_off(char in);
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

//***********************************************
//�����������

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

//***********************************************
//���������� �����
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
#endif

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

//***********************************************
//���������� ����
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


