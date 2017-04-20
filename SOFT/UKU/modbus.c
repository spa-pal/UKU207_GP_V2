#include "stdint.h"
#include "modbus.h"
//#include "LPC17xx.H"
#include "main.h"
#include "stdio.h"
#include "eeprom_map.h"
#include "25lc640.h"
#include "gran.h"
#include "uart0.h"
#include "sc16is7xx.h"
#include "control.h"
#include "modbus_tcp.h"
	
#include <string.h>

unsigned char modbus_buf[20];
short modbus_crc16;
char modbus_timeout_cnt;
char bMODBUS_TIMEOUT;
unsigned char modbus_rx_buffer[30];	//�����, ���� ���������� ����������� ������� ���������� ���������� �� ������ ����� 
unsigned char modbus_an_buffer[30];    	//�����, ���� ��� ����� ���������� ��� �������
unsigned char modbus_rx_buffer_ptr;	//��������� �� ������� ������� ������������ ������
unsigned char modbus_rx_counter;		//���������� �������� ����, ������������ ��� ������� ����������� ������� � ��� �����������
signed short modbusTimeoutInMills;
short modbus_plazma;				//�������
short modbus_plazma1;				//�������
short modbus_plazma2;				//�������
short modbus_plazma3;				//�������
char modbus_cmnd_cnt,modbus_cmnd,modbus_self_cmnd_cnt=33;

char modbus_registers[200];

#define MODBUS_RTU_PROT	0

extern int  mem_copy (void *dp, void *sp, int len);

//-----------------------------------------------
unsigned short CRC16_2(char* buf, short len)
{
unsigned short crc = 0xFFFF;
short pos;
short i;

for (pos = 0; pos < len; pos++)
  	{
    	crc ^= (unsigned short)buf[pos];          // XOR byte into least sig. byte of crc

    	for ( i = 8; i != 0; i--) 
		{    // Loop over each bit
      	if ((crc & 0x0001) != 0) 
			{      // If the LSB is set
        		crc >>= 1;                    // Shift right and XOR 0xA001
        		crc ^= 0xA001;
      		}
      	else  crc >>= 1;                    // Just shift right
    		}
  	}
  // Note, this number has low and high bytes swapped, so use it accordingly (or swap bytes)
return crc;
}

//-----------------------------------------------
void modbus_in(void)
{
short crc16_calculated;		//����������� �� �������� ������ CRC
short crc16_incapsulated;	//����������� � ������� CRC
unsigned short modbus_rx_arg0;		//���������� � ������� ������ ��������
unsigned short modbus_rx_arg1;		//���������� � ������� ������ ��������
//unsigned short modbus_rx_arg2;		//���������� � ������� ������ ��������
//unsigned short modbus_rx_arg3;		//���������� � ������� ��������� ��������
unsigned char modbus_func;			//���������� � ������� ��� �������

//modbus_plazma++;

memcpy(modbus_an_buffer,modbus_rx_buffer,modbus_rx_buffer_ptr);
modbus_rx_counter=modbus_rx_buffer_ptr;
modbus_rx_buffer_ptr=0;
bMODBUS_TIMEOUT=0;

	
crc16_calculated  = CRC16_2((char*)modbus_an_buffer, modbus_rx_counter-2);
crc16_incapsulated = *((short*)&modbus_an_buffer[modbus_rx_counter-2]);

//modbus_plazma=modbus_rx_counter;
//modbus_plazma2=crc16_calculated;
//modbus_plazma3=crc16_incapsulated;




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

/*
if((UIB0[0]=='w')&&(UIB0[1]=='r')&&(UIB0[2]=='i')&&(UIB0[3]=='t')&&(UIB0[4]=='e')&&(UIB0[15]==crc_87(UIB0,15))&&(UIB0[16]==crc_95(UIB0,15)))
	{
	unsigned short ptr;
	unsigned long data1,data2;
	char temp_out[20];
	ptr=UIB0[5]+(UIB0[6]*256U);
	*((char*)&data1)=UIB0[7];
	*(((char*)&data1)+1)=UIB0[8];
	*(((char*)&data1)+2)=UIB0[9];
	*(((char*)&data1)+3)=UIB0[10];
	*((char*)&data2)=UIB0[11];
	*(((char*)&data2)+1)=UIB0[12];
	*(((char*)&data2)+2)=UIB0[13];
	*(((char*)&data2)+3)=UIB0[14];	
	lc640_write_long(ptr,data1);
	lc640_write_long(ptr+4,data2);
	
	//data1=lc640_read_long(ptr);
	//data2=lc640_read_long(ptr+4);
	temp_out[0]='w';
	temp_out[1]='r';
	temp_out[2]='i';
	temp_out[3]='t';
	temp_out[4]='e';
	temp_out[5]=*((char*)&ptr);
	temp_out[6]=*(((char*)&ptr)+1);	

	temp_out[7]=crc_87(temp_out,7);	
	temp_out[8]=crc_95(temp_out,7);			
	uart_out_adr0(temp_out,9);
	}


}
	*/



modbus_func=modbus_an_buffer[1];
modbus_rx_arg0=(((unsigned short)modbus_an_buffer[2])*((unsigned short)256))+((unsigned short)modbus_an_buffer[3]);
modbus_rx_arg1=(((unsigned short)modbus_an_buffer[4])*((unsigned short)256))+((unsigned short)modbus_an_buffer[5]);
//modbus_rx_arg2=(((unsigned short)modbus_an_buffer[6])*((unsigned short)256))+((unsigned short)modbus_an_buffer[7]);
//modbus_rx_arg3=(((unsigned short)modbus_an_buffer[8])*((unsigned short)256))+((unsigned short)modbus_an_buffer[9]);
modbus_cmnd=(modbus_rx_arg1>>8)&0x7f;
modbus_cmnd_cnt=(modbus_rx_arg1)&0x0f;

modbus_plazma3=modbus_cmnd;
modbus_plazma2=modbus_cmnd_cnt;
modbus_plazma1=modbus_self_cmnd_cnt;

if(crc16_calculated==crc16_incapsulated)
	{
	if(modbus_self_cmnd_cnt==33)modbus_self_cmnd_cnt=modbus_cmnd_cnt;
	modbus_plazma=modbus_an_buffer[0];
	if(modbus_an_buffer[0]==200)	 //���� ������ �� ������
		{
		if(modbus_func==4)		//������ ������������� ���-�� ���������
			{
			modbus_for_pult_registers_transmit(7);
			}
		else if(modbus_func==6) 	//������ ��������
			{
			//if(modbus_rx_arg0==1)		//
				{
				modbus_for_pult_registers_transmit(7);
				tumbler_stat=(enum_tumbler_stat)(modbus_rx_arg1>>15);
				if((tumbler_stat!=tumbler_stat_old))
					{
					if(tumbler_stat==tsU)
						{
						lc640_write_int(EE_MAIN_MENU_MODE,mmmIN);
						}
					else lc640_write_int(EE_MAIN_MENU_MODE,mmmIT);
					
					if(main_cnt>3)
						{
						work_stat=wsOFF;
						restart_off();
						}
					}
				tumbler_stat_old=tumbler_stat;
				
				}
			 //else if(modbus_rx_arg0==0)
			 	{
				//modbus_plazma++;		
				if((modbus_cmnd==61)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))
					{
					if(I_ug<1000)I_ug++;
					else I_ug=((I_ug/10)+1)*10;
					gran(&I_ug,I_MIN_IPS,I_MAX_IPS);
					I_ug_block_cnt=10;
					//lc640_write_int(EE_I_UG,I_ug);
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
				
				
				else if((modbus_cmnd==51)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))	//�����+
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
				
						if(T_PROC_GS>T_PROC_MAX)								 	//���� ������������� ����� ��������
							{												//��� ��������� ���� ������ ��� 
							T_PROC_GS=T_PROC_MAX+1;								//������������ ����� ���������
							if(T_PROC_GS_MODE!=1)								//(�� ������� ���������) �� 
								{											//��������������� ����� ����������� 
								T_PROC_GS_MODE=1;								//������(T_PROC_GS_MODE=1), ��� �������
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);	//������� ����� � ����������� ��������� - 
								}											//����� ����������� ������ ��������� 
							}												//(T_PROC_GS_MODE=0)
					
						else if(T_PROC_GS<30)
							{
							T_PROC_GS=29;
							if(T_PROC_GS_MODE!=1)
								{
								T_PROC_GS_MODE=1;
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
								}
							}
						else 
							{
							if(T_PROC_GS_MODE!=0)
								{
								T_PROC_GS_MODE=0;
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
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
				
						if(T_PROC_PS>T_PROC_MAX)								 	//���� ������������� ����� ��������
							{												//��� ��������� ���� ������ ��� 
							T_PROC_PS=T_PROC_MAX+1;								//������������ ����� ���������
							if(T_PROC_PS_MODE!=1)								//(�� ������� ���������) �� 
								{											//��������������� ����� ����������� 
								T_PROC_PS_MODE=1;								//������(T_PROC_PS_MODE=1), ��� �������
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);	//������� ����� � ����������� ��������� - 
								}											//����� ����������� ������ ��������� 
							}												//(T_PROC_PS_MODE=0)
					
						else if(T_PROC_PS<30)
							{
							T_PROC_PS=29;
							if(T_PROC_PS_MODE!=1)
								{
								T_PROC_PS_MODE=1;
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
								}
							}
						else 
							{
							if(T_PROC_PS_MODE!=0)
								{
								T_PROC_PS_MODE=0;
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
								}
							}			
						}
					}
				else if((modbus_cmnd==53)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))	//�����++
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
				
						if(T_PROC_GS>T_PROC_MAX)								 	//���� ������������� ����� ��������
							{												//��� ��������� ���� ������ ��� 
							T_PROC_GS=T_PROC_MAX+1;								//������������ ����� ���������
							if(T_PROC_GS_MODE!=1)								//(�� ������� ���������) �� 
								{											//��������������� ����� ����������� 
								T_PROC_GS_MODE=1;								//������(T_PROC_GS_MODE=1), ��� �������
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);	//������� ����� � ����������� ��������� - 
								}											//����� ����������� ������ ��������� 
							}												//(T_PROC_GS_MODE=0)
					
						else if(T_PROC_GS<30)
							{
							T_PROC_GS=29;
							if(T_PROC_GS_MODE!=1)
								{
								T_PROC_GS_MODE=1;
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
								}
							}
						else 
							{
							if(T_PROC_GS_MODE!=0)
								{
								T_PROC_GS_MODE=0;
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
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
				
						if(T_PROC_PS>T_PROC_MAX)								 	//���� ������������� ����� ��������
							{												//��� ��������� ���� ������ ��� 
							T_PROC_PS=T_PROC_MAX+1;								//������������ ����� ���������
							if(T_PROC_PS_MODE!=1)								//(�� ������� ���������) �� 
								{											//��������������� ����� ����������� 
								T_PROC_PS_MODE=1;								//������(T_PROC_PS_MODE=1), ��� �������
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);	//������� ����� � ����������� ��������� - 
								}											//����� ����������� ������ ��������� 
							}												//(T_PROC_PS_MODE=0)
					
						else if(T_PROC_PS<30)
							{
							T_PROC_PS=29;
							if(T_PROC_PS_MODE!=1)
								{
								T_PROC_PS_MODE=1;
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
								}
							}
						else 
							{
							if(T_PROC_PS_MODE!=0)
								{
								T_PROC_PS_MODE=0;
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
								}
							}				
						}
					}
				
				else if((modbus_cmnd==52)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))	//�����-
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
				
							
						if(T_PROC_GS>T_PROC_MAX)								 	//���� ������������� ����� ��������
							{												//��� ��������� ���� ������ ��� 
							T_PROC_GS=T_PROC_MAX+1;								//������������ ����� ���������
							if(T_PROC_GS_MODE!=1)								//(�� ������� ���������) �� 
								{											//��������������� ����� ����������� 
								T_PROC_GS_MODE=1;								//������(T_PROC_GS_MODE=1), ��� �������
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);	//������� ����� � ����������� ��������� - 
								}											//����� ����������� ������ ��������� 
							}												//(T_PROC_GS_MODE=0)
					
						else if(T_PROC_GS<30)
							{
							T_PROC_GS=29;
							if(T_PROC_GS_MODE!=1)
								{
								T_PROC_GS_MODE=1;
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
								}
							}
						else 
							{
							if(T_PROC_GS_MODE!=0)
								{
								T_PROC_GS_MODE=0;
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
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
				
						if(T_PROC_PS>T_PROC_MAX)								 	//���� ������������� ����� ��������
							{												//��� ��������� ���� ������ ��� 
							T_PROC_PS=T_PROC_MAX+1;								//������������ ����� ���������
							if(T_PROC_PS_MODE!=1)								//(�� ������� ���������) �� 
								{											//��������������� ����� ����������� 
								T_PROC_PS_MODE=1;								//������(T_PROC_PS_MODE=1), ��� �������
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);	//������� ����� � ����������� ��������� - 
								}											//����� ����������� ������ ��������� 
							}												//(T_PROC_PS_MODE=0)
					
						else if(T_PROC_PS<30)
							{
							T_PROC_PS=29;
							if(T_PROC_PS_MODE!=1)
								{
								T_PROC_PS_MODE=1;
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
								}
							}
						else 
							{
							if(T_PROC_PS_MODE!=0)
								{
								T_PROC_PS_MODE=0;
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
								}
							}			
						}
					}
				else if((modbus_cmnd==54)&&(modbus_cmnd_cnt!=modbus_self_cmnd_cnt))	//�����--
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
				
						if(T_PROC_GS>T_PROC_MAX)								 	//���� ������������� ����� ��������
							{												//��� ��������� ���� ������ ��� 
							T_PROC_GS=T_PROC_MAX+1;								//������������ ����� ���������
							if(T_PROC_GS_MODE!=1)								//(�� ������� ���������) �� 
								{											//��������������� ����� ����������� 
								T_PROC_GS_MODE=1;								//������(T_PROC_GS_MODE=1), ��� �������
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);	//������� ����� � ����������� ��������� - 
								}											//����� ����������� ������ ��������� 
							}												//(T_PROC_GS_MODE=0)
					
						else if(T_PROC_GS<30)
							{
							T_PROC_GS=29;
							if(T_PROC_GS_MODE!=1)
								{
								T_PROC_GS_MODE=1;
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
								}
							}
						else 
							{
							if(T_PROC_GS_MODE!=0)
								{
								T_PROC_GS_MODE=0;
								lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
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
				
						if(T_PROC_PS>T_PROC_MAX)								 	//���� ������������� ����� ��������
							{												//��� ��������� ���� ������ ��� 
							T_PROC_PS=T_PROC_MAX+1;								//������������ ����� ���������
							if(T_PROC_PS_MODE!=1)								//(�� ������� ���������) �� 
								{											//��������������� ����� ����������� 
								T_PROC_PS_MODE=1;								//������(T_PROC_PS_MODE=1), ��� �������
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);	//������� ����� � ����������� ��������� - 
								}											//����� ����������� ������ ��������� 
							}												//(T_PROC_PS_MODE=0)
					
						else if(T_PROC_PS<30)
							{
							T_PROC_PS=29;
							if(T_PROC_PS_MODE!=1)
								{
								T_PROC_PS_MODE=1;
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
								}
							}
						else 
							{
							if(T_PROC_PS_MODE!=0)
								{
								T_PROC_PS_MODE=0;
								lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
								}
							}	
						}
					}
				
				
			//	else if((modbus_rx_arg1>>8)==90)
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
							index_set=0;
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
							index_set=0;
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
		if(modbus_func==3)		//������ ������������� ���-�� ���������
			{
			if((modbus_rx_arg0>=50)&&(modbus_rx_arg0<80)) modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_func, modbus_rx_arg0,modbus_rx_arg1, MODBUS_RTU_PROT);
			}
		else if(modbus_func==4)		//������ ������������� ���-�� ���������	������
			{
			modbus_input_registers_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0, modbus_rx_arg1, MODBUS_RTU_PROT);
			}

		else if(modbus_func==6) 	//������ ��������
			{
			if(modbus_rx_arg0==50)		//��� ������������ ��� ������ ������������ ����
				{
				I_ug=modbus_rx_arg1;
				lc640_write_int(EE_I_UG,I_ug);
				}
			if(modbus_rx_arg0==51)		//���������� ������������ ��� ������ ������������ ����������
				{
				U_up=modbus_rx_arg1;
				lc640_write_int(EE_U_UP,U_up);
				}
			if(modbus_rx_arg0==52)		//������������� ���������� ��� ������ ������������ ����
				{
				U_maxg=modbus_rx_arg1;
				lc640_write_int(EE_U_MAX_G,U_maxg);
				}
			if(modbus_rx_arg0==53)		//������������ ��� ��� ������ ������������ ����������
				{
				I_maxp=modbus_rx_arg1;
				lc640_write_int(EE_I_MAX_P,I_maxp);
				}								
			if(modbus_rx_arg0==54)		//��������� ������� ��� ���.����.�������
				{
				signed long sec,min,hour;
				sec=(signed long)modbus_rx_arg1;
				min=(T_PROC_GS/60L)%60L;
				hour=T_PROC_GS/3600L;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
				}
			if(modbus_rx_arg0==55)		//��������� ������� ��� ���.����.������
				{
				signed long sec,min,hour;
				sec=T_PROC_GS%60L;
				min=(signed long)modbus_rx_arg1;
				hour=T_PROC_GS/3600L;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
				}
			if(modbus_rx_arg0==56)		//��������� ������� ��� ���.����.����
				{
				signed long sec,min,hour;
				sec=T_PROC_GS%60L;
				min=(T_PROC_GS/60L)%60L;
				hour=(signed long)modbus_rx_arg1;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
				}
			if(modbus_rx_arg0==57)		//��������� ������� ��� ���.����.�������
				{
				signed long sec,min,hour;
				sec=(signed long)modbus_rx_arg1;
				min=(T_PROC_PS/60L)%60L;
				hour=T_PROC_PS/3600L;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
				}

			if(modbus_rx_arg0==58)		//��������� ������� ��� ���.����.������
				{
				signed long sec,min,hour;
				sec=T_PROC_PS%60L;
				min=(signed long)modbus_rx_arg1;
				hour=T_PROC_PS/3600L;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
				}

			if(modbus_rx_arg0==59)		//��������� ������� ��� ���.����.����
				{
				signed long sec,min,hour;
				sec=T_PROC_PS%60L;
				min=(T_PROC_PS/60L)%60L;
				hour=(signed long)modbus_rx_arg1;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
				}

			if(modbus_rx_arg0==60)		//���/���� ��������� ����.
				{
				if(modbus_rx_arg1==1)
					{
					if(work_stat!=wsPS)
						{
						work_stat=wsPS;
						time_proc=0;
						time_proc_remain=T_PROC_PS;
						restart_on_PS();
						lc640_write_int(EE_MAIN_MENU_MODE,mmmIN);
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
			if(modbus_rx_arg0==61)		//���/���� ��������� ����
				{
				if(modbus_rx_arg1==1)
					{
					if(work_stat!=wsGS)
						{
						work_stat=wsGS;
						time_proc=0;
						time_proc_remain=T_PROC_GS;
						lc640_write_int(EE_MAIN_MENU_MODE,mmmIT);
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

			if(modbus_rx_arg0==62)		//������������ ���� �������
				{
					{
					if(work_stat==wsOFF)
						{
						if(modbus_rx_arg1==0)REV_STAT=rsFF;
						if(modbus_rx_arg1==1)REV_STAT=rsREW;
						}
					}
				}
			if(modbus_rx_arg0==63)		//���������-���������� �����������
				{
					{
					if((work_stat==wsOFF)&&(REV_IS_ON))
						{
						if(modbus_rx_arg1==1)AVT_REV_IS_ON=1;
						if(modbus_rx_arg1==0)AVT_REV_IS_ON=0;
						lc640_write_int(EE_AVT_REV_IS_ON,AVT_REV_IS_ON);
						}
					}
				}
			if(modbus_rx_arg0==64)		//����������, ����� ������ ������, ���
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_FF=modbus_rx_arg1;
					gran(&AVT_REV_TIME_FF,30,T_PROC_MAX);
					lc640_write_int(EE_AVT_REV_TIME_FF,AVT_REV_TIME_FF);	
					}
				}
			if(modbus_rx_arg0==65)		//����������, ����� ������ ��������, ���
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_REW=modbus_rx_arg1;
					gran(&AVT_REV_TIME_REW,30,T_PROC_MAX);
					lc640_write_int(EE_AVT_REV_TIME_REW,AVT_REV_TIME_REW);	
					}
				}
			if(modbus_rx_arg0==66)		//����������, ����� ����� ��� ������������, ���
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_PAUSE=modbus_rx_arg1;
					gran(&AVT_REV_TIME_PAUSE,2,600);
					lc640_write_int(EE_AVT_REV_TIME_PAUSE,AVT_REV_TIME_PAUSE);	
					}
				}

			if(modbus_rx_arg0==67)		//����������, ��� ������������ ������, 0.1�
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_I_NOM_FF=modbus_rx_arg1;
		    			gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(EE_AVT_REV_I_NOM_FF,AVT_REV_I_NOM_FF);	
					}
				}

			if(modbus_rx_arg0==68)		//����������, ��� ������������ ��������, 0.1�
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_I_NOM_REW=modbus_rx_arg1;
		    			gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(EE_AVT_REV_I_NOM_REW,AVT_REV_I_NOM_REW);	
					}
				}
			if(modbus_rx_arg0==69)		//����������, ���������� ������������ ������, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_U_NOM_FF=modbus_rx_arg1;
		    			gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
					lc640_write_int(EE_AVT_REV_U_NOM_FF,AVT_REV_U_NOM_FF);					
					}
				}

			if(modbus_rx_arg0==70)		//����������, ���������� ������������ ��������, 0.1�
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_U_NOM_REW=modbus_rx_arg1;
		    			gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
					lc640_write_int(EE_AVT_REV_U_NOM_REW,AVT_REV_U_NOM_REW);					
					}
				}

			if(modbus_rx_arg0==71)		//����� ������ �������������� �����, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_ZAR_TIME=modbus_rx_arg1;
		    			gran(&CAP_ZAR_TIME,10,9999);
					lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
					}
				}
			if(modbus_rx_arg0==72)		//����� �����1 �������������� �����, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_PAUSE1_TIME=modbus_rx_arg1;
		    			gran(&CAP_PAUSE1_TIME,10,9999);
					lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
					}
				}
			if(modbus_rx_arg0==73)		//����� ������� �������������� �����, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_RAZR_TIME=modbus_rx_arg1;
		    			gran(&CAP_RAZR_TIME,10,9999);
					lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
					}
				}
			if(modbus_rx_arg0==74)		//����� �����2 �������������� �����, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_PAUSE2_TIME=modbus_rx_arg1;
		    			gran(&CAP_PAUSE2_TIME,10,9999);
					lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
					}
				}

			if(modbus_rx_arg0==75)		//������������ ���������� �������������� �����, 1�  
				{
				if(work_stat==wsOFF)
					{
					CAP_MAX_VOLT=modbus_rx_arg1;
		    			gran(&CAP_MAX_VOLT,1,100);
					lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
					}
				}
			if(modbus_rx_arg0==76)		//������� ��� �������������� �����, 1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_WRK_CURR=modbus_rx_arg1;
		    			gran(&CAP_WRK_CURR,1,150);
					lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
					}
				}

			if(modbus_rx_arg0==77)		//������� ��� ������ ������ 
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
						lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
						}
					}
				if(modbus_rx_arg1==0x22)
					{
					if(work_stat==wsOFF)
						{
						CAP_ZAR_TIME--;
		    				gran(&CAP_ZAR_TIME,10,9999);
						lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
						}
					}

				if(modbus_rx_arg1==0x31)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE1_TIME++;
		    				gran(&CAP_PAUSE1_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
						}
					}
				if(modbus_rx_arg1==0x32)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE1_TIME--;
		    				gran(&CAP_PAUSE1_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
						}
					}

				if(modbus_rx_arg1==0x41)
					{
					if(work_stat==wsOFF)
						{
						CAP_RAZR_TIME++;
		    				gran(&CAP_RAZR_TIME,10,9999);
						lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
						}
					}
				if(modbus_rx_arg1==0x42)
					{
					if(work_stat==wsOFF)
						{
						CAP_RAZR_TIME--;
		    				gran(&CAP_RAZR_TIME,10,9999);
						lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
						}
					}

				if(modbus_rx_arg1==0x51)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE2_TIME++;
		    				gran(&CAP_PAUSE2_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
						}
					}
				if(modbus_rx_arg1==0x52)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE2_TIME--;
		    				gran(&CAP_PAUSE2_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
						}
					}

				if(modbus_rx_arg1==0x61)
					{
					if(work_stat==wsOFF)
						{
						CAP_MAX_VOLT++;
		    				gran(&CAP_MAX_VOLT,1,100);
						lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
						}
					}
				if(modbus_rx_arg1==0x62)
					{
					if(work_stat==wsOFF)
						{
						CAP_MAX_VOLT--;
		    				gran(&CAP_MAX_VOLT,1,100);
						lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
						}
					}

				if(modbus_rx_arg1==0x71)
					{
					if(work_stat==wsOFF)
						{
						CAP_WRK_CURR++;
		    				gran(&CAP_WRK_CURR,1,150);
						lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
						}
					}
				if(modbus_rx_arg1==0x72)
					{
					if(work_stat==wsOFF)
						{
						CAP_WRK_CURR--;
		    				gran(&CAP_WRK_CURR,1,150);
						lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
						}
					}

				}

			
			if((T_PROC_GS>T_PROC_MAX)||(T_PROC_GS<30))
				{
				if(T_PROC_GS>T_PROC_MAX)T_PROC_GS=T_PROC_MAX+1;
				else if(T_PROC_GS<30)T_PROC_GS=29;
				lc640_write_int(EE_T_PROC_GS,T_PROC_GS);
				T_PROC_GS_MODE=1;	
				lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
				}
			if((T_PROC_GS<=T_PROC_MAX)&&(T_PROC_GS>=30))
				{
				T_PROC_GS_MODE=0;	
				lc640_write_int(EE_T_PROC_GS_MODE,T_PROC_GS_MODE);
				}
			
			if((T_PROC_PS>T_PROC_MAX)||(T_PROC_PS<30))
				{
				if(T_PROC_PS>T_PROC_MAX)T_PROC_PS=T_PROC_MAX+1;
				else if(T_PROC_PS<30)T_PROC_PS=29;
				lc640_write_int(EE_T_PROC_PS,T_PROC_PS);
				T_PROC_PS_MODE=1;	
				lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
				}
			if((T_PROC_PS<=T_PROC_MAX)&&(T_PROC_PS>=30))
				{
				T_PROC_PS_MODE=0;	
				lc640_write_int(EE_T_PROC_PS_MODE,T_PROC_PS_MODE);
				}

			modbus_hold_register_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0);


			//modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0,2);


			}
		} 
	//;
	}
// modbus_plazma++;

}

//-----------------------------------------------
void modbus_input_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short reg_quantity, char prot)
{
//char modbus_registers[110];
char modbus_tx_buff[200];
unsigned short crc_temp;
char i;
/*
load_U=1234;
load_I=5678;
time_proc=361233UL;//1357;
time_proc_remain=722444UL;//1357;

bVOLT_IS_NOT_DOWN=0;
bVOLT_IS_NOT_UP=1;	*/

modbus_registers[0]=(char)(load_U/256);					//���1
modbus_registers[1]=(char)(load_U%256);
modbus_registers[2]=(char)(load_I/256);					//���2
modbus_registers[3]=(char)(load_I%256);
modbus_registers[4]=(char)((time_proc%60)/256);			//���3
modbus_registers[5]=(char)((time_proc%60)%256);
modbus_registers[6]=(char)(((time_proc/60)%60)/256);		//���4
modbus_registers[7]=(char)(((time_proc/60)%60)%256);
modbus_registers[8]=(char)((time_proc/3600)/256);			//���5
modbus_registers[9]=(char)((time_proc/3600)%256);		 	
modbus_registers[10]=(char)((time_proc_remain%60)/256);	//���6
modbus_registers[11]=(char)((time_proc_remain%60)%256);
modbus_registers[12]=(char)(((time_proc_remain/60)%60)/256);//���7
modbus_registers[13]=(char)(((time_proc_remain/60)%60)%256);
modbus_registers[14]=(char)((time_proc_remain/3600)/256);	//���8
modbus_registers[15]=(char)((time_proc_remain/3600)%256);
modbus_registers[16]=(char)((CAP_COUNTER)/256);			//���9
modbus_registers[17]=(char)((CAP_COUNTER)%256);
modbus_registers[18]=(char)((CAP_TIME_SEC)/256);			//���10
modbus_registers[19]=(char)((CAP_TIME_SEC)%256);
modbus_registers[20]=(char)((CAP_TIME_MIN)/256);			//���11
modbus_registers[21]=(char)((CAP_TIME_MIN)%256);
modbus_registers[22]=(char)((CAP_TIME_HOUR)/256);			//���12
modbus_registers[23]=(char)((CAP_TIME_HOUR)%256);
modbus_registers[24]=0;
modbus_registers[25]=0;										//���13
if(bVOLT_IS_NOT_DOWN)	modbus_registers[25]=1;
modbus_registers[26]=0;
modbus_registers[27]=0;										//���14
if(bVOLT_IS_NOT_UP)	modbus_registers[27]=1;
								
/*
modbus_registers[16]=(char)(I_ug/256);					//���9
modbus_registers[17]=(char)(I_ug%256);
modbus_registers[18]=(char)(U_up/256);					//���10
modbus_registers[19]=(char)(U_up%256);
modbus_registers[20]=(char)(U_maxg/256);				//���11
modbus_registers[21]=(char)(U_maxg%256);
modbus_registers[22]=(char)(I_maxp/256);				//���12
modbus_registers[23]=(char)(I_maxp%256);
modbus_registers[24]=(char)((T_PROC_GS%60)/256);			//���13
modbus_registers[25]=(char)((T_PROC_GS%60)%256);
modbus_registers[26]=(char)((T_PROC_GS/60)/256);			//���14
modbus_registers[27]=(char)((T_PROC_GS/60)%256);
modbus_registers[28]=(char)((T_PROC_GS/3600)/256);		//���15
modbus_registers[29]=(char)((T_PROC_GS/3600)%256);
modbus_registers[30]=(char)((T_PROC_PS%60)/256);			//���16
modbus_registers[31]=(char)((T_PROC_PS%60)%256);
modbus_registers[32]=(char)((T_PROC_PS/60)/256);			//���17
modbus_registers[33]=(char)((T_PROC_PS/60)%256);
modbus_registers[34]=(char)((T_PROC_PS/3600)/256);		//���18
modbus_registers[35]=(char)((T_PROC_PS/3600)%256);
modbus_registers[36]=0;								//���19
modbus_registers[37]=0;
if(work_stat==wsPS)modbus_registers[37]=1;
modbus_registers[38]=0;								//���20
modbus_registers[39]=0;
if(work_stat==wsGS)modbus_registers[39]=1;
modbus_registers[40]=0;								//���21
modbus_registers[41]=0;
if(REV_STAT==rsREW)modbus_registers[41]=1;
modbus_registers[42]=0;								//���22
modbus_registers[43]=0;
if(AVT_REV_IS_ON)modbus_registers[42]=1;
*/
if(prot==MODBUS_RTU_PROT)
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
else if(prot==MODBUS_TCP_PROT)
	{
	modbus_tcp_out_ptr=(char*)&modbus_registers[(reg_adr-1)*2];
	}
}


//-----------------------------------------------
void modbus_for_pult_registers_transmit(unsigned short reg_quantity)
{
char modbus_registers[20];
char modbus_tx_buff[30];
unsigned short crc_temp;
char i;
//char reg_quantity=4;

//pult_time_set=0xffff;

modbus_registers[0]=(char)(pult_u%256);
modbus_registers[1]=(char)(pult_u/256);					//���1
modbus_registers[2]=(char)(pult_i%256);
modbus_registers[3]=(char)(pult_i/256);					//���2
modbus_registers[4]=(char)(pult_work_stat%256);
modbus_registers[5]=(char)(pult_work_stat/256);			//���3
modbus_registers[6]=(char)(pult_u_set%256);
modbus_registers[7]=(char)(pult_u_set/256);				//���4
modbus_registers[8]=(char)(pult_time%256);
modbus_registers[9]=(char)(pult_time/256);				//���5
modbus_registers[10]=(char)(pult_time_set%256);		 	
modbus_registers[11]=(char)(pult_time_set/256);			//���6
modbus_registers[12]=(char)(pult_i_set%256);
modbus_registers[13]=(char)(pult_i_set/256);				//���7


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
//modbus_plazma1++;
}


/*
//-----------------------------------------------
void modbus_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr)
{
char modbus_registers[120];
char modbus_tx_buff[100];
unsigned short crc_temp;
char i;

modbus_registers[0]=(char)(load_U/256);					//���1
modbus_registers[1]=(char)(load_U%256);
modbus_registers[2]=(char)(load_I/256);					//���2
modbus_registers[3]=(char)(load_I%256);
modbus_registers[4]=(char)((time_proc%60)/256);			//���3
modbus_registers[5]=(char)((time_proc%60)%256);
modbus_registers[6]=(char)((time_proc/60)/256);			//���4
modbus_registers[7]=(char)((time_proc/60)%256);
modbus_registers[8]=(char)((time_proc/3600)/256);			//���5
modbus_registers[9]=(char)((time_proc/3600)%256);		 	
modbus_registers[10]=(char)((time_proc_remain%60)/256);	//���6
modbus_registers[11]=(char)((time_proc_remain%60)%256);
modbus_registers[12]=(char)((time_proc_remain/60)/256);	//���7
modbus_registers[13]=(char)((time_proc_remain/60)%256);
modbus_registers[14]=(char)((time_proc_remain/3600)/256);	//���8
modbus_registers[15]=(char)((time_proc_remain/3600)%256);
modbus_registers[16]=(char)(I_ug/256);					//���9
modbus_registers[17]=(char)(I_ug%256);
modbus_registers[18]=(char)(U_up/256);					//���10
modbus_registers[19]=(char)(U_up%256);
modbus_registers[20]=(char)(U_maxg/256);				//���11
modbus_registers[21]=(char)(U_maxg%256);
modbus_registers[22]=(char)(I_maxp/256);				//���12
modbus_registers[23]=(char)(I_maxp%256);
modbus_registers[24]=(char)((T_PROC_GS%60)/256);			//���13
modbus_registers[25]=(char)((T_PROC_GS%60)%256);
modbus_registers[26]=(char)((T_PROC_GS/60)/256);			//���14
modbus_registers[27]=(char)((T_PROC_GS/60)%256);
modbus_registers[28]=(char)((T_PROC_GS/3600)/256);		//���15
modbus_registers[29]=(char)((T_PROC_GS/3600)%256);
modbus_registers[30]=(char)((T_PROC_PS%60)/256);			//���16
modbus_registers[31]=(char)((T_PROC_PS%60)%256);
modbus_registers[32]=(char)((T_PROC_PS/60)/256);			//���17
modbus_registers[33]=(char)((T_PROC_PS/60)%256);
modbus_registers[34]=(char)((T_PROC_PS/3600)/256);		//���18
modbus_registers[35]=(char)((T_PROC_PS/3600)%256);
modbus_registers[36]=0;								//���19
modbus_registers[37]=0;
if(work_stat==wsPS)modbus_registers[37]=1;
modbus_registers[38]=0;								//���20
modbus_registers[39]=0;
if(work_stat==wsGS)modbus_registers[39]=1;
modbus_registers[40]=0;								//���21
modbus_registers[41]=0;
if(REV_STAT==rsREW)modbus_registers[41]=1;
modbus_registers[42]=0;								//���22
modbus_registers[43]=0;
if(AVT_REV_IS_ON)modbus_registers[42]=1;

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
modbus_tx_buff[2]=(char)(reg_adr/256);
modbus_tx_buff[3]=(char)(reg_adr%256);
//modbus_tx_buff[4]=(char)(reg_quantity/256);
//modbus_tx_buff[5]=(char)(reg_quantity%256);


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
}  */


//-----------------------------------------------
void modbus_hold_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr)
{
char modbus_registers[120];
char modbus_tx_buff[100];
unsigned short crc_temp;
char i;

modbus_registers[0]=(char)(I_ug/256);					//���50
modbus_registers[1]=(char)(I_ug%256);
modbus_registers[2]=(char)(U_up/256);					//���51
modbus_registers[3]=(char)(U_up%256);
modbus_registers[4]=(char)(U_maxg/256);					//���52
modbus_registers[5]=(char)(U_maxg%256);
modbus_registers[6]=(char)(I_maxp/256);					//���53
modbus_registers[7]=(char)(I_maxp%256);
modbus_registers[8]=(char)((T_PROC_GS%60)/256);			//���54
modbus_registers[9]=(char)((T_PROC_GS%60)%256);
modbus_registers[10]=(char)(((T_PROC_GS/60)%60)/256);		//���55
modbus_registers[11]=(char)(((T_PROC_GS/60)%60)%256);
modbus_registers[12]=(char)((T_PROC_GS/3600)/256);		//���56
modbus_registers[13]=(char)((T_PROC_GS/3600)%256);
modbus_registers[14]=(char)((T_PROC_PS%60)/256);			//���57
modbus_registers[15]=(char)((T_PROC_PS%60)%256);
modbus_registers[16]=(char)(((T_PROC_PS/60)%60)/256);		//���58
modbus_registers[17]=(char)(((T_PROC_PS/60)%60)%256);
modbus_registers[18]=(char)((T_PROC_PS/3600)/256);		//���59
modbus_registers[19]=(char)((T_PROC_PS/3600)%256);
modbus_registers[20]=0;								//���60
modbus_registers[21]=0;
if(work_stat==wsPS)modbus_registers[21]=1;
modbus_registers[22]=0;								//���61
modbus_registers[23]=0;
if(work_stat==wsGS)modbus_registers[23]=1;
modbus_registers[24]=0;								//���62
modbus_registers[25]=0;
if(REV_STAT==rsREW)modbus_registers[25]=1;
modbus_registers[26]=0;								//���63
modbus_registers[27]=0;
if(AVT_REV_IS_ON)modbus_registers[27]=1;
modbus_registers[28]=(char)((AVT_REV_TIME_FF)/256);		//���64
modbus_registers[29]=(char)((AVT_REV_TIME_FF)%256);
modbus_registers[30]=(char)((AVT_REV_TIME_REW)/256);		//���65
modbus_registers[31]=(char)((AVT_REV_TIME_REW)%256);
modbus_registers[32]=(char)((AVT_REV_TIME_PAUSE)/256);		//���66
modbus_registers[33]=(char)((AVT_REV_TIME_PAUSE)%256);
modbus_registers[34]=(char)((AVT_REV_I_NOM_FF)/256);		//���67
modbus_registers[35]=(char)((AVT_REV_I_NOM_FF)%256);
modbus_registers[36]=(char)((AVT_REV_I_NOM_REW)/256);		//���68
modbus_registers[37]=(char)((AVT_REV_I_NOM_REW)%256);
modbus_registers[38]=(char)((AVT_REV_U_NOM_FF)/256);		//���69
modbus_registers[39]=(char)((AVT_REV_U_NOM_FF)%256);
modbus_registers[40]=(char)((AVT_REV_U_NOM_REW)/256);		//���70
modbus_registers[41]=(char)((AVT_REV_U_NOM_REW)%256);
modbus_registers[42]=(char)((CAP_ZAR_TIME)/256);			//���71
modbus_registers[43]=(char)((CAP_ZAR_TIME)%256);
modbus_registers[44]=(char)((CAP_PAUSE1_TIME)/256);		//���72
modbus_registers[45]=(char)((CAP_PAUSE1_TIME)%256);
modbus_registers[46]=(char)((CAP_RAZR_TIME)/256);			//���73
modbus_registers[47]=(char)((CAP_RAZR_TIME)%256);
modbus_registers[48]=(char)((CAP_PAUSE2_TIME)/256);		//���74
modbus_registers[49]=(char)((CAP_PAUSE2_TIME)%256);
modbus_registers[50]=(char)((CAP_MAX_VOLT)/256);			//���75
modbus_registers[51]=(char)((CAP_MAX_VOLT)%256);
modbus_registers[52]=(char)((CAP_WRK_CURR)/256);			//���76
modbus_registers[53]=(char)((CAP_WRK_CURR)%256);

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
modbus_tx_buff[2]=(char)(reg_adr/256);
modbus_tx_buff[3]=(char)(reg_adr%256);
//modbus_tx_buff[4]=(char)(reg_quantity/256);
//modbus_tx_buff[5]=(char)(reg_quantity%256);


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


//-----------------------------------------------
void modbus_hold_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short reg_quantity, char prot)
{
//char modbus_registers[110];
char modbus_tx_buff[200];
unsigned short crc_temp;
char i;

//reg_adr=45;
//I_ug=reg_adr;
//U_up=5678;

modbus_registers[0]=(char)(lc640_read_int(EE_I_UG)/256);//���50
modbus_registers[1]=(char)(lc640_read_int(EE_I_UG)%256);
modbus_registers[2]=(char)(lc640_read_int(EE_U_UP)/256);//���51
modbus_registers[3]=(char)(lc640_read_int(EE_U_UP)%256);
modbus_registers[4]=(char)(U_maxg/256);					//���52
modbus_registers[5]=(char)(U_maxg%256);
modbus_registers[6]=(char)(I_maxp/256);					//���53
modbus_registers[7]=(char)(I_maxp%256);
modbus_registers[8]=(char)((T_PROC_GS%60)/256);			//���54
modbus_registers[9]=(char)((T_PROC_GS%60)%256);
modbus_registers[10]=(char)(((T_PROC_GS/60)%60)/256);		//���55
modbus_registers[11]=(char)(((T_PROC_GS/60)%60)%256);
modbus_registers[12]=(char)((T_PROC_GS/3600)/256);		//���56
modbus_registers[13]=(char)((T_PROC_GS/3600)%256);
modbus_registers[14]=(char)((T_PROC_PS%60)/256);			//���57
modbus_registers[15]=(char)((T_PROC_PS%60)%256);
modbus_registers[16]=(char)(((T_PROC_PS/60)%60)/256);		//���58
modbus_registers[17]=(char)(((T_PROC_PS/60)%60)%256);
modbus_registers[18]=(char)((T_PROC_PS/3600)/256);		//���59
modbus_registers[19]=(char)((T_PROC_PS/3600)%256);
modbus_registers[20]=0;								//���60
modbus_registers[21]=0;
if(work_stat==wsPS)modbus_registers[21]=1;
modbus_registers[22]=0;								//���61
modbus_registers[23]=0;
if(work_stat==wsGS)modbus_registers[23]=1;
modbus_registers[24]=0;								//���62
modbus_registers[25]=0;
if(REV_STAT==rsREW)modbus_registers[25]=1;
modbus_registers[26]=0;								//���63
modbus_registers[27]=0;
if(AVT_REV_IS_ON)modbus_registers[27]=1;
modbus_registers[28]=(char)((AVT_REV_TIME_FF)/256);		//���64
modbus_registers[29]=(char)((AVT_REV_TIME_FF)%256);
modbus_registers[30]=(char)((AVT_REV_TIME_REW)/256);		//���65
modbus_registers[31]=(char)((AVT_REV_TIME_REW)%256);
modbus_registers[32]=(char)((AVT_REV_TIME_PAUSE)/256);		//���66
modbus_registers[33]=(char)((AVT_REV_TIME_PAUSE)%256);
modbus_registers[34]=(char)((AVT_REV_I_NOM_FF)/256);		//���67
modbus_registers[35]=(char)((AVT_REV_I_NOM_FF)%256);
modbus_registers[36]=(char)((AVT_REV_I_NOM_REW)/256);		//���68
modbus_registers[37]=(char)((AVT_REV_I_NOM_REW)%256);
modbus_registers[38]=(char)((AVT_REV_U_NOM_FF)/256);		//���69
modbus_registers[39]=(char)((AVT_REV_U_NOM_FF)%256);
modbus_registers[40]=(char)((AVT_REV_U_NOM_REW)/256);		//���70
modbus_registers[41]=(char)((AVT_REV_U_NOM_REW)%256);
modbus_registers[42]=(char)((CAP_ZAR_TIME)/256);			//���71
modbus_registers[43]=(char)((CAP_ZAR_TIME)%256);
modbus_registers[44]=(char)((CAP_PAUSE1_TIME)/256);		//���72
modbus_registers[45]=(char)((CAP_PAUSE1_TIME)%256);
modbus_registers[46]=(char)((CAP_RAZR_TIME)/256);			//���73
modbus_registers[47]=(char)((CAP_RAZR_TIME)%256);
modbus_registers[48]=(char)((CAP_PAUSE2_TIME)/256);		//���74
modbus_registers[49]=(char)((CAP_PAUSE2_TIME)%256);
modbus_registers[50]=(char)((CAP_MAX_VOLT)/256);			//���75
modbus_registers[51]=(char)((CAP_MAX_VOLT)%256);
modbus_registers[52]=(char)((CAP_WRK_CURR)/256);			//���76
modbus_registers[53]=(char)((CAP_WRK_CURR)%256);

modbus_registers[80]=(char)((I_ug_ram)/256);			//���90
modbus_registers[81]=(char)((I_ug_ram)%256);
modbus_registers[82]=(char)((U_up_ram)/256);			//���91
modbus_registers[83]=(char)((U_up_ram)%256);

if(prot==MODBUS_RTU_PROT)
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
else if(prot==MODBUS_TCP_PROT)
	{
	modbus_tcp_out_ptr=(char*)&modbus_registers[(reg_adr-50)*2];
	}
// modbus_tcp_out_ptr=(char*)(&modbus_registers[0]);
//modbus_tcp_out_ptr=(char*)&modbus_registers[(reg_adr-50)*2];
}


