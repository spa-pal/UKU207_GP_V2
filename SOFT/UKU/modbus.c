
#include "modbus.h"
//#include "LPC17xx.H"
#include "main.h"
//#include "sdio.h"
#include "eeprom_map.h"

unsigned char modbus_buf[20];
short modbus_crc16;
char modbus_timeout_cnt;
char bMODBUS_TIMEOUT;
unsigned char modbus_rx_buffer[30];	//�����, ���� ���������� ����������� ������� ���������� ���������� �� ������ ����� 
unsigned char modbus_an_buffer[30];    	//�����, ���� ��� ����� ���������� ��� �������
unsigned char modbus_rx_buffer_ptr;	//��������� �� ������� ������� ������������ ������
unsigned char modbus_rx_counter;		//���������� �������� ����, ������������ ��� ������� ����������� ������� � ��� �����������

short modbus_plazma;				//�������
short modbus_plazma1;				//�������
short modbus_plazma2;				//�������
short modbus_plazma3;				//�������

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
unsigned short modbus_rx_arg2;		//���������� � ������� ������ ��������
unsigned short modbus_rx_arg3;		//���������� � ������� ��������� ��������
unsigned char modbus_func;			//���������� � ������� ��� �������

//modbus_plazma++;

mem_copy(modbus_an_buffer,modbus_rx_buffer,modbus_rx_buffer_ptr);
modbus_rx_counter=modbus_rx_buffer_ptr;
modbus_rx_buffer_ptr=0;
bMODBUS_TIMEOUT=0;
	
crc16_calculated  = CRC16_2(modbus_an_buffer, modbus_rx_counter-2);
crc16_incapsulated = *((short*)&modbus_an_buffer[modbus_rx_counter-2]);

modbus_plazma1=modbus_rx_counter;
modbus_plazma2=crc16_calculated;
modbus_plazma3=crc16_incapsulated;

modbus_func=modbus_an_buffer[1];
modbus_rx_arg0=(((unsigned short)modbus_an_buffer[2])*((unsigned short)256))+((unsigned short)modbus_an_buffer[3]);
modbus_rx_arg1=(((unsigned short)modbus_an_buffer[4])*((unsigned short)256))+((unsigned short)modbus_an_buffer[5]);
modbus_rx_arg2=(((unsigned short)modbus_an_buffer[6])*((unsigned short)256))+((unsigned short)modbus_an_buffer[7]);
modbus_rx_arg3=(((unsigned short)modbus_an_buffer[8])*((unsigned short)256))+((unsigned short)modbus_an_buffer[9]);


if(crc16_calculated==crc16_incapsulated)
	{
	modbus_plazma++;
	if(modbus_an_buffer[0]==MODBUS_ADRESS)
		{
		if(modbus_func==3)		//������ ������������� ���-�� ���������
			{
			modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0,modbus_rx_arg1);
			}

		else if(modbus_func==6) 	//������ ��������
			{
			if(modbus_rx_arg0==18)		//��������� ������� ��� ���.����.����
				{
				signed long sec,min,hour;
				sec=T_PROC_PS%60L;
				min=T_PROC_PS/60L;
				hour=2;//(signed long)modbus_rx_arg1;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
				}
			if(modbus_rx_arg0==9)		//��� ������������ ��� ������ ������������ ����
				{
				I_ug=modbus_rx_arg1;
				lc640_write_int(EE_I_UG,I_ug);
				}
			if(modbus_rx_arg0==10)		//���������� ������������ ��� ������ ������������ ����������
				{
				U_up=modbus_rx_arg1;
				lc640_write_int(EE_U_UP,U_up);
				}
			if(modbus_rx_arg0==19)		//���/���� ��������� ����.
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
			if(modbus_rx_arg0==20)		//���/���� ��������� ����
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
			if(modbus_rx_arg0==21)		//������������ ���� �������
				{
				//if(modbus_rx_arg1==1)
					{
					if(work_stat==wsOFF)
						{
						if(modbus_rx_arg1==0)REV_STAT=rsFF;
						if(modbus_rx_arg1==1)REV_STAT=rsREW;
						}
					}
				}
			if(modbus_rx_arg0==22)		//���������-���������� �����������
				{
				//if(modbus_rx_arg1==1)
					{
					if((work_stat==wsOFF)&&(REV_IS_ON))
						{
						if(modbus_rx_arg1==1)AVT_REV_IS_ON=1;
						if(modbus_rx_arg1==0)AVT_REV_IS_ON=0;
						lc640_write_int(EE_AVT_REV_IS_ON,AVT_REV_IS_ON);
						}
					}
				}
			if(modbus_rx_arg0==23)		//����������, ����� ������ ������, ���
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_FF=modbus_rx_arg1;
					gran(&AVT_REV_TIME_FF,30,T_PROC_MAX);
					lc640_write_int(EE_AVT_REV_TIME_FF,AVT_REV_TIME_FF);	
					}
				}
			if(modbus_rx_arg0==24)		//����������, ����� ������ ��������, ���
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_REW=modbus_rx_arg1;
					gran(&AVT_REV_TIME_REW,30,T_PROC_MAX);
					lc640_write_int(EE_AVT_REV_TIME_REW,AVT_REV_TIME_REW);	
					}
				}
			if(modbus_rx_arg0==25)		//����������, ����� ����� ��� ������������, ���
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_PAUSE=modbus_rx_arg1;
					gran(&AVT_REV_TIME_PAUSE,2,600);
					lc640_write_int(EE_AVT_REV_TIME_PAUSE,AVT_REV_TIME_PAUSE);	
					}
				}

			if(modbus_rx_arg0==26)		//����������, ��� ������������ ������, 0.1�
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_I_NOM_FF=modbus_rx_arg1;
		    			gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(EE_AVT_REV_I_NOM_FF,AVT_REV_I_NOM_FF);	
					}
				}

			if(modbus_rx_arg0==27)		//����������, ��� ������������ ��������, 0.1�
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_I_NOM_REW=modbus_rx_arg1;
		    			gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(EE_AVT_REV_I_NOM_REW,AVT_REV_I_NOM_REW);	
					}
				}
			if(modbus_rx_arg0==28)		//����������, ���������� ������������ ������, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_U_NOM_FF=modbus_rx_arg1;
		    			gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
					lc640_write_int(EE_AVT_REV_U_NOM_FF,AVT_REV_U_NOM_FF);					
					}
				}

			if(modbus_rx_arg0==29)		//����������, ���������� ������������ ��������, 0.1�
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_U_NOM_REW=modbus_rx_arg1;
		    			gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
					lc640_write_int(EE_AVT_REV_U_NOM_REW,AVT_REV_U_NOM_REW);					
					}
				}

			if(modbus_rx_arg0==40)		//����� ������ �������������� �����, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_ZAR_TIME=modbus_rx_arg1;
		    			gran(&CAP_ZAR_TIME,10,9999);
					lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
					}
				}
			if(modbus_rx_arg0==41)		//����� �����1 �������������� �����, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_PAUSE1_TIME=modbus_rx_arg1;
		    			gran(&CAP_PAUSE1_TIME,10,9999);
					lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
					}
				}
			if(modbus_rx_arg0==42)		//����� ������� �������������� �����, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_RAZR_TIME=modbus_rx_arg1;
		    			gran(&CAP_RAZR_TIME,10,9999);
					lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
					}
				}
			if(modbus_rx_arg0==43)		//����� �����2 �������������� �����, 0.1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_PAUSE2_TIME=modbus_rx_arg1;
		    			gran(&CAP_PAUSE2_TIME,10,9999);
					lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
					}
				}

			if(modbus_rx_arg0==44)		//������������ ���������� �������������� �����, 1�  
				{
				if(work_stat==wsOFF)
					{
					CAP_MAX_VOLT=modbus_rx_arg1;
		    			gran(&CAP_MAX_VOLT,1,100);
					lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
					}
				}
			if(modbus_rx_arg0==45)		//������� ��� �������������� �����, 1� 
				{
				if(work_stat==wsOFF)
					{
					CAP_WRK_CURR=modbus_rx_arg1;
		    			gran(&CAP_WRK_CURR,1,150);
					lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
					}
				}

			if(modbus_rx_arg0==50)		//������� ��� ������ ������ 
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
			if(modbus_rx_arg0==51)		//����� �����2 �������������� �����, 0.1� 
				{
				if(modbus_rx_arg2==0x23)
					{
					if(work_stat==wsOFF)
						{
						CAP_ZAR_TIME=modbus_rx_arg1;
		    				gran(&CAP_ZAR_TIME,10,9999);
						lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
						}
					}
			/*	if(modbus_rx_arg1==0x22)
					{
					if(work_stat==wsOFF)
						{
						CAP_ZAR_TIME--;
		    				gran(&CAP_ZAR_TIME,10,9999);
						lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
						}
					}*/
				}
			//modbus_hold_register_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0);


			modbus_hold_register_transmit(MODBUS_ADRESS,modbus_func,modbus_rx_arg0);


			}
		} 
	//;
	}
// modbus_plazma++;

}

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
/*
modbus_registers[0]=0x10;
modbus_registers[1]=0x11;
modbus_registers[2]=0x12;
modbus_registers[3]=0x13;
modbus_registers[4]=0x14;
modbus_registers[5]=0x15;
*/

mem_copy((char*)&modbus_tx_buff[4],(char*)&modbus_registers[(reg_adr-1)*2],2);

crc_temp=CRC16_2(modbus_tx_buff,6);

modbus_tx_buff[6]=crc_temp%256;
modbus_tx_buff[7]=crc_temp/256;

for (i=0;i<8;i++)
	{
	putchar0(modbus_tx_buff[i]);
	}
}


//-----------------------------------------------
void modbus_hold_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr)
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
modbus_registers[44]=(char)((AVT_REV_TIME_FF)/256);		//���23
modbus_registers[45]=(char)((AVT_REV_TIME_FF)%256);
modbus_registers[46]=(char)((AVT_REV_TIME_REW)/256);		//���24
modbus_registers[47]=(char)((AVT_REV_TIME_REW)%256);
modbus_registers[48]=(char)((AVT_REV_TIME_PAUSE)/256);		//���25
modbus_registers[49]=(char)((AVT_REV_TIME_PAUSE)%256);
modbus_registers[50]=(char)((AVT_REV_I_NOM_FF)/256);		//���26
modbus_registers[51]=(char)((AVT_REV_I_NOM_FF)%256);
modbus_registers[52]=(char)((AVT_REV_I_NOM_REW)/256);		//���27
modbus_registers[53]=(char)((AVT_REV_I_NOM_REW)%256);
modbus_registers[54]=(char)((AVT_REV_U_NOM_FF)/256);		//���28
modbus_registers[55]=(char)((AVT_REV_U_NOM_FF)%256);
modbus_registers[56]=(char)((AVT_REV_U_NOM_REW)/256);		//���29
modbus_registers[57]=(char)((AVT_REV_U_NOM_REW)%256);

modbus_registers[78]=(char)((CAP_ZAR_TIME)/256);			//���40
modbus_registers[79]=(char)((CAP_ZAR_TIME)%256);
modbus_registers[80]=(char)((CAP_PAUSE1_TIME)/256);			//���41
modbus_registers[81]=(char)((CAP_PAUSE1_TIME)%256);
modbus_registers[82]=(char)((CAP_RAZR_TIME)/256);			//���42
modbus_registers[83]=(char)((CAP_RAZR_TIME)%256);
modbus_registers[84]=(char)((CAP_PAUSE2_TIME)/256);			//���43
modbus_registers[85]=(char)((CAP_PAUSE2_TIME)%256);
modbus_registers[86]=(char)((CAP_MAX_VOLT)/256);			//���44
modbus_registers[87]=(char)((CAP_MAX_VOLT)%256);
modbus_registers[88]=(char)((CAP_WRK_CURR)/256);			//���45
modbus_registers[89]=(char)((CAP_WRK_CURR)%256);
modbus_registers[90]=(char)((CAP_COUNTER)/256);			//���46
modbus_registers[91]=(char)((CAP_COUNTER)%256);
modbus_registers[92]=(char)((CAP_TIME_SEC/10)/256);			//���47
modbus_registers[93]=(char)((CAP_TIME_SEC/10)%256);
modbus_registers[94]=(char)((CAP_TIME_MIN)/256);			//���48
modbus_registers[95]=(char)((CAP_TIME_MIN)%256);
modbus_registers[96]=(char)((CAP_TIME_HOUR)/256);			//���49
modbus_registers[97]=(char)((CAP_TIME_HOUR)%256);

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
modbus_tx_buff[2]=(char)(reg_adr/256);
modbus_tx_buff[3]=(char)(reg_adr%256);
//modbus_tx_buff[4]=(char)(reg_quantity/256);
//modbus_tx_buff[5]=(char)(reg_quantity%256);
/*
modbus_registers[0]=0x10;
modbus_registers[1]=0x11;
modbus_registers[2]=0x12;
modbus_registers[3]=0x13;
modbus_registers[4]=0x14;
modbus_registers[5]=0x15;
*/

mem_copy((char*)&modbus_tx_buff[4],(char*)&modbus_registers[(reg_adr-1)*2],2);

crc_temp=CRC16_2(modbus_tx_buff,6);

modbus_tx_buff[6]=crc_temp%256;
modbus_tx_buff[7]=crc_temp/256;

for (i=0;i<8;i++)
	{
	putchar0(modbus_tx_buff[i]);
	}
}


//-----------------------------------------------
void modbus_hold_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr,unsigned short reg_quantity)
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
if(AVT_REV_IS_ON)modbus_registers[43]=1;
modbus_registers[44]=(char)((AVT_REV_TIME_FF)/256);		//���23
modbus_registers[45]=(char)((AVT_REV_TIME_FF)%256);
modbus_registers[46]=(char)((AVT_REV_TIME_REW)/256);		//���24
modbus_registers[47]=(char)((AVT_REV_TIME_REW)%256);
modbus_registers[48]=(char)((AVT_REV_TIME_PAUSE)/256);		//���25
modbus_registers[49]=(char)((AVT_REV_TIME_PAUSE)%256);
modbus_registers[50]=(char)((AVT_REV_I_NOM_FF)/256);		//���26
modbus_registers[51]=(char)((AVT_REV_I_NOM_FF)%256);
modbus_registers[52]=(char)((AVT_REV_I_NOM_REW)/256);		//���27
modbus_registers[53]=(char)((AVT_REV_I_NOM_REW)%256);
modbus_registers[54]=(char)((AVT_REV_U_NOM_FF)/256);		//���28
modbus_registers[55]=(char)((AVT_REV_U_NOM_FF)%256);
modbus_registers[56]=(char)((AVT_REV_U_NOM_REW)/256);		//���29
modbus_registers[57]=(char)((AVT_REV_U_NOM_REW)%256);

modbus_registers[78]=(char)((CAP_ZAR_TIME)/256);			//���40
modbus_registers[79]=(char)((CAP_ZAR_TIME)%256);
modbus_registers[80]=(char)((CAP_PAUSE1_TIME)/256);			//���41
modbus_registers[81]=(char)((CAP_PAUSE1_TIME)%256);
modbus_registers[82]=(char)((CAP_RAZR_TIME)/256);			//���42
modbus_registers[83]=(char)((CAP_RAZR_TIME)%256);
modbus_registers[84]=(char)((CAP_PAUSE2_TIME)/256);		//���43
modbus_registers[85]=(char)((CAP_PAUSE2_TIME)%256);
modbus_registers[86]=(char)((CAP_MAX_VOLT)/256);			//���44
modbus_registers[87]=(char)((CAP_MAX_VOLT)%256);
modbus_registers[88]=(char)((CAP_WRK_CURR)/256);			//���45
modbus_registers[89]=(char)((CAP_WRK_CURR)%256);
modbus_registers[90]=(char)((CAP_COUNTER)/256);			//���46
modbus_registers[91]=(char)((CAP_COUNTER)%256);
modbus_registers[92]=(char)((CAP_TIME_SEC/10)/256);			//���47
modbus_registers[93]=(char)((CAP_TIME_SEC/10)%256);
modbus_registers[94]=(char)((CAP_TIME_MIN)/256);			//���48
modbus_registers[95]=(char)((CAP_TIME_MIN)%256);
modbus_registers[96]=(char)((CAP_TIME_HOUR)/256);			//���49
modbus_registers[97]=(char)((CAP_TIME_HOUR)%256);

modbus_tx_buff[0]=adr;
modbus_tx_buff[1]=func;
//modbus_tx_buff[2]=(char)(reg_adr/256);
//modbus_tx_buff[3]=(char)(reg_adr%256);
//modbus_tx_buff[4]=(char)(reg_quantity/256);
//modbus_tx_buff[5]=(char)(reg_quantity%256);
modbus_tx_buff[2]=(char)(reg_quantity*2);
/*
modbus_registers[0]=0x10;
modbus_registers[1]=0x11;
modbus_registers[2]=0x12;
modbus_registers[3]=0x13;
modbus_registers[4]=0x14;
modbus_registers[5]=0x15;
*/

//if((reg_adr<17)&&(reg_quantity<10))
	{
	mem_copy((char*)&modbus_tx_buff[3],(char*)&modbus_registers[(reg_adr-1)*2],reg_quantity*2);
	}
crc_temp=CRC16_2(modbus_tx_buff,(reg_quantity*2)+3);

modbus_tx_buff[3+(reg_quantity*2)]=crc_temp%256;
modbus_tx_buff[4+(reg_quantity*2)]=crc_temp/256;

for (i=0;i<(5+(reg_quantity*2));i++)
	{
	putchar0(modbus_tx_buff[i]);
	}
}


