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

char modbus_registers[300];

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

pvlk=0;


if(modbus_an_buffer[0]=='r')
	{
	pvlk=1;
	if(modbus_an_buffer[1]=='e')
		{
		pvlk=2;
		if(modbus_an_buffer[2]=='a')
			{
			pvlk=3;
			if(modbus_an_buffer[3]=='d')
				{
				pvlk=4;
				/*if(modbus_an_buffer[6]==crc_87(modbus_an_buffer,6))
					{
					pvlk=5;
					if(modbus_an_buffer[7]==crc_95(modbus_an_buffer,6))
						{
						pvlk=6;*/	

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
						}
					}
				}/*
			} 
		}*/	 
	} 

if(modbus_an_buffer[0]=='w')
	{
	pvlk=1;
	if(modbus_an_buffer[1]=='r')
		{
		pvlk=2;
		if(modbus_an_buffer[2]=='i')
			{
			pvlk=3;
			if(modbus_an_buffer[3]=='t')
				{
				pvlk=4;
				if(modbus_an_buffer[4]=='e')
					{
					pvlk=5;
					if(modbus_an_buffer[15]==crc_87(modbus_an_buffer,15))
						{
						pvlk=6;
						if(modbus_an_buffer[16]==crc_95(modbus_an_buffer,15))

							{
							unsigned short ptr;
							unsigned long data1,data2;
							char temp_out[20];
							pvlk=7;
							ptr=modbus_an_buffer[5]+(modbus_an_buffer[6]*256U);
							*((char*)&data1)=modbus_an_buffer[7];
							*(((char*)&data1)+1)=modbus_an_buffer[8];
							*(((char*)&data1)+2)=modbus_an_buffer[9];
							*(((char*)&data1)+3)=modbus_an_buffer[10];
							*((char*)&data2)=modbus_an_buffer[11];
							*(((char*)&data2)+1)=modbus_an_buffer[12];
							*(((char*)&data2)+2)=modbus_an_buffer[13];
							*(((char*)&data2)+3)=modbus_an_buffer[14];	
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
							
							temp_out[10]=0;
							for (i=0;i<9;i++)
								{
								putchar_sc16is700(temp_out[i]);
								temp_out[10]^=temp_out[i];
								}
							putchar_sc16is700(9);
							putchar_sc16is700(temp_out[10]^9);
							putchar_sc16is700(0x0a);
							}
						}
					}
				}
		   	}
		}
	}

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
			if((modbus_rx_arg0>=50)&&(modbus_rx_arg0<100)) modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_func, modbus_rx_arg0,modbus_rx_arg1, MODBUS_RTU_PROT);
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
/*					if(work_stat!=wsPS)
						{
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
						lc640_write_int(EE_MAIN_MENU_MODE,mmmIN);
						}*/
					start_PS();
					}
				if(modbus_rx_arg1==0)
					{
					/*if(work_stat==wsPS)
						{
						work_stat=wsOFF;
						restart_off();
						}*/
					stop_proc();
					}
				}
			if(modbus_rx_arg0==61)		//���/���� ��������� ����
				{
				if(modbus_rx_arg1==1)
					{
					/*if(work_stat!=wsGS)
						{
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
						lc640_write_int(EE_MAIN_MENU_MODE,mmmIT);
						}*/
					start_GS();
					}
				if(modbus_rx_arg1==0)
					{
					/*if(work_stat==wsGS)
						{
						work_stat=wsOFF;
						restart_off();
						} */
					stop_proc();
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
					gran_u/*long*/(&AVT_REV_TIME_FF,30,T_PROC_MAX);
					lc640_write_int(EE_AVT_REV_TIME_FF,AVT_REV_TIME_FF);	
					}
				}
			if(modbus_rx_arg0==65)		//����������, ����� ������ ��������, ���
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_REW=modbus_rx_arg1;
					gran_u/*long*/(&AVT_REV_TIME_REW,30,T_PROC_MAX);
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

				if(modbus_rx_arg1==0x80)
					{
					if(RELE_FUNC[0]==6)
						{
						rele_ext_cntrl[0]=0;					
						}
					}
				if(modbus_rx_arg1==0x81)
					{
					if(RELE_FUNC[0]==6)
						{
						rele_ext_cntrl[0]=1;					
						}
					}
				if(modbus_rx_arg1==0x82)
					{
					if(RELE_FUNC[1]==6)
						{
						rele_ext_cntrl[1]=0;					
						}
					}
				if(modbus_rx_arg1==0x83)
					{
					if(RELE_FUNC[1]==6)
						{
						rele_ext_cntrl[1]=1;					
						}
					}
				}

			if(modbus_rx_arg0==80)		//��� ���������� � ������ ����������������� ���������� 
				{
				pwm_u_reg = modbus_rx_arg1;
				}

			if(modbus_rx_arg0==81)		//��� ���� � ������ ����������������� ���������� 
				{
				pwm_i_reg = modbus_rx_arg1;
				}

			if(modbus_rx_arg0==82)		//������� ������� � ������ ����������������� ���������� 
				{
				pwm_t_reg = modbus_rx_arg1*10;
				}

			if(modbus_rx_arg0==90)		//��� ������������ ��� ������ ������������ ����, � ���
				{
				I_ug_ram=modbus_rx_arg1;
				eepromRamSwitch=1;
				ramModbusCnt=300;
				}

			if(modbus_rx_arg0==91)	//���������� ������������ ��� ������ ������������ ����������, � ���
				{
				U_up_ram=modbus_rx_arg1;
				eepromRamSwitch=1;
				ramModbusCnt=300;
				}

			if(modbus_rx_arg0==92)		//���/���� ��������� ����.
				{
				if(modbus_rx_arg1==1)
					{
					if(work_stat!=wsPS)
						{
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
				ramModbusCnt=300;
				}
			if(modbus_rx_arg0==93)		//���/���� ��������� ����
				{
				if(modbus_rx_arg1==1)
					{
					if(work_stat!=wsGS)
						{
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
				ramModbusCnt=300;
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

			modbus_hold_register_answer_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0,modbus_rx_arg1);


			if((modbus_rx_arg0!=90)&&(modbus_rx_arg0!=91)&&(modbus_rx_arg0!=92)&&(modbus_rx_arg0!=93)) lc640_write_int(EE_EE_WRITE_CNT,EE_WRITE_CNT+1);
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
bVOLT_IS_NOT_UP=1;	
*/
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
{
char i;
for (i=0;i<30;i++)
	{
	bps[i]._Uii=500+i;
	bps[i]._Ii=400+i;
	bps[i]._Ti=100+i;
	bps[i]._av=1+i;
	}
}*/
modbus_registers[42]=(signed char)(bps[0]._Uii>>8);			//���22	�������� ���������� ����������� �1, 0.1�
modbus_registers[43]=(signed char)(bps[0]._Uii);
modbus_registers[44]=(signed char)(bps[0]._Ii>>8);				//���23	�������� ��� ����������� �1, 0.1�
modbus_registers[45]=(signed char)(bps[0]._Ii);
modbus_registers[46]=(signed char)(bps[0]._Ti>>8);				//���24	����������� ��������� ����������� �1, 1��
modbus_registers[47]=(signed char)(bps[0]._Ti);
modbus_registers[48]=(signed char)(bps[0]._av>>8);				//���25	���� ������ ����������� �1, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[49]=(signed char)(bps[0]._av);
modbus_registers[50]=(signed char)(bps[1]._Uii>>8);			//���26	�������� ���������� ����������� �2, 0.1�
modbus_registers[51]=(signed char)(bps[1]._Uii);
modbus_registers[52]=(signed char)(bps[1]._Ii>>8);				//���27	�������� ��� ����������� �2, 0.1�
modbus_registers[53]=(signed char)(bps[1]._Ii);
modbus_registers[54]=(signed char)(bps[1]._Ti>>8);				//���28	����������� ��������� ����������� �2, 1��
modbus_registers[55]=(signed char)(bps[1]._Ti);
modbus_registers[56]=(signed char)(bps[1]._av>>8);				//���29	���� ������ ����������� �2, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[57]=(signed char)(bps[1]._av);
modbus_registers[58]=(signed char)(bps[2]._Uii>>8);			//���30	�������� ���������� ����������� �3, 0.1�
modbus_registers[59]=(signed char)(bps[2]._Uii);
modbus_registers[60]=(signed char)(bps[2]._Ii>>8);				//���31	�������� ��� ����������� �3, 0.1�
modbus_registers[61]=(signed char)(bps[2]._Ii);
modbus_registers[62]=(signed char)(bps[2]._Ti>>8);				//���32	����������� ��������� ����������� �3, 1��
modbus_registers[63]=(signed char)(bps[2]._Ti);
modbus_registers[64]=(signed char)(bps[2]._av>>8);				//���33	���� ������ ����������� �3, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[65]=(signed char)(bps[2]._av);
modbus_registers[66]=(signed char)(bps[3]._Uii>>8);			//���34	�������� ���������� ����������� �4, 0.1�
modbus_registers[67]=(signed char)(bps[3]._Uii);
modbus_registers[68]=(signed char)(bps[3]._Ii>>8);				//���35	�������� ��� ����������� �4, 0.1�
modbus_registers[69]=(signed char)(bps[3]._Ii);
modbus_registers[70]=(signed char)(bps[3]._Ti>>8);				//���36	����������� ��������� ����������� �4, 1��
modbus_registers[71]=(signed char)(bps[3]._Ti);
modbus_registers[72]=(signed char)(bps[3]._av>>8);				//���37	���� ������ ����������� �4, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[73]=(signed char)(bps[3]._av);
modbus_registers[74]=(signed char)(bps[4]._Uii>>8);			//���38	�������� ���������� ����������� �5, 0.1�
modbus_registers[75]=(signed char)(bps[4]._Uii);
modbus_registers[76]=(signed char)(bps[4]._Ii>>8);				//���39	�������� ��� ����������� �5, 0.1�
modbus_registers[77]=(signed char)(bps[4]._Ii);
modbus_registers[78]=(signed char)(bps[4]._Ti>>8);				//���40	����������� ��������� ����������� �5, 1��
modbus_registers[79]=(signed char)(bps[4]._Ti);
modbus_registers[80]=(signed char)(bps[4]._av>>8);				//���41	���� ������ ����������� �5, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[81]=(signed char)(bps[4]._av);
modbus_registers[82]=(signed char)(bps[5]._Uii>>8);			//���42	�������� ���������� ����������� �6, 0.1�
modbus_registers[83]=(signed char)(bps[5]._Uii);
modbus_registers[84]=(signed char)(bps[5]._Ii>>8);				//���43	�������� ��� ����������� �6, 0.1�
modbus_registers[85]=(signed char)(bps[5]._Ii);
modbus_registers[86]=(signed char)(bps[5]._Ti>>8);				//���44	����������� ��������� ����������� �6, 1��
modbus_registers[87]=(signed char)(bps[5]._Ti);
modbus_registers[88]=(signed char)(bps[5]._av>>8);				//���45	���� ������ ����������� �6, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[89]=(signed char)(bps[5]._av);
modbus_registers[90]=(signed char)(bps[6]._Uii>>8);			//���46	�������� ���������� ����������� �7, 0.1�
modbus_registers[91]=(signed char)(bps[6]._Uii);
modbus_registers[92]=(signed char)(bps[6]._Ii>>8);				//���47	�������� ��� ����������� �7, 0.1�
modbus_registers[93]=(signed char)(bps[6]._Ii);
modbus_registers[94]=(signed char)(bps[6]._Ti>>8);				//���48	����������� ��������� ����������� �7, 1��
modbus_registers[95]=(signed char)(bps[6]._Ti);
modbus_registers[96]=(signed char)(bps[6]._av>>8);				//���49	���� ������ ����������� �7, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[97]=(signed char)(bps[6]._av);
modbus_registers[98]=(signed char)(bps[7]._Uii>>8);			//���50	�������� ���������� ����������� �8, 0.1�
modbus_registers[99]=(signed char)(bps[7]._Uii);
modbus_registers[100]=(signed char)(bps[7]._Ii>>8);			//���51	�������� ��� ����������� �8, 0.1�
modbus_registers[101]=(signed char)(bps[7]._Ii);
modbus_registers[102]=(signed char)(bps[7]._Ti>>8);			//���52	����������� ��������� ����������� �8, 1��
modbus_registers[103]=(signed char)(bps[7]._Ti);
modbus_registers[104]=(signed char)(bps[7]._av>>8);			//���53	���� ������ ����������� �8, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[105]=(signed char)(bps[7]._av);
modbus_registers[106]=(signed char)(bps[8]._Uii>>8);			//���54	�������� ���������� ����������� �7, 0.1�
modbus_registers[107]=(signed char)(bps[8]._Uii);
modbus_registers[108]=(signed char)(bps[8]._Ii>>8);				//���55	�������� ��� ����������� �7, 0.1�
modbus_registers[109]=(signed char)(bps[8]._Ii);
modbus_registers[110]=(signed char)(bps[8]._Ti>>8);				//���56	����������� ��������� ����������� �7, 1��
modbus_registers[111]=(signed char)(bps[8]._Ti);
modbus_registers[112]=(signed char)(bps[8]._av>>8);				//���57	���� ������ ����������� �7, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[113]=(signed char)(bps[8]._av);
modbus_registers[114]=(signed char)(bps[9]._Uii>>8);			//���58	�������� ���������� ����������� �8, 0.1�
modbus_registers[115]=(signed char)(bps[9]._Uii);
modbus_registers[116]=(signed char)(bps[9]._Ii>>8);			//���59	�������� ��� ����������� �8, 0.1�
modbus_registers[117]=(signed char)(bps[9]._Ii);
modbus_registers[118]=(signed char)(bps[9]._Ti>>8);			//���60	����������� ��������� ����������� �8, 1��
modbus_registers[119]=(signed char)(bps[9]._Ti);
modbus_registers[120]=(signed char)(bps[9]._av>>8);			//���61	���� ������ ����������� �8, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[121]=(signed char)(bps[9]._av);

modbus_registers[122]=(signed char)(bps[10]._Uii>>8);			//���62	�������� ���������� ����������� �1, 0.1�
modbus_registers[123]=(signed char)(bps[10]._Uii);
modbus_registers[124]=(signed char)(bps[10]._Ii>>8);				//���63	�������� ��� ����������� �1, 0.1�
modbus_registers[125]=(signed char)(bps[10]._Ii);
modbus_registers[126]=(signed char)(bps[10]._Ti>>8);				//���64	����������� ��������� ����������� �1, 1��
modbus_registers[127]=(signed char)(bps[10]._Ti);
modbus_registers[128]=(signed char)(bps[10]._av>>8);				//���65	���� ������ ����������� �1, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[129]=(signed char)(bps[10]._av);
modbus_registers[130]=(signed char)(bps[11]._Uii>>8);			//���66	�������� ���������� ����������� �2, 0.1�
modbus_registers[131]=(signed char)(bps[11]._Uii);
modbus_registers[132]=(signed char)(bps[11]._Ii>>8);				//���67	�������� ��� ����������� �2, 0.1�
modbus_registers[133]=(signed char)(bps[11]._Ii);
modbus_registers[134]=(signed char)(bps[11]._Ti>>8);				//���68	����������� ��������� ����������� �2, 1��
modbus_registers[135]=(signed char)(bps[11]._Ti);
modbus_registers[136]=(signed char)(bps[11]._av>>8);				//���69	���� ������ ����������� �2, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[137]=(signed char)(bps[11]._av);
modbus_registers[138]=(signed char)(bps[12]._Uii>>8);			//���70	�������� ���������� ����������� �3, 0.1�
modbus_registers[139]=(signed char)(bps[12]._Uii);
modbus_registers[140]=(signed char)(bps[12]._Ii>>8);				//���71	�������� ��� ����������� �3, 0.1�
modbus_registers[141]=(signed char)(bps[12]._Ii);
modbus_registers[142]=(signed char)(bps[12]._Ti>>8);				//���72	����������� ��������� ����������� �3, 1��
modbus_registers[143]=(signed char)(bps[12]._Ti);
modbus_registers[144]=(signed char)(bps[12]._av>>8);				//���73	���� ������ ����������� �3, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[145]=(signed char)(bps[12]._av);
modbus_registers[146]=(signed char)(bps[13]._Uii>>8);			//���74	�������� ���������� ����������� �4, 0.1�
modbus_registers[147]=(signed char)(bps[13]._Uii);
modbus_registers[148]=(signed char)(bps[13]._Ii>>8);				//���75	�������� ��� ����������� �4, 0.1�
modbus_registers[149]=(signed char)(bps[13]._Ii);
modbus_registers[150]=(signed char)(bps[13]._Ti>>8);				//���76	����������� ��������� ����������� �4, 1��
modbus_registers[151]=(signed char)(bps[13]._Ti);
modbus_registers[152]=(signed char)(bps[13]._av>>8);				//���77	���� ������ ����������� �4, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[153]=(signed char)(bps[13]._av);
modbus_registers[154]=(signed char)(bps[14]._Uii>>8);			//���78	�������� ���������� ����������� �5, 0.1�
modbus_registers[155]=(signed char)(bps[14]._Uii);
modbus_registers[156]=(signed char)(bps[14]._Ii>>8);				//���79	�������� ��� ����������� �5, 0.1�
modbus_registers[157]=(signed char)(bps[14]._Ii);
modbus_registers[158]=(signed char)(bps[14]._Ti>>8);				//���80	����������� ��������� ����������� �5, 1��
modbus_registers[159]=(signed char)(bps[14]._Ti);
modbus_registers[160]=(signed char)(bps[14]._av>>8);				//���81	���� ������ ����������� �5, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[161]=(signed char)(bps[14]._av);
modbus_registers[162]=(signed char)(bps[15]._Uii>>8);			//���82	�������� ���������� ����������� �6, 0.1�
modbus_registers[163]=(signed char)(bps[15]._Uii);
modbus_registers[164]=(signed char)(bps[15]._Ii>>8);				//���83	�������� ��� ����������� �6, 0.1�
modbus_registers[165]=(signed char)(bps[15]._Ii);
modbus_registers[166]=(signed char)(bps[15]._Ti>>8);				//���84	����������� ��������� ����������� �6, 1��
modbus_registers[167]=(signed char)(bps[15]._Ti);
modbus_registers[168]=(signed char)(bps[15]._av>>8);				//���85	���� ������ ����������� �6, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[169]=(signed char)(bps[15]._av);
modbus_registers[170]=(signed char)(bps[16]._Uii>>8);			//���86	�������� ���������� ����������� �7, 0.1�
modbus_registers[171]=(signed char)(bps[16]._Uii);
modbus_registers[172]=(signed char)(bps[16]._Ii>>8);				//���87	�������� ��� ����������� �7, 0.1�
modbus_registers[173]=(signed char)(bps[16]._Ii);
modbus_registers[174]=(signed char)(bps[16]._Ti>>8);				//���88	����������� ��������� ����������� �7, 1��
modbus_registers[175]=(signed char)(bps[16]._Ti);
modbus_registers[176]=(signed char)(bps[16]._av>>8);				//���89	���� ������ ����������� �7, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[177]=(signed char)(bps[16]._av);
modbus_registers[178]=(signed char)(bps[17]._Uii>>8);			//���590	�������� ���������� ����������� �8, 0.1�
modbus_registers[179]=(signed char)(bps[17]._Uii);
modbus_registers[180]=(signed char)(bps[17]._Ii>>8);			//���91	�������� ��� ����������� �8, 0.1�
modbus_registers[181]=(signed char)(bps[17]._Ii);
modbus_registers[182]=(signed char)(bps[17]._Ti>>8);			//���92	����������� ��������� ����������� �8, 1��
modbus_registers[183]=(signed char)(bps[17]._Ti);
modbus_registers[184]=(signed char)(bps[17]._av>>8);			//���93	���� ������ ����������� �8, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[185]=(signed char)(bps[17]._av);
modbus_registers[186]=(signed char)(bps[18]._Uii>>8);			//���94	�������� ���������� ����������� �7, 0.1�
modbus_registers[187]=(signed char)(bps[18]._Uii);
modbus_registers[188]=(signed char)(bps[18]._Ii>>8);				//���95	�������� ��� ����������� �7, 0.1�
modbus_registers[189]=(signed char)(bps[18]._Ii);
modbus_registers[190]=(signed char)(bps[18]._Ti>>8);				//���96	����������� ��������� ����������� �7, 1��
modbus_registers[191]=(signed char)(bps[18]._Ti);
modbus_registers[192]=(signed char)(bps[18]._av>>8);				//���97	���� ������ ����������� �7, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[193]=(signed char)(bps[18]._av);
modbus_registers[194]=(signed char)(bps[19]._Uii>>8);			//���98	�������� ���������� ����������� �8, 0.1�
modbus_registers[195]=(signed char)(bps[19]._Uii);
modbus_registers[196]=(signed char)(bps[19]._Ii>>8);			//���99	�������� ��� ����������� �8, 0.1�
modbus_registers[197]=(signed char)(bps[19]._Ii);
modbus_registers[198]=(signed char)(bps[19]._Ti>>8);			//���100	����������� ��������� ����������� �8, 1��
modbus_registers[199]=(signed char)(bps[19]._Ti);
modbus_registers[200]=(signed char)(bps[19]._av>>8);			//���101	���� ������ ����������� �8, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[201]=(signed char)(bps[19]._av);

modbus_registers[202]=(signed char)(bps[20]._Uii>>8);			//���102	�������� ���������� ����������� �1, 0.1�
modbus_registers[203]=(signed char)(bps[20]._Uii);
modbus_registers[204]=(signed char)(bps[20]._Ii>>8);				//���103	�������� ��� ����������� �1, 0.1�
modbus_registers[205]=(signed char)(bps[20]._Ii);
modbus_registers[206]=(signed char)(bps[20]._Ti>>8);				//���104	����������� ��������� ����������� �1, 1��
modbus_registers[207]=(signed char)(bps[20]._Ti);
modbus_registers[208]=(signed char)(bps[20]._av>>8);				//���105	���� ������ ����������� �1, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[209]=(signed char)(bps[20]._av);
modbus_registers[210]=(signed char)(bps[21]._Uii>>8);			//���106	�������� ���������� ����������� �2, 0.1�
modbus_registers[211]=(signed char)(bps[21]._Uii);
modbus_registers[212]=(signed char)(bps[21]._Ii>>8);				//���107	�������� ��� ����������� �2, 0.1�
modbus_registers[213]=(signed char)(bps[21]._Ii);
modbus_registers[214]=(signed char)(bps[21]._Ti>>8);				//���108	����������� ��������� ����������� �2, 1��
modbus_registers[215]=(signed char)(bps[21]._Ti);
modbus_registers[216]=(signed char)(bps[21]._av>>8);				//���109	���� ������ ����������� �2, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[217]=(signed char)(bps[21]._av);
modbus_registers[218]=(signed char)(bps[22]._Uii>>8);			//���110	�������� ���������� ����������� �3, 0.1�
modbus_registers[219]=(signed char)(bps[22]._Uii);
modbus_registers[220]=(signed char)(bps[22]._Ii>>8);				//���111	�������� ��� ����������� �3, 0.1�
modbus_registers[221]=(signed char)(bps[22]._Ii);
modbus_registers[222]=(signed char)(bps[22]._Ti>>8);				//���112	����������� ��������� ����������� �3, 1��
modbus_registers[223]=(signed char)(bps[22]._Ti);
modbus_registers[224]=(signed char)(bps[22]._av>>8);				//���113	���� ������ ����������� �3, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[225]=(signed char)(bps[22]._av);
modbus_registers[226]=(signed char)(bps[23]._Uii>>8);			//���114	�������� ���������� ����������� �4, 0.1�
modbus_registers[227]=(signed char)(bps[23]._Uii);
modbus_registers[228]=(signed char)(bps[23]._Ii>>8);				//���115	�������� ��� ����������� �4, 0.1�
modbus_registers[229]=(signed char)(bps[23]._Ii);
modbus_registers[230]=(signed char)(bps[23]._Ti>>8);				//���116	����������� ��������� ����������� �4, 1��
modbus_registers[231]=(signed char)(bps[23]._Ti);
modbus_registers[232]=(signed char)(bps[23]._av>>8);				//���117	���� ������ ����������� �4, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[233]=(signed char)(bps[23]._av);
modbus_registers[234]=(signed char)(bps[24]._Uii>>8);			//���118	�������� ���������� ����������� �5, 0.1�
modbus_registers[235]=(signed char)(bps[24]._Uii);
modbus_registers[236]=(signed char)(bps[24]._Ii>>8);				//���119	�������� ��� ����������� �5, 0.1�
modbus_registers[237]=(signed char)(bps[24]._Ii);
modbus_registers[238]=(signed char)(bps[24]._Ti>>8);				//���120	����������� ��������� ����������� �5, 1��
modbus_registers[239]=(signed char)(bps[24]._Ti);
modbus_registers[240]=(signed char)(bps[24]._av>>8);				//���121	���� ������ ����������� �5, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[241]=(signed char)(bps[24]._av);
modbus_registers[242]=(signed char)(bps[25]._Uii>>8);			//���122	�������� ���������� ����������� �6, 0.1�
modbus_registers[243]=(signed char)(bps[25]._Uii);
modbus_registers[244]=(signed char)(bps[25]._Ii>>8);				//���123	�������� ��� ����������� �6, 0.1�
modbus_registers[245]=(signed char)(bps[25]._Ii);
modbus_registers[246]=(signed char)(bps[25]._Ti>>8);				//���124	����������� ��������� ����������� �6, 1��
modbus_registers[247]=(signed char)(bps[25]._Ti);
modbus_registers[248]=(signed char)(bps[25]._av>>8);				//���125	���� ������ ����������� �6, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[249]=(signed char)(bps[25]._av);
modbus_registers[250]=(signed char)(bps[26]._Uii>>8);			//���126	�������� ���������� ����������� �7, 0.1�
modbus_registers[251]=(signed char)(bps[26]._Uii);
modbus_registers[252]=(signed char)(bps[26]._Ii>>8);				//���127	�������� ��� ����������� �7, 0.1�
modbus_registers[253]=(signed char)(bps[26]._Ii);
modbus_registers[254]=(signed char)(bps[26]._Ti>>8);				//���128	����������� ��������� ����������� �7, 1��
modbus_registers[255]=(signed char)(bps[26]._Ti);
modbus_registers[256]=(signed char)(bps[26]._av>>8);				//���129	���� ������ ����������� �7, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[257]=(signed char)(bps[26]._av);
modbus_registers[258]=(signed char)(bps[27]._Uii>>8);			//���130	�������� ���������� ����������� �8, 0.1�
modbus_registers[259]=(signed char)(bps[27]._Uii);
modbus_registers[260]=(signed char)(bps[27]._Ii>>8);			//���131	�������� ��� ����������� �8, 0.1�
modbus_registers[261]=(signed char)(bps[27]._Ii);
modbus_registers[262]=(signed char)(bps[27]._Ti>>8);			//���132	����������� ��������� ����������� �8, 1��
modbus_registers[263]=(signed char)(bps[27]._Ti);
modbus_registers[264]=(signed char)(bps[27]._av>>8);			//���133	���� ������ ����������� �8, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[265]=(signed char)(bps[27]._av);
modbus_registers[266]=(signed char)(bps[28]._Uii>>8);			//���134	�������� ���������� ����������� �7, 0.1�
modbus_registers[267]=(signed char)(bps[28]._Uii);
modbus_registers[268]=(signed char)(bps[28]._Ii>>8);				//���135	�������� ��� ����������� �7, 0.1�
modbus_registers[269]=(signed char)(bps[28]._Ii);
modbus_registers[270]=(signed char)(bps[28]._Ti>>8);				//���136	����������� ��������� ����������� �7, 1��
modbus_registers[271]=(signed char)(bps[28]._Ti);
modbus_registers[272]=(signed char)(bps[28]._av>>8);				//���137	���� ������ ����������� �7, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[273]=(signed char)(bps[28]._av);
modbus_registers[274]=(signed char)(bps[29]._Uii>>8);			//���138	�������� ���������� ����������� �8, 0.1�
modbus_registers[275]=(signed char)(bps[29]._Uii);
modbus_registers[276]=(signed char)(bps[29]._Ii>>8);			//���139	�������� ��� ����������� �8, 0.1�
modbus_registers[277]=(signed char)(bps[29]._Ii);
modbus_registers[278]=(signed char)(bps[29]._Ti>>8);			//���140	����������� ��������� ����������� �8, 1��
modbus_registers[279]=(signed char)(bps[29]._Ti);
modbus_registers[280]=(signed char)(bps[29]._av>>8);			//���141	���� ������ ����������� �8, 0x01 - ��������, 0x02 �������� U���, 0x04 �������� U���, 0x08 - ����������� ����� � ������������
modbus_registers[281]=(signed char)(bps[29]._av);
								
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

I_ug=50;
modbus_registers[0]=(char)(I_ug/256);					//���50
modbus_registers[1]=(char)(I_ug%256);
U_up=51;
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
modbus_registers[58]=(char)((REV_IS_ON)/256);				//���79	
modbus_registers[59]=(char)((REV_IS_ON)%256);
proc_phase=7;
modbus_registers[60]=(char)((proc_phase)/256);				//���80	
modbus_registers[61]=(char)((proc_phase)%256);


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
void modbus_hold_register_answer_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short answer)
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
modbus_registers[44]=(char)((CAP_PAUSE1_TIME)/256);			//���72
modbus_registers[45]=(char)((CAP_PAUSE1_TIME)%256);
modbus_registers[46]=(char)((CAP_RAZR_TIME)/256);			//���73
modbus_registers[47]=(char)((CAP_RAZR_TIME)%256);
modbus_registers[48]=(char)((CAP_PAUSE2_TIME)/256);			//���74
modbus_registers[49]=(char)((CAP_PAUSE2_TIME)%256);
modbus_registers[50]=(char)((CAP_MAX_VOLT)/256);			//���75
modbus_registers[51]=(char)((CAP_MAX_VOLT)%256);
modbus_registers[52]=(char)((CAP_WRK_CURR)/256);			//���76
modbus_registers[53]=(char)((CAP_WRK_CURR)%256);
modbus_registers[58]=(char)((REV_IS_ON)/256);				//���79
modbus_registers[59]=(char)((REV_IS_ON)%256);

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
modbus_tx_buff[2]=(char)(reg_adr/256);
modbus_tx_buff[3]=(char)(reg_adr%256);
//modbus_tx_buff[4]=(char)(reg_quantity/256);
//modbus_tx_buff[5]=(char)(reg_quantity%256);


//memcpy((char*)&modbus_tx_buff[4],(char*)&modbus_registers[(reg_adr-1)*2],2);
modbus_tx_buff[4]=(char)(answer/256);
modbus_tx_buff[5]=(char)(answer%256);

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
modbus_registers[56]=(char)((proc_phase)/256);				//���78	
modbus_registers[57]=(char)((proc_phase)%256);
modbus_registers[58]=(char)((REV_IS_ON)/256);				//���79	
modbus_registers[59]=(char)((REV_IS_ON)%256);



modbus_registers[60]=(char)((pwm_u_reg)/256);			//���80
modbus_registers[61]=(char)((pwm_u_reg)%256);
modbus_registers[62]=(char)((pwm_i_reg)/256);			//���81
modbus_registers[63]=(char)((pwm_i_reg)%256);
modbus_registers[64]=(char)((pwm_t_reg/10)/256);			//���82
modbus_registers[65]=(char)((pwm_t_reg/10)%256);

modbus_registers[80]=(char)((I_ug_ram)/256);			//���90
modbus_registers[81]=(char)((I_ug_ram)%256);
modbus_registers[82]=(char)((U_up_ram)/256);			//���91
modbus_registers[83]=(char)((U_up_ram)%256);
modbus_registers[84]=0;									//���92
modbus_registers[85]=0;
if(work_stat==wsPS)modbus_registers[85]=1;
modbus_registers[86]=0;									//���93
modbus_registers[87]=0;
if(work_stat==wsGS)modbus_registers[87]=1;

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


