#include "25lc640.h"
#include "control.h"
#include "mess.h"
#include "gran.h"
#include "common_func.h"
#include "eeprom_map.h"
#include "avar_hndl.h"
#include "main.h"
#include "beep.h"
#include "full_can.h"
#include "ret.h" 
#include <LPC17xx.h>

#define KOEFPOT  105L







extern signed short u_necc,u_necc_,u_necc_up,u_necc_dn;
extern signed short main_cnt_5Hz;
extern signed short num_necc;
extern signed short num_necc_Imax;
extern signed short num_necc_Imin;
//extern char bSAME_IST_ON;
//extern signed short Unet,unet_store;
//extern char bat_cnt_to_block[2];
//extern enum  {bisON=0x0055,bisOFF=0x00aa}BAT_IS_ON[2];
extern signed mat_temper;




//***********************************************
//������
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

//***********************************************
//���
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
//char rele_stat;
char bRELE_OUT;
signed short adc_self_ch_buff[3],adc_self_ch_disp[3];
long main_power_buffer[8],main_power_buffer_;
short adc_result;
short main_power_buffer_cnt;
short adc_gorb_cnt,adc_zero_cnt;
char adc_window_flag;
short adc_window_cnt;
short adc_net_buff_cnt;


extern int mess_par0[MESS_DEEP],mess_par1[MESS_DEEP],mess_data[2];

extern signed short TBAT;
extern signed short Kunet;
extern signed short Kubat[2];
extern unsigned short ad7705_buff[2][16],ad7705_buff_[2];
extern unsigned short Kibat0[2];
extern signed short Kibat1[2];
extern signed short Ktbat[2];
//extern signed short bat_Ib[2];
short adc_buff_out_[3];
extern char kb_full_ver;
extern signed short Kuload;

signed short bat_ver_cnt=150;
extern signed short Isumm;
extern signed short Isumm_;
extern char ND_out[3];
//extern signed short tout[4];


short plazma_adc_cnt;
short plazma_sk;
extern char cntrl_plazma;

//extern const short ptr_bat_zar_cnt[2];

//***********************************************
//���������� ������������
signed char vent_stat=0;

//***********************************************
//���������� �����
signed short cntrl_stat_U=1000;
signed short cntrl_stat_I=1000;
signed short cntrl_stat_old=600;
signed short cntrl_stat_new;
signed short Ibmax;
unsigned char unh_cnt0,unh_cnt1,b1Hz_unh;
unsigned char	ch_cnt0,b1Hz_ch,i,iiii;
unsigned short IZMAX_;


//***********************************************
//���������������
signed short samokalibr_cnt;



//**********************************************
//�������� ������� �������
signed short 	main_kb_cnt;
signed short 	kb_cnt_1lev;
signed short 	kb_cnt_2lev;
char 		kb_full_ver;
char kb_start[2];

//**********************************************
//������ � ������
char num_of_wrks_bps;
char bps_all_off_cnt,bps_mask_off_cnt,bps_mask_on_off_cnt;
char bps_hndl_2sec_cnt;
unsigned short bps_on_mask,bps_off_mask;
char num_necc_up,num_necc_down;
unsigned char sh_cnt0,b1Hz_sh,sh_cnt1;

//***********************************************
//�����������
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

//***********************************************
//������
extern unsigned avar_stat;	 	//"�����������" ���� ��������� � ������ ������ ��������� � ����� �����
extern unsigned avar_ind_stat; 	//"�����������" ���� �� ������������� ��������� ��������� � ����� �����
extern unsigned avar_stat_old;
extern unsigned avar_stat_new,avar_stat_offed;
//��������� ����������
//1���  - �������� ����
//2���� - �������
//12��� - ����
//5���  - ���������
//4���� - ������� ������� �����������
//4���� - ������� ����� ��������


short cntrl_stat_blok_cnt,cntrl_stat_blok_cnt_,cntrl_stat_blok_cnt_plus[2],cntrl_stat_blok_cnt_minus[2];

//***********************************************
//����� ��������
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

//***********************************************
//�������� ������� ���
signed char net_in_drv_cnt_B,net_in_drv_cnt_C;
char net_in_drv_stat_B, net_in_drv_stat_C;

signed long temp_temp_SL;

//***********************************************
//���������� ����
signed short RELE_FUNC[2];
char rele_ext_cntrl[2];

//-----------------------------------------------
void kb_init(void)
{
main_kb_cnt=(TBAT*60)-60/*120*/;
}






//-----------------------------------------------
void samokalibr_init(void)
{
samokalibr_cnt=1785;
}
//-----------------------------------------------
void samokalibr_hndl(void)
{
if(++samokalibr_cnt>=1800)samokalibr_cnt=0;

if(samokalibr_cnt>=1785U)
	{
	mess_send(MESS2RELE_HNDL,PARAM_RELE_SAMOKALIBR,1,15);
	mess_send(MESS2IND_HNDL,PARAM_SAMOKALIBR,0,15);
	mess_send(MESS2MATEMAT,PARAM_SAMOKALIBR,0,15);
	} 

if(samokalibr_cnt==1799U)
	{
	if(Kiload0!=ad7705_buff_[0]) lc640_write_int(EE_KILOAD0,ad7705_buff_[0]);
	}	 	
}


/*
//-----------------------------------------------
void ubat_old_drv(void)
{        
bat_u_old_cnt++;
gran_ring(&bat_u_old_cnt,0,8);

bat[0]._u_old[bat_u_old_cnt]=bat[0]._Ub;
bat[1]._u_old[bat_u_old_cnt]=bat[1]._Ub;
}*/

//-----------------------------------------------
void unet_drv(void)
{
if((adc_buff_[5]>3500)||(adc_buff_[10]>3500))
	{
	if(unet_drv_cnt<20)unet_drv_cnt++;
	}
else if(unet_drv_cnt)unet_drv_cnt--;

gran(&unet_drv_cnt,0,20);
}

//-----------------------------------------------
void matemat(void)
{
//signed short temp_SS;
signed long temp_SL/*,temp_SL_*/;
char /*temp,*/i;


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

//temp_SL=(signed long)ad7705_buff__[0];
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
	//temp_SL/=NUMIST;
	
	load_I=(signed short)temp_SL;
	load_I_=(signed short)temp_SL;
	}

if(load_I<0)load_I=0;
//load_I=333;
/*
bps[0]._cnt=0;
if(debug_cnt==0)
	{
	bps[0]._buff[6]=0x00;
	}
else if(debug_cnt==1)
	{
	bps[0]._buff[6]=0xf0;
	}
else if(debug_cnt==2)
	{
	bps[0]._buff[6]=0xff;
	}
else if(debug_cnt==3)
	{
	bps[0]._buff[6]=0x80;
	}
else if(debug_cnt==4)
	{
	bps[0]._buff[6]=0x0f;
	}
*/
for(i=0;i<32;i++)
	{
	if(bps[i]._cnt<25)
	     {
	     bps[i]._Ii=bps[i]._buff[0]+(bps[i]._buff[1]*256);
	     bps[i]._Uin=bps[i]._buff[2]+(bps[i]._buff[3]*256);
	     bps[i]._Uii=bps[i]._buff[4]+(bps[i]._buff[5]*256);
	     bps[i]._Ti=(signed)((signed char)bps[i]._buff[6]);
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



//-----------------------------------------------
void adc_init(void)
{

SET_REG(LPC_PINCON->PINSEL1,1,(25-16)*2,2);
SET_REG(LPC_PINCON->PINSEL1,1,(24-16)*2,2);
SET_REG(LPC_PINCON->PINSEL1,1,(23-16)*2,2);


SET_REG(LPC_PINCON->PINMODE1,2,(25-16)*2,2);
SET_REG(LPC_PINCON->PINMODE1,2,(24-16)*2,2);
SET_REG(LPC_PINCON->PINMODE1,2,(23-16)*2,2);

SET_REG(LPC_ADC->ADCR,0,24,3);

SET_REG(LPC_ADC->ADCR,1,21,1);
SET_REG(LPC_ADC->ADCR,0,16,1);
SET_REG(LPC_ADC->ADCR,1,8,8);

//SET_REG(LPC_GPIO0->FIODIR,7,5,3);
//SET_REG(LPC_GPIO0->FIOPIN,4,5,3);
	
	/*if(adc_ch<=7)*///SET_REG(LPC_ADC->ADCR,1<<5,0,8);
     /*else if(adc_ch==8) SET_REG(LPC_ADC->ADCR,1<<2,0,8);
     else SET_REG(LPC_ADC->ADCR,1<<4,0,8);*/

LPC_ADC->ADINTEN     =  (1<< 8);      /* global enable interrupt            */

NVIC_EnableIRQ(ADC_IRQn);             /* enable ADC Interrupt               */


}

//-----------------------------------------------
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

//-----------------------------------------------
void adc_drv7(void) //(U���� - ���������)
{
//int temp_S;
//char i;
//signed short temp_SS;

adc_self_ch_disp[0]=abs_pal(adc_self_ch_buff[1]-adc_self_ch_buff[0]);//adc_self_ch_buff[0]&0x0f80;
adc_self_ch_disp[1]=abs_pal(adc_self_ch_buff[2]-adc_self_ch_buff[1]);//adc_self_ch_buff[1]&0x0f80;
adc_self_ch_disp[2]=abs_pal(adc_self_ch_buff[2]-adc_self_ch_buff[0]);//adc_self_ch_buff[2]&0x0f80;

//adc_self_ch_disp[0]=adc_self_ch_buff[0]&0x0ff0;
//adc_self_ch_disp[1]=adc_self_ch_buff[1]&0x0ff0;
//adc_self_ch_disp[2]=adc_self_ch_buff[2]&0x0ff0;


if(adc_self_ch_disp[2]<300)//==adc_self_ch_disp[2])
	{
	adc_result=adc_self_ch_buff[2];
	} 
else if(adc_self_ch_disp[1]<300)//==adc_self_ch_disp[2])
	{
	adc_result=adc_self_ch_buff[1];
	}
else if(adc_self_ch_disp[0]<300)//==adc_self_ch_disp[1])
	{
	adc_result=adc_self_ch_buff[0];
	}
    //adc_result=92;

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
		#ifdef UKU_220
		net_buff_=(short)((main_power_buffer[adc_net_buff_cnt>>10])>>11);
		#else
		net_buff_=(short)((main_power_buffer[adc_net_buff_cnt>>10])>>8);
		#endif
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
		//adc_buff_[3]=346;
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

//SET_REG(LPC_GPIO0->FIODIR,7,5,3);
//SET_REG(LPC_GPIO0->FIOPIN,adc_ch,5,3);

if(adc_ch_net)
	{
	//LPC_GPIO2->FIODIR|=(1<<7);
	//LPC_GPIO2->FIOPIN|=(1<<7);
	SET_REG(LPC_ADC->ADCR,1<<2,0,8);
	}
else
	{
	//LPC_GPIO2->FIODIR|=(1<<7);
	//LPC_GPIO2->FIOPIN&=~(1<<7);
	if(!(adc_ch&(1<<3)))SET_REG(LPC_ADC->ADCR,1<<0,0,8);
	else 			SET_REG(LPC_ADC->ADCR,1<<1,0,8);


	SET_REG(LPC_GPIO0->FIODIR,1,28,1);
	SET_REG(LPC_GPIO1->FIODIR,1,30,1);
	SET_REG(LPC_GPIO3->FIODIR,1,26,1);

	if(!(adc_ch&(1<<0)))SET_REG(LPC_GPIO0->FIOPIN,0,28,1);
	else 			SET_REG(LPC_GPIO0->FIOPIN,1,28,1);

	if(!(adc_ch&(1<<1)))SET_REG(LPC_GPIO1->FIOPIN,0,30,1);
	else 			SET_REG(LPC_GPIO1->FIOPIN,1,30,1);

	if(!(adc_ch&(1<<2)))SET_REG(LPC_GPIO3->FIOPIN,0,26,1);
	else 			SET_REG(LPC_GPIO3->FIOPIN,1,26,1);
	}
	



LPC_ADC->ADCR |=  (1<<24);

}

//-----------------------------------------------
void avg_hndl(void)
{ 
char i;



#define AVGCNTMAX	5
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
	if(/*(bps[i]._state==bsWRK)&&*/(bps[i]._cnt<20))avg_num++;
	}

/*if((K[NUMI]>=1)&&(bps_state[0]==ssWRK))	avg_num++;
if((K[NUMI]>=2)&&(bps_state[1]==ssWRK))	avg_num++;
if((K[NUMI]>=3)&&(bps_state[2]==ssWRK))	avg_num++;*/

	
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
		//for(i=0;i<NUMIST;i++)
			//{
		//	if(bps[i]._state==bsWRK)
				//{
				//if(bps[i]._Ii>i_avg)bps[i]._xu_--;
				/*if(bps[i]._Ii<i_avg)*/
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
			//	}
			//}		
		}			
	}   	 


avg_hndl_end:
__nop();  
}

//-----------------------------------------------
void adc_drv6(void) //(� �������� �������� �����)
{
//int temp_S;
//char i;
//signed short temp_SS;

adc_self_ch_disp[0]=abs_pal(adc_self_ch_buff[1]-adc_self_ch_buff[0]);//adc_self_ch_buff[0]&0x0f80;
adc_self_ch_disp[1]=abs_pal(adc_self_ch_buff[2]-adc_self_ch_buff[1]);//adc_self_ch_buff[1]&0x0f80;
adc_self_ch_disp[2]=abs_pal(adc_self_ch_buff[2]-adc_self_ch_buff[0]);//adc_self_ch_buff[2]&0x0f80;

//adc_self_ch_disp[0]=adc_self_ch_buff[0]&0x0ff0;
//adc_self_ch_disp[1]=adc_self_ch_buff[1]&0x0ff0;
//adc_self_ch_disp[2]=adc_self_ch_buff[2]&0x0ff0;


if(adc_self_ch_disp[2]<300)//==adc_self_ch_disp[2])
	{
	adc_result=adc_self_ch_buff[2];
	} 
else if(adc_self_ch_disp[1]<300)//==adc_self_ch_disp[2])
	{
	adc_result=adc_self_ch_buff[1];
	}
else if(adc_self_ch_disp[0]<300)//==adc_self_ch_disp[1])
	{
	adc_result=adc_self_ch_buff[0];
	}
    //adc_result=92;

if(adc_ch_net)
	{

	if(adc_window_flag)
		{
		main_power_buffer[0]+=(long)(adc_result>>2);
		main_power_buffer[1]+=(long)(adc_result>>2);
		main_power_buffer[2]+=(long)(adc_result>>2);
		main_power_buffer[3]+=(long)(adc_result>>2);
		}
//	main_power_buffer[4]+=(long)(adc_result>>2);
//	main_power_buffer[5]+=(long)(adc_result>>2);
//	main_power_buffer[6]+=(long)(adc_result>>2);
//	main_power_buffer[7]+=(long)(adc_result>>2);
//	main_power_buffer_cnt++;


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
				//net_buff_=main_power_buffer[0]>>8;
				//main_power_buffer[0]=0;
			   	}

			if((adc_gorb_cnt&0x007f)==0)
				{
				net_buff_=main_power_buffer[adc_gorb_cnt>>7]>>8;
				main_power_buffer[adc_gorb_cnt>>7]=0;
				}
			}

		//LPC_GPIO2->FIODIR|=(1<<8);
		//LPC_GPIO2->FIOPIN^=(1<<8);

		if((adc_window_cnt>150)&&(adc_window_flag))
			{
			adc_window_flag=0;

			
			}
		if((adc_window_cnt>30)&&(adc_window_cnt<70)&&(!adc_window_flag))
			{
			adc_window_flag=1;

			//LPC_GPIO2->FIODIR|=(1<<8);
			//LPC_GPIO2->FIOPIN|=(1<<8);
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

		//adc_buff_[3]=346;
		}
	if(++adc_ch>=16) 
		{
		adc_ch=0;
		adc_ch_cnt++;
		if(adc_ch_cnt>=16)adc_ch_cnt=0;
		}
	}

//adc_buff[adc_ch][adc_cnt1]=(adc_self_ch_buff[2]+adc_self_ch_buff[1])/2;

//if(adc_buff[adc_ch][adc_cnt1]<adc_buff_min[adc_ch])adc_buff_min[adc_ch]=adc_buff[adc_ch][adc_cnt1];
//if(adc_buff[adc_ch][adc_cnt1]>adc_buff_max[adc_ch])adc_buff_max[adc_ch]=adc_buff[adc_ch][adc_cnt1];
/*
	{
	if((adc_cnt1&0x03)==0)
		{
		temp_S=0;
		for(i=0;i<16;i++)
			{
			temp_S+=adc_buff[adc_ch][i];
			} 
         	adc_buff_[adc_ch]=temp_S>>4;
          }
	}*/


		  

adc_self_ch_cnt=0;

adc_ch_net++;
adc_ch_net&=1;

//SET_REG(LPC_GPIO0->FIODIR,7,5,3);
//SET_REG(LPC_GPIO0->FIOPIN,adc_ch,5,3);

if(adc_ch_net)
	{
	//LPC_GPIO2->FIODIR|=(1<<7);
	//LPC_GPIO2->FIOPIN|=(1<<7);
	SET_REG(LPC_ADC->ADCR,1<<2,0,8);
	}
else
	{
	//LPC_GPIO2->FIODIR|=(1<<7);
	//LPC_GPIO2->FIOPIN&=~(1<<7);
	if(!(adc_ch&(1<<3)))SET_REG(LPC_ADC->ADCR,1<<0,0,8);
	else 			SET_REG(LPC_ADC->ADCR,1<<1,0,8);


	SET_REG(LPC_GPIO0->FIODIR,1,28,1);
	SET_REG(LPC_GPIO1->FIODIR,1,30,1);
	SET_REG(LPC_GPIO3->FIODIR,1,26,1);

	if(!(adc_ch&(1<<0)))SET_REG(LPC_GPIO0->FIOPIN,0,28,1);
	else 			SET_REG(LPC_GPIO0->FIOPIN,1,28,1);

	if(!(adc_ch&(1<<1)))SET_REG(LPC_GPIO1->FIOPIN,0,30,1);
	else 			SET_REG(LPC_GPIO1->FIOPIN,1,30,1);

	if(!(adc_ch&(1<<2)))SET_REG(LPC_GPIO3->FIOPIN,0,26,1);
	else 			SET_REG(LPC_GPIO3->FIOPIN,1,26,1);
	}
	



LPC_ADC->ADCR |=  (1<<24);

}
 /*
//-----------------------------------------------
void adc_drv_()
{
short temp_S;
char i;
adc_ch=4;
if(ADDR&0x00000001)
	{
	ADWR=ADDR_bit.VVDDA;
	
	if(++period_cnt>=200)
		{
		period_cnt=0;
		adc_buff[adc_ch][adc_cnt]=ADWR;
		
		if((adc_cnt&0x03)==0)
			{
			temp_S=0;
			for(i=0;i<16;i++)
				{
				temp_S+=adc_buff[adc_ch][i];
				}
			adc_buff_[adc_ch]=temp_S>>4;
			uart_out0(2,*((char*)&adc_buff_[adc_ch]),*(((char*)&adc_buff_[adc_ch])+1),0,0,0,0);

			}
		adc_cnt++;
		if(adc_cnt>=16)adc_cnt=0;
		
		}
	}

PINSEL1_bit.P0_28=1;	
PINSEL1_bit.P0_29=1;	
PINSEL1_bit.P0_30=1;	

PINSEL0_bit.P0_4=0;
PINSEL0_bit.P0_5=0;
PINSEL0_bit.P0_6=0;

IO0DIR_bit.P0_4=1;
IO0DIR_bit.P0_5=1;
IO0DIR_bit.P0_6=1;


if(adc_ch&0x02)IO0SET|=((long)1UL<<5);
else IO0CLR|=((long)1UL<<5);
if(adc_ch&0x04)IO0SET|=((long)1UL<<6);
else IO0CLR|=((long)1UL<<6);
if(adc_ch&0x08)IO0SET|=((long)1UL<<4);
else IO0CLR|=((long)1UL<<4);

ADCR_bit.PDN=1;
ADCR_bit.CLKDIV=14;
ADCR_bit.BURST=0;
ADCR_bit.CLKS=0;
ADCR_bit.TEST=0;

ADCR_bit.SEL=4;
ADCR_bit.START=1;
	

}
*/




/*//-----------------------------------------------
void bp_on_(char in)
{
bp_tumbler[in-1]=1;
}

//-----------------------------------------------
void bp_off_(char in)
{
bp_tumbler[in-1]=0;
}
 */

//-----------------------------------------------
//������� ������� ���������� �� ����������
void ach_off_hndl(void)
{

if((work_stat!=wsOFF)&&(ACH_OFF_EN))
	{
	milliAmperSecunda+=((long)load_I);
	if(milliAmperSecunda>=3600L)
		{
		milliAmperSecunda-=3600L;
		AMPERCHAS+=1;
		lc640_write_long(EE_AMPERCHAS,AMPERCHAS);

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
 	
//-----------------------------------------------
//������� ������� ���������� �� �������� ����
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

//-----------------------------------------------
void time_hndl(void) /*�� ��� � �������*/
{
if((REV_IS_ON)&&(AVT_REV_IS_ON))
	{

	}




if(work_stat==wsGS)
	{
	time_proc++;
	if(((time_proc%600L)==0)&&(restart_enable==reON))
		{
		lc640_write_long(EE_TIME_PROC_GS_RESTART,time_proc);
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
		lc640_write_long(EE_TIME_PROC_PS_RESTART,time_proc);
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

//-----------------------------------------------
void cap_time_hndl(void) /*10 ��� � �������*/
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


//-----------------------------------------------
void restart_on_GS(void)
{
lc640_write_long(EE_TIME_PROC_GS_RESTART,1);
}

//-----------------------------------------------
void restart_on_PS(void)
{
lc640_write_long(EE_TIME_PROC_PS_RESTART,1);
}

//-----------------------------------------------
void restart_off(void)
{
lc640_write_long(EE_TIME_PROC_GS_RESTART,0);
lc640_write_long(EE_TIME_PROC_PS_RESTART,0);
}

//-----------------------------------------------
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
	//index_set=0;
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
	lc640_write_long(EE_AMPERCHAS,AMPERCHAS);
}


//-----------------------------------------------
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
	//index_set=0;
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
	lc640_write_long(EE_AMPERCHAS,AMPERCHAS);
}

//-----------------------------------------------
void start_CAP(void) {
	work_stat=wsCAP;
}

//-----------------------------------------------
void pause_CAP(void) {
	work_stat=wsOFF;
}

//-----------------------------------------------
void stop_CAP(void) {
	work_stat=wsOFF;

}

//-----------------------------------------------
void ramModbusCnt_hndl(void)  
{
if(ramModbusCnt) ramModbusCnt--;
else 
	{
	I_ug_ram=0;
	U_up_ram=0;
	}	
}

//-----------------------------------------------
void reset_CAP(void) {
	work_stat=wsOFF;
	cap_time_proc=0;
	CAP_COUNTER=0;
	CAP_TIME_SEC=0;
	CAP_TIME_MIN=0;
	CAP_TIME_HOUR=0;
}

//-----------------------------------------------
void stop_proc(void)
{
work_stat=wsOFF;
restart_off();
}

//-----------------------------------------------
short find_U_curve(signed short in)
{
short ii,i=0,out=0;

ii=0;

if(lc640_read_int(SEKTOR_KURVE_U+(ii*2)) >= in)
	{
	out=0;
	}
else 
	{
	for (ii=0;ii<=200;ii+=10)
		{
		if(lc640_read_int(SEKTOR_KURVE_U+(ii*2)) <= in)
			{
			i=ii;
			}
		else continue;
		}
	if(i<200)
		{
		for (ii=i;ii<i+10;ii++)
			{
			if(lc640_read_int(SEKTOR_KURVE_U+(ii*2)) <= in)
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
			if(lc640_read_int(SEKTOR_KURVE_U+(ii*2)) <= in)
				{
				out=ii;
				}
			else continue;
			}
	
	
		}
	}

return out;
}

//-----------------------------------------------
short find_I_curve(signed short in)
{
short ii,i=0,out=0;

ii=0;

if(lc640_read_int(SEKTOR_KURVE_I+(ii*2)) >= in)
	{
	out=0;
	}
else 
	{
	for (ii=0;ii<=200;ii+=10)
		{
		if(lc640_read_int(SEKTOR_KURVE_I+(ii*2)) <= in)
			{
			i=ii;
			}
		else continue;
		}
	
	if(i<200)
		{
		for (ii=i;ii<i+10;ii++)
			{
			if(lc640_read_int(SEKTOR_KURVE_I+(ii*2)) <= in)
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
			if(lc640_read_int(SEKTOR_KURVE_I+(ii*2)) <= in)
				{
				out=ii;
				}
			else continue;
			}
		}
	}
return out;
}


//-----------------------------------------------
void viz_hndl(void)
{
if(ind==iK_viz_u)
	{
	if(viz_stat==vsON)
		{
		viz_stat_cnt++;
		if(viz_stat_cnt>=10221)
			{
			viz_stat=vsOFF;
			lc640_write_int(EE_U_CURVE_IS_ON,0xabcd);
			//ind=iK_viz_sel;
			tree_down(0,0);
			}
		tst_pwm_i=1022;
		tst_pwm_u=(viz_stat_cnt/50)*5;
		if(viz_stat_cnt%50==49)
			{
			lc640_write_int(SEKTOR_KURVE_U+((viz_stat_cnt/50)*2),load_U);
			}
		}
	}

if(ind==iK_viz_i)
	{
	if(viz_stat==vsON)
		{
		viz_stat_cnt++;
		if(viz_stat_cnt>=10221)
			{
			viz_stat=vsOFF;
			lc640_write_int(EE_I_CURVE_IS_ON,0xabcd);
			//ind=iK_viz_sel;
			tree_down(0,0);
			}
		tst_pwm_u=1022;
		tst_pwm_i=(viz_stat_cnt/50)*5;
		if(viz_stat_cnt%50==49)
			{
			lc640_write_int(SEKTOR_KURVE_I+((viz_stat_cnt/50)*2),load_I);
			}
		}
	}
}



//-----------------------------------------------
void bps_hndl(void) /*��, 10 ��� � �������*/
{
char /*ptr__,*/i;

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
	
gran(&I_ug_temp,0/*I_MIN_IPS*/,I_MAX_IPS);
gran(&U_up_temp,0/*U_MIN*/,U_MAX);

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

if(ind==iK_load)
	{
	if(sub_ind==0)		 
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
	else if(sub_ind==1)
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
else if((ind==iK_bps)||(ind==iK_bps_v2))
	{
	if((sub_ind==0)||(sub_ind==3))
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
 		
		bps[sub_ind1]._vol_u=1022;
		bps[sub_ind1]._vol_i=1022;
		bps[sub_ind1]._flags_tu=0;
		}

	else if(sub_ind==6)
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



			bps[sub_ind1]._vol_u=1022;
			bps[sub_ind1]._vol_i=1022;
			bps[sub_ind1]._flags_tu=0;
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

else if(ind==iTst_pwm)
	{
	char i;

	for(i=0;i<NUMIST;i++)
		{
		bps[i]._vol_u=tst_pwm_u;
		bps[i]._vol_i=tst_pwm_i;
		bps[i]._flags_tu=0;
		}
	}

else if(ind==iK_viz_u)
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

else if(ind==iK_viz_i)
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

		//I_ug_temp= (signed short)((signed long)I_ug_temp*(signed long)time_proc)/(signed long)CURR_FADE_IN;

		I_ug_temp= (signed short)temp_SL_;
		}	
	
	if(b1Hz_sh) {




		if(!((REV_IS_ON)&&(AVT_REV_IS_ON)&&((proc_phase==ppFF_P_REW)||(proc_phase==ppREW_P_FF)))) {
	 		if(load_I<I_ug_temp)_x_++;
   			else if(load_I>I_ug_temp)_x_--;
			//gran(&_x_,-temp_SL_I,1022-temp_SL_I);
			gran(&_x_,-50,50); 

	 		if(load_U<U_maxg)_xu_++;
   			else if(load_U>U_maxg)_xu_--;
			//gran(&_x_,-temp_SL_U,1022-temp_SL_U);
			gran(&_xu_,-50,50); 
		}
	}

	temp_SL_U=1022;
	temp_SL_U*=(signed long)U_maxg;
	temp_SL_U/=(signed long)U_MAX;

	temp_SL_I=1022;
	//temp_SL_I*=NUMIST;
	temp_SL_I*=(signed long)I_ug_temp;
	temp_SL_I/=(signed long)I_MAX_IPS;

	if(lc640_read_int(EE_U_CURVE_IS_ON)==0xabcd)
		{
		temp_SL_U=find_U_curve(U_maxg)*5;
		}
	 
	if(lc640_read_int(EE_I_CURVE_IS_ON)==0xabcd)
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
			bps[i]._vol_u=(short)temp_SL_U + _xu_/*+bps[i]._xu_*/;
			if(bps[i]._vol_u<0)bps[i]._vol_u=0;
			if(bps[i]._vol_u>1022)bps[i]._vol_u=1022;
			bps[i]._vol_i=((short)temp_SL_I + _x_);///NUMIST;
			if(bps[i]._vol_i<0)bps[i]._vol_i=0;
			if(bps[i]._vol_i>1022)bps[i]._vol_i=1022;
			bps[i]._flags_tu=0;
		}
	}

	}
else if(work_stat==wsPS)
	{
	signed long temp_SL_U,temp_SL_I;
	/*	U_up_d=U_up/100;
	if(U_up_d<5) U_up_d=5;
	*/
	if(load_U_>5)bU_VALID=1;
	else bU_VALID=0;

	temp_SL_U=(long)U_up_temp/100L;
	if(temp_SL_U<=0)temp_SL_U=1;
	if((abs(load_U_-U_up_temp))<(signed short)temp_SL_U) bU_VALID_VALID=1;
	else bU_VALID_VALID=0;
/*	if( (load_U_>(U_up-U_up_d))&&(load_U_<(U_up+U_up_d)) )bFAST_REG=0;
	else bFAST_REG=1;*/

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

	if(lc640_read_int(EE_U_CURVE_IS_ON)==0xabcd)
		{	
		temp_SL_U=find_U_curve(U_up_temp)*5;
		}
	//temp_SL_U=lc640_read_int(SEKTOR_KURVE_U+(temp_SL_U*2));
	 
	temp_SL_I=1022;
	//temp_SL_I*=NUMIST;
	temp_SL_I*=(signed long)I_maxp;
	temp_SL_I/=(signed long)I_MAX_IPS;

	if(lc640_read_int(EE_I_CURVE_IS_ON)==0xabcd)
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
			bps[i]._vol_i=((short)temp_SL_I + _x_);///NUMIST;
			if(bps[i]._vol_i<0)bps[i]._vol_i=0;
			if(bps[i]._vol_i>1022)bps[i]._vol_i=1022;
			bps[i]._flags_tu=0;
		}
	}


/*	for(i=0;i<NUMIST;i++)
		{
		bps[i]._vol_u=(short)temp_SL_U + _xu_;
	 	bps[i]._vol_i=((short)temp_SL_I+ _x_);//NUMIST;
		bps[i]._flags_tu=0;
		}*/
	//bps[0]._vol_i+= _x_;
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
	//temp_SL_I*=NUMIST;
	temp_SL_I*=(signed long)CAP_WRK_CURR;
	temp_SL_I/=(signed long)I_MAX_IPS;

	if(lc640_read_int(EE_U_CURVE_IS_ON)==0xabcd)
		{
		temp_SL_U=find_U_curve(CAP_MAX_VOLT*10)*5;
		}
	 
	if(lc640_read_int(EE_I_CURVE_IS_ON)==0xabcd)
		{
		temp_SL_I=find_I_curve(CAP_WRK_CURR*10)*5;
		} 

//temp_SL_U=1000;

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
			bps[i]._vol_i=((short)temp_SL_I + _x_);///NUMIST;
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

//gran(&bps[0]._vol_u,10,1010);
//gran(&bps[0]._vol_i,10,1010);

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

//���� ������ � ���������� ���������� �� ���������� � ����������
#define AV_OVERLOAD	0
#define AV_T	1
#define AVUMAX	3
#define AVUMIN	4



//-----------------------------------------------
void bps_drv(char in)
{
char temp;

if (bps[in]._device!=dSRC) return;
temp=bps[in]._flags_tm;
if(temp&(1<<AV_T))
	{
	if(bps[in]._temp_av_cnt<10) 
		{
		bps[in]._temp_av_cnt++;
		if(bps[in]._temp_av_cnt>=10)
			{
			bps[in]._temp_av_cnt=10;
			bps[in]._av|=(1<<0);
		   	//if(!(bps[in]._av&(1<<0)))avar_bps_hndl(in,0,1);
			}
		}
	}

else if(!(temp&(1<<AV_T)))
	{
	if(bps[in]._temp_av_cnt) 
		{
		bps[in]._temp_av_cnt--;
		if(!bps[in]._temp_av_cnt)
			{
			bps[in]._av&=~(1<<0);
			//if(bps[in]._av&(1<<0))avar_bps_hndl(in,0,0);
			}
		} 	

	}

if((temp&(1<<AVUMAX)))
	{
	if(bps[in]._umax_av_cnt<10) 
		{
		bps[in]._umax_av_cnt++;
		if(bps[in]._umax_av_cnt>=10)
			{ 
			bps[in]._umax_av_cnt=10;
			bps[in]._av|=(1<<1);
			//if(!(bps[in]._av&(1<<1)))avar_bps_hndl(in,1,1);
		  	/*if((K[APV]!=ON)||((apv_cnt[in,0]==0)&&(apv_cnt[in,1]==0)&&(apv_cnt[in,2]==0)&&(apv_flags[in]==afOFF)))avar_s_hndl(in,1,1);
			if((apv_cnt[in,0]==0)&&(apv_cnt[in,1]==0)&&(apv_cnt[in,2]==0)&&(apv_flags[in]==afON))
				{
				apv_cnt[in,0]=APV_INIT;
				apv_cnt[in,1]=APV_INIT;
				apv_cnt[in,2]=APV_INIT;
				apv_flags[in]=afOFF;
				}				*/
						
			}
		} 
	}		
else if(!(temp&(1<<AVUMAX)))
	{
	if(bps[in]._umax_av_cnt>0) 
		{
		bps[in]._umax_av_cnt--;
		if(bps[in]._umax_av_cnt==0)
			{
			bps[in]._umax_av_cnt=0;
			bps[in]._av&=~(1<<1);
			//avar_bps_hndl(in,1,0);
	 //		apv_cnt[in,0]=0;
	//		apv_cnt[in,1]=0;
	 //		apv_cnt[in,2]=0;			
			}
		}
	else if(bps[in]._umax_av_cnt<0) bps[in]._umax_av_cnt=0;		 
	}

if(temp&(1<<AVUMIN))
	{
	if(bps[in]._umin_av_cnt<10) 
		{
		bps[in]._umin_av_cnt++;
		if(bps[in]._umin_av_cnt>=10)
			{ 
			bps[in]._umin_av_cnt=10;
			bps[in]._av|=(1<<2);
			//if(!(bps[in]._av&(1<<2)))avar_bps_hndl(in,2,1);
		  	/*	if((K[APV]!=ON)||((apv_cnt[in,0]==0)&&(apv_cnt[in,1]==0)&&(apv_cnt[in,2]==0)&&(apv_flags[in]==afOFF)))avar_s_hndl(in,2,1);
			if((apv_cnt[in,0]==0)&&(apv_cnt[in,1]==0)&&(apv_cnt[in,2]==0)&&(apv_flags[in]==afON))
				{
				apv_cnt[in,0]=APV_INIT;
				apv_cnt[in,1]=APV_INIT;
				apv_cnt[in,2]=APV_INIT;
				apv_flags[in]=afOFF;
				}*/				
			}
		} 
	}	
	
else if(!(temp&(1<<AVUMIN)))
	{
	if(bps[in]._umin_av_cnt) 
		{
		bps[in]._umin_av_cnt--;
		if(bps[in]._umin_av_cnt==0)
			{
			bps[in]._umin_av_cnt=0;
			bps[in]._av&=~(1<<2);
		//	avar_bps_hndl(in,2,0);
		//	apv_cnt[in,0]=0;
		//	apv_cnt[in,1]=0;
		//	apv_cnt[in,2]=0;
			}
		}
	else if(bps[in]._umin_av_cnt>10)bps[in]._umin_av_cnt--;	 
	}

//bps[in]._state=bsOFF;


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
else if ( (net_av) && (bps[in]._cnt>20)/*&& 
		(bps[in]._Uii<200)*/)				bps[in]._state=bsOFF_AV_NET;
else if (bps[in]._flags_tm&BIN8(100000))	bps[in]._state=bsRDY;
else if (bps[in]._cnt<20)				bps[in]._state=bsWRK;



//else if(bps[in]._flags_tm&BIN8(100000)) bps[in]._state=ssBL;
//else if((!(bps[in]._flags_tm&BIN8(100000)))&&(net_U>100))bps[in]._state=ssWRK;
//else bps[0]._state=ssNOT;

//bps[in]._is_ready=0;
//bps[in]._is_wrk=0;
//if(bps[in]._av_net) bps[in]._flags_bp='N';// �� ���������
//else if(bps[in]._av_u_max) bps[in]._flags_bp='P';// �������� ����������(u_.av_.bAS1T)) bps_state[0]=ssAV;
//else if(bps[in]._av_u_min) bps[in]._flags_bp='M';// �������� ����������
//else if(bps[in]._av_temper) bps[in]._flags_bp='T';// �����������
//else if(bps[in]._flags_tm&BIN8(100000)) 
//	{
//	bps[in]._flags_bp='B';// ������������
//	bps[in]._is_ready=1;
//	}
//else if((!(bps[in]._flags_tm&BIN8(100000)))&&(net_U>100))
//     {
//     bps[in]._flags_bp='W';// ��������
//     bps[in]._is_ready=1;
//     bps[in]._is_wrk=1;
     
//     }
//else bps[in]._is_ready=1;     





/*
bps[in]._flags_tu&=BIN8(11111110);
if(bps[in]._ist_blok_cnt)
	{
	bps[in]._ist_blok_cnt--;
	bps[in]._flags_tu|=BIN8(1);
	}

	   */ 

//��������� ���� ��� ������ �����
if(bps[in]._cnt>=10) 
	{
	bps[in]._flags_tu|=BIN8(10000000);
	bps[in]._av|=(1<<3);
	}
else 
	{
	bps[in]._flags_tu&=BIN8(1111111);
	bps[in]._av&=~(1<<3);
	}
bps[in]._vol_u=cntrl_stat_U;	
bps[in]._vol_i=cntrl_stat_I;
 
}



//-----------------------------------------------
void zar_superviser_start(void)
{
sign_U[0]=1;
sign_I[0]=1;
sign_U[1]=1;
sign_I[1]=1;

}

//-----------------------------------------------
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

//-----------------------------------------------
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

/*
SET_REG(LPC_PINCON->PINSEL0,0,5*2,2);
SET_REG(LPC_GPIO0->FIODIR,1,5,1);
//SET_REG(LPC_GPIO0->FIOSET,1,5,1);

if(RELE_LOG_CURR==0)
	{
	SET_REG(LPC_GPIO0->FIOPIN,1,5,1);
	}
else if(RELE_LOG_CURR==1)
	{
	if(bCURRENT_STAB==0)SET_REG(LPC_GPIO0->FIOPIN,0,5,1);
	else SET_REG(LPC_GPIO0->FIOPIN,1,5,1);
	}
else
	{
	if(bCURRENT_STAB==0)SET_REG(LPC_GPIO0->FIOPIN,1,5,1);
	else SET_REG(LPC_GPIO0->FIOPIN,0,5,1);
	}*/

}

//-----------------------------------------------
void revers_hndl(void)
{
SET_REG(LPC_PINCON->PINSEL0,0,4*2,2);
SET_REG(LPC_GPIO0->FIODIR,1,4,1);
//SET_REG(LPC_GPIO0->FIOSET,1,5,1);

if(work_stat==wsCAP) 
	{
	if(bRAZR) SET_REG(LPC_GPIO0->FIOPIN,0,4,1);
	else SET_REG(LPC_GPIO0->FIOPIN,1,4,1);
	} 
else 
	{
	if(REV_STAT==rsREW)
		{
		SET_REG(LPC_GPIO0->FIOPIN,0,4,1);
		}
	else 	
		{
		SET_REG(LPC_GPIO0->FIOPIN,1,4,1);
		}
	}
}

//-----------------------------------------------
void rele_hndl(void)
{
//����1
if(RELE_FUNC[0]==0)rele_stat[0]=rsOFF; 		//���������
else if(RELE_FUNC[0]==1)					//������
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
else if(RELE_FUNC[0]==2)					//���������������
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
else if(RELE_FUNC[0]==3)					//���������� � �����
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
else if(RELE_FUNC[0]==4)					//���������� �� ����
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
else if(RELE_FUNC[0]==5)					//���������� �� ����
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
else if(RELE_FUNC[0]==6)					//������� ����������
	{
	if(rele_ext_cntrl[0])	rele_stat[0]=rsON;
	else 				rele_stat[0]=rsOFF;
	}											
//����2
if(RELE_FUNC[1]==0)rele_stat[1]=rsOFF; 		//���������
else if(RELE_FUNC[1]==1)					//������
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
else if(RELE_FUNC[1]==2)					//���������������
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
else if(RELE_FUNC[1]==3)					//���������� � �����
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
else if(RELE_FUNC[1]==4)					//���������� �� ����
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
else if(RELE_FUNC[1]==5)					//���������� �� ����
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
else if(RELE_FUNC[1]==6)					//������� ����������
	{
	if(rele_ext_cntrl[1])	rele_stat[1]=rsON;
	else 				rele_stat[1]=rsOFF;
	}	

//rele_stat[0]=rsON;
//rele_stat[1]=rsON;
										
}
 
//-----------------------------------------------
void rele_drv(void)
{
#ifdef EXT_BOARD_V_1
SET_REG(LPC_PINCON->PINSEL0,0,4*2,2);
SET_REG(LPC_GPIO0->FIODIR,1,4,1);

if(rele_stat[0]==rsON) SET_REG(LPC_GPIO0->FIOPIN,0,4,1);
else SET_REG(LPC_GPIO0->FIOPIN,1,4,1);
#endif

#ifdef EXT_BOARD_V_2
SET_REG(LPC_PINCON->PINSEL0,0,7*2,2);
SET_REG(LPC_GPIO0->FIODIR,1,7,1);

if(rele_stat[0]==rsON) SET_REG(LPC_GPIO0->FIOPIN,0,7,1);
else SET_REG(LPC_GPIO0->FIOPIN,1,7,1);
#endif

SET_REG(LPC_PINCON->PINSEL0,0,5*2,2);
SET_REG(LPC_GPIO0->FIODIR,1,5,1);

if(rele_stat[1]==rsON) SET_REG(LPC_GPIO0->FIOPIN,0,5,1);
else SET_REG(LPC_GPIO0->FIOPIN,1,5,1);


}



