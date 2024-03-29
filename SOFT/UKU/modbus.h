
extern unsigned char modbus_buf[20];
extern short modbus_crc16;
extern char modbus_timeout_cnt;
extern char bMODBUS_TIMEOUT;
extern unsigned char modbus_rx_buffer[30];	//�����, ���� ���������� ����������� ������� ���������� ���������� �� ������ �����
extern unsigned char modbus_an_buffer[30];	//�����, ���� ��� ����� ���������� ��� �������
extern unsigned char modbus_rx_buffer_ptr;	//��������� �� ������� ������� ������������ ������
extern unsigned char modbus_rx_counter;		//���������� �������� ����, ������������ ��� ������� ����������� ������� � ��� �����������
extern signed short modbusTimeoutInMills;
extern short modbus_plazma;				//�������
extern short modbus_plazma1;				//�������
extern short modbus_plazma2;				//�������
extern short modbus_plazma3;				//�������
extern char modbus_cmnd_cnt,modbus_cmnd,modbus_self_cmnd_cnt;

extern char modbus_registers[300];

//-----------------------------------------------
unsigned short CRC16_2(char* buf, short len);
//-----------------------------------------------
void modbus_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr,unsigned short reg_quantity);
//-----------------------------------------------
void modbus_hold_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short reg_quantity, char prot);
//-----------------------------------------------
void modbus_hold_register_answer_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short answer);
//-----------------------------------------------
void modbus_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr);
//-----------------------------------------------
void modbus_hold_register_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr);
//-----------------------------------------------
void modbus_input_registers_transmit(unsigned char adr,unsigned char func,unsigned short reg_adr, unsigned short reg_quantity, char prot);
//-----------------------------------------------
void modbus_for_pult_registers_transmit(unsigned short reg_quantity);
//-----------------------------------------------
void modbus_in(void);



