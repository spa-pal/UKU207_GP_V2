
#define MCP2515_CS 1
#define MCP2515_CS_ON       LPC_GPIO0->FIODIR|=(1UL<<MCP2515_CS);LPC_GPIO0->FIOCLR|=(1UL<<MCP2515_CS);
#define MCP2515_CS_OFF      LPC_GPIO0->FIODIR|=(1UL<<MCP2515_CS);LPC_GPIO0->FIOSET|=(1UL<<MCP2515_CS);




//#if(KAN_XTAL==8)
//#define CNF1_init	0xc3 /*0b11000011*/  //tq=500ns   //8MHz
//#define CNF2_init	0xfb /*0b11111011*/  //Ps1=7tq,Pr=2tq 
//#define CNF3_init	0x02 /*0b00000010*/  //Ps2=6tq   
//#elif(KAN_XTAL==10)
#define CNF1_init	0xc3 /*0b11000011*/  //tq=500ns   //10MHz
#define CNF2_init	0xfe /*0b11111110*/  //Ps1=7tq,Pr=2tq 
#define CNF3_init	0x03 /*0b00000011*/  //Ps2=6tq
//#elif(KAN_XTAL==20)
//#define CNF1_init	0xc7 /*0b11000111*/  //tq=500ns   //20MHz
//#define CNF2_init	0xfe /*0b11111110*/  //Ps1=7tq,Pr=2tq 
//#define CNF3_init	0x03 /*0b00000011*/  //Ps2=6tq
//#endif





#define RXF0SIDH	0x00
#define RXF0SIDL	0x01
#define RXF0EID8	0x02
#define RXF0EID0	0x03
#define RXF1SIDH	0x04
#define RXF1SIDL	0x05
#define RXF1EID8	0x06
#define RXF1EID0	0x07
#define RXF2SIDH	0x08
#define RXF2SIDL	0x09
#define RXF2EID8	0x0a
#define RXF2EID0	0x0b
#define BFPCTRL	0x0c
#define TXRTSCTRL	0x0d
#define CANSTAT	0x0e
#define CANCTRL	0x0f

#define RXF3SIDH	0x10
#define RXF3SIDL	0x11
#define RXF3EID8	0x12
#define RXF3EID0	0x13
#define RXF4SIDH	0x14
#define RXF4SIDL	0x15
#define RXF4EID8	0x16
#define RXF4EID0	0x17
#define RXF5SIDH	0x18
#define RXF5SIDL	0x19
#define RXF5EID8	0x1a
#define RXF5EID0	0x1b
#define TEC		0x1c
#define REC		0x1d 

#define RXM0SIDH	0x20
#define RXM0SIDL	0x21
#define RXM0EID8	0x22
#define RXM0EID0	0x23
#define RXM1SIDH	0x24
#define RXM1SIDL	0x25
#define RXM1EID8	0x26
#define RXM1EID0	0x27
#define CNF3		0x28 
#define CNF2		0x29
#define CNF1		0x2a
#define CANINTE	0x2b
#define CANINTF	0x2c
#define EFLG		0x2d

#define TXB0CTRL	0x30
#define TXB0SIDH	0x31
#define TXB0SIDL	0x32
#define TXB0EID8	0x33
#define TXB0EID0	0x34
#define TXB0DLC	0x35
#define TXB0D0		0x36
#define TXB0D1		0x37
#define TXB0D2		0x38 
#define TXB0D3		0x39
#define TXB0D4		0x3a
#define TXB0D5		0x3b
#define TXB0D6		0x3c
#define TXB0D7		0x3d

#define TXB1CTRL	0x40
#define TXB1SIDH	0x41
#define TXB1SIDL	0x42
#define TXB1EID8	0x43
#define TXB1EID0	0x44
#define TXB1DLC	0x45
#define TXB1D0		0x46
#define TXB1D1		0x47
#define TXB1D2		0x48 
#define TXB1D3		0x49
#define TXB1D4		0x4a
#define TXB1D5		0x4b
#define TXB1D6		0x4c
#define TXB1D7		0x4d

#define TXB2CTRL	0x50
#define TXB2SIDH	0x51
#define TXB2SIDL	0x52
#define TXB2EID8	0x53
#define TXB2EID0	0x54
#define TXB2DLC	0x55
#define TXB2D0		0x56
#define TXB2D1		0x57
#define TXB2D2		0x58 
#define TXB2D3		0x59
#define TXB2D4		0x5a
#define TXB2D5		0x5b
#define TXB2D6		0x5c
#define TXB2D7		0x5d

#define RXB0CTRL	0x60
#define RXB0SIDH	0x61
#define RXB0SIDL	0x62
#define RXB0EID8	0x63
#define RXB0EID0	0x64
#define RXB0DLC	0x65
#define RXB0D0		0x66
#define RXB0D1		0x67
#define RXB0D2		0x68 
#define RXB0D3		0x69
#define RXB0D4		0x6a
#define RXB0D5		0x6b
#define RXB0D6		0x6c
#define RXB0D7		0x6d

#define RXB1CTRL	0x70
#define RXB1SIDH	0x71
#define RXB1SIDL	0x72
#define RXB1EID8	0x73
#define RXB1EID0	0x74
#define RXB1DLC	0x75
#define RXB1D0		0x76
#define RXB1D1		0x77
#define RXB1D2		0x78 
#define RXB1D3		0x79
#define RXB1D4		0x7a
#define RXB1D5		0x7b
#define RXB1D6		0x7c
#define RXB1D7		0x7d

extern char mcp2515_can_st,mcp2515_can_st_old;
extern char MCP2515_RXBUFF[40];
extern char bMCP2515_IN;
extern char mcp2515_out_buff[8][8];
extern char mcp2515_buff_wr_ptr;
extern char mcp2515_buff_rd_ptr;


//-----------------------------------------------
void mcp2515_reset(void);
//-----------------------------------------------
char mcp2515_write(char addr,char in);
//-----------------------------------------------
char mcp2515_read(char addr);
//-----------------------------------------------
void mcp2515_bit_modify(char addr,char mask,char data);
//-----------------------------------------------
char mcp2515_read_status(void);
//-----------------------------------------------
void mcp2515_rts(char in);
//-----------------------------------------------
void can_mcp2515_init(void);
//-----------------------------------------------
void can_mcp2515_hndl(void);
//-----------------------------------------------
void mcp2515_transmit(char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7);


