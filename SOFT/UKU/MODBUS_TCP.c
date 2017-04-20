
#include <lpc17xx.h>
#include <rtl.h>
#include "main.h"
#include "modbus_tcp.h"
#include "eeprom_map.h"
#include "modbus.h"
#include "25lc640.h"
#include "gran.h"
#include "control.h"

char plazma_modbus_tcp[20];
short modbus_tcp_plazma[10];

char modbus_tcp_func;
char modbus_tcp_unit;
short modbus_tcp_rx_arg0;
short modbus_tcp_rx_arg1;
short modbus_tcp_rx_arg2;


#define MODBUS_TCP_PROT	1
extern int  mem_copy (void *dp, void *sp, int len);

char* modbus_tcp_out_ptr;

/*--------------------------- TCP socket ------------------------------------*/

U16 tcp_callback (U8 soc, U8 evt, U8 *ptr, U16 par) 
{
/* This function is called by the TCP module on TCP event */
/* Check the 'Net_Config.h' for possible events.          */
par = par;

if (soc != socket_tcp) {
	return (0);
}

switch (evt) 
	{
    case TCP_EVT_DATA:
    /* TCP data frame has arrived, data is located at *par1, */
    /* data length is par2. Allocate buffer to send reply.   */
    //procrec(ptr);
	
	plazma_modbus_tcp[1]=ptr[0];
	plazma_modbus_tcp[2]=ptr[1];
	plazma_modbus_tcp[3]=ptr[2];
	plazma_modbus_tcp[4]=ptr[3];
	plazma_modbus_tcp[5]=ptr[4];
	plazma_modbus_tcp[6]=ptr[5];
	plazma_modbus_tcp[7]=ptr[6];
	plazma_modbus_tcp[8]=ptr[7];
	plazma_modbus_tcp[9]=ptr[8];
	plazma_modbus_tcp[10]=ptr[9];
	plazma_modbus_tcp[11]=ptr[10];
	plazma_modbus_tcp[12]=ptr[11];
	  //plazma_modbus_tcp[4]=ptr[3];
	  //plazma_modbus_tcp[5]=par;
	  //plazma_modbus_tcp[6]=ptr[5];

   	
	modbus_tcp_func=ptr[7];
	modbus_tcp_unit=ptr[6];

	modbus_tcp_rx_arg0=(((unsigned short)ptr[8])*((unsigned short)256))+((unsigned short)ptr[9]);
	modbus_tcp_rx_arg1=(((unsigned short)ptr[10])*((unsigned short)256))+((unsigned short)ptr[11]);

			modbus_tcp_plazma[0]++;
			modbus_tcp_plazma[1]=modbus_tcp_func;
			modbus_tcp_plazma[2]=modbus_tcp_rx_arg0;
			modbus_tcp_plazma[3]=modbus_tcp_rx_arg1;

	if(modbus_tcp_unit==MODBUS_ADRESS)
		{
		//char modbus_tcp_tx_buff[200];
		ramModbusCnt=300;

		if(modbus_tcp_func==3)		//чтение произвольного кол-ва регистров хранения
			{
			U8 *sendbuf;
			

			modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_tcp_func,modbus_tcp_rx_arg0,modbus_tcp_rx_arg1,MODBUS_TCP_PROT);

			sendbuf = tcp_get_buf((modbus_tcp_rx_arg1*2)+9);
			sendbuf[0]=ptr[0];
			sendbuf[1]=ptr[1];
			sendbuf[2]=ptr[2];
			sendbuf[3]=ptr[3];
			sendbuf[4]=((modbus_tcp_rx_arg1*2)+3)/256;
			sendbuf[5]=((modbus_tcp_rx_arg1*2)+3)%256;;
			sendbuf[6]=modbus_tcp_unit;
			sendbuf[7]=modbus_tcp_func;
			sendbuf[8]=(U8)(modbus_tcp_rx_arg1*2);
			mem_copy((char*)&sendbuf[9],modbus_tcp_out_ptr,(modbus_tcp_rx_arg1*2));
			//sendbuf[9]=3;
			//sendbuf[10]=4;
          	tcp_send (socket_tcp, sendbuf, ((modbus_tcp_rx_arg1*2)+9));
			//
			
			//modbus_tcp_tx_buff[4]=0;
			//modbus_tcp_tx_buff[5]=5;
			//modbus_tcp_tx_buff[6]=1;//modbus_tcp_unit;
			//modbus_tcp_tx_buff[7]=3;//modbus_tcp_func;
			//modbus_tcp_tx_buff[8]=2;
			//mem_copy((char*)&modbus_tcp_tx_buff[9],modbus_tcp_out_ptr,2);
			//modbus_tcp_tx_buff[9]=2;
			//modbus_tcp_tx_buff[10]=3;
			//tcp_send (socket_tcp, modbus_tcp_tx_buff, 11);

			//modbus_tcp_plazma[0]++;
			//modbus_tcp_plazma[1]=3;
			}

		if(modbus_tcp_func==4)		//чтение произвольного кол-ва регистров	входов
			{
			U8 *sendbuf;

			modbus_input_registers_transmit(MODBUS_ADRESS,modbus_tcp_func,modbus_tcp_rx_arg0,modbus_tcp_rx_arg1,MODBUS_TCP_PROT);

			sendbuf = tcp_get_buf((modbus_tcp_rx_arg1*2)+9);
			sendbuf[0]=ptr[0];
			sendbuf[1]=ptr[1];
			sendbuf[2]=ptr[2];
			sendbuf[3]=ptr[3];
			sendbuf[4]=((modbus_tcp_rx_arg1*2)+3)/256;
			sendbuf[5]=((modbus_tcp_rx_arg1*2)+3)%256;;
			sendbuf[6]=modbus_tcp_unit;
			sendbuf[7]=modbus_tcp_func;
			sendbuf[8]=(U8)(modbus_tcp_rx_arg1*2);
			mem_copy((char*)&sendbuf[9],modbus_tcp_out_ptr,(modbus_tcp_rx_arg1*2));
			//sendbuf[9]=3;
			//sendbuf[10]=4;
          	tcp_send (socket_tcp, sendbuf, ((modbus_tcp_rx_arg1*2)+9));
			//
			
			//modbus_tcp_tx_buff[4]=0;
			//modbus_tcp_tx_buff[5]=5;
			//modbus_tcp_tx_buff[6]=1;//modbus_tcp_unit;
			//modbus_tcp_tx_buff[7]=3;//modbus_tcp_func;
			//modbus_tcp_tx_buff[8]=2;
			//mem_copy((char*)&modbus_tcp_tx_buff[9],modbus_tcp_out_ptr,2);
			//modbus_tcp_tx_buff[9]=2;
			//modbus_tcp_tx_buff[10]=3;
			//tcp_send (socket_tcp, modbus_tcp_tx_buff, 11);
			//modbus_tcp_plazma[0]++;
			//modbus_tcp_plazma[1]=4;
			}

		else if(modbus_tcp_func==6) 	//запись регистров хранения
			{
			U8 *sendbuf;

			
			if(modbus_tcp_rx_arg0==50)		//ток стабилизации для режима стабилизации тока
				{
				I_ug=modbus_tcp_rx_arg1;
				lc640_write_int(EE_I_UG,I_ug);
				}
			if(modbus_tcp_rx_arg0==51)		//напряжение стабилизации для режима стабилизации напряжения
				{
				U_up=modbus_tcp_rx_arg1;
				lc640_write_int(EE_U_UP,U_up);
				}
			if(modbus_tcp_rx_arg0==52)		//максимапльное напряжение для режима стабилизации тока
				{
				U_maxg=modbus_tcp_rx_arg1;
				lc640_write_int(EE_U_MAX_G,U_maxg);
				}
			if(modbus_tcp_rx_arg0==53)		//максимальный ток для режима стабилизации напряжения
				{
				I_maxp=modbus_tcp_rx_arg1;
				lc640_write_int(EE_I_MAX_P,I_maxp);
				}								
			if(modbus_tcp_rx_arg0==54)		//Установка времени для ист.тока.секунды
				{
				signed long sec,min,hour;
				sec=(signed long)modbus_tcp_rx_arg1;
				min=(T_PROC_GS/60L)%60L;
				hour=T_PROC_GS/3600L;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
				}
			if(modbus_tcp_rx_arg0==55)		//Установка времени для ист.тока.минуты
				{
				signed long sec,min,hour;
				sec=T_PROC_GS%60L;
				min=(signed long)modbus_tcp_rx_arg1;
				hour=T_PROC_GS/3600L;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
				}
			if(modbus_tcp_rx_arg0==56)		//Установка времени для ист.тока.часы
				{
				signed long sec,min,hour;
				sec=T_PROC_GS%60L;
				min=(T_PROC_GS/60L)%60L;
				hour=(signed long)modbus_tcp_rx_arg1;
				T_PROC_GS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
				}
			if(modbus_tcp_rx_arg0==57)		//Установка времени для ист.напр.секунды
				{
				signed long sec,min,hour;
				sec=(signed long)modbus_tcp_rx_arg1;
				min=(T_PROC_PS/60L)%60L;
				hour=T_PROC_PS/3600L;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
				}

			if(modbus_tcp_rx_arg0==58)		//Установка времени для ист.напр.минуты
				{
				signed long sec,min,hour;
				sec=T_PROC_PS%60L;
				min=(signed long)modbus_tcp_rx_arg1;
				hour=T_PROC_PS/3600L;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
				}

			if(modbus_tcp_rx_arg0==59)		//Установка времени для ист.напр.часы
				{
				signed long sec,min,hour;
				sec=T_PROC_PS%60L;
				min=(T_PROC_PS/60L)%60L;
				hour=(signed long)modbus_tcp_rx_arg1;
				T_PROC_PS=(hour*3600L)+(min*60L)+sec;
				lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
				}

			if(modbus_tcp_rx_arg0==60)		//вкл/выкл источника напр.
				{
				if(modbus_tcp_rx_arg1==1)
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
				if(modbus_tcp_rx_arg1==0)
					{
					if(work_stat==wsPS)
						{
						work_stat=wsOFF;
						restart_off();
						}
					}
				}
			if(modbus_tcp_rx_arg0==61)		//вкл/выкл источника тока
				{
				if(modbus_tcp_rx_arg1==1)
					{
					if(work_stat!=wsGS)
						{
						work_stat=wsGS;
						time_proc=0;
						time_proc_remain=T_PROC_GS;
						lc640_write_int(EE_MAIN_MENU_MODE,mmmIT);
						}
					}
				if(modbus_tcp_rx_arg1==0)
					{
					if(work_stat==wsGS)
						{
						work_stat=wsOFF;
						restart_off();
						}
					}
				}

			if(modbus_tcp_rx_arg0==62)		//переключение реле реверса
				{
					{
					if(work_stat==wsOFF)
						{
						if(modbus_tcp_rx_arg1==0)REV_STAT=rsFF;
						if(modbus_tcp_rx_arg1==1)REV_STAT=rsREW;
						}
					}
				}
			if(modbus_tcp_rx_arg0==63)		//включение-выключение автореверса
				{
					{
					if((work_stat==wsOFF)&&(REV_IS_ON))
						{
						if(modbus_tcp_rx_arg1==1)AVT_REV_IS_ON=1;
						if(modbus_tcp_rx_arg1==0)AVT_REV_IS_ON=0;
						lc640_write_int(EE_AVT_REV_IS_ON,AVT_REV_IS_ON);
						}
					}
				}
			if(modbus_tcp_rx_arg0==64)		//Автореверс, время работы прямое, сек
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_FF=modbus_tcp_rx_arg1;
					gran(&AVT_REV_TIME_FF,30,T_PROC_MAX);
					lc640_write_int(EE_AVT_REV_TIME_FF,AVT_REV_TIME_FF);	
					}
				}
			if(modbus_tcp_rx_arg0==65)		//Автореверс, время работы обратное, сек
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_REW=modbus_tcp_rx_arg1;
					gran(&AVT_REV_TIME_REW,30,T_PROC_MAX);
					lc640_write_int(EE_AVT_REV_TIME_REW,AVT_REV_TIME_REW);	
					}
				}
			if(modbus_tcp_rx_arg0==66)		//Автореверс, время паузы при переключении, сек
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_TIME_PAUSE=modbus_tcp_rx_arg1;
					gran(&AVT_REV_TIME_PAUSE,2,600);
					lc640_write_int(EE_AVT_REV_TIME_PAUSE,AVT_REV_TIME_PAUSE);	
					}
				}

			if(modbus_tcp_rx_arg0==67)		//Автореверс, ток стабилизации прямой, 0.1А
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_I_NOM_FF=modbus_tcp_rx_arg1;
		    			gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(EE_AVT_REV_I_NOM_FF,AVT_REV_I_NOM_FF);	
					}
				}

			if(modbus_tcp_rx_arg0==68)		//Автореверс, ток стабилизации обратный, 0.1А
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_I_NOM_REW=modbus_tcp_rx_arg1;
		    			gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
					lc640_write_int(EE_AVT_REV_I_NOM_REW,AVT_REV_I_NOM_REW);	
					}
				}
			if(modbus_tcp_rx_arg0==69)		//Автореверс, напряжение стабилизации прямое, 0.1В 
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_U_NOM_FF=modbus_tcp_rx_arg1;
		    			gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
					lc640_write_int(EE_AVT_REV_U_NOM_FF,AVT_REV_U_NOM_FF);					
					}
				}

			if(modbus_tcp_rx_arg0==70)		//Автореверс, напряжение стабилизации обратное, 0.1В
				{
				if(work_stat==wsOFF)
					{
					AVT_REV_U_NOM_REW=modbus_tcp_rx_arg1;
		    			gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
					lc640_write_int(EE_AVT_REV_U_NOM_REW,AVT_REV_U_NOM_REW);					
					}
				}

			if(modbus_tcp_rx_arg0==71)		//Время заряда испытательного цикла, 0.1С 
				{
				if(work_stat==wsOFF)
					{
					CAP_ZAR_TIME=modbus_tcp_rx_arg1;
		    			gran(&CAP_ZAR_TIME,10,9999);
					lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
					}
				}
			if(modbus_tcp_rx_arg0==72)		//Время паузы1 испытательного цикла, 0.1С 
				{
				if(work_stat==wsOFF)
					{
					CAP_PAUSE1_TIME=modbus_tcp_rx_arg1;
		    			gran(&CAP_PAUSE1_TIME,10,9999);
					lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
					}
				}
			if(modbus_tcp_rx_arg0==73)		//Время разряда испытательного цикла, 0.1С 
				{
				if(work_stat==wsOFF)
					{
					CAP_RAZR_TIME=modbus_tcp_rx_arg1;
		    			gran(&CAP_RAZR_TIME,10,9999);
					lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
					}
				}
			if(modbus_tcp_rx_arg0==74)		//Время паузы2 испытательного цикла, 0.1С 
				{
				if(work_stat==wsOFF)
					{
					CAP_PAUSE2_TIME=modbus_tcp_rx_arg1;
		    			gran(&CAP_PAUSE2_TIME,10,9999);
					lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
					}
				}

			if(modbus_tcp_rx_arg0==75)		//Максимальное напряжение испытательного цикла, 1В  
				{
				if(work_stat==wsOFF)
					{
					CAP_MAX_VOLT=modbus_tcp_rx_arg1;
		    			gran(&CAP_MAX_VOLT,1,100);
					lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
					}
				}
			if(modbus_tcp_rx_arg0==76)		//Рабочий ток испытательного цикла, 1А 
				{
				if(work_stat==wsOFF)
					{
					CAP_WRK_CURR=modbus_tcp_rx_arg1;
		    			gran(&CAP_WRK_CURR,1,150);
					lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
					}
				}

			if(modbus_tcp_rx_arg0==77)		//Регистр для записи команд 
				{
				if(modbus_tcp_rx_arg1==0x11)
					{
					start_CAP();
					}
				if(modbus_tcp_rx_arg1==0x12)
					{
					pause_CAP();
					}
				if(modbus_tcp_rx_arg1==0x13)
					{
					stop_CAP();
					}
				if(modbus_tcp_rx_arg1==0x14)
					{
					reset_CAP();
					}

				if(modbus_tcp_rx_arg1==0x21)
					{
					if(work_stat==wsOFF)
						{
						CAP_ZAR_TIME++;
		    				gran(&CAP_ZAR_TIME,10,9999);
						lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
						}
					}
				if(modbus_tcp_rx_arg1==0x22)
					{
					if(work_stat==wsOFF)
						{
						CAP_ZAR_TIME--;
		    				gran(&CAP_ZAR_TIME,10,9999);
						lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
						}
					}

				if(modbus_tcp_rx_arg1==0x31)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE1_TIME++;
		    				gran(&CAP_PAUSE1_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
						}
					}
				if(modbus_tcp_rx_arg1==0x32)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE1_TIME--;
		    				gran(&CAP_PAUSE1_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
						}
					}

				if(modbus_tcp_rx_arg1==0x41)
					{
					if(work_stat==wsOFF)
						{
						CAP_RAZR_TIME++;
		    				gran(&CAP_RAZR_TIME,10,9999);
						lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
						}
					}
				if(modbus_tcp_rx_arg1==0x42)
					{
					if(work_stat==wsOFF)
						{
						CAP_RAZR_TIME--;
		    				gran(&CAP_RAZR_TIME,10,9999);
						lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
						}
					}

				if(modbus_tcp_rx_arg1==0x51)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE2_TIME++;
		    				gran(&CAP_PAUSE2_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
						}
					}
				if(modbus_tcp_rx_arg1==0x52)
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE2_TIME--;
		    				gran(&CAP_PAUSE2_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
						}
					}

				if(modbus_tcp_rx_arg1==0x61)
					{
					if(work_stat==wsOFF)
						{
						CAP_MAX_VOLT++;
		    				gran(&CAP_MAX_VOLT,1,100);
						lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
						}
					}
				if(modbus_tcp_rx_arg1==0x62)
					{
					if(work_stat==wsOFF)
						{
						CAP_MAX_VOLT--;
		    				gran(&CAP_MAX_VOLT,1,100);
						lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
						}
					}

				if(modbus_tcp_rx_arg1==0x71)
					{
					if(work_stat==wsOFF)
						{
						CAP_WRK_CURR++;
		    				gran(&CAP_WRK_CURR,1,150);
						lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
						}
					}
				if(modbus_tcp_rx_arg1==0x72)
					{
					if(work_stat==wsOFF)
						{
						CAP_WRK_CURR--;
		    				gran(&CAP_WRK_CURR,1,150);
						lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
						}
					}

				}

			else if(modbus_tcp_rx_arg0==90)		//ток стабилизации для режима стабилизации тока, в ОЗУ
				{
				I_ug_ram=modbus_tcp_rx_arg1;
				eepromRamSwitch=1;
				}

			else if(modbus_tcp_rx_arg0==91)	//напряжение стабилизации для режима стабилизации напряжения, в ОЗУ
				{
				U_up_ram=modbus_tcp_rx_arg1;
				eepromRamSwitch=1;
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

			
			modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_tcp_func,modbus_tcp_rx_arg0,1,MODBUS_TCP_PROT);
	
			sendbuf = tcp_get_buf(11);
			sendbuf[0]=ptr[0];
			sendbuf[1]=ptr[1];
			sendbuf[2]=ptr[2];
			sendbuf[3]=ptr[3];
			sendbuf[4]=0;
			sendbuf[5]=6;
			sendbuf[6]=modbus_tcp_unit;
			sendbuf[7]=modbus_tcp_func;
			sendbuf[8]=modbus_tcp_rx_arg0/256;
			sendbuf[9]=modbus_tcp_rx_arg0%256;
			mem_copy((char*)&sendbuf[10],modbus_tcp_out_ptr,2);
				//sendbuf[9]=3;
				//sendbuf[10]=4;
	        tcp_send (socket_tcp, sendbuf, 12);
				//
				
				//modbus_tcp_tx_buff[4]=0;
				//modbus_tcp_tx_buff[5]=5;
				//modbus_tcp_tx_buff[6]=1;//modbus_tcp_unit;
				//modbus_tcp_tx_buff[7]=3;//modbus_tcp_func;
				//modbus_tcp_tx_buff[8]=2;
				//mem_copy((char*)&modbus_tcp_tx_buff[9],modbus_tcp_out_ptr,2);
				//modbus_tcp_tx_buff[9]=2;
				//modbus_tcp_tx_buff[10]=3;
				//tcp_send (socket_tcp, modbus_tcp_tx_buff, 11);



			if((modbus_tcp_rx_arg0!=90)&&(modbus_tcp_rx_arg0!=91)) lc640_write_int(EE_EE_WRITE_CNT,EE_WRITE_CNT+1);


			}


		else if(modbus_tcp_func==16) 	//групповая запись регистров хранения
			{
			U8 *sendbuf;
			unsigned short modbus_tcp_write_args[100];
			char i;

			//pvlk=0;

			for(i=0;i<modbus_tcp_rx_arg1;i++)
				{
				modbus_tcp_write_args[i]=(((unsigned short)ptr[13+(i*2)])*((unsigned short)256))+((unsigned short)ptr[14+(i*2)]);
				//pvlk++;
				}
			
			for(i=0;i<modbus_tcp_rx_arg1;i++)
				{

				if((modbus_tcp_rx_arg0+i)==50)		//ток стабилизации для режима стабилизации тока
					{
					I_ug=modbus_tcp_write_args[i];
					lc640_write_int(EE_I_UG,I_ug);
					}
				else if((modbus_tcp_rx_arg0+i)==51)	//напряжение стабилизации для режима стабилизации напряжения
					{
					U_up=modbus_tcp_write_args[i];
					lc640_write_int(EE_U_UP,U_up);
					}
				else if((modbus_tcp_rx_arg0+i)==52)		//максимапльное напряжение для режима стабилизации тока
					{
					U_maxg=modbus_tcp_write_args[i];
					lc640_write_int(EE_U_MAX_G,U_maxg);
					}
				else if((modbus_tcp_rx_arg0+i)==53)		//максимальный ток для режима стабилизации напряжения
					{
					I_maxp=modbus_tcp_write_args[i];
					lc640_write_int(EE_I_MAX_P,I_maxp);
					}								
				else if((modbus_tcp_rx_arg0+i)==54)		//Установка времени для ист.тока.секунды
					{
					signed long sec,min,hour;
					sec=(signed long)modbus_tcp_write_args[i];
					min=(T_PROC_GS/60L)%60L;
					hour=T_PROC_GS/3600L;
					T_PROC_GS=(hour*3600L)+(min*60L)+sec;
					lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
					}
				else if((modbus_tcp_rx_arg0+i)==55)		//Установка времени для ист.тока.минуты
					{
					signed long sec,min,hour;
					sec=T_PROC_GS%60L;
					min=(signed long)modbus_tcp_write_args[i];
					hour=T_PROC_GS/3600L;
					T_PROC_GS=(hour*3600L)+(min*60L)+sec;
					lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
					}
				else if((modbus_tcp_rx_arg0+i)==56)		//Установка времени для ист.тока.часы
					{
					signed long sec,min,hour;
					sec=T_PROC_GS%60L;
					min=(T_PROC_GS/60L)%60L;
					hour=(signed long)modbus_tcp_write_args[i];
					T_PROC_GS=(hour*3600L)+(min*60L)+sec;
					lc640_write_long(EE_T_PROC_GS,T_PROC_GS);
					}
				else if((modbus_tcp_rx_arg0+i)==57)		//Установка времени для ист.напр.секунды
					{
					signed long sec,min,hour;
					sec=(signed long)modbus_tcp_write_args[i];
					min=(T_PROC_PS/60L)%60L;
					hour=T_PROC_PS/3600L;
					T_PROC_PS=(hour*3600L)+(min*60L)+sec;
					lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
					}
				else if((modbus_tcp_rx_arg0+i)==58)		//Установка времени для ист.напр.минуты
					{
					signed long sec,min,hour;
					sec=T_PROC_PS%60L;
					min=(signed long)modbus_tcp_write_args[i];
					hour=T_PROC_PS/3600L;
					T_PROC_PS=(hour*3600L)+(min*60L)+sec;
					lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
					}
	
				else if((modbus_tcp_rx_arg0+i)==59)		//Установка времени для ист.напр.часы
					{
					signed long sec,min,hour;
					sec=T_PROC_PS%60L;
					min=(T_PROC_PS/60L)%60L;
					hour=(signed long)modbus_tcp_write_args[i];
					T_PROC_PS=(hour*3600L)+(min*60L)+sec;
					lc640_write_long(EE_T_PROC_PS,T_PROC_PS);
					}

	 			else if((modbus_tcp_rx_arg0+i)==60)		//вкл/выкл источника напр.
					{
					if(modbus_tcp_write_args[i]==1)
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
					if(modbus_tcp_write_args[i]==0)
						{
						if(work_stat==wsPS)
							{
							work_stat=wsOFF;
							restart_off();
							}
						}
					}
				else if((modbus_tcp_rx_arg0+i)==61)		//вкл/выкл источника тока
					{
					if(modbus_tcp_write_args[i]==1)
						{
						if(work_stat!=wsGS)
							{
							work_stat=wsGS;
							time_proc=0;
							time_proc_remain=T_PROC_GS;
							lc640_write_int(EE_MAIN_MENU_MODE,mmmIT);
							}
						}
					if(modbus_tcp_write_args[i]==0)
						{
						if(work_stat==wsGS)
							{
							work_stat=wsOFF;
							restart_off();
							}
						}
					}
				else if((modbus_tcp_rx_arg0+i)==62)		//переключение реле реверса
					{
						{
						if(work_stat==wsOFF)
							{
							if(modbus_tcp_write_args[i]==0)REV_STAT=rsFF;
							if(modbus_tcp_write_args[i]==1)REV_STAT=rsREW;
							}
						}
					}
				else if((modbus_tcp_rx_arg0+i)==63)		//включение-выключение автореверса
					{
						{
						if((work_stat==wsOFF)&&(REV_IS_ON))
							{
							if(modbus_tcp_write_args[i]==1)AVT_REV_IS_ON=1;
							if(modbus_tcp_write_args[i]==0)AVT_REV_IS_ON=0;
							lc640_write_int(EE_AVT_REV_IS_ON,AVT_REV_IS_ON);
							}
						}
					}
				else if((modbus_tcp_rx_arg0+i)==64)		//Автореверс, время работы прямое, сек
					{
					if(work_stat==wsOFF)
						{
						AVT_REV_TIME_FF=modbus_tcp_write_args[i];
						gran(&AVT_REV_TIME_FF,30,T_PROC_MAX);
						lc640_write_int(EE_AVT_REV_TIME_FF,AVT_REV_TIME_FF);	
						}
					}
				else if((modbus_tcp_rx_arg0+i)==65)		//Автореверс, время работы обратное, сек
					{
					if(work_stat==wsOFF)
						{
						AVT_REV_TIME_REW=modbus_tcp_write_args[i];
						gran(&AVT_REV_TIME_REW,30,T_PROC_MAX);
						lc640_write_int(EE_AVT_REV_TIME_REW,AVT_REV_TIME_REW);	
						}
					}
				else if((modbus_tcp_rx_arg0+i)==66)		//Автореверс, время паузы при переключении, сек
					{
					if(work_stat==wsOFF)
						{
						AVT_REV_TIME_PAUSE=modbus_tcp_write_args[i];
						gran(&AVT_REV_TIME_PAUSE,2,600);
						lc640_write_int(EE_AVT_REV_TIME_PAUSE,AVT_REV_TIME_PAUSE);	
						}
					}
	
				else if((modbus_tcp_rx_arg0+i)==67)		//Автореверс, ток стабилизации прямой, 0.1А
					{
					if(work_stat==wsOFF)
						{
						AVT_REV_I_NOM_FF=modbus_tcp_write_args[i];
			    			gran(&AVT_REV_I_NOM_FF,I_MIN_IPS,I_MAX_IPS);
						lc640_write_int(EE_AVT_REV_I_NOM_FF,AVT_REV_I_NOM_FF);	
						}
					}
	
				else if((modbus_tcp_rx_arg0+i)==68)		//Автореверс, ток стабилизации обратный, 0.1А
					{
					if(work_stat==wsOFF)
						{
						AVT_REV_I_NOM_REW=modbus_tcp_write_args[i];
			    			gran(&AVT_REV_I_NOM_REW,I_MIN_IPS,I_MAX_IPS);
						lc640_write_int(EE_AVT_REV_I_NOM_REW,AVT_REV_I_NOM_REW);	
						}
					}
				else if((modbus_tcp_rx_arg0+i)==69)		//Автореверс, напряжение стабилизации прямое, 0.1В 
					{
					if(work_stat==wsOFF)
						{
						AVT_REV_U_NOM_FF=modbus_tcp_write_args[i];
			    			gran(&AVT_REV_U_NOM_FF,U_MIN,U_MAX);
						lc640_write_int(EE_AVT_REV_U_NOM_FF,AVT_REV_U_NOM_FF);					
						}
					}
	
				else if((modbus_tcp_rx_arg0+i)==70)		//Автореверс, напряжение стабилизации обратное, 0.1В
					{
					if(work_stat==wsOFF)
						{
						AVT_REV_U_NOM_REW=modbus_tcp_write_args[i];
			    			gran(&AVT_REV_U_NOM_REW,U_MIN,U_MAX);
						lc640_write_int(EE_AVT_REV_U_NOM_REW,AVT_REV_U_NOM_REW);					
						}
					}
				else if((modbus_tcp_rx_arg0+i)==71)		//Время заряда испытательного цикла, 0.1С 
					{
					if(work_stat==wsOFF)
						{
						CAP_ZAR_TIME=modbus_tcp_write_args[i];
			    			gran(&CAP_ZAR_TIME,10,9999);
						lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
						}
					}
				else if((modbus_tcp_rx_arg0+i)==72)		//Время паузы1 испытательного цикла, 0.1С 
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE1_TIME=modbus_tcp_write_args[i];
			    			gran(&CAP_PAUSE1_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
						}
					}
				else if((modbus_tcp_rx_arg0+i)==73)		//Время разряда испытательного цикла, 0.1С 
					{
					if(work_stat==wsOFF)
						{
						CAP_RAZR_TIME=modbus_tcp_write_args[i];
			    			gran(&CAP_RAZR_TIME,10,9999);
						lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
						}
					}
				else if((modbus_tcp_rx_arg0+i)==74)		//Время паузы2 испытательного цикла, 0.1С 
					{
					if(work_stat==wsOFF)
						{
						CAP_PAUSE2_TIME=modbus_tcp_write_args[i];
			    			gran(&CAP_PAUSE2_TIME,10,9999);
						lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
						}
					}
	
				else if((modbus_tcp_rx_arg0+i)==75)		//Максимальное напряжение испытательного цикла, 1В  
					{
					if(work_stat==wsOFF)
						{
						CAP_MAX_VOLT=modbus_tcp_write_args[i];
			    			gran(&CAP_MAX_VOLT,1,100);
						lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
						}
					}
				else if((modbus_tcp_rx_arg0+i)==76)		//Рабочий ток испытательного цикла, 1А 
					{
					if(work_stat==wsOFF)
						{
						CAP_WRK_CURR=modbus_tcp_write_args[i];
			    			gran(&CAP_WRK_CURR,1,150);
						lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
						}
					}
	
				else if((modbus_tcp_rx_arg0+i)==77)		//Регистр для записи команд 
					{
					if(modbus_tcp_write_args[i]==0x11)
						{
						start_CAP();
						}
					if(modbus_tcp_write_args[i]==0x12)
						{
						pause_CAP();
						}
					if(modbus_tcp_write_args[i]==0x13)
						{
						stop_CAP();
						}
					if(modbus_tcp_write_args[i]==0x14)
						{
						reset_CAP();
						}
	
					if(modbus_tcp_write_args[i]==0x21)
						{
						if(work_stat==wsOFF)
							{
							CAP_ZAR_TIME++;
			    				gran(&CAP_ZAR_TIME,10,9999);
							lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
							}
						}
					if(modbus_tcp_write_args[i]==0x22)
						{
						if(work_stat==wsOFF)
							{
							CAP_ZAR_TIME--;
			    				gran(&CAP_ZAR_TIME,10,9999);
							lc640_write_int(EE_CAP_ZAR_TIME,CAP_ZAR_TIME);					
							}
						}
	
					if(modbus_tcp_write_args[i]==0x31)
						{
						if(work_stat==wsOFF)
							{
							CAP_PAUSE1_TIME++;
			    				gran(&CAP_PAUSE1_TIME,10,9999);
							lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
							}
						}
					if(modbus_tcp_write_args[i]==0x32)
						{
						if(work_stat==wsOFF)
							{
							CAP_PAUSE1_TIME--;
			    				gran(&CAP_PAUSE1_TIME,10,9999);
							lc640_write_int(EE_CAP_PAUSE1_TIME,CAP_PAUSE1_TIME);					
							}
						}
	
					if(modbus_tcp_write_args[i]==0x41)
						{
						if(work_stat==wsOFF)
							{
							CAP_RAZR_TIME++;
			    				gran(&CAP_RAZR_TIME,10,9999);
							lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
							}
						}
					if(modbus_tcp_write_args[i]==0x42)
						{
						if(work_stat==wsOFF)
							{
							CAP_RAZR_TIME--;
			    				gran(&CAP_RAZR_TIME,10,9999);
							lc640_write_int(EE_CAP_RAZR_TIME,CAP_RAZR_TIME);					
							}
						}
	
					if(modbus_tcp_write_args[i]==0x51)
						{
						if(work_stat==wsOFF)
							{
							CAP_PAUSE2_TIME++;
			    				gran(&CAP_PAUSE2_TIME,10,9999);
							lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
							}
						}
					if(modbus_tcp_write_args[i]==0x52)
						{
						if(work_stat==wsOFF)
							{
							CAP_PAUSE2_TIME--;
			    				gran(&CAP_PAUSE2_TIME,10,9999);
							lc640_write_int(EE_CAP_PAUSE2_TIME,CAP_PAUSE2_TIME);					
							}
						}
	
					if(modbus_tcp_write_args[i]==0x61)
						{
						if(work_stat==wsOFF)
							{
							CAP_MAX_VOLT++;
			    				gran(&CAP_MAX_VOLT,1,100);
							lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
							}
						}
					if(modbus_tcp_write_args[i]==0x62)
						{
						if(work_stat==wsOFF)
							{
							CAP_MAX_VOLT--;
			    				gran(&CAP_MAX_VOLT,1,100);
							lc640_write_int(EE_CAP_MAX_VOLT,CAP_MAX_VOLT);					
							}
						}
	
					if(modbus_tcp_write_args[i]==0x71)
						{
						if(work_stat==wsOFF)
							{
							CAP_WRK_CURR++;
			    				gran(&CAP_WRK_CURR,1,150);
							lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
							}
						}
					if(modbus_tcp_write_args[i]==0x72)
						{
						if(work_stat==wsOFF)
							{
							CAP_WRK_CURR--;
			    				gran(&CAP_WRK_CURR,1,150);
							lc640_write_int(EE_CAP_WRK_CURR,CAP_WRK_CURR);					
							}
						}
	
					}

				if((modbus_tcp_rx_arg0+i)==90)		//ток стабилизации для режима стабилизации тока, в ОЗУ
					{
					I_ug_ram=modbus_tcp_write_args[i];
					eepromRamSwitch=1;
					}

				else if((modbus_tcp_rx_arg0+i)==91)	//напряжение стабилизации для режима стабилизации напряжения, в ОЗУ
					{
					U_up_ram=modbus_tcp_write_args[i];
					eepromRamSwitch=1;
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
				}


			
			//modbus_hold_registers_transmit(MODBUS_ADRESS,modbus_tcp_func,modbus_tcp_rx_arg0,modbus_tcp_rx_arg1,MODBUS_TCP_PROT);
	
			sendbuf = tcp_get_buf(11);
			sendbuf[0]=ptr[0];
			sendbuf[1]=ptr[1];
			sendbuf[2]=ptr[2];
			sendbuf[3]=ptr[3];
			sendbuf[4]=0;
			sendbuf[5]=6;
			sendbuf[6]=modbus_tcp_unit;
			sendbuf[7]=modbus_tcp_func;
			sendbuf[8]=modbus_tcp_rx_arg0/256;
			sendbuf[9]=modbus_tcp_rx_arg0%256;
			sendbuf[10]=modbus_tcp_rx_arg1/256;
			sendbuf[11]=modbus_tcp_rx_arg1%256;
	        tcp_send (socket_tcp, sendbuf, 12);
				//
				
				//modbus_tcp_tx_buff[4]=0;
				//modbus_tcp_tx_buff[5]=5;
				//modbus_tcp_tx_buff[6]=1;//modbus_tcp_unit;
				//modbus_tcp_tx_buff[7]=3;//modbus_tcp_func;
				//modbus_tcp_tx_buff[8]=2;
				//mem_copy((char*)&modbus_tcp_tx_buff[9],modbus_tcp_out_ptr,2);
				//modbus_tcp_tx_buff[9]=2;
				//modbus_tcp_tx_buff[10]=3;
				//tcp_send (socket_tcp, modbus_tcp_tx_buff, 11);

 			if((modbus_tcp_rx_arg0!=90)&&(modbus_tcp_rx_arg0!=91)) lc640_write_int(EE_EE_WRITE_CNT,EE_WRITE_CNT+1);





			}

			
		} 
	break;

  	case TCP_EVT_CONREQ:
      		/* Remote peer requested connect, accept it */
    return (1);

    case TCP_EVT_CONNECT:
      		/* The TCP socket is connected */
      	return (1);
  	}
return (0);
}

