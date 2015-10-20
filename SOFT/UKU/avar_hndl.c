#include "avar_hndl.h"
#include "eeprom_map.h"
#include "full_can.h"
#include "25lc640.h"
#include <LPC17xx.H>
#include "main.h"
#include "control.h"

     
//***********************************************
//������
unsigned avar_stat;	 	//"�����������" ���� ��������� � ������ ������ ��������� � ����� �����
unsigned avar_ind_stat; 	//"�����������" ���� �� ������������� ��������� ��������� � ����� �����
unsigned avar_stat_old;
unsigned avar_stat_new,avar_stat_offed;
//��������� ����������
//1���  - �������� ����
//2���� - �������
//12��� - ����
//5���  - ���������
//4���� - ������� ������� �����������
//4���� - ������� ����� ��������

char /*av_net*//*,av_bat[2]*//*av_bps[12],*/av_inv[6];//,/*av_dt[4],av_sk[4]*/;

extern char bOUT_FREE2;	






//**********************************************
//**********************************************
//**********************************************
//**********************************************
//**********************************************
//**********************************************
//**********************************************
//**********************************************
//**********************************************
//�������


//***********************************************
//��������� ��������� ����
//char u_net_av_stat,u_net_av_stat_;
extern signed short net_U,net_Ustore;
extern char bFF,bFF_;
extern signed short net_F,hz_out,hz_out_cnt;

extern char net_av;



//-----------------------------------------------
void avar_hndl(void)
{
//static unsigned avar_stat_old;
char i;
//unsigned avar_stat_new,avar_stat_offed;

if(net_av)		SET_REG(avar_stat,1,0,1);
else	   			SET_REG(avar_stat,0,0,1);

for(i=0;i<2;i++)
	{
	if(bat[i]._av&1)	SET_REG(avar_stat,1,1+i,1);
	else	   		SET_REG(avar_stat,0,1+i,1);
	}

for(i=0;i<12;i++)
	{
	if(bps[i]._av)	SET_REG(avar_stat,1,3+i,1);
	else	   		SET_REG(avar_stat,0,3+i,1);
	}

for(i=0;i<6;i++)
	{
	if(av_inv[i])	SET_REG(avar_stat,1,15+i,1);
	else	   		SET_REG(avar_stat,0,15+i,1);
	}

/*for(i=0;i<4;i++)
	{
	if(av_dt[i])	SET_REG(avar_stat,1,21+i,1);
	else	   		SET_REG(avar_stat,0,21+i,1);
	}  */
for(i=0;i<4;i++)
	{
	if(sk_av_stat[i]==sasON)	SET_REG(avar_stat,1,25+i,1);
	else	   		SET_REG(avar_stat,0,25+i,1);
	}

avar_stat_new=(avar_stat^avar_stat_old)&avar_stat;

avar_ind_stat|=avar_stat_new;

if((SK_ZVUK_EN[0])) avar_ind_stat&=(~(1UL<<25));
if((SK_ZVUK_EN[1])) avar_ind_stat&=(~(1UL<<26));
if((SK_ZVUK_EN[2])) avar_ind_stat&=(~(1UL<<27));
if((SK_ZVUK_EN[3])) avar_ind_stat&=(~(1UL<<28));	


avar_stat_offed=~((avar_stat^avar_stat_old)&avar_stat_old);

if(!AV_OFF_AVT)avar_stat_offed|=0xfffffffe;

avar_ind_stat&=avar_stat_offed; 

avar_stat_old=avar_stat;
}





//-----------------------------------------------
void avar_bps_hndl(char dev, char v, char in)
{
char data[4];
unsigned short event_ptr,lc640_adr,event_ptr_find,event_cnt;
char avar_simbol;

avar_simbol='T';
if(v==0)avar_simbol='T';
else if(v==1)avar_simbol='U';
else if(v==2)avar_simbol='u';
else if(v==3)avar_simbol='L';

if(in==1)
	{
	//av_src[bps]=1;

//	SET_REG(avar_ind_stat,1,3+dev,1);
//	SET_REG(avar_stat,1,3+dev,1);
	
	if(v==0)bps[dev]._av|=(1<<0);
	else if(v==1) bps[dev]._av|=(1<<1);
	else if(v==2) bps[dev]._av|=(1<<2);
	else if(v==3) bps[dev]._av|=(1<<3);

	bps[dev]._last_avar=v;

	//beep_init(0x33333333,'A');

//	event_ptr=lc640_read_int(PTR_EVENT_LOG);
	event_ptr++;	
	if(event_ptr>63)event_ptr=0;	
//	lc640_write_int(PTR_EVENT_LOG,event_ptr);	
	
     //event_cnt=lc640_read_int(CNT_EVENT_LOG);
	if(event_cnt!=63)event_cnt=event_ptr;
//	lc640_write_int(CNT_EVENT_LOG,event_cnt); 
	
	//lc640_adr=EVENT_LOG+(lc640_read_int(PTR_EVENT_LOG)*32);
	
	data[0]='S';
	data[1]=dev; 
	data[2]=avar_simbol;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr,data);

	data[0]=0;
	data[1]=0;
	data[2]=0;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+4,data);

	data[0]=LPC_RTC->YEAR;
	data[1]=LPC_RTC->MONTH;
	data[2]=LPC_RTC->DOM;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+8,data);

	data[0]=LPC_RTC->HOUR;
	data[1]=LPC_RTC->MIN;
	data[2]=LPC_RTC->SEC;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+12,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+16,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+20,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+24,data);
	
	data[0]='A';
	data[1]='A';
	data[2]='A';
	data[3]='A';
	lc640_write_long_ptr(lc640_adr+28,data);		


/* ---
	if(dev==0)
		{
		if(v==0)
		snmp_trap_send("BPS #1 Alarm, overheat",4,1,0);
		else if(v==1)
		snmp_trap_send("BPS #1 Alarm, voltage is up",4,1,1);
		else if(v==2)
		snmp_trap_send("BPS #1 Alarm, voltage is down",4,1,2);
		else if(v==3)
		snmp_trap_send("BPS #1 Alarm, connect is lost",4,1,3);
		}
	else if(dev==1)
		{
		if(v==0)
		snmp_trap_send("BPS #2 Alarm, overheat",4,2,0);
		else if(v==1)
		snmp_trap_send("BPS #2 Alarm, voltage is up",4,2,1);
		else if(v==2)
		snmp_trap_send("BPS #2 Alarm, voltage is down",4,2,2);
		else if(v==3)
		snmp_trap_send("BPS #2 Alarm, connect is lost",4,2,3);
		} 
	else if(dev==2)
		{
		if(v==0)
		snmp_trap_send("BPS #3 Alarm, overheat",4,3,0);
		else if(v==1)
		snmp_trap_send("BPS #3 Alarm, voltage is up",4,3,1);
		else if(v==2)
		snmp_trap_send("BPS #3 Alarm, voltage is down",4,3,2);
		else if(v==3)
		snmp_trap_send("BPS #3 Alarm, connect is lost",4,3,3);
		} */	
			
	}

else if(in==0)
	{      
//	av_bps[bps]=0;

	//SET_REG(avar_stat,0,3+bps,1);
	//if(AV_OFF_AVT) SET_REG(avar_ind_stat,0,3+bps,1);

     if(v==0) bps[dev]._av&=(~(1<<0));
     else if(v==1) bps[dev]._av&=(~(1<<1));
	else if(v==2) bps[dev]._av&=(~(1<<2));
	else if(v==3) bps[dev]._av&=(~(1<<3));
     
//	if((bps[dev]._av&0x0f==0))
//	     {
		//SET_REG(avar_stat,0,3+bps,1);
		//if(AV_OFF_AVT) SET_REG(avar_ind_stat,0,3+bps,1);
//	     }
 
	//event_ptr=lc640_read_int(PTR_EVENT_LOG);
//	event_ptr_find=event_ptr;
	
avar_src_hndl_lbl1: 

	//lc640_adr=EVENT_LOG+(event_ptr_find*32);

     //lc640_read_long_ptr(lc640_adr,data);
     
     if(!((data[0]=='S')&&(data[1]==dev)&&(data[2]==avar_simbol)))
     	{        
     	if(event_ptr_find)event_ptr_find--;
     	else event_ptr_find=63;
     	if(event_ptr_find==event_ptr)goto avar_src_hndl_end;
     	else goto avar_src_hndl_lbl1;
     	}
     else 
     	{
     	lc640_read_long_ptr(lc640_adr+16,data);
     	if(!((data[0]=='A')&&(data[1]=='A')&&(data[2]=='A')&&(data[3]=='A')))
     		{        
     		if(event_ptr_find)event_ptr_find--;
         		else event_ptr_find=63;
         		if(event_ptr_find==event_ptr)goto avar_src_hndl_end;
     		else goto avar_src_hndl_lbl1;
     		}

     	}	


	
	data[0]=LPC_RTC->YEAR;
	data[1]=LPC_RTC->MONTH;
	data[2]=LPC_RTC->DOM;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+16,data);

	data[0]=LPC_RTC->HOUR;
	data[1]=LPC_RTC->MIN;
	data[2]=LPC_RTC->SEC;
	data[3]=0;
	lc640_write_long_ptr(lc640_adr+20,data);
	
	data[0]='B';
	data[1]='B';
	data[2]='B';
	data[3]='B';
	lc640_write_long_ptr(lc640_adr+24,data);
	
	data[0]='B';
	data[1]='B';
	data[2]='B';
	data[3]='B';
	lc640_write_long_ptr(lc640_adr+28,data);
	
	}
	
avar_src_hndl_end:
__nop();		
}

//-----------------------------------------------
void wrk_mem_hndl(char b)
{

}  

//-----------------------------------------------
void avar_bat_hndl(char b, char in)
{
	
}



//-----------------------------------------------
void ke_mem_hndl(char b,unsigned short in)
{

}


//-----------------------------------------------
void vz_mem_hndl(unsigned short in)
{


}
  



