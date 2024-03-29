//#define CAN_TO_UKU
#define RS_TO_UKU

#include "string.h"
//#include <iostm8s208.h>
#include <iostm8s103.h>
#include "stm8s.h"
#include "main.h"


#define BPS_MESS_STID	0x019e
#define BPS_MESS_STID_MASK	0x03ff
#define UKU_MESS_STID	0x00ae
#define UKU_MESS_STID_MASK	0x03ff


char t0_cnt0=0,t0_cnt1=0,t0_cnt2=0,t0_cnt3=0,t0_cnt4=0;
_Bool b100Hz, b10Hz, b5Hz, b2Hz, b1Hz, bT4, bB;
char cnt_T4; 


char strob_cnt;
const char DIGISYM[15]={0b11000000,0b11111001,0b10100100,0b10110000,0b10011001,0b10010010,0b10000010,0b11111000,0b10000000,0b10010000,0b11111111,0b11111111,0b11111111,0b11111111,0b11111111};
char dig1[8]={0xff,0xff,0xff,0xff};
char dig2[8]={0xff,0xff,0xff,0xff};
char dig3[8]={0xff,0xff,0xff,0xff};
char dig1_[8]={0xff,0xff,0xff,0xff};
char dig2_[8]={0xff,0xff,0xff,0xff};
char dig3_[8]={0xff,0xff,0xff,0xff};
char ind_cnt;
char ind_fad_cnt; 

char dig[5];
char zero_on;
char ind_out_[5];
char ind_out[5];
char bFL5,bFL2,bFL,bFL_;

//���
@near char can_out_buff[4][16];
char can_buff_wr_ptr;
char can_buff_rd_ptr;
char bTX_FREE=1;
char tx_busy_cnt;
char bCAN_RX=0;
char can_error_cnt;
short can_plazma;
u8 mess[14];

short rdata[3];

//�������
_Bool encApin,encBpin,encApin_old,encBpin_old;
char encAcnt,encBcnt;
_Bool encA,encB;
_Bool encCW, encOW;
short enc_plazma;
char encCW_cnt1;
char encCW_cnt2;
_Bool encCW_;
char encOW_cnt1;
char encOW_cnt2;
_Bool encOW_;

//�������
signed short tmblr_cnt;
enum_tmblr_state tmblr_state;

//������
signed short but_cnt;
enum_but_state but_state;

//���������� � ��������������
signed short out_U, out_I, out_I_;
signed short ust_I, ust_I_;
signed short ust_Iloc, ust_I_loc;
enum_wrk_mode wrk_mode;
char ch_en=0;
char cmnd;
short enc_cmnd;
short enc_cmnd_cnt;

//������ ��������
short enc_but_drv_cnt;

char wrk_state;
char bREW;
char bAV;

//�����
unsigned short time;
unsigned short time_set;
//unsigned short ust_time;
//���������
short ind_U;
short ind_I;
short ind_U_set;
short ind_I_set;

//���������� ���������
enum_work_stat work_stat=wsOFF;


//UART � MODBUS
#define TX_BUFFER_SIZE1 64
#define RX_BUFFER_SIZE1 50

char tx_buffer1[TX_BUFFER_SIZE1]={0};
signed char tx_counter1;
signed char tx_wr_index1,tx_rd_index1;
@near char rx_buffer[RX_BUFFER_SIZE1]={0};
signed short rx_counter1;
signed short rx_wr_index1,rx_rd_index1;
tx_stat_enum tx_stat=tsOFF;
@near char tx_stat_cnt;
char tx_wd_cnt=100;
char bOUT_FREE;
char	modbusTimeOutCnt=0;
char	bMODBUS_TIMEOUT=0;
short modbus_plazma;
//char enc_plazma;

//-----------------------------------------------
void bcd2ind_zero(void);
void bcd2ind(void);
void bin2bcd_int(unsigned int in);

//-----------------------------------------------
long delay_ms(short in)
{
long i,ii,iii;

i=((long)in)*100UL;

for(ii=0;ii<i;ii++)
	{
		iii++;
	}

}

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
@near char modbus_an_buffer[30];	
short crc16_calculated;		//au?eneyaiay ec i?eiyouo aaiiuo CRC
short crc16_incapsulated;	//ano?iaiiiay a iinueeo CRC
unsigned short modbus_rx_arg0;		//ano?iaiiue a iinueeo ia?aue a?aoiaio
unsigned short modbus_rx_arg1;		//ano?iaiiue a iinueeo aoi?ie a?aoiaio
unsigned short modbus_rx_arg2;		//ano?iaiiue a iinueeo o?aoee a?aoiaio
unsigned short modbus_rx_arg3;		//ano?iaiiue a iinueeo ?aoaa?oue a?aoiaio
unsigned char modbus_func;			//ano?iaiiue a iinueeo eia ooieoee

//modbus_plazma++;

memcpy(modbus_an_buffer,rx_buffer,rx_wr_index1);
//modbus_rx_counter=modbus_rx_buffer_ptr;
//modbus_rx_buffer_ptr=0;
//bMODBUS_TIMEOUT=0;
//modbus_plazma=rx_wr_index1;

crc16_calculated  = CRC16_2(modbus_an_buffer, rx_wr_index1-2);
crc16_incapsulated = modbus_an_buffer[rx_wr_index1-2]+(modbus_an_buffer[rx_wr_index1-1])*256;

//modbus_plazma=modbus_rx_counter;
//modbus_plazma2=crc16_calculated;
//modbus_plazma3=crc16_incapsulated;

//modbus_func=modbus_an_buffer[1];
//modbus_rx_arg0=(((unsigned short)modbus_an_buffer[2])*((unsigned short)256))+((unsigned short)modbus_an_buffer[3]);
//modbus_rx_arg1=(((unsigned short)modbus_an_buffer[4])*((unsigned short)256))+((unsigned short)modbus_an_buffer[5]);
//modbus_rx_arg2=(((unsigned short)modbus_an_buffer[6])*((unsigned short)256))+((unsigned short)modbus_an_buffer[7]);
//modbus_rx_arg3=(((unsigned short)modbus_an_buffer[8])*((unsigned short)256))+((unsigned short)modbus_an_buffer[9]);
rx_wr_index1=0;

//if(crc16_calculated==crc16_incapsulated)
	{
	if(modbus_an_buffer[0]==201)	 //anee cai?in io ioeuoa
		{
			modbus_plazma++;
		if((modbus_an_buffer[1]==6)||(modbus_an_buffer[1]==4))		//?oaiea i?iecaieuiiai eie-aa ?aaeno?ia
			{
			if(modbus_an_buffer[2]==14)
				{
				ind_U=(modbus_an_buffer[3]+(modbus_an_buffer[4]*256));
				ind_I=(modbus_an_buffer[5]+(modbus_an_buffer[6]*256));
				work_stat=(enum_work_stat)modbus_an_buffer[7];
				ind_U_set=(modbus_an_buffer[9]+(modbus_an_buffer[10]*256));
				time= (modbus_an_buffer[11]+(modbus_an_buffer[12]*256));
				time_set= (modbus_an_buffer[13]+(modbus_an_buffer[14]*256));
				ind_I_set=(modbus_an_buffer[15]+(modbus_an_buffer[16]*256));	
				}
			}
		}
	}
}


//-----------------------------------------------
void putchar1(char c)
{
while (tx_counter1 == TX_BUFFER_SIZE1);
///#asm("cli")
if (tx_counter1 || ((UART1->SR & UART1_SR_TXE)==0))
   {
   tx_buffer1[tx_wr_index1]=c;
   if (++tx_wr_index1 == TX_BUFFER_SIZE1) tx_wr_index1=0;
   ++tx_counter1;
   }
else 
	{
	UART1->DR=c;
	GPIOA->ODR|=(1<<6);
	tx_stat=tsON;
	}


UART1->CR2|= UART1_CR2_TIEN | UART1_CR2_TCIEN;
}

//-----------------------------------------------
void modbus_transmit_request(char addr,char func,short reg_adr,short reg_quant)
{
@near char modbus_buff[20],i;
@near short crc_temp;

modbus_buff[0] = addr;
modbus_buff[1] = func;
modbus_buff[2] = (char)(reg_adr>>8);
modbus_buff[3] = (char)reg_adr;
modbus_buff[4] = (char)(reg_quant>>8);
modbus_buff[5] = (char)reg_quant;

crc_temp= CRC16_2(modbus_buff,6);

modbus_buff[6]= (char)crc_temp;
modbus_buff[7]= (char)(crc_temp>>8);

for (i=0;i<8;i++)
{
	putchar1(modbus_buff[i]);
}

}

//-----------------------------------------------
void modbus_write_request(char addr,char func,short reg_adr, short arg)
{
@near char modbus_buff[20],i;
@near short crc_temp;

modbus_buff[0] = addr;
modbus_buff[1] = func;
modbus_buff[2] = (char)(reg_adr>>8);
modbus_buff[3] = (char)reg_adr;
modbus_buff[4] = (char)(arg>>8);
modbus_buff[5] = (char)arg;

crc_temp= CRC16_2(modbus_buff,6);

modbus_buff[6]= (char)crc_temp;
modbus_buff[7]= (char)(crc_temp>>8);


for (i=0;i<8;i++)
{
	putchar1(modbus_buff[i]);
}



}



//-----------------------------------------------
void spi_init(void){

	GPIOE->DDR|=(1<<5);
	GPIOE->CR1|=(1<<5);
	GPIOE->CR2&=~(1<<5);
	GPIOE->ODR|=(1<<5);	

	GPIOC->DDR|=(1<<3);
	GPIOC->CR1|=(1<<3);
	GPIOC->CR2&=~(1<<3);
	GPIOC->ODR|=(1<<3);	
	
	GPIOC->DDR|=(1<<2);
	GPIOC->CR1|=(1<<2);
	GPIOC->CR2&=~(1<<2);
	GPIOC->ODR|=(1<<2);		
	
	GPIOC->DDR|=(1<<5);
	GPIOC->CR1|=(1<<5);
	GPIOC->CR2|=(1<<5);
	GPIOC->ODR|=(1<<5);	
	
	GPIOC->DDR|=(1<<6);
	GPIOC->CR1|=(1<<6);
	GPIOC->CR2|=(1<<6);
	GPIOC->ODR|=(1<<6);	

/*	GPIOC->DDR&=~(1<<7);
	GPIOC->CR1&=~(1<<7);
	GPIOC->CR2&=~(1<<7);
	GPIOC->ODR|=(1<<7);	*/
	
	SPI->CR1= /*SPI_CR1_LSBFIRST |*/
			SPI_CR1_SPE | 
			( (0<< 3) & SPI_CR1_BR ) |
			SPI_CR1_MSTR |
			SPI_CR1_CPOL |
			SPI_CR1_CPHA; 
			
	SPI->CR2= SPI_CR2_SSM | SPI_CR2_SSI;
	SPI->ICR= 0;	
}

//-----------------------------------------------
char spi(char in){
	char c;
	while(!((SPI->SR)&SPI_SR_TXE));
	SPI->DR=in;
	while(!((SPI->SR)&SPI_SR_RXNE));
	c=SPI->DR;	
	return c;
}

//-----------------------------------------------
void bin2bcd_int(unsigned int in)
{

char i=5;
for(i=0;i<5;i++)
	{
	dig[i]=in%10;
	in/=10;
	}   
}

//-----------------------------------------------
void bcd2ind_zero()
{
char i;
zero_on=1;
for (i=4;i>0;i--)
	{
	if(zero_on&&(!dig[i-1])&&(i-1))
		{
		ind_out_[i-1]=DIGISYM[10];
		}
	else
		{
		ind_out_[i-1]=DIGISYM[dig[i-1]];
		zero_on=0;
		}
	}
}

//-----------------------------------------------
void bcd2ind()
{
char i;

for (i=4;i>0;i--)
	{
	ind_out_[i-1]=DIGISYM[dig[i-1]];
	}
}

//-----------------------------------------------
void int2ind_slkuf1(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
{
char i;
//char n;
bin2bcd_int(in);
if(unzero)bcd2ind_zero();
else bcd2ind();
if(komma)
	{
	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
	ind_out_[komma]&=0b01111111;
	}
if(fl&&bFL5)
	{
	for(i=0;i<len;i++)
		{
		ind_out_[i]=DIGISYM[10];
		}
	}

for(i=0;i<len;i++)
		{
		dig1[start+i]=ind_out_[i];
		}
if(len==0)
	{
	dig1[0]=0xff;
	dig1[1]=0xff;
	dig1[2]=0xff;
	dig1[3]=0xff;
	}
dig1_[0]=dig1[0];
dig1_[1]=dig1[1];
dig1_[2]=dig1[2];
dig1_[3]=dig1[3];
if(fad)
	{
	dig1[0]=0xff;
	dig1[1]=0xff;
	dig1[2]=0xff;
	dig1[3]=0xff;
	}
}

//-----------------------------------------------
void int2ind_slkuf2(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
{
char i;
//char n;
	dig2[0]=0xff;
	dig2[1]=0xff;
	dig2[2]=0xff;
	dig2[3]=0xff;
	dig2_[0]=0xff;
	dig2_[1]=0xff;
	dig2_[2]=0xff;
	dig2_[3]=0xff;
bin2bcd_int(in);
if(unzero)bcd2ind_zero();
else bcd2ind();
if(komma)
	{
	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
	ind_out_[komma]&=0b01111111;
	} 
if(fl&&bFL5)
	{
	for(i=0;i<len;i++)
		{
		ind_out_[i]=DIGISYM[10];
		}
	}

for(i=0;i<len;i++)
		{
		dig2[start+i]=ind_out_[i];
		}
if(len==0)
	{
	dig2[0]=0xff;
	dig2[1]=0xff;
	dig2[2]=0xff;
	dig2[3]=0xff;
	}
dig2_[0]=dig2[0];
dig2_[1]=dig2[1];
dig2_[2]=dig2[2];
dig2_[3]=dig2[3];
if(fad)
	{
	dig2[0]=0xff;
	dig2[1]=0xff;
	dig2[2]=0xff;
	dig2[3]=0xff;
	}
}
//-----------------------------------------------
void int2ind_slkuf3(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
{
char i;
//char n;
bin2bcd_int(in);
if(unzero)bcd2ind_zero();
else bcd2ind();
if(komma)
	{
	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
	ind_out_[komma]&=0b01111111;
	} 
if(fl&&bFL5)
	{
	for(i=0;i<len;i++)
		{
		ind_out_[i]=DIGISYM[10];
		}
	}

for(i=0;i<len;i++)
		{
		dig3[start+i]=ind_out_[i];
		}
if(len==0)
	{
	dig3[0]=0xff;
	dig3[1]=0xff;
	dig3[2]=0xff;
	dig3[3]=0xff;
	}
dig3_[0]=dig3[0];
dig3_[1]=dig3[1];
dig3_[2]=dig3[2];
dig3_[3]=dig3[3];
if(fad)
	{
	dig3[0]=0xff;
	dig3[1]=0xff;
	dig3[2]=0xff;
	dig3[3]=0xff;
	}	

}

//-----------------------------------------------
void tmblr_drv(void)
{
if(GPIOB->IDR&0b10000000)
	{
	tmblr_cnt++;
	if(tmblr_cnt>=10)tmblr_cnt=10;
	}
else 
	{
	tmblr_cnt--;
	if(tmblr_cnt<=0)tmblr_cnt=0;
	}

if(tmblr_cnt>=9)tmblr_state=tsU;
else if(tmblr_cnt<=0)tmblr_state=tsI;



	
}


//-----------------------------------------------
void but_drv(void)
{
if(GPIOE->IDR&0b00000001)
	{
	but_cnt++;
	if(but_cnt>=10)but_cnt=10;
	}
else 
	{
	but_cnt--;
	if(but_cnt<=0)but_cnt=0;
	}

if(but_cnt>=9)but_state=bsOFF;
else if(but_cnt<=0)but_state=bsON;



	
}


//-----------------------------------------------
void enc_but_drv(void)
{
if(!((GPIOB->IDR)&(1<<5)))
	{
	enc_but_drv_cnt++;
	}
else 
	{
	if(enc_but_drv_cnt>=10)
		{
		cmnd=1;
		}
	enc_but_drv_cnt=0;
	}
}

//-----------------------------------------------
void enc_an(void)
{
//���������� ������ �������� �������� �� �������
if(encCW)
	{
	if(encCW_cnt1)
		{
		if(encCW_cnt2<10)
			{
			encCW_cnt2++;
			}
		}
	encCW_cnt1=80;

	if(encCW_cnt2>8)
		{
		encCW_=1;
		encCW=0;
		}
	}
else
	{
	if(encCW_cnt1)
		{
		encCW_cnt1--;
		if(encCW_cnt1==0)
			{
			encCW_cnt2=0;
			encCW_=0;
			}
		}
	}

//���������� ������ �������� �������� ������ �������
if(encOW)
	{
	if(encOW_cnt1)
		{
		if(encOW_cnt2<10)
			{
			encOW_cnt2++;
			}
		}
	encOW_cnt1=50;
	if(encOW_cnt2>5)
		{
		encOW_=1;
		encOW=0;
		}
	}
else
	{
	if(encOW_cnt1)
		{
		encOW_cnt1--;
		if(encOW_cnt1==0)
			{
			encOW_cnt2=0;
			encOW_=0;
			}
		}
	}
		
if(encCW||encOW||encCW_||encOW_)
	{
		enc_plazma++;
	if(!ind_fad_cnt)
		{
		ind_fad_cnt=10;
		}
	else 
		{
		if(tmblr_state==tsI)
			{

			if(but_state==bsON)
				{
				if(encCW)
					{
					//can_transmit(0x18a,51,0,0,0,0,0,0,0);		//�����+
					//modbus_write_request(200,6,0,51);
					enc_cmnd=51;
					enc_cmnd_cnt++;
					}
				if(encCW_)
					{
					//can_transmit(0x18a,53,0,0,0,0,0,0,0);		//�����++
					//modbus_write_request(200,6,0,53);
					enc_cmnd=53;
					enc_cmnd_cnt++;
					}

				if(encOW)
					{
					//can_transmit(0x18a,52,0,0,0,0,0,0,0);		//�����-
					//modbus_write_request(200,6,0,52);
					enc_cmnd=52;
					enc_cmnd_cnt++;
					}

				if(encOW_)
					{
					//can_transmit(0x18a,54,0,0,0,0,0,0,0);		//�����--
					//modbus_write_request(200,6,0,54);
					enc_cmnd=54;
					enc_cmnd_cnt++;
					}
				}
			else
				{
				if(encCW)
					{
					//can_transmit(0x18a,61,0,0,0,0,0,0,0);
					//modbus_write_request(200,6,0,61);
					enc_cmnd=61;
					enc_cmnd_cnt++;
					}
				if(encCW_)
					{
					//can_transmit(0x18a,63,0,0,0,0,0,0,0);
					//modbus_write_request(200,6,0,63);
					enc_cmnd=63;
					enc_cmnd_cnt++;
					}
				if(encOW)
					{
					//can_transmit(0x18a,62,0,0,0,0,0,0,0);
					//modbus_write_request(200,6,0,62);
					enc_cmnd=62;
					enc_cmnd_cnt++;
					}
				if(encOW_)
					{
					//can_transmit(0x18a,64,0,0,0,0,0,0,0);
					//modbus_write_request(200,6,0,64);
					enc_cmnd=64;
					enc_cmnd_cnt++;
					}
				}
			}
		else	if(tmblr_state==tsU)
			{

			if(but_state==bsON)
				{
				if(encCW)
					{
					//can_transmit(0x18a,51,0,0,0,0,0,0,0);		//�����+
					//modbus_write_request(200,6,0,51);
					enc_cmnd=51;
					enc_cmnd_cnt++;
					}
				if(encCW_)
					{
					//can_transmit(0x18a,53,0,0,0,0,0,0,0);		//�����++
					//modbus_write_request(200,6,0,53);
					enc_cmnd=53;
					enc_cmnd_cnt++;
					}

				if(encOW)
					{
					//can_transmit(0x18a,52,0,0,0,0,0,0,0);		//�����-
					//modbus_write_request(200,6,0,52);
					enc_cmnd=52;
					enc_cmnd_cnt++;
					}

				if(encOW_)
					{
					//can_transmit(0x18a,54,0,0,0,0,0,0,0);		//�����--
					//modbus_write_request(200,6,0,54);
					enc_cmnd=54;
					enc_cmnd_cnt++;
					}
				}
			else
				{
				if(encCW)
					{
					//can_transmit(0x18a,71,0,0,0,0,0,0,0);
					//modbus_write_request(200,6,0,71);
					enc_cmnd=71;
					enc_cmnd_cnt++;
					}
				if(encCW_)
					{
					//can_transmit(0x18a,73,0,0,0,0,0,0,0);
					//modbus_write_request(200,6,0,73);
					enc_cmnd=73;
					enc_cmnd_cnt++;
					}
				if(encOW)
					{
					//can_transmit(0x18a,72,0,0,0,0,0,0,0);
					//modbus_write_request(200,6,0,72);
					enc_cmnd=72;
					enc_cmnd_cnt++;
					}
				if(encOW_)
					{
					//can_transmit(0x18a,74,0,0,0,0,0,0,0);
					//modbus_write_request(200,6,0,74);
					enc_cmnd=74;
					enc_cmnd_cnt++;
					}
				}
			}
		}
	ind_fad_cnt=10;
	encCW=0;
	encCW_=0;
	encOW=0;
	encOW_=0;
	if(enc_cmnd_cnt>15)enc_cmnd_cnt=0;
	}

if(cmnd)
	{
	//can_transmit(0x18a,90,0,0,0,0,0,0,0);
	//modbus_write_request(200,6,0,90);
	cmnd=0;
	enc_cmnd=1;
	enc_cmnd_cnt++;
	if(enc_cmnd_cnt>15)enc_cmnd_cnt=0;
	}

}


//-----------------------------------------------
void uart1_init (void)
{
//���� A4 - RX
GPIOA->DDR&=~(1<<4);
GPIOA->CR1|=(1<<4);
GPIOA->CR2&=~(1<<4);

//���� A5 - TX
GPIOA->DDR|=(1<<5);
GPIOA->CR1|=(1<<5);
GPIOA->CR2&=~(1<<5);	

//���� A6 - DE
GPIOA->DDR|=(1<<6);
GPIOA->CR1|=(1<<6);
GPIOA->CR2&=~(1<<6);


	
UART1->CR1&=~UART1_CR1_M;					
UART1->CR3|= (0<<4) & UART1_CR3_STOP;  	
UART1->BRR2= 0x02;
UART1->BRR1= 0x41;
UART1->CR2|= UART1_CR2_TEN | UART1_CR2_REN | UART1_CR2_RIEN/*| UART2_CR2_TIEN*/ ;	
}

//-----------------------------------------------
void can_in_an(void)
{
char temp,i;
signed temp_S;
int tempI;



if(mess[6]==33)
	{
	//&&(mess[1]==2)&&(mess[2]==3)&&(mess[3]==4)&&(mess[4]==5)&&(mess[5]==6)&&(mess[6]==7)&&(mess[7]==8))can_transmit1(1,2,3,4,5,6,7//,8);
	//an_plazma++;;
	
	ind_U=(mess[7]+(mess[8]*256));
	ind_I=(mess[9]+(mess[10]*256));
	work_stat=(enum_work_stat)mess[11];
	ind_U_set=(mess[12]+(mess[13]*256));

	/*out_U= (mess[8]+(mess[9]*256));
	out_I= (mess[10]+(mess[11]*256));
	out_I_= (mess[12]+(mess[13]*256));*/

	//wrk_mode=mess[7];
	
	}

if(mess[6]==34)
	{
	time= (mess[7]+(mess[8]*256));
	time_set= (mess[9]+(mess[10]*256));
	ind_I_set=(mess[12]+(mess[13]*256));
	//wrk_state=mess[7];
	//bREW=mess[12];

/*	ust_I= (mess[8]+(mess[9]*256));
	ust_I_= (mess[10]+(mess[11]*256));
	wrk_state=mess[7];
	bREW=mess[12];*/
	}



can_in_an_end:
bCAN_RX=0;
}   

/* -------------------------------------------------------------------------- */
void init_CAN(void) {
	CAN->MCR&=~CAN_MCR_SLEEP;					// CAN wake up request
	CAN->MCR|= CAN_MCR_INRQ;					// CAN initialization request
	while((CAN->MSR & CAN_MSR_INAK) == 0);	// waiting for CAN enter the init mode
	
	CAN->MCR|= CAN_MCR_NART;					// no automatic retransmition
	
	CAN->PSR= 2;							// *** FILTER 0 SETTINGS ***
	


//#ifdef ID_SCALE_8					// accepted range of IDs on filter 0
//	CAN->Page.Filter01.F0R1= MY_MESS_STID>>3;			// 8 bits mode
//	CAN->Page.Filter01.F0R2= MY_MESS_STID_MASK>>3;
//#endif
//#ifdef ID_SCALE_16
	CAN->Page.Filter01.F0R1= UKU_MESS_STID>>3;			// 16 bits mode
	CAN->Page.Filter01.F0R2= UKU_MESS_STID<<5;
	CAN->Page.Filter01.F0R5= UKU_MESS_STID_MASK>>3;
	CAN->Page.Filter01.F0R6= UKU_MESS_STID_MASK<<5;
	
	CAN->Page.Filter01.F1R1= BPS_MESS_STID>>3;			// 16 bits mode
	CAN->Page.Filter01.F1R2= BPS_MESS_STID<<5;
	CAN->Page.Filter01.F1R5= BPS_MESS_STID_MASK>>3;
	CAN->Page.Filter01.F1R6= BPS_MESS_STID_MASK<<5;
	
//#endif

	CAN->PSR= 6;									// set page 6
//#ifdef ID_LIST_MODE
//	CAN->Page.Config.FMR1|= 3;								//list mode
//#endif
//#ifdef ID_MASK_MODE
	CAN->Page.Config.FMR1&=~3;								//mask mode
//#endif
//#ifdef ID_SCALE_8
//	CAN->Page.Config.FCR1&= ~(CAN_FCR1_FSC00 | CAN_FCR1_FSC01);			//8 bit scale 
//#endif
//#ifdef ID_SCALE_16
	CAN->Page.Config.FCR1= ((3<<1) & (CAN_FCR1_FSC00 | CAN_FCR1_FSC01));		//16 bit scale
	CAN->Page.Config.FCR1= ((3<<5) & (CAN_FCR1_FSC10 | CAN_FCR1_FSC11));		//16 bit scale
//#endif

	CAN->Page.Config.FCR1|= CAN_FCR1_FACT0;	// filter 0 active
	CAN->Page.Config.FCR1|= CAN_FCR1_FACT1;
	
	
	CAN->PSR= 6;								// *** BIT TIMING SETTINGS ***
	
	CAN->Page.Config.BTR1= 4;					// CAN_BTR1_BRP=9, 	tq= fcpu/(9+1)
	CAN->Page.Config.BTR2= (1<<7)|(6<<4) | 7; 		// BS2=8, BS1=7, 		
	
	CAN->IER|=(1<<1);
	
	
	CAN->MCR&=~CAN_MCR_INRQ;					// leave initialization request
	while((CAN->MSR & CAN_MSR_INAK) != 0);	// waiting for CAN leave the init mode
}


//-----------------------------------------------
void can_transmit(unsigned short id_st,char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7)
{

if((can_buff_wr_ptr<0)||(can_buff_wr_ptr>3))can_buff_wr_ptr=0;

can_out_buff[can_buff_wr_ptr][0]=(char)(id_st>>6);
can_out_buff[can_buff_wr_ptr][1]=(char)(id_st<<2);

can_out_buff[can_buff_wr_ptr][2]=data0;
can_out_buff[can_buff_wr_ptr][3]=data1;
can_out_buff[can_buff_wr_ptr][4]=data2;
can_out_buff[can_buff_wr_ptr][5]=data3;
can_out_buff[can_buff_wr_ptr][6]=data4;
can_out_buff[can_buff_wr_ptr][7]=data5;
can_out_buff[can_buff_wr_ptr][8]=data6;
can_out_buff[can_buff_wr_ptr][9]=data7;

can_buff_wr_ptr++;
if(can_buff_wr_ptr>3)can_buff_wr_ptr=0;
} 

//-----------------------------------------------
void ind_hndl(void)
{

if(ind_fad_cnt)
	{
	ind_fad_cnt--;
	}



//if(ind_I<=999)int2ind_slkuf1(ind_I,0,3,1,0,0,0);
//else int2ind_slkuf1(ind_I/10,0,3,0,0,0,0);
int2ind_slkuf2(ind_U,0,3,1,0,0,0);

//int2ind_slkuf1(but_state,3,1,0,0,0,0);


if(work_stat==wsGS)
	{
	if((ind_fad_cnt)&&(but_state==bsOFF))
		{
		//������������� ���
		if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,4,1,1,0,1);
		else int2ind_slkuf1(ind_I_set/10,0,4,0,1,0,1);
		}
	else
		{
		//������� ���
		if(ind_I<=999)int2ind_slkuf1(ind_I,0,4,1,1,0,0);
		else int2ind_slkuf1(ind_I/10,0,4,0,1,0,0);
		}

	//������� ����������
	if(ind_U<1000){
		int2ind_slkuf2(ind_U,0,3,1,1,0,0);
	} else {
		int2ind_slkuf2(ind_U/10,0,4,0,1,0,0);
	}

	//����� ��������
	if(bFL2)	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,2,0,0,0);
	else 	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,0,0,0,0);

	if(bFL5)dig1_[3]&=0xdf;
	}
else if(work_stat==wsPS)
	{
	//������� ���
	if(ind_I<=999)int2ind_slkuf1(ind_I,0,4,1,1,0,0);
	else int2ind_slkuf1(ind_I/10,0,4,0,1,0,0);

	//������������ ����������
	if((!ind_fad_cnt)||(but_state!=bsOFF)) {
		//������� ����������
		if(ind_U<1000){
			int2ind_slkuf2(ind_U,0,3,1,1,0,0);
		} else {
			int2ind_slkuf2(ind_U/10,0,4,0,1,0,0);
		}
		
	}	else {
		//������������ ����������
		if(ind_U_set<1000) {
			int2ind_slkuf2(ind_U_set,0,3,1,1,0,1);
		} else {
			int2ind_slkuf2(ind_U_set/10,0,4,0,1,0,1);
		}
	}
	
		

	//����� ��������
	if(bFL2)	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,2,0,0,0);
	else 	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,0,0,0,0);

	if(bFL5)dig2_[3]&=0xdf;
	}
else
	{
	if(tmblr_state==tsI)
		{
		//������������� ���
		if((ind_fad_cnt)&&(but_state==bsOFF))
			{
			if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,4,1,1,0,1);
			else int2ind_slkuf1(ind_I_set/10,0,4,0,1,0,1);
			}
		else
			{
			if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,4,1,1,0,0);
			else int2ind_slkuf1(ind_I_set/10,0,4,0,1,0,0);
			}

		//������������ ����������
		if(ind_U_set<1000) {
			int2ind_slkuf2(ind_U_set,0,3,1,1,0,0);
		} else {
			int2ind_slkuf2(ind_U_set/10,0,4,0,1,0,0);
		}
		
		dig1_[3]&=0xdf;

		//������������� �����
		if((ind_fad_cnt)&&(but_state==bsON))
			{
			if(time_set==0xffff)
				{
				dig3[0]=0xbf;
				dig3[1]=0xbf;
				dig3[2]=0xbf;
				dig3[3]=0xbf;
				dig3_[0]=0xff;
				dig3_[1]=0xff;
				dig3_[2]=0xff;
				dig3_[3]=0xff;
				}
			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,1);
			}
		else
			{
			if(time_set==0xffff)
				{
				dig3[0]=0xbf;
				dig3[1]=0xbf;
				dig3[2]=0xbf;
				dig3[3]=0xbf;
				dig3_[0]=0xbf;
				dig3_[1]=0xbf;
				dig3_[2]=0xbf;
				dig3_[3]=0xbf;
				}
			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,0);
			}
		}
	else if(tmblr_state==tsU)
		{
		//������������ ���
		if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,0);
		else int2ind_slkuf1(ind_I_set/10,0,4,0,1,0,0);
		

		//������������ ����������
		if((!ind_fad_cnt)||(but_state!=bsOFF)) {
			if(ind_U_set<1000) {
				int2ind_slkuf2(ind_U_set,0,3,1,1,0,0);
			} else {
				int2ind_slkuf2(ind_U_set/10,0,4,0,1,0,0);
			}
		}	else {
			if(ind_U_set<1000) {
				int2ind_slkuf2(ind_U_set,0,3,1,1,0,1);
			} else {
				int2ind_slkuf2(ind_U_set/10,0,4,0,1,0,1);
			}
		}
		dig2_[3]&=0xdf;

		//������������� �����
		if((ind_fad_cnt)&&(but_state==bsON))
			{
			if(time_set==0xffff)
				{
				dig3[0]=0xbf;
				dig3[1]=0xbf;
				dig3[2]=0xbf;
				dig3[3]=0xbf;
				dig3_[0]=0xff;
				dig3_[1]=0xff;
				dig3_[2]=0xff;
				dig3_[3]=0xff;
				}
			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,1);
			}
		else
			{
			if(time_set==0xffff)
				{
				dig3[0]=0xbf;
				dig3[1]=0xbf;
				dig3[2]=0xbf;
				dig3[3]=0xbf;
				dig3_[0]=0xbf;
				dig3_[1]=0xbf;
				dig3_[2]=0xbf;
				dig3_[3]=0xbf;
				}
			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,0);
			}
		}
//int2ind_slkuf3(ind_fad_cnt,0,4,2,0,0,0);
	}
	
//int2ind_slkuf1(encApin,0,3,1,1,0,1);
//int2ind_slkuf2(enc_cmnd_cnt,0,3,1,1,0,1);
//int2ind_slkuf1(enc_cmnd,0,3,1,1,0,1);

}

//-----------------------------------------------
void can_tx_hndl(void)
{
	
if(bTX_FREE)
	{
	if(can_buff_rd_ptr!=can_buff_wr_ptr)
		{
		bTX_FREE=0;

		CAN->PSR= 0;
		CAN->Page.TxMailbox.MDLCR=8;
		CAN->Page.TxMailbox.MIDR1=can_out_buff[can_buff_rd_ptr][0];
		CAN->Page.TxMailbox.MIDR2=can_out_buff[can_buff_rd_ptr][1];

		memcpy(&CAN->Page.TxMailbox.MDAR1, &can_out_buff[can_buff_rd_ptr][2],8);

		can_buff_rd_ptr++;
		if(can_buff_rd_ptr>3)can_buff_rd_ptr=0;

		CAN->Page.TxMailbox.MCSR|= CAN_MCSR_TXRQ;
		CAN->IER|=(1<<0);
		}
	}
else 
	{
	tx_busy_cnt++;
	if(tx_busy_cnt>=100)
		{
		tx_busy_cnt=0;
		bTX_FREE=1;
		}
	}
}


//-----------------------------------------------
void t4_init(void){
	TIM4->PSCR = 7;
	TIM4->ARR= 66;
	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
	
	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
	
}

//-----------------------------------------------
void t1_init(void)
{
TIM1->ARRH= 0x03;
TIM1->ARRL= 0xff;
TIM1->CCR1H= 0x00;	
TIM1->CCR1L= 0xff;
TIM1->CCR2H= 0x00;	
TIM1->CCR2L= 0x00;

TIM1->CCMR1= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE; //OC2 toggle mode, prelouded
TIM1->CCMR2= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE; //OC2 toggle mode, prelouded
TIM1->CCER1= TIM1_CCER1_CC1E | TIM1_CCER1_CC2E ; //OC1, OC2 output pins enabled

TIM1->CR1=(TIM1_CR1_CEN | TIM1_CR1_ARPE);
TIM1->BKR|= TIM1_BKR_AOE;
}



//***********************************************
//***********************************************
//***********************************************
//***********************************************
@far @interrupt void TIM4_UPD_Interrupt (void) 
{
TIM4->SR1&=~TIM4_SR1_UIF;

/*ADC2->CSR=0x25+adc_ch;
ADC2->CR1|=1;
ADC2->CR1|=1;*/
//bT4=!bT4;
cnt_T4++;
if(cnt_T4>=3)cnt_T4=0;



if(!cnt_T4)
	{
	strob_cnt++;
	if(strob_cnt>=4)strob_cnt=0;
	(GPIOB->ODR)=(GPIOB->ODR)|0x0f;
	
	GPIOD->ODR=dig1[strob_cnt];
	spi(dig2[strob_cnt]);
	GPIOC->ODR&=~(1<<2);
	GPIOC->ODR|=(1<<2);
	spi(dig3[strob_cnt]);
	GPIOC->ODR&=~(1<<3);
	GPIOC->ODR|=(1<<3);
	
	(GPIOB->ODR)&=~(1<<(3-strob_cnt));
	}
else if(cnt_T4==2)
	{
	GPIOD->ODR=dig1_[strob_cnt];
	spi(dig2_[strob_cnt]);
	GPIOC->ODR&=~(1<<2);
	GPIOC->ODR|=(1<<2);
	spi(dig3_[strob_cnt]);
	GPIOC->ODR&=~(1<<3);
	GPIOC->ODR|=(1<<3);
	}


if(++t0_cnt0>=12)
	{
	b100Hz=1;
	t0_cnt0=0;
	if(++t0_cnt1>=10)
		{
		t0_cnt1=0;
		b10Hz=1;
		}
	if(++t0_cnt2>=20)
		{
		t0_cnt2=0;
		b5Hz=1;
		if(bFL5)bFL5=0;
		else bFL5=1;
		}
	if(++t0_cnt4>=50)
		{
		t0_cnt4=0;
		b2Hz=1;
		if(bFL2)bFL2=0;
		else bFL2=1;
		}
	if(++t0_cnt3>=100)
		{
		t0_cnt3=0;
		b1Hz=1;
		}
	}

if(modbusTimeOutCnt<6)
	{
	modbusTimeOutCnt++;
	if(modbusTimeOutCnt>=6)
		{
		bMODBUS_TIMEOUT=1;
		
		}
	}
else if (modbusTimeOutCnt>6)
	{
	modbusTimeOutCnt=0;
	bMODBUS_TIMEOUT=0;
	}
  


if(GPIOB->IDR&(1<<6))encApin=1;
else encApin=0;

if(GPIOB->IDR&(1<<4))encBpin=1;
else encBpin=0;

if(encApin_old==encApin)
	{
	if(encAcnt<3)
		{
		encAcnt++;
		if(encAcnt>=3)
			{
			encA=encApin;
			if(encA==encB)encCW=1;
			else encOW=1;
			}
		}
	}
else encAcnt=0;

if(encBpin_old==encBpin)
	{
	if(encBcnt<3)
		{
		encBcnt++;
		if(encBcnt>=3)
			{
			encB=encBpin;
			}
		}
	}
else encBcnt=0;




encApin_old=encApin;
encBpin_old=encBpin;

}

//***********************************************
@far @interrupt void CAN_RX_Interrupt (void) 
{
	
CAN->PSR= 7;	

//can_plazma++;
// page 7 - read messsage
//while (CAN->RFR & CAN_RFR_FMP01) {				// make up all received messages
memcpy(&mess[0], &CAN->Page.RxFIFO.MFMI, 14); // compare the message content
//				for(i=5; i<MY_MESS_DLC+5; ++i)
//					if(mess[i+1]!=MY_MESS[i]) { tout= 0; break;	};
//				if(tout)
//					set_Rx_LEDs();
//				CAN->RFR|= CAN_RFR_RFOM;				// release received message
//				while(CAN->RFR & CAN_RFR_RFOM);		// wait until the current message is released

//adress=30;
//if((mess[8]==0xeD)&&(mess[6]==adress)) GPIOA->ODR^=(1<<5);	

bCAN_RX=1;
CAN->RFR|=(1<<5);

}

//***********************************************
@far @interrupt void CAN_TX_Interrupt (void) 
{
if((CAN->TSR)&(1<<0))
	{
	bTX_FREE=1;	
	//GPIOA->ODR^=(1<<5);
	CAN->TSR|=(1<<0);
	}
}

//***********************************************
@far @interrupt void ADC2_EOC_Interrupt (void) {

short temp_adc;

GPIOE->ODR|=(1<<6);

ADC2->CSR&=~(1<<7);

temp_adc=(((short)(ADC2->DRH))<<8)+((short)(ADC2->DRL));
//unet_buff[adc_ch]=temp_adc;
//unet_buff_flag[adc_ch]=1;

//adc_ch++;
//if(adc_ch>=3)adc_ch=0;
		
//adc2_start(0);
GPIOE->ODR&=~(1<<6);

}

//***********************************************
@far @interrupt void UART1TxInterrupt (void) 
{
@near char tx_status;

tx_status=UART1->SR;

if (tx_status & (UART1_SR_TXE))
{
	if (tx_counter1)
		{
		--tx_counter1;
		UART1->DR=tx_buffer1[tx_rd_index1];
		if (++tx_rd_index1 == TX_BUFFER_SIZE1) tx_rd_index1=0;
		}
	else 
		{
		tx_stat_cnt=3;
			bOUT_FREE=1;
			UART1->CR2&= ~UART1_CR2_TIEN;
			
		}
}
if (tx_status & (UART1_SR_TC))
	{		
	GPIOA->ODR&=~(1<<6);
	tx_stat=txsOFF;
	UART1->SR&=~UART1_SR_TC;
	}
}

//***********************************************
@far @interrupt void UART1RxInterrupt (void) 
{
@near char temp,rx_status,rx_data;

rx_status=UART1->SR;
rx_data=UART1->DR;

/*if(rx_data==0x0a)
	{
GPIOD->DDR|=(1<<5);
GPIOD->CR1|=(1<<5);
GPIOD->CR2&=~(1<<5);
GPIOD->ODR^=(1<<5);	
	}*/

if ((rx_status & (UART1_SR_RXNE))&&(tx_stat!=tsON))
	{
		
	temp=rx_data;
	rx_buffer[rx_wr_index1]=rx_data;
	
	rx_wr_index1++;

	modbusTimeOutCnt=0;
	}


}


//===============================================
//===============================================
//===============================================
//===============================================

main()
{

CLK->ECKR|=1;
while((CLK->ECKR & 2) == 0);
CLK->SWCR|=2;
CLK->SWR=0xB4;

delay_ms(200);
FLASH_DUKR=0xae;
FLASH_DUKR=0x56;
enableInterrupts();

GPIOB->DDR|=0x0f;
GPIOB->CR1&=~(0x0f);
GPIOB->CR2&=~(0x0f);

GPIOD->DDR|=0xff;
GPIOD->CR1&=~(0xff);
GPIOD->CR2&=~(0xff);

GPIOB->DDR&=~(1<<5);
GPIOB->CR1|=(1<<5);

GPIOB->DDR&=~(1<<4);
GPIOB->CR1|=(1<<4);
//GPIOB->CR2|=(1<<4);

GPIOB->DDR&=~(1<<6);
GPIOB->CR1|=(1<<6);/*
GPIOB->CR2|=(1<<6);*/

GPIOB->DDR&=~(1<<7);
GPIOB->CR1|=(1<<7);

GPIOE->DDR&=~(1<<0);
GPIOE->CR1|=(1<<0);

GPIOE->DDR&=~(1<<1);
GPIOE->CR1|=(1<<1);

/*		GPIOE->DDR|=(1<<6);
		GPIOE->CR1|=(1<<6);
		GPIOE->CR2&=~(1<<6);

		GPIOE->DDR|=(1<<5);
		GPIOE->CR1|=(1<<5);
		GPIOE->CR2&=~(1<<5);*/
		

t4_init();
spi_init();
/*		GPIOG->DDR|=(1<<0);
		GPIOG->CR1|=(1<<0);
		GPIOG->CR2&=~(1<<0);	
		//GPIOG->ODR^=(1<<0);

		GPIOG->DDR&=~(1<<1);
		GPIOG->CR1|=(1<<1);
		GPIOG->CR2&=~(1<<1);
		
		GPIOD->DDR|=(1<<7);
		GPIOD->CR1|=(1<<7);
		GPIOD->CR2&=~(1<<7);*/

#ifdef CAN_TO_UKU
init_CAN();
#endif
//adc2_init();

//CAN->DGR&=0xfc;
/*
GPIOC->DDR|=(1<<1);
GPIOC->CR1|=(1<<1);
GPIOC->CR2|=(1<<1);

GPIOC->DDR|=(1<<2);
GPIOC->CR1|=(1<<2);
GPIOC->CR2|=(1<<2);
*/
//t1_init();
/*
GPIOA->DDR|=(1<<5);
GPIOA->CR1|=(1<<5);
GPIOA->CR2&=~(1<<5);

TZAS=10;


adc2_init();
adc2_start(0);
*/
#ifdef RS_TO_UKU
uart1_init();
#endif

while (1)
	{

#ifdef CAN_TO_UKU		
	if(bCAN_RX)
		{

		bCAN_RX=0;
		can_in_an();


		}
#endif
#ifdef RS_TO_UKU
	if(bMODBUS_TIMEOUT)
		{
		bMODBUS_TIMEOUT=0;
		
		modbus_in();
		}
#endif
//	if(bRX485)
//		{
//		rx485_in_an();
//		}

	if(b100Hz)
		{
		b100Hz=0;
/*GPIOE->ODR^=(1<<5);


		//GPIOC->ODR^=(1<<1);
		*/
		can_tx_hndl();

		enc_but_drv();
		enc_an();
	
		tmblr_drv();
		but_drv();	
      	}  
      	
	if(b10Hz)
		{
		b10Hz=0;

		ind_hndl();


	
	  /*   link_drv();*/
		}

	if(b5Hz)
		{
		b5Hz=0;
		
		GPIOE->DDR|=(1<<1);
		GPIOE->CR1|=(1<<1);
		GPIOE->CR2|=(1<<1);		
		
		GPIOE->ODR^=(1<<1);
#ifdef RS_TO_UKU
		modbus_write_request(200,6,1,(enc_cmnd_cnt&0x0f)+(((cmnd<<4)&0xf0)+(tmblr_state&0x01)<<15)+((enc_cmnd&0x7f)<<8));
		//modbus_transmit_request(200,4,0,7);
		
		//putchar1(200);
		//putchar1(6);
		//putchar1(0);
		//putchar1(1);
		//putchar1(0);
		//putchar1(2);
		//putchar1(0x48);
		//putchar1(0x52);
#endif
		
      	}
      	
	if(b2Hz)
		{
		b2Hz=0;
//led_ind=adc_buff_[0]/100;

//		GPIOA->ODR^=(1<<5);

#ifdef CAN_TO_UKU
		can_transmit(0x18a,45,(tmblr_state&0x0f)+((cmnd<<4)&0xf0)+(enc_cmnd<<8),/**(((char*)&ust_U)+1)*/0,/**((char*)&ust_U)*/0,/**(((char*)&ust_I)+1)*/0,/**((char*)&ust_I)*/0,/**(((char*)&ust_time)+1)*/0,/**((char*)&ust_time)*/0);
#endif		
		}
    	
	if(b1Hz)
		{
		b1Hz=0;
		
		bB=!bB;
		/*ind_cnt++;
		if(ind_cnt==10)ind_cnt=0;
		dig2[0]=DIGISYM[ind_cnt];*/
		
		
        /*  if(main_cnt<1000)main_cnt++;
  		
  		can_error_cnt++;
  		if(can_error_cnt>=10)
  			{
  			can_error_cnt=0;
			init_CAN();
  			}*/
		
		}

	}
}