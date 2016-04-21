   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2172                     	bsct
2173  0000               _t0_cnt0:
2174  0000 00            	dc.b	0
2175  0001               _t0_cnt1:
2176  0001 00            	dc.b	0
2177  0002               _t0_cnt2:
2178  0002 00            	dc.b	0
2179  0003               _t0_cnt3:
2180  0003 00            	dc.b	0
2181  0004               _t0_cnt4:
2182  0004 00            	dc.b	0
2183                     .const:	section	.text
2184  0000               _DIGISYM:
2185  0000 c0            	dc.b	192
2186  0001 f9            	dc.b	249
2187  0002 a4            	dc.b	164
2188  0003 b0            	dc.b	176
2189  0004 99            	dc.b	153
2190  0005 92            	dc.b	146
2191  0006 82            	dc.b	130
2192  0007 f8            	dc.b	248
2193  0008 80            	dc.b	128
2194  0009 90            	dc.b	144
2195  000a ff            	dc.b	255
2196  000b ff            	dc.b	255
2197  000c ff            	dc.b	255
2198  000d ff            	dc.b	255
2199  000e ff            	dc.b	255
2200                     	bsct
2201  0005               _dig1:
2202  0005 ff            	dc.b	255
2203  0006 ff            	dc.b	255
2204  0007 ff            	dc.b	255
2205  0008 ff            	dc.b	255
2206  0009 00000000      	ds.b	4
2207  000d               _dig2:
2208  000d ff            	dc.b	255
2209  000e ff            	dc.b	255
2210  000f ff            	dc.b	255
2211  0010 ff            	dc.b	255
2212  0011 00000000      	ds.b	4
2213  0015               _dig3:
2214  0015 ff            	dc.b	255
2215  0016 ff            	dc.b	255
2216  0017 ff            	dc.b	255
2217  0018 ff            	dc.b	255
2218  0019 00000000      	ds.b	4
2219  001d               _dig1_:
2220  001d ff            	dc.b	255
2221  001e ff            	dc.b	255
2222  001f ff            	dc.b	255
2223  0020 ff            	dc.b	255
2224  0021 00000000      	ds.b	4
2225  0025               _dig2_:
2226  0025 ff            	dc.b	255
2227  0026 ff            	dc.b	255
2228  0027 ff            	dc.b	255
2229  0028 ff            	dc.b	255
2230  0029 00000000      	ds.b	4
2231  002d               _dig3_:
2232  002d ff            	dc.b	255
2233  002e ff            	dc.b	255
2234  002f ff            	dc.b	255
2235  0030 ff            	dc.b	255
2236  0031 00000000      	ds.b	4
2237  0035               _bTX_FREE:
2238  0035 01            	dc.b	1
2239  0036               _bCAN_RX:
2240  0036 00            	dc.b	0
2241  0037               _ch_en:
2242  0037 00            	dc.b	0
2243  0038               _work_stat:
2244  0038 00            	dc.b	0
2245                     	switch	.data
2246  0000               _tx_buffer1:
2247  0000 00            	dc.b	0
2248  0001 000000000000  	ds.b	49
2249  0032               _rx_buffer:
2250  0032 00            	dc.b	0
2251  0033 000000000000  	ds.b	49
2252                     	bsct
2253  0039               _tx_stat:
2254  0039 00            	dc.b	0
2255  003a               _tx_wd_cnt:
2256  003a 64            	dc.b	100
2257  003b               _modbusTimeOutCnt:
2258  003b 00            	dc.b	0
2259  003c               _bMODBUS_TIMEOUT:
2260  003c 00            	dc.b	0
2327                     ; 127 long delay_ms(short in)
2327                     ; 128 {
2329                     	switch	.text
2330  0000               _delay_ms:
2332  0000 520c          	subw	sp,#12
2333       0000000c      OFST:	set	12
2336                     ; 131 i=((long)in)*100UL;
2338  0002 90ae0064      	ldw	y,#100
2339  0006 cd0000        	call	c_vmul
2341  0009 96            	ldw	x,sp
2342  000a 1c0005        	addw	x,#OFST-7
2343  000d cd0000        	call	c_rtol
2345                     ; 133 for(ii=0;ii<i;ii++)
2347  0010 ae0000        	ldw	x,#0
2348  0013 1f0b          	ldw	(OFST-1,sp),x
2349  0015 ae0000        	ldw	x,#0
2350  0018 1f09          	ldw	(OFST-3,sp),x
2352  001a 2012          	jra	L7641
2353  001c               L3641:
2354                     ; 135 		iii++;
2356  001c 96            	ldw	x,sp
2357  001d 1c0001        	addw	x,#OFST-11
2358  0020 a601          	ld	a,#1
2359  0022 cd0000        	call	c_lgadc
2361                     ; 133 for(ii=0;ii<i;ii++)
2363  0025 96            	ldw	x,sp
2364  0026 1c0009        	addw	x,#OFST-3
2365  0029 a601          	ld	a,#1
2366  002b cd0000        	call	c_lgadc
2368  002e               L7641:
2371  002e 9c            	rvf
2372  002f 96            	ldw	x,sp
2373  0030 1c0009        	addw	x,#OFST-3
2374  0033 cd0000        	call	c_ltor
2376  0036 96            	ldw	x,sp
2377  0037 1c0005        	addw	x,#OFST-7
2378  003a cd0000        	call	c_lcmp
2380  003d 2fdd          	jrslt	L3641
2381                     ; 138 }
2384  003f 5b0c          	addw	sp,#12
2385  0041 81            	ret
2456                     ; 141 unsigned short CRC16_2(char* buf, short len)
2456                     ; 142 {
2457                     	switch	.text
2458  0042               _CRC16_2:
2460  0042 89            	pushw	x
2461  0043 5206          	subw	sp,#6
2462       00000006      OFST:	set	6
2465                     ; 143 unsigned short crc = 0xFFFF;
2467  0045 aeffff        	ldw	x,#65535
2468  0048 1f05          	ldw	(OFST-1,sp),x
2469                     ; 147 for (pos = 0; pos < len; pos++)
2471  004a 5f            	clrw	x
2472  004b 1f01          	ldw	(OFST-5,sp),x
2474  004d 2044          	jra	L5351
2475  004f               L1351:
2476                     ; 149     	crc ^= (unsigned short)buf[pos];          // XOR byte into least sig. byte of crc
2478  004f 1e01          	ldw	x,(OFST-5,sp)
2479  0051 72fb07        	addw	x,(OFST+1,sp)
2480  0054 f6            	ld	a,(x)
2481  0055 5f            	clrw	x
2482  0056 97            	ld	xl,a
2483  0057 01            	rrwa	x,a
2484  0058 1806          	xor	a,(OFST+0,sp)
2485  005a 01            	rrwa	x,a
2486  005b 1805          	xor	a,(OFST-1,sp)
2487  005d 01            	rrwa	x,a
2488  005e 1f05          	ldw	(OFST-1,sp),x
2489                     ; 151     	for ( i = 8; i != 0; i--) 
2491  0060 ae0008        	ldw	x,#8
2492  0063 1f03          	ldw	(OFST-3,sp),x
2493  0065               L1451:
2494                     ; 153       	if ((crc & 0x0001) != 0) 
2496  0065 7b06          	ld	a,(OFST+0,sp)
2497  0067 a501          	bcp	a,#1
2498  0069 2712          	jreq	L7451
2499                     ; 155         		crc >>= 1;                    // Shift right and XOR 0xA001
2501  006b 0405          	srl	(OFST-1,sp)
2502  006d 0606          	rrc	(OFST+0,sp)
2503                     ; 156         		crc ^= 0xA001;
2505  006f 7b06          	ld	a,(OFST+0,sp)
2506  0071 a801          	xor	a,#1
2507  0073 6b06          	ld	(OFST+0,sp),a
2508  0075 7b05          	ld	a,(OFST-1,sp)
2509  0077 a8a0          	xor	a,#160
2510  0079 6b05          	ld	(OFST-1,sp),a
2512  007b 2004          	jra	L1551
2513  007d               L7451:
2514                     ; 158       	else  crc >>= 1;                    // Just shift right
2516  007d 0405          	srl	(OFST-1,sp)
2517  007f 0606          	rrc	(OFST+0,sp)
2518  0081               L1551:
2519                     ; 151     	for ( i = 8; i != 0; i--) 
2521  0081 1e03          	ldw	x,(OFST-3,sp)
2522  0083 1d0001        	subw	x,#1
2523  0086 1f03          	ldw	(OFST-3,sp),x
2526  0088 1e03          	ldw	x,(OFST-3,sp)
2527  008a 26d9          	jrne	L1451
2528                     ; 147 for (pos = 0; pos < len; pos++)
2530  008c 1e01          	ldw	x,(OFST-5,sp)
2531  008e 1c0001        	addw	x,#1
2532  0091 1f01          	ldw	(OFST-5,sp),x
2533  0093               L5351:
2536  0093 9c            	rvf
2537  0094 1e01          	ldw	x,(OFST-5,sp)
2538  0096 130b          	cpw	x,(OFST+5,sp)
2539  0098 2fb5          	jrslt	L1351
2540                     ; 162 return crc;
2542  009a 1e05          	ldw	x,(OFST-1,sp)
2545  009c 5b08          	addw	sp,#8
2546  009e 81            	ret
2611                     ; 167 void modbus_in(void)
2611                     ; 168 {
2612                     	switch	.text
2613  009f               _modbus_in:
2615  009f 5226          	subw	sp,#38
2616       00000026      OFST:	set	38
2619                     ; 180 memcpy(modbus_an_buffer,rx_buffer,rx_wr_index1);
2621  00a1 96            	ldw	x,sp
2622  00a2 1c0009        	addw	x,#OFST-29
2623  00a5 bf00          	ldw	c_x,x
2624  00a7 be05          	ldw	x,_rx_wr_index1
2625  00a9 5d            	tnzw	x
2626  00aa 270a          	jreq	L21
2627  00ac               L41:
2628  00ac 5a            	decw	x
2629  00ad d60032        	ld	a,(_rx_buffer,x)
2630  00b0 92d700        	ld	([c_x.w],x),a
2631  00b3 5d            	tnzw	x
2632  00b4 26f6          	jrne	L41
2633  00b6               L21:
2634                     ; 184 modbus_plazma=rx_wr_index1;
2636  00b6 be05          	ldw	x,_rx_wr_index1
2637  00b8 bf00          	ldw	_modbus_plazma,x
2638                     ; 186 crc16_calculated  = CRC16_2(modbus_an_buffer, rx_wr_index1-2);
2640  00ba be05          	ldw	x,_rx_wr_index1
2641  00bc 5a            	decw	x
2642  00bd 5a            	decw	x
2643  00be 89            	pushw	x
2644  00bf 96            	ldw	x,sp
2645  00c0 1c000b        	addw	x,#OFST-27
2646  00c3 cd0042        	call	_CRC16_2
2648  00c6 85            	popw	x
2649                     ; 187 crc16_incapsulated = modbus_an_buffer[rx_wr_index1-2]+(modbus_an_buffer[rx_wr_index1-1])*256;
2651  00c7 96            	ldw	x,sp
2652  00c8 1c0009        	addw	x,#OFST-29
2653  00cb 1f03          	ldw	(OFST-35,sp),x
2654  00cd be05          	ldw	x,_rx_wr_index1
2655  00cf 5a            	decw	x
2656  00d0 72fb03        	addw	x,(OFST-35,sp)
2657  00d3 f6            	ld	a,(x)
2658  00d4 5f            	clrw	x
2659  00d5 97            	ld	xl,a
2660  00d6 4f            	clr	a
2661  00d7 02            	rlwa	x,a
2662  00d8 01            	rrwa	x,a
2663  00d9 9096          	ldw	y,sp
2664  00db 72a90009      	addw	y,#OFST-29
2665  00df 1701          	ldw	(OFST-37,sp),y
2666  00e1 90be05        	ldw	y,_rx_wr_index1
2667  00e4 905a          	decw	y
2668  00e6 905a          	decw	y
2669  00e8 72f901        	addw	y,(OFST-37,sp)
2670  00eb 90fb          	add	a,(y)
2671  00ed 2401          	jrnc	L61
2672  00ef 5c            	incw	x
2673  00f0               L61:
2674                     ; 198 rx_wr_index1=0;
2676  00f0 5f            	clrw	x
2677  00f1 bf05          	ldw	_rx_wr_index1,x
2678                     ; 202 	if(modbus_an_buffer[0]==200)	 //anee cai?in io ioeuoa
2680  00f3 7b09          	ld	a,(OFST-29,sp)
2681  00f5 a1c8          	cp	a,#200
2682  00f7 267c          	jrne	L1061
2683                     ; 204 		if((modbus_an_buffer[1]==6)||(modbus_an_buffer[1]==4))		//?oaiea i?iecaieuiiai eie-aa ?aaeno?ia
2685  00f9 7b0a          	ld	a,(OFST-28,sp)
2686  00fb a106          	cp	a,#6
2687  00fd 2706          	jreq	L5061
2689  00ff 7b0a          	ld	a,(OFST-28,sp)
2690  0101 a104          	cp	a,#4
2691  0103 2670          	jrne	L1061
2692  0105               L5061:
2693                     ; 206 			if(modbus_an_buffer[2]==14)
2695  0105 7b0b          	ld	a,(OFST-27,sp)
2696  0107 a10e          	cp	a,#14
2697  0109 266a          	jrne	L1061
2698                     ; 208 				ind_U=(modbus_an_buffer[3]+(modbus_an_buffer[4]*256));
2700  010b 7b0d          	ld	a,(OFST-25,sp)
2701  010d 5f            	clrw	x
2702  010e 97            	ld	xl,a
2703  010f 4f            	clr	a
2704  0110 02            	rlwa	x,a
2705  0111 01            	rrwa	x,a
2706  0112 1b0c          	add	a,(OFST-26,sp)
2707  0114 2401          	jrnc	L02
2708  0116 5c            	incw	x
2709  0117               L02:
2710  0117 b797          	ld	_ind_U+1,a
2711  0119 9f            	ld	a,xl
2712  011a b796          	ld	_ind_U,a
2713                     ; 209 				ind_I=(modbus_an_buffer[5]+(modbus_an_buffer[6]*256));
2715  011c 7b0f          	ld	a,(OFST-23,sp)
2716  011e 5f            	clrw	x
2717  011f 97            	ld	xl,a
2718  0120 4f            	clr	a
2719  0121 02            	rlwa	x,a
2720  0122 01            	rrwa	x,a
2721  0123 1b0e          	add	a,(OFST-24,sp)
2722  0125 2401          	jrnc	L22
2723  0127 5c            	incw	x
2724  0128               L22:
2725  0128 b795          	ld	_ind_I+1,a
2726  012a 9f            	ld	a,xl
2727  012b b794          	ld	_ind_I,a
2728                     ; 210 				work_stat=(enum_work_stat)modbus_an_buffer[7];
2730  012d 7b10          	ld	a,(OFST-22,sp)
2731  012f b738          	ld	_work_stat,a
2732                     ; 211 				ind_U_set=(modbus_an_buffer[9]+(modbus_an_buffer[10]*256));
2734  0131 7b13          	ld	a,(OFST-19,sp)
2735  0133 5f            	clrw	x
2736  0134 97            	ld	xl,a
2737  0135 4f            	clr	a
2738  0136 02            	rlwa	x,a
2739  0137 01            	rrwa	x,a
2740  0138 1b12          	add	a,(OFST-20,sp)
2741  013a 2401          	jrnc	L42
2742  013c 5c            	incw	x
2743  013d               L42:
2744  013d b793          	ld	_ind_U_set+1,a
2745  013f 9f            	ld	a,xl
2746  0140 b792          	ld	_ind_U_set,a
2747                     ; 212 				time= (modbus_an_buffer[11]+(modbus_an_buffer[12]*256));
2749  0142 7b15          	ld	a,(OFST-17,sp)
2750  0144 5f            	clrw	x
2751  0145 97            	ld	xl,a
2752  0146 4f            	clr	a
2753  0147 02            	rlwa	x,a
2754  0148 01            	rrwa	x,a
2755  0149 1b14          	add	a,(OFST-18,sp)
2756  014b 2401          	jrnc	L62
2757  014d 5c            	incw	x
2758  014e               L62:
2759  014e b79b          	ld	_time+1,a
2760  0150 9f            	ld	a,xl
2761  0151 b79a          	ld	_time,a
2762                     ; 213 				time_set= (modbus_an_buffer[13]+(modbus_an_buffer[14]*256));
2764  0153 7b17          	ld	a,(OFST-15,sp)
2765  0155 5f            	clrw	x
2766  0156 97            	ld	xl,a
2767  0157 4f            	clr	a
2768  0158 02            	rlwa	x,a
2769  0159 01            	rrwa	x,a
2770  015a 1b16          	add	a,(OFST-16,sp)
2771  015c 2401          	jrnc	L03
2772  015e 5c            	incw	x
2773  015f               L03:
2774  015f b799          	ld	_time_set+1,a
2775  0161 9f            	ld	a,xl
2776  0162 b798          	ld	_time_set,a
2777                     ; 214 				ind_I_set=(modbus_an_buffer[15]+(modbus_an_buffer[16]*256));	
2779  0164 7b19          	ld	a,(OFST-13,sp)
2780  0166 5f            	clrw	x
2781  0167 97            	ld	xl,a
2782  0168 4f            	clr	a
2783  0169 02            	rlwa	x,a
2784  016a 01            	rrwa	x,a
2785  016b 1b18          	add	a,(OFST-14,sp)
2786  016d 2401          	jrnc	L23
2787  016f 5c            	incw	x
2788  0170               L23:
2789  0170 b791          	ld	_ind_I_set+1,a
2790  0172 9f            	ld	a,xl
2791  0173 b790          	ld	_ind_I_set,a
2792  0175               L1061:
2793                     ; 219 }
2796  0175 5b26          	addw	sp,#38
2797  0177 81            	ret
2835                     ; 223 void putchar1(char c)
2835                     ; 224 {
2836                     	switch	.text
2837  0178               _putchar1:
2839  0178 88            	push	a
2840       00000000      OFST:	set	0
2843  0179               L1361:
2844                     ; 225 while (tx_counter1 == TX_BUFFER_SIZE1);
2846  0179 b60b          	ld	a,_tx_counter1
2847  017b a132          	cp	a,#50
2848  017d 27fa          	jreq	L1361
2849                     ; 227 if (tx_counter1 || ((UART1->SR & UART1_SR_TXE)==0))
2851  017f 3d0b          	tnz	_tx_counter1
2852  0181 2607          	jrne	L7361
2854  0183 c65230        	ld	a,21040
2855  0186 a580          	bcp	a,#128
2856  0188 2622          	jrne	L5361
2857  018a               L7361:
2858                     ; 229    tx_buffer1[tx_wr_index1]=c;
2860  018a 5f            	clrw	x
2861  018b b60a          	ld	a,_tx_wr_index1
2862  018d 2a01          	jrpl	L63
2863  018f 53            	cplw	x
2864  0190               L63:
2865  0190 97            	ld	xl,a
2866  0191 7b01          	ld	a,(OFST+1,sp)
2867  0193 d70000        	ld	(_tx_buffer1,x),a
2868                     ; 230    if (++tx_wr_index1 == TX_BUFFER_SIZE1) tx_wr_index1=0;
2870  0196 3c0a          	inc	_tx_wr_index1
2871  0198 b60a          	ld	a,_tx_wr_index1
2872  019a a132          	cp	a,#50
2873  019c 2602          	jrne	L1461
2876  019e 3f0a          	clr	_tx_wr_index1
2877  01a0               L1461:
2878                     ; 231    ++tx_counter1;
2880  01a0 3c0b          	inc	_tx_counter1
2882  01a2               L3461:
2883                     ; 241 UART1->CR2|= UART1_CR2_TIEN | UART1_CR2_TCIEN;
2885  01a2 c65235        	ld	a,21045
2886  01a5 aac0          	or	a,#192
2887  01a7 c75235        	ld	21045,a
2888                     ; 242 }
2891  01aa 84            	pop	a
2892  01ab 81            	ret
2893  01ac               L5361:
2894                     ; 235 	UART1->DR=c;
2896  01ac 7b01          	ld	a,(OFST+1,sp)
2897  01ae c75231        	ld	21041,a
2898                     ; 236 	GPIOA->ODR|=(1<<6);
2900  01b1 721c5000      	bset	20480,#6
2901                     ; 237 	tx_stat=tsON;
2903  01b5 35010039      	mov	_tx_stat,#1
2904  01b9 20e7          	jra	L3461
2996                     ; 245 void modbus_transmit_request(char addr,char func,short reg_adr,short reg_quant)
2996                     ; 246 {
2997                     	switch	.text
2998  01bb               _modbus_transmit_request:
3000  01bb 89            	pushw	x
3001  01bc 5217          	subw	sp,#23
3002       00000017      OFST:	set	23
3005                     ; 250 modbus_buff[0] = addr;
3007  01be 9e            	ld	a,xh
3008  01bf 6b04          	ld	(OFST-19,sp),a
3009                     ; 251 modbus_buff[1] = func;
3011  01c1 9f            	ld	a,xl
3012  01c2 6b05          	ld	(OFST-18,sp),a
3013                     ; 252 modbus_buff[2] = (char)(reg_adr>>8);
3015  01c4 7b1c          	ld	a,(OFST+5,sp)
3016  01c6 6b06          	ld	(OFST-17,sp),a
3017                     ; 253 modbus_buff[3] = (char)reg_adr;
3019  01c8 7b1d          	ld	a,(OFST+6,sp)
3020  01ca 6b07          	ld	(OFST-16,sp),a
3021                     ; 254 modbus_buff[4] = (char)(reg_quant>>8);
3023  01cc 7b1e          	ld	a,(OFST+7,sp)
3024  01ce 6b08          	ld	(OFST-15,sp),a
3025                     ; 255 modbus_buff[5] = (char)reg_quant;
3027  01d0 7b1f          	ld	a,(OFST+8,sp)
3028  01d2 6b09          	ld	(OFST-14,sp),a
3029                     ; 257 crc_temp= CRC16_2(modbus_buff,6);
3031  01d4 ae0006        	ldw	x,#6
3032  01d7 89            	pushw	x
3033  01d8 96            	ldw	x,sp
3034  01d9 1c0006        	addw	x,#OFST-17
3035  01dc cd0042        	call	_CRC16_2
3037  01df 5b02          	addw	sp,#2
3038  01e1 1f01          	ldw	(OFST-22,sp),x
3039                     ; 259 modbus_buff[6]= (char)crc_temp;
3041  01e3 7b02          	ld	a,(OFST-21,sp)
3042  01e5 6b0a          	ld	(OFST-13,sp),a
3043                     ; 260 modbus_buff[7]= (char)(crc_temp>>8);
3045  01e7 7b01          	ld	a,(OFST-22,sp)
3046  01e9 6b0b          	ld	(OFST-12,sp),a
3047                     ; 262 for (i=0;i<8;i++)
3049  01eb 0f03          	clr	(OFST-20,sp)
3050  01ed               L3171:
3051                     ; 264 	putchar1(modbus_buff[i]);
3053  01ed 96            	ldw	x,sp
3054  01ee 1c0004        	addw	x,#OFST-19
3055  01f1 9f            	ld	a,xl
3056  01f2 5e            	swapw	x
3057  01f3 1b03          	add	a,(OFST-20,sp)
3058  01f5 2401          	jrnc	L24
3059  01f7 5c            	incw	x
3060  01f8               L24:
3061  01f8 02            	rlwa	x,a
3062  01f9 f6            	ld	a,(x)
3063  01fa cd0178        	call	_putchar1
3065                     ; 262 for (i=0;i<8;i++)
3067  01fd 0c03          	inc	(OFST-20,sp)
3070  01ff 7b03          	ld	a,(OFST-20,sp)
3071  0201 a108          	cp	a,#8
3072  0203 25e8          	jrult	L3171
3073                     ; 267 }
3076  0205 5b19          	addw	sp,#25
3077  0207 81            	ret
3169                     ; 270 void modbus_write_request(char addr,char func,short reg_adr, short arg)
3169                     ; 271 {
3170                     	switch	.text
3171  0208               _modbus_write_request:
3173  0208 89            	pushw	x
3174  0209 5217          	subw	sp,#23
3175       00000017      OFST:	set	23
3178                     ; 275 modbus_buff[0] = addr;
3180  020b 9e            	ld	a,xh
3181  020c 6b04          	ld	(OFST-19,sp),a
3182                     ; 276 modbus_buff[1] = func;
3184  020e 9f            	ld	a,xl
3185  020f 6b05          	ld	(OFST-18,sp),a
3186                     ; 277 modbus_buff[2] = (char)(reg_adr>>8);
3188  0211 7b1c          	ld	a,(OFST+5,sp)
3189  0213 6b06          	ld	(OFST-17,sp),a
3190                     ; 278 modbus_buff[3] = (char)reg_adr;
3192  0215 7b1d          	ld	a,(OFST+6,sp)
3193  0217 6b07          	ld	(OFST-16,sp),a
3194                     ; 279 modbus_buff[4] = (char)(arg>>8);
3196  0219 7b1e          	ld	a,(OFST+7,sp)
3197  021b 6b08          	ld	(OFST-15,sp),a
3198                     ; 280 modbus_buff[5] = (char)arg;
3200  021d 7b1f          	ld	a,(OFST+8,sp)
3201  021f 6b09          	ld	(OFST-14,sp),a
3202                     ; 282 crc_temp= CRC16_2(modbus_buff,6);
3204  0221 ae0006        	ldw	x,#6
3205  0224 89            	pushw	x
3206  0225 96            	ldw	x,sp
3207  0226 1c0006        	addw	x,#OFST-17
3208  0229 cd0042        	call	_CRC16_2
3210  022c 5b02          	addw	sp,#2
3211  022e 1f01          	ldw	(OFST-22,sp),x
3212                     ; 284 modbus_buff[6]= (char)crc_temp;
3214  0230 7b02          	ld	a,(OFST-21,sp)
3215  0232 6b0a          	ld	(OFST-13,sp),a
3216                     ; 285 modbus_buff[7]= (char)(crc_temp>>8);
3218  0234 7b01          	ld	a,(OFST-22,sp)
3219  0236 6b0b          	ld	(OFST-12,sp),a
3220                     ; 287 for (i=0;i<8;i++)
3222  0238 0f03          	clr	(OFST-20,sp)
3223  023a               L7671:
3224                     ; 289 	putchar1(modbus_buff[i]);
3226  023a 96            	ldw	x,sp
3227  023b 1c0004        	addw	x,#OFST-19
3228  023e 9f            	ld	a,xl
3229  023f 5e            	swapw	x
3230  0240 1b03          	add	a,(OFST-20,sp)
3231  0242 2401          	jrnc	L64
3232  0244 5c            	incw	x
3233  0245               L64:
3234  0245 02            	rlwa	x,a
3235  0246 f6            	ld	a,(x)
3236  0247 cd0178        	call	_putchar1
3238                     ; 287 for (i=0;i<8;i++)
3240  024a 0c03          	inc	(OFST-20,sp)
3243  024c 7b03          	ld	a,(OFST-20,sp)
3244  024e a108          	cp	a,#8
3245  0250 25e8          	jrult	L7671
3246                     ; 292 }
3249  0252 5b19          	addw	sp,#25
3250  0254 81            	ret
3273                     ; 297 void spi_init(void){
3274                     	switch	.text
3275  0255               _spi_init:
3279                     ; 299 	GPIOE->DDR|=(1<<5);
3281  0255 721a5016      	bset	20502,#5
3282                     ; 300 	GPIOE->CR1|=(1<<5);
3284  0259 721a5017      	bset	20503,#5
3285                     ; 301 	GPIOE->CR2&=~(1<<5);
3287  025d 721b5018      	bres	20504,#5
3288                     ; 302 	GPIOE->ODR|=(1<<5);	
3290  0261 721a5014      	bset	20500,#5
3291                     ; 304 	GPIOC->DDR|=(1<<3);
3293  0265 7216500c      	bset	20492,#3
3294                     ; 305 	GPIOC->CR1|=(1<<3);
3296  0269 7216500d      	bset	20493,#3
3297                     ; 306 	GPIOC->CR2&=~(1<<3);
3299  026d 7217500e      	bres	20494,#3
3300                     ; 307 	GPIOC->ODR|=(1<<3);	
3302  0271 7216500a      	bset	20490,#3
3303                     ; 309 	GPIOC->DDR|=(1<<2);
3305  0275 7214500c      	bset	20492,#2
3306                     ; 310 	GPIOC->CR1|=(1<<2);
3308  0279 7214500d      	bset	20493,#2
3309                     ; 311 	GPIOC->CR2&=~(1<<2);
3311  027d 7215500e      	bres	20494,#2
3312                     ; 312 	GPIOC->ODR|=(1<<2);		
3314  0281 7214500a      	bset	20490,#2
3315                     ; 314 	GPIOC->DDR|=(1<<5);
3317  0285 721a500c      	bset	20492,#5
3318                     ; 315 	GPIOC->CR1|=(1<<5);
3320  0289 721a500d      	bset	20493,#5
3321                     ; 316 	GPIOC->CR2|=(1<<5);
3323  028d 721a500e      	bset	20494,#5
3324                     ; 317 	GPIOC->ODR|=(1<<5);	
3326  0291 721a500a      	bset	20490,#5
3327                     ; 319 	GPIOC->DDR|=(1<<6);
3329  0295 721c500c      	bset	20492,#6
3330                     ; 320 	GPIOC->CR1|=(1<<6);
3332  0299 721c500d      	bset	20493,#6
3333                     ; 321 	GPIOC->CR2|=(1<<6);
3335  029d 721c500e      	bset	20494,#6
3336                     ; 322 	GPIOC->ODR|=(1<<6);	
3338  02a1 721c500a      	bset	20490,#6
3339                     ; 329 	SPI->CR1= /*SPI_CR1_LSBFIRST |*/
3339                     ; 330 			SPI_CR1_SPE | 
3339                     ; 331 			( (0<< 3) & SPI_CR1_BR ) |
3339                     ; 332 			SPI_CR1_MSTR |
3339                     ; 333 			SPI_CR1_CPOL |
3339                     ; 334 			SPI_CR1_CPHA; 
3341  02a5 35475200      	mov	20992,#71
3342                     ; 336 	SPI->CR2= SPI_CR2_SSM | SPI_CR2_SSI;
3344  02a9 35035201      	mov	20993,#3
3345                     ; 337 	SPI->ICR= 0;	
3347  02ad 725f5202      	clr	20994
3348                     ; 338 }
3351  02b1 81            	ret
3394                     ; 341 char spi(char in){
3395                     	switch	.text
3396  02b2               _spi:
3398  02b2 88            	push	a
3399  02b3 88            	push	a
3400       00000001      OFST:	set	1
3403  02b4               L1302:
3404                     ; 343 	while(!((SPI->SR)&SPI_SR_TXE));
3406  02b4 c65203        	ld	a,20995
3407  02b7 a502          	bcp	a,#2
3408  02b9 27f9          	jreq	L1302
3409                     ; 344 	SPI->DR=in;
3411  02bb 7b02          	ld	a,(OFST+1,sp)
3412  02bd c75204        	ld	20996,a
3414  02c0               L1402:
3415                     ; 345 	while(!((SPI->SR)&SPI_SR_RXNE));
3417  02c0 c65203        	ld	a,20995
3418  02c3 a501          	bcp	a,#1
3419  02c5 27f9          	jreq	L1402
3420                     ; 346 	c=SPI->DR;	
3422  02c7 c65204        	ld	a,20996
3423  02ca 6b01          	ld	(OFST+0,sp),a
3424                     ; 347 	return c;
3426  02cc 7b01          	ld	a,(OFST+0,sp)
3429  02ce 85            	popw	x
3430  02cf 81            	ret
3474                     ; 351 void bin2bcd_int(unsigned int in)
3474                     ; 352 {
3475                     	switch	.text
3476  02d0               _bin2bcd_int:
3478  02d0 89            	pushw	x
3479  02d1 88            	push	a
3480       00000001      OFST:	set	1
3483                     ; 354 char i=5;
3485                     ; 355 for(i=0;i<5;i++)
3487  02d2 0f01          	clr	(OFST+0,sp)
3488  02d4               L7602:
3489                     ; 357 	dig[i]=in%10;
3491  02d4 1e02          	ldw	x,(OFST+1,sp)
3492  02d6 90ae000a      	ldw	y,#10
3493  02da 65            	divw	x,y
3494  02db 51            	exgw	x,y
3495  02dc 7b01          	ld	a,(OFST+0,sp)
3496  02de 905f          	clrw	y
3497  02e0 9097          	ld	yl,a
3498  02e2 01            	rrwa	x,a
3499  02e3 90e787        	ld	(_dig,y),a
3500  02e6 02            	rlwa	x,a
3501                     ; 358 	in/=10;
3503  02e7 1e02          	ldw	x,(OFST+1,sp)
3504  02e9 90ae000a      	ldw	y,#10
3505  02ed 65            	divw	x,y
3506  02ee 1f02          	ldw	(OFST+1,sp),x
3507                     ; 355 for(i=0;i<5;i++)
3509  02f0 0c01          	inc	(OFST+0,sp)
3512  02f2 7b01          	ld	a,(OFST+0,sp)
3513  02f4 a105          	cp	a,#5
3514  02f6 25dc          	jrult	L7602
3515                     ; 360 }
3518  02f8 5b03          	addw	sp,#3
3519  02fa 81            	ret
3557                     ; 363 void bcd2ind_zero()
3557                     ; 364 {
3558                     	switch	.text
3559  02fb               _bcd2ind_zero:
3561  02fb 88            	push	a
3562       00000001      OFST:	set	1
3565                     ; 366 zero_on=1;
3567  02fc 35010086      	mov	_zero_on,#1
3568                     ; 367 for (i=4;i>0;i--)
3570  0300 a604          	ld	a,#4
3571  0302 6b01          	ld	(OFST+0,sp),a
3572  0304               L3112:
3573                     ; 369 	if(zero_on&&(!dig[i-1])&&(i-1))
3575  0304 3d86          	tnz	_zero_on
3576  0306 271e          	jreq	L1212
3578  0308 7b01          	ld	a,(OFST+0,sp)
3579  030a 5f            	clrw	x
3580  030b 97            	ld	xl,a
3581  030c 5a            	decw	x
3582  030d 6d87          	tnz	(_dig,x)
3583  030f 2615          	jrne	L1212
3585  0311 7b01          	ld	a,(OFST+0,sp)
3586  0313 5f            	clrw	x
3587  0314 97            	ld	xl,a
3588  0315 5a            	decw	x
3589  0316 a30000        	cpw	x,#0
3590  0319 270b          	jreq	L1212
3591                     ; 371 		ind_out_[i-1]=DIGISYM[10];
3593  031b 7b01          	ld	a,(OFST+0,sp)
3594  031d 5f            	clrw	x
3595  031e 97            	ld	xl,a
3596  031f 5a            	decw	x
3597  0320 a6ff          	ld	a,#255
3598  0322 e781          	ld	(_ind_out_,x),a
3600  0324 201c          	jra	L3212
3601  0326               L1212:
3602                     ; 375 		ind_out_[i-1]=DIGISYM[dig[i-1]];
3604  0326 7b01          	ld	a,(OFST+0,sp)
3605  0328 5f            	clrw	x
3606  0329 97            	ld	xl,a
3607  032a 5a            	decw	x
3608  032b 7b01          	ld	a,(OFST+0,sp)
3609  032d 905f          	clrw	y
3610  032f 9097          	ld	yl,a
3611  0331 905a          	decw	y
3612  0333 90e687        	ld	a,(_dig,y)
3613  0336 905f          	clrw	y
3614  0338 9097          	ld	yl,a
3615  033a 90d60000      	ld	a,(_DIGISYM,y)
3616  033e e781          	ld	(_ind_out_,x),a
3617                     ; 376 		zero_on=0;
3619  0340 3f86          	clr	_zero_on
3620  0342               L3212:
3621                     ; 367 for (i=4;i>0;i--)
3623  0342 0a01          	dec	(OFST+0,sp)
3626  0344 0d01          	tnz	(OFST+0,sp)
3627  0346 26bc          	jrne	L3112
3628                     ; 379 }
3631  0348 84            	pop	a
3632  0349 81            	ret
3669                     ; 382 void bcd2ind()
3669                     ; 383 {
3670                     	switch	.text
3671  034a               _bcd2ind:
3673  034a 88            	push	a
3674       00000001      OFST:	set	1
3677                     ; 386 for (i=4;i>0;i--)
3679  034b a604          	ld	a,#4
3680  034d 6b01          	ld	(OFST+0,sp),a
3681  034f               L3412:
3682                     ; 388 	ind_out_[i-1]=DIGISYM[dig[i-1]];
3684  034f 7b01          	ld	a,(OFST+0,sp)
3685  0351 5f            	clrw	x
3686  0352 97            	ld	xl,a
3687  0353 5a            	decw	x
3688  0354 7b01          	ld	a,(OFST+0,sp)
3689  0356 905f          	clrw	y
3690  0358 9097          	ld	yl,a
3691  035a 905a          	decw	y
3692  035c 90e687        	ld	a,(_dig,y)
3693  035f 905f          	clrw	y
3694  0361 9097          	ld	yl,a
3695  0363 90d60000      	ld	a,(_DIGISYM,y)
3696  0367 e781          	ld	(_ind_out_,x),a
3697                     ; 386 for (i=4;i>0;i--)
3699  0369 0a01          	dec	(OFST+0,sp)
3702  036b 0d01          	tnz	(OFST+0,sp)
3703  036d 26e0          	jrne	L3412
3704                     ; 390 }
3707  036f 84            	pop	a
3708  0370 81            	ret
3813                     ; 393 void int2ind_slkuf1(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
3813                     ; 394 {
3814                     	switch	.text
3815  0371               _int2ind_slkuf1:
3817  0371 89            	pushw	x
3818  0372 88            	push	a
3819       00000001      OFST:	set	1
3822                     ; 397 bin2bcd_int(in);
3824  0373 cd02d0        	call	_bin2bcd_int
3826                     ; 398 if(unzero)bcd2ind_zero();
3828  0376 0d09          	tnz	(OFST+8,sp)
3829  0378 2705          	jreq	L3222
3832  037a cd02fb        	call	_bcd2ind_zero
3835  037d 2002          	jra	L5222
3836  037f               L3222:
3837                     ; 399 else bcd2ind();
3839  037f adc9          	call	_bcd2ind
3841  0381               L5222:
3842                     ; 400 if(komma)
3844  0381 0d08          	tnz	(OFST+7,sp)
3845  0383 271c          	jreq	L7222
3846                     ; 402 	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
3848  0385 7b08          	ld	a,(OFST+7,sp)
3849  0387 5f            	clrw	x
3850  0388 97            	ld	xl,a
3851  0389 e681          	ld	a,(_ind_out_,x)
3852  038b a1ff          	cp	a,#255
3853  038d 2608          	jrne	L1322
3856  038f 7b08          	ld	a,(OFST+7,sp)
3857  0391 5f            	clrw	x
3858  0392 97            	ld	xl,a
3859  0393 a6c0          	ld	a,#192
3860  0395 e781          	ld	(_ind_out_,x),a
3861  0397               L1322:
3862                     ; 403 	ind_out_[komma]&=0b01111111;
3864  0397 7b08          	ld	a,(OFST+7,sp)
3865  0399 5f            	clrw	x
3866  039a 97            	ld	xl,a
3867  039b e681          	ld	a,(_ind_out_,x)
3868  039d a47f          	and	a,#127
3869  039f e781          	ld	(_ind_out_,x),a
3870  03a1               L7222:
3871                     ; 405 if(fl&&bFL5)
3873  03a1 0d0a          	tnz	(OFST+9,sp)
3874  03a3 2718          	jreq	L3322
3876  03a5 3d7b          	tnz	_bFL5
3877  03a7 2714          	jreq	L3322
3878                     ; 407 	for(i=0;i<len;i++)
3880  03a9 0f01          	clr	(OFST+0,sp)
3882  03ab 200a          	jra	L1422
3883  03ad               L5322:
3884                     ; 409 		ind_out_[i]=DIGISYM[10];
3886  03ad 7b01          	ld	a,(OFST+0,sp)
3887  03af 5f            	clrw	x
3888  03b0 97            	ld	xl,a
3889  03b1 a6ff          	ld	a,#255
3890  03b3 e781          	ld	(_ind_out_,x),a
3891                     ; 407 	for(i=0;i<len;i++)
3893  03b5 0c01          	inc	(OFST+0,sp)
3894  03b7               L1422:
3897  03b7 7b01          	ld	a,(OFST+0,sp)
3898  03b9 1107          	cp	a,(OFST+6,sp)
3899  03bb 25f0          	jrult	L5322
3900  03bd               L3322:
3901                     ; 413 for(i=0;i<len;i++)
3903  03bd 0f01          	clr	(OFST+0,sp)
3905  03bf 2016          	jra	L1522
3906  03c1               L5422:
3907                     ; 415 		dig1[start+i]=ind_out_[i];
3909  03c1 7b06          	ld	a,(OFST+5,sp)
3910  03c3 5f            	clrw	x
3911  03c4 1b01          	add	a,(OFST+0,sp)
3912  03c6 2401          	jrnc	L46
3913  03c8 5c            	incw	x
3914  03c9               L46:
3915  03c9 02            	rlwa	x,a
3916  03ca 7b01          	ld	a,(OFST+0,sp)
3917  03cc 905f          	clrw	y
3918  03ce 9097          	ld	yl,a
3919  03d0 90e681        	ld	a,(_ind_out_,y)
3920  03d3 e705          	ld	(_dig1,x),a
3921                     ; 413 for(i=0;i<len;i++)
3923  03d5 0c01          	inc	(OFST+0,sp)
3924  03d7               L1522:
3927  03d7 7b01          	ld	a,(OFST+0,sp)
3928  03d9 1107          	cp	a,(OFST+6,sp)
3929  03db 25e4          	jrult	L5422
3930                     ; 417 if(len==0)
3932  03dd 0d07          	tnz	(OFST+6,sp)
3933  03df 2610          	jrne	L5522
3934                     ; 419 	dig1[0]=0xff;
3936  03e1 35ff0005      	mov	_dig1,#255
3937                     ; 420 	dig1[1]=0xff;
3939  03e5 35ff0006      	mov	_dig1+1,#255
3940                     ; 421 	dig1[2]=0xff;
3942  03e9 35ff0007      	mov	_dig1+2,#255
3943                     ; 422 	dig1[3]=0xff;
3945  03ed 35ff0008      	mov	_dig1+3,#255
3946  03f1               L5522:
3947                     ; 424 dig1_[0]=dig1[0];
3949  03f1 45051d        	mov	_dig1_,_dig1
3950                     ; 425 dig1_[1]=dig1[1];
3952  03f4 45061e        	mov	_dig1_+1,_dig1+1
3953                     ; 426 dig1_[2]=dig1[2];
3955  03f7 45071f        	mov	_dig1_+2,_dig1+2
3956                     ; 427 dig1_[3]=dig1[3];
3958  03fa 450820        	mov	_dig1_+3,_dig1+3
3959                     ; 428 if(fad)
3961  03fd 0d0b          	tnz	(OFST+10,sp)
3962  03ff 2710          	jreq	L7522
3963                     ; 430 	dig1[0]=0xff;
3965  0401 35ff0005      	mov	_dig1,#255
3966                     ; 431 	dig1[1]=0xff;
3968  0405 35ff0006      	mov	_dig1+1,#255
3969                     ; 432 	dig1[2]=0xff;
3971  0409 35ff0007      	mov	_dig1+2,#255
3972                     ; 433 	dig1[3]=0xff;
3974  040d 35ff0008      	mov	_dig1+3,#255
3975  0411               L7522:
3976                     ; 435 }
3979  0411 5b03          	addw	sp,#3
3980  0413 81            	ret
4085                     ; 438 void int2ind_slkuf2(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
4085                     ; 439 {
4086                     	switch	.text
4087  0414               _int2ind_slkuf2:
4089  0414 89            	pushw	x
4090  0415 88            	push	a
4091       00000001      OFST:	set	1
4094                     ; 442 	dig2[0]=0xff;
4096  0416 35ff000d      	mov	_dig2,#255
4097                     ; 443 	dig2[1]=0xff;
4099  041a 35ff000e      	mov	_dig2+1,#255
4100                     ; 444 	dig2[2]=0xff;
4102  041e 35ff000f      	mov	_dig2+2,#255
4103                     ; 445 	dig2[3]=0xff;
4105  0422 35ff0010      	mov	_dig2+3,#255
4106                     ; 446 	dig2_[0]=0xff;
4108  0426 35ff0025      	mov	_dig2_,#255
4109                     ; 447 	dig2_[1]=0xff;
4111  042a 35ff0026      	mov	_dig2_+1,#255
4112                     ; 448 	dig2_[2]=0xff;
4114  042e 35ff0027      	mov	_dig2_+2,#255
4115                     ; 449 	dig2_[3]=0xff;
4117  0432 35ff0028      	mov	_dig2_+3,#255
4118                     ; 450 bin2bcd_int(in);
4120  0436 cd02d0        	call	_bin2bcd_int
4122                     ; 451 if(unzero)bcd2ind_zero();
4124  0439 0d09          	tnz	(OFST+8,sp)
4125  043b 2705          	jreq	L3332
4128  043d cd02fb        	call	_bcd2ind_zero
4131  0440 2003          	jra	L5332
4132  0442               L3332:
4133                     ; 452 else bcd2ind();
4135  0442 cd034a        	call	_bcd2ind
4137  0445               L5332:
4138                     ; 453 if(komma)
4140  0445 0d08          	tnz	(OFST+7,sp)
4141  0447 271c          	jreq	L7332
4142                     ; 455 	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
4144  0449 7b08          	ld	a,(OFST+7,sp)
4145  044b 5f            	clrw	x
4146  044c 97            	ld	xl,a
4147  044d e681          	ld	a,(_ind_out_,x)
4148  044f a1ff          	cp	a,#255
4149  0451 2608          	jrne	L1432
4152  0453 7b08          	ld	a,(OFST+7,sp)
4153  0455 5f            	clrw	x
4154  0456 97            	ld	xl,a
4155  0457 a6c0          	ld	a,#192
4156  0459 e781          	ld	(_ind_out_,x),a
4157  045b               L1432:
4158                     ; 456 	ind_out_[komma]&=0b01111111;
4160  045b 7b08          	ld	a,(OFST+7,sp)
4161  045d 5f            	clrw	x
4162  045e 97            	ld	xl,a
4163  045f e681          	ld	a,(_ind_out_,x)
4164  0461 a47f          	and	a,#127
4165  0463 e781          	ld	(_ind_out_,x),a
4166  0465               L7332:
4167                     ; 458 if(fl&&bFL5)
4169  0465 0d0a          	tnz	(OFST+9,sp)
4170  0467 2718          	jreq	L3432
4172  0469 3d7b          	tnz	_bFL5
4173  046b 2714          	jreq	L3432
4174                     ; 460 	for(i=0;i<len;i++)
4176  046d 0f01          	clr	(OFST+0,sp)
4178  046f 200a          	jra	L1532
4179  0471               L5432:
4180                     ; 462 		ind_out_[i]=DIGISYM[10];
4182  0471 7b01          	ld	a,(OFST+0,sp)
4183  0473 5f            	clrw	x
4184  0474 97            	ld	xl,a
4185  0475 a6ff          	ld	a,#255
4186  0477 e781          	ld	(_ind_out_,x),a
4187                     ; 460 	for(i=0;i<len;i++)
4189  0479 0c01          	inc	(OFST+0,sp)
4190  047b               L1532:
4193  047b 7b01          	ld	a,(OFST+0,sp)
4194  047d 1107          	cp	a,(OFST+6,sp)
4195  047f 25f0          	jrult	L5432
4196  0481               L3432:
4197                     ; 466 for(i=0;i<len;i++)
4199  0481 0f01          	clr	(OFST+0,sp)
4201  0483 2016          	jra	L1632
4202  0485               L5532:
4203                     ; 468 		dig2[start+i]=ind_out_[i];
4205  0485 7b06          	ld	a,(OFST+5,sp)
4206  0487 5f            	clrw	x
4207  0488 1b01          	add	a,(OFST+0,sp)
4208  048a 2401          	jrnc	L07
4209  048c 5c            	incw	x
4210  048d               L07:
4211  048d 02            	rlwa	x,a
4212  048e 7b01          	ld	a,(OFST+0,sp)
4213  0490 905f          	clrw	y
4214  0492 9097          	ld	yl,a
4215  0494 90e681        	ld	a,(_ind_out_,y)
4216  0497 e70d          	ld	(_dig2,x),a
4217                     ; 466 for(i=0;i<len;i++)
4219  0499 0c01          	inc	(OFST+0,sp)
4220  049b               L1632:
4223  049b 7b01          	ld	a,(OFST+0,sp)
4224  049d 1107          	cp	a,(OFST+6,sp)
4225  049f 25e4          	jrult	L5532
4226                     ; 470 if(len==0)
4228  04a1 0d07          	tnz	(OFST+6,sp)
4229  04a3 2610          	jrne	L5632
4230                     ; 472 	dig2[0]=0xff;
4232  04a5 35ff000d      	mov	_dig2,#255
4233                     ; 473 	dig2[1]=0xff;
4235  04a9 35ff000e      	mov	_dig2+1,#255
4236                     ; 474 	dig2[2]=0xff;
4238  04ad 35ff000f      	mov	_dig2+2,#255
4239                     ; 475 	dig2[3]=0xff;
4241  04b1 35ff0010      	mov	_dig2+3,#255
4242  04b5               L5632:
4243                     ; 477 dig2_[0]=dig2[0];
4245  04b5 450d25        	mov	_dig2_,_dig2
4246                     ; 478 dig2_[1]=dig2[1];
4248  04b8 450e26        	mov	_dig2_+1,_dig2+1
4249                     ; 479 dig2_[2]=dig2[2];
4251  04bb 450f27        	mov	_dig2_+2,_dig2+2
4252                     ; 480 dig2_[3]=dig2[3];
4254  04be 451028        	mov	_dig2_+3,_dig2+3
4255                     ; 481 if(fad)
4257  04c1 0d0b          	tnz	(OFST+10,sp)
4258  04c3 2710          	jreq	L7632
4259                     ; 483 	dig2[0]=0xff;
4261  04c5 35ff000d      	mov	_dig2,#255
4262                     ; 484 	dig2[1]=0xff;
4264  04c9 35ff000e      	mov	_dig2+1,#255
4265                     ; 485 	dig2[2]=0xff;
4267  04cd 35ff000f      	mov	_dig2+2,#255
4268                     ; 486 	dig2[3]=0xff;
4270  04d1 35ff0010      	mov	_dig2+3,#255
4271  04d5               L7632:
4272                     ; 488 }
4275  04d5 5b03          	addw	sp,#3
4276  04d7 81            	ret
4381                     ; 490 void int2ind_slkuf3(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
4381                     ; 491 {
4382                     	switch	.text
4383  04d8               _int2ind_slkuf3:
4385  04d8 89            	pushw	x
4386  04d9 88            	push	a
4387       00000001      OFST:	set	1
4390                     ; 494 bin2bcd_int(in);
4392  04da cd02d0        	call	_bin2bcd_int
4394                     ; 495 if(unzero)bcd2ind_zero();
4396  04dd 0d09          	tnz	(OFST+8,sp)
4397  04df 2705          	jreq	L3442
4400  04e1 cd02fb        	call	_bcd2ind_zero
4403  04e4 2003          	jra	L5442
4404  04e6               L3442:
4405                     ; 496 else bcd2ind();
4407  04e6 cd034a        	call	_bcd2ind
4409  04e9               L5442:
4410                     ; 497 if(komma)
4412  04e9 0d08          	tnz	(OFST+7,sp)
4413  04eb 271c          	jreq	L7442
4414                     ; 499 	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
4416  04ed 7b08          	ld	a,(OFST+7,sp)
4417  04ef 5f            	clrw	x
4418  04f0 97            	ld	xl,a
4419  04f1 e681          	ld	a,(_ind_out_,x)
4420  04f3 a1ff          	cp	a,#255
4421  04f5 2608          	jrne	L1542
4424  04f7 7b08          	ld	a,(OFST+7,sp)
4425  04f9 5f            	clrw	x
4426  04fa 97            	ld	xl,a
4427  04fb a6c0          	ld	a,#192
4428  04fd e781          	ld	(_ind_out_,x),a
4429  04ff               L1542:
4430                     ; 500 	ind_out_[komma]&=0b01111111;
4432  04ff 7b08          	ld	a,(OFST+7,sp)
4433  0501 5f            	clrw	x
4434  0502 97            	ld	xl,a
4435  0503 e681          	ld	a,(_ind_out_,x)
4436  0505 a47f          	and	a,#127
4437  0507 e781          	ld	(_ind_out_,x),a
4438  0509               L7442:
4439                     ; 502 if(fl&&bFL5)
4441  0509 0d0a          	tnz	(OFST+9,sp)
4442  050b 2718          	jreq	L3542
4444  050d 3d7b          	tnz	_bFL5
4445  050f 2714          	jreq	L3542
4446                     ; 504 	for(i=0;i<len;i++)
4448  0511 0f01          	clr	(OFST+0,sp)
4450  0513 200a          	jra	L1642
4451  0515               L5542:
4452                     ; 506 		ind_out_[i]=DIGISYM[10];
4454  0515 7b01          	ld	a,(OFST+0,sp)
4455  0517 5f            	clrw	x
4456  0518 97            	ld	xl,a
4457  0519 a6ff          	ld	a,#255
4458  051b e781          	ld	(_ind_out_,x),a
4459                     ; 504 	for(i=0;i<len;i++)
4461  051d 0c01          	inc	(OFST+0,sp)
4462  051f               L1642:
4465  051f 7b01          	ld	a,(OFST+0,sp)
4466  0521 1107          	cp	a,(OFST+6,sp)
4467  0523 25f0          	jrult	L5542
4468  0525               L3542:
4469                     ; 510 for(i=0;i<len;i++)
4471  0525 0f01          	clr	(OFST+0,sp)
4473  0527 2016          	jra	L1742
4474  0529               L5642:
4475                     ; 512 		dig3[start+i]=ind_out_[i];
4477  0529 7b06          	ld	a,(OFST+5,sp)
4478  052b 5f            	clrw	x
4479  052c 1b01          	add	a,(OFST+0,sp)
4480  052e 2401          	jrnc	L47
4481  0530 5c            	incw	x
4482  0531               L47:
4483  0531 02            	rlwa	x,a
4484  0532 7b01          	ld	a,(OFST+0,sp)
4485  0534 905f          	clrw	y
4486  0536 9097          	ld	yl,a
4487  0538 90e681        	ld	a,(_ind_out_,y)
4488  053b e715          	ld	(_dig3,x),a
4489                     ; 510 for(i=0;i<len;i++)
4491  053d 0c01          	inc	(OFST+0,sp)
4492  053f               L1742:
4495  053f 7b01          	ld	a,(OFST+0,sp)
4496  0541 1107          	cp	a,(OFST+6,sp)
4497  0543 25e4          	jrult	L5642
4498                     ; 514 if(len==0)
4500  0545 0d07          	tnz	(OFST+6,sp)
4501  0547 2610          	jrne	L5742
4502                     ; 516 	dig3[0]=0xff;
4504  0549 35ff0015      	mov	_dig3,#255
4505                     ; 517 	dig3[1]=0xff;
4507  054d 35ff0016      	mov	_dig3+1,#255
4508                     ; 518 	dig3[2]=0xff;
4510  0551 35ff0017      	mov	_dig3+2,#255
4511                     ; 519 	dig3[3]=0xff;
4513  0555 35ff0018      	mov	_dig3+3,#255
4514  0559               L5742:
4515                     ; 521 dig3_[0]=dig3[0];
4517  0559 45152d        	mov	_dig3_,_dig3
4518                     ; 522 dig3_[1]=dig3[1];
4520  055c 45162e        	mov	_dig3_+1,_dig3+1
4521                     ; 523 dig3_[2]=dig3[2];
4523  055f 45172f        	mov	_dig3_+2,_dig3+2
4524                     ; 524 dig3_[3]=dig3[3];
4526  0562 451830        	mov	_dig3_+3,_dig3+3
4527                     ; 525 if(fad)
4529  0565 0d0b          	tnz	(OFST+10,sp)
4530  0567 2710          	jreq	L7742
4531                     ; 527 	dig3[0]=0xff;
4533  0569 35ff0015      	mov	_dig3,#255
4534                     ; 528 	dig3[1]=0xff;
4536  056d 35ff0016      	mov	_dig3+1,#255
4537                     ; 529 	dig3[2]=0xff;
4539  0571 35ff0017      	mov	_dig3+2,#255
4540                     ; 530 	dig3[3]=0xff;
4542  0575 35ff0018      	mov	_dig3+3,#255
4543  0579               L7742:
4544                     ; 533 }
4547  0579 5b03          	addw	sp,#3
4548  057b 81            	ret
4573                     ; 536 void tmblr_drv(void)
4573                     ; 537 {
4574                     	switch	.text
4575  057c               _tmblr_drv:
4579                     ; 538 if(GPIOB->IDR&0b10000000)
4581  057c c65006        	ld	a,20486
4582  057f a580          	bcp	a,#128
4583  0581 2716          	jreq	L1152
4584                     ; 540 	tmblr_cnt++;
4586  0583 be14          	ldw	x,_tmblr_cnt
4587  0585 1c0001        	addw	x,#1
4588  0588 bf14          	ldw	_tmblr_cnt,x
4589                     ; 541 	if(tmblr_cnt>=10)tmblr_cnt=10;
4591  058a 9c            	rvf
4592  058b be14          	ldw	x,_tmblr_cnt
4593  058d a3000a        	cpw	x,#10
4594  0590 2f16          	jrslt	L5152
4597  0592 ae000a        	ldw	x,#10
4598  0595 bf14          	ldw	_tmblr_cnt,x
4599  0597 200f          	jra	L5152
4600  0599               L1152:
4601                     ; 545 	tmblr_cnt--;
4603  0599 be14          	ldw	x,_tmblr_cnt
4604  059b 1d0001        	subw	x,#1
4605  059e bf14          	ldw	_tmblr_cnt,x
4606                     ; 546 	if(tmblr_cnt<=0)tmblr_cnt=0;
4608  05a0 9c            	rvf
4609  05a1 be14          	ldw	x,_tmblr_cnt
4610  05a3 2c03          	jrsgt	L5152
4613  05a5 5f            	clrw	x
4614  05a6 bf14          	ldw	_tmblr_cnt,x
4615  05a8               L5152:
4616                     ; 549 if(tmblr_cnt>=9)tmblr_state=tsU;
4618  05a8 9c            	rvf
4619  05a9 be14          	ldw	x,_tmblr_cnt
4620  05ab a30009        	cpw	x,#9
4621  05ae 2f06          	jrslt	L1252
4624  05b0 350100ac      	mov	_tmblr_state,#1
4626  05b4 2009          	jra	L3252
4627  05b6               L1252:
4628                     ; 550 else if(tmblr_cnt<=0)tmblr_state=tsI;
4630  05b6 9c            	rvf
4631  05b7 be14          	ldw	x,_tmblr_cnt
4632  05b9 2c04          	jrsgt	L3252
4635  05bb 350200ac      	mov	_tmblr_state,#2
4636  05bf               L3252:
4637                     ; 555 }
4640  05bf 81            	ret
4665                     ; 559 void but_drv(void)
4665                     ; 560 {
4666                     	switch	.text
4667  05c0               _but_drv:
4671                     ; 561 if(GPIOE->IDR&0b00000001)
4673  05c0 c65015        	ld	a,20501
4674  05c3 a501          	bcp	a,#1
4675  05c5 2716          	jreq	L7352
4676                     ; 563 	but_cnt++;
4678  05c7 be12          	ldw	x,_but_cnt
4679  05c9 1c0001        	addw	x,#1
4680  05cc bf12          	ldw	_but_cnt,x
4681                     ; 564 	if(but_cnt>=10)but_cnt=10;
4683  05ce 9c            	rvf
4684  05cf be12          	ldw	x,_but_cnt
4685  05d1 a3000a        	cpw	x,#10
4686  05d4 2f16          	jrslt	L3452
4689  05d6 ae000a        	ldw	x,#10
4690  05d9 bf12          	ldw	_but_cnt,x
4691  05db 200f          	jra	L3452
4692  05dd               L7352:
4693                     ; 568 	but_cnt--;
4695  05dd be12          	ldw	x,_but_cnt
4696  05df 1d0001        	subw	x,#1
4697  05e2 bf12          	ldw	_but_cnt,x
4698                     ; 569 	if(but_cnt<=0)but_cnt=0;
4700  05e4 9c            	rvf
4701  05e5 be12          	ldw	x,_but_cnt
4702  05e7 2c03          	jrsgt	L3452
4705  05e9 5f            	clrw	x
4706  05ea bf12          	ldw	_but_cnt,x
4707  05ec               L3452:
4708                     ; 572 if(but_cnt>=9)but_state=bsOFF;
4710  05ec 9c            	rvf
4711  05ed be12          	ldw	x,_but_cnt
4712  05ef a30009        	cpw	x,#9
4713  05f2 2f04          	jrslt	L7452
4716  05f4 3fab          	clr	_but_state
4718  05f6 2009          	jra	L1552
4719  05f8               L7452:
4720                     ; 573 else if(but_cnt<=0)but_state=bsON;
4722  05f8 9c            	rvf
4723  05f9 be12          	ldw	x,_but_cnt
4724  05fb 2c04          	jrsgt	L1552
4727  05fd 350100ab      	mov	_but_state,#1
4728  0601               L1552:
4729                     ; 578 }
4732  0601 81            	ret
4757                     ; 582 void enc_but_drv(void)
4757                     ; 583 {
4758                     	switch	.text
4759  0602               _enc_but_drv:
4763                     ; 584 if(!((GPIOB->IDR)&(1<<5)))
4765  0602 c65006        	ld	a,20486
4766  0605 a520          	bcp	a,#32
4767  0607 2609          	jrne	L5652
4768                     ; 586 	enc_but_drv_cnt++;
4770  0609 be0f          	ldw	x,_enc_but_drv_cnt
4771  060b 1c0001        	addw	x,#1
4772  060e bf0f          	ldw	_enc_but_drv_cnt,x
4774  0610 200f          	jra	L7652
4775  0612               L5652:
4776                     ; 590 	if(enc_but_drv_cnt>=10)
4778  0612 9c            	rvf
4779  0613 be0f          	ldw	x,_enc_but_drv_cnt
4780  0615 a3000a        	cpw	x,#10
4781  0618 2f04          	jrslt	L1752
4782                     ; 592 		cmnd=1;
4784  061a 35010011      	mov	_cmnd,#1
4785  061e               L1752:
4786                     ; 594 	enc_but_drv_cnt=0;
4788  061e 5f            	clrw	x
4789  061f bf0f          	ldw	_enc_but_drv_cnt,x
4790  0621               L7652:
4791                     ; 596 }
4794  0621 81            	ret
4832                     ; 599 void enc_an(void)
4832                     ; 600 {
4833                     	switch	.text
4834  0622               _enc_an:
4838                     ; 602 if(encCW)
4840                     	btst	_encCW
4841  0627 2420          	jruge	L3062
4842                     ; 604 	if(encCW_cnt1)
4844  0629 3d19          	tnz	_encCW_cnt1
4845  062b 2708          	jreq	L5062
4846                     ; 606 		if(encCW_cnt2<10)
4848  062d b618          	ld	a,_encCW_cnt2
4849  062f a10a          	cp	a,#10
4850  0631 2402          	jruge	L5062
4851                     ; 608 			encCW_cnt2++;
4853  0633 3c18          	inc	_encCW_cnt2
4854  0635               L5062:
4855                     ; 611 	encCW_cnt1=80;
4857  0635 35500019      	mov	_encCW_cnt1,#80
4858                     ; 613 	if(encCW_cnt2>8)
4860  0639 b618          	ld	a,_encCW_cnt2
4861  063b a109          	cp	a,#9
4862  063d 251a          	jrult	L3162
4863                     ; 615 		encCW_=1;
4865  063f 72100001      	bset	_encCW_
4866                     ; 616 		encCW=0;
4868  0643 72110003      	bres	_encCW
4869  0647 2010          	jra	L3162
4870  0649               L3062:
4871                     ; 621 	if(encCW_cnt1)
4873  0649 3d19          	tnz	_encCW_cnt1
4874  064b 270c          	jreq	L3162
4875                     ; 623 		encCW_cnt1--;
4877  064d 3a19          	dec	_encCW_cnt1
4878                     ; 624 		if(encCW_cnt1==0)
4880  064f 3d19          	tnz	_encCW_cnt1
4881  0651 2606          	jrne	L3162
4882                     ; 626 			encCW_cnt2=0;
4884  0653 3f18          	clr	_encCW_cnt2
4885                     ; 627 			encCW_=0;
4887  0655 72110001      	bres	_encCW_
4888  0659               L3162:
4889                     ; 633 if(encOW)
4891                     	btst	_encOW
4892  065e 2420          	jruge	L1262
4893                     ; 635 	if(encOW_cnt1)
4895  0660 3d17          	tnz	_encOW_cnt1
4896  0662 2708          	jreq	L3262
4897                     ; 637 		if(encOW_cnt2<10)
4899  0664 b616          	ld	a,_encOW_cnt2
4900  0666 a10a          	cp	a,#10
4901  0668 2402          	jruge	L3262
4902                     ; 639 			encOW_cnt2++;
4904  066a 3c16          	inc	_encOW_cnt2
4905  066c               L3262:
4906                     ; 642 	encOW_cnt1=50;
4908  066c 35320017      	mov	_encOW_cnt1,#50
4909                     ; 643 	if(encOW_cnt2>5)
4911  0670 b616          	ld	a,_encOW_cnt2
4912  0672 a106          	cp	a,#6
4913  0674 251a          	jrult	L1362
4914                     ; 645 		encOW_=1;
4916  0676 72100000      	bset	_encOW_
4917                     ; 646 		encOW=0;
4919  067a 72110002      	bres	_encOW
4920  067e 2010          	jra	L1362
4921  0680               L1262:
4922                     ; 651 	if(encOW_cnt1)
4924  0680 3d17          	tnz	_encOW_cnt1
4925  0682 270c          	jreq	L1362
4926                     ; 653 		encOW_cnt1--;
4928  0684 3a17          	dec	_encOW_cnt1
4929                     ; 654 		if(encOW_cnt1==0)
4931  0686 3d17          	tnz	_encOW_cnt1
4932  0688 2606          	jrne	L1362
4933                     ; 656 			encOW_cnt2=0;
4935  068a 3f16          	clr	_encOW_cnt2
4936                     ; 657 			encOW_=0;
4938  068c 72110000      	bres	_encOW_
4939  0690               L1362:
4940                     ; 662 if(encCW||encOW||encCW_||encOW_)
4942                     	btst	_encCW
4943  0695 2518          	jrult	L1462
4945                     	btst	_encOW
4946  069c 2511          	jrult	L1462
4948                     	btst	_encCW_
4949  06a3 250a          	jrult	L1462
4951                     	btst	_encOW_
4952  06aa 2503          	jrult	L601
4953  06ac cc094c        	jp	L7362
4954  06af               L601:
4955  06af               L1462:
4956                     ; 664 		enc_plazma++;
4958  06af be1a          	ldw	x,_enc_plazma
4959  06b1 1c0001        	addw	x,#1
4960  06b4 bf1a          	ldw	_enc_plazma,x
4961                     ; 665 	if(!ind_fad_cnt)
4963  06b6 3d8c          	tnz	_ind_fad_cnt
4964  06b8 2608          	jrne	L7462
4965                     ; 667 		ind_fad_cnt=10;
4967  06ba 350a008c      	mov	_ind_fad_cnt,#10
4969  06be ac380938      	jpf	L1562
4970  06c2               L7462:
4971                     ; 671 		if(tmblr_state==tsI)
4973  06c2 b6ac          	ld	a,_tmblr_state
4974  06c4 a102          	cp	a,#2
4975  06c6 2703          	jreq	L011
4976  06c8 cc079f        	jp	L3562
4977  06cb               L011:
4978                     ; 674 			if(but_state==bsON)
4980  06cb b6ab          	ld	a,_but_state
4981  06cd a101          	cp	a,#1
4982  06cf 2667          	jrne	L5562
4983                     ; 676 				if(encCW)
4985                     	btst	_encCW
4986  06d6 2411          	jruge	L7562
4987                     ; 679 					modbus_write_request(200,6,0,51);
4989  06d8 ae0033        	ldw	x,#51
4990  06db 89            	pushw	x
4991  06dc 5f            	clrw	x
4992  06dd 89            	pushw	x
4993  06de ae0006        	ldw	x,#6
4994  06e1 a6c8          	ld	a,#200
4995  06e3 95            	ld	xh,a
4996  06e4 cd0208        	call	_modbus_write_request
4998  06e7 5b04          	addw	sp,#4
4999  06e9               L7562:
5000                     ; 681 				if(encCW_)
5002                     	btst	_encCW_
5003  06ee 2411          	jruge	L1662
5004                     ; 684 					modbus_write_request(200,6,0,53);
5006  06f0 ae0035        	ldw	x,#53
5007  06f3 89            	pushw	x
5008  06f4 5f            	clrw	x
5009  06f5 89            	pushw	x
5010  06f6 ae0006        	ldw	x,#6
5011  06f9 a6c8          	ld	a,#200
5012  06fb 95            	ld	xh,a
5013  06fc cd0208        	call	_modbus_write_request
5015  06ff 5b04          	addw	sp,#4
5016  0701               L1662:
5017                     ; 687 				if(encOW)
5019                     	btst	_encOW
5020  0706 2411          	jruge	L3662
5021                     ; 690 					modbus_write_request(200,6,0,52);
5023  0708 ae0034        	ldw	x,#52
5024  070b 89            	pushw	x
5025  070c 5f            	clrw	x
5026  070d 89            	pushw	x
5027  070e ae0006        	ldw	x,#6
5028  0711 a6c8          	ld	a,#200
5029  0713 95            	ld	xh,a
5030  0714 cd0208        	call	_modbus_write_request
5032  0717 5b04          	addw	sp,#4
5033  0719               L3662:
5034                     ; 693 				if(encOW_)
5036                     	btst	_encOW_
5037  071e 2503          	jrult	L211
5038  0720 cc0938        	jp	L1562
5039  0723               L211:
5040                     ; 696 					modbus_write_request(200,6,0,54);
5042  0723 ae0036        	ldw	x,#54
5043  0726 89            	pushw	x
5044  0727 5f            	clrw	x
5045  0728 89            	pushw	x
5046  0729 ae0006        	ldw	x,#6
5047  072c a6c8          	ld	a,#200
5048  072e 95            	ld	xh,a
5049  072f cd0208        	call	_modbus_write_request
5051  0732 5b04          	addw	sp,#4
5052  0734 ac380938      	jpf	L1562
5053  0738               L5562:
5054                     ; 701 				if(encCW)
5056                     	btst	_encCW
5057  073d 2411          	jruge	L1762
5058                     ; 704 					modbus_write_request(200,6,0,61);
5060  073f ae003d        	ldw	x,#61
5061  0742 89            	pushw	x
5062  0743 5f            	clrw	x
5063  0744 89            	pushw	x
5064  0745 ae0006        	ldw	x,#6
5065  0748 a6c8          	ld	a,#200
5066  074a 95            	ld	xh,a
5067  074b cd0208        	call	_modbus_write_request
5069  074e 5b04          	addw	sp,#4
5070  0750               L1762:
5071                     ; 706 				if(encCW_)
5073                     	btst	_encCW_
5074  0755 2411          	jruge	L3762
5075                     ; 709 					modbus_write_request(200,6,0,63);
5077  0757 ae003f        	ldw	x,#63
5078  075a 89            	pushw	x
5079  075b 5f            	clrw	x
5080  075c 89            	pushw	x
5081  075d ae0006        	ldw	x,#6
5082  0760 a6c8          	ld	a,#200
5083  0762 95            	ld	xh,a
5084  0763 cd0208        	call	_modbus_write_request
5086  0766 5b04          	addw	sp,#4
5087  0768               L3762:
5088                     ; 711 				if(encOW)
5090                     	btst	_encOW
5091  076d 2411          	jruge	L5762
5092                     ; 714 					modbus_write_request(200,6,0,62);
5094  076f ae003e        	ldw	x,#62
5095  0772 89            	pushw	x
5096  0773 5f            	clrw	x
5097  0774 89            	pushw	x
5098  0775 ae0006        	ldw	x,#6
5099  0778 a6c8          	ld	a,#200
5100  077a 95            	ld	xh,a
5101  077b cd0208        	call	_modbus_write_request
5103  077e 5b04          	addw	sp,#4
5104  0780               L5762:
5105                     ; 716 				if(encOW_)
5107                     	btst	_encOW_
5108  0785 2503          	jrult	L411
5109  0787 cc0938        	jp	L1562
5110  078a               L411:
5111                     ; 719 					modbus_write_request(200,6,0,64);
5113  078a ae0040        	ldw	x,#64
5114  078d 89            	pushw	x
5115  078e 5f            	clrw	x
5116  078f 89            	pushw	x
5117  0790 ae0006        	ldw	x,#6
5118  0793 a6c8          	ld	a,#200
5119  0795 95            	ld	xh,a
5120  0796 cd0208        	call	_modbus_write_request
5122  0799 5b04          	addw	sp,#4
5123  079b ac380938      	jpf	L1562
5124  079f               L3562:
5125                     ; 723 		else	if(tmblr_state==tsU)
5127  079f b6ac          	ld	a,_tmblr_state
5128  07a1 a101          	cp	a,#1
5129  07a3 2703          	jreq	L611
5130  07a5 cc0938        	jp	L1562
5131  07a8               L611:
5132                     ; 726 			if(but_state==bsON)
5134  07a8 b6ab          	ld	a,_but_state
5135  07aa a101          	cp	a,#1
5136  07ac 2703          	jreq	L021
5137  07ae cc0878        	jp	L5072
5138  07b1               L021:
5139                     ; 728 				if(encCW)
5141                     	btst	_encCW
5142  07b6 2429          	jruge	L7072
5143                     ; 730 					can_transmit(0x18a,51,0,0,0,0,0,0,0);		//Время+
5145  07b8 4b00          	push	#0
5146  07ba 4b00          	push	#0
5147  07bc 4b00          	push	#0
5148  07be 4b00          	push	#0
5149  07c0 4b00          	push	#0
5150  07c2 4b00          	push	#0
5151  07c4 4b00          	push	#0
5152  07c6 4b33          	push	#51
5153  07c8 ae018a        	ldw	x,#394
5154  07cb cd0a9f        	call	_can_transmit
5156  07ce 5b08          	addw	sp,#8
5157                     ; 731 					modbus_write_request(200,6,0,51);
5159  07d0 ae0033        	ldw	x,#51
5160  07d3 89            	pushw	x
5161  07d4 5f            	clrw	x
5162  07d5 89            	pushw	x
5163  07d6 ae0006        	ldw	x,#6
5164  07d9 a6c8          	ld	a,#200
5165  07db 95            	ld	xh,a
5166  07dc cd0208        	call	_modbus_write_request
5168  07df 5b04          	addw	sp,#4
5169  07e1               L7072:
5170                     ; 733 				if(encCW_)
5172                     	btst	_encCW_
5173  07e6 2429          	jruge	L1172
5174                     ; 735 					can_transmit(0x18a,53,0,0,0,0,0,0,0);		//Время++
5176  07e8 4b00          	push	#0
5177  07ea 4b00          	push	#0
5178  07ec 4b00          	push	#0
5179  07ee 4b00          	push	#0
5180  07f0 4b00          	push	#0
5181  07f2 4b00          	push	#0
5182  07f4 4b00          	push	#0
5183  07f6 4b35          	push	#53
5184  07f8 ae018a        	ldw	x,#394
5185  07fb cd0a9f        	call	_can_transmit
5187  07fe 5b08          	addw	sp,#8
5188                     ; 736 					modbus_write_request(200,6,0,53);
5190  0800 ae0035        	ldw	x,#53
5191  0803 89            	pushw	x
5192  0804 5f            	clrw	x
5193  0805 89            	pushw	x
5194  0806 ae0006        	ldw	x,#6
5195  0809 a6c8          	ld	a,#200
5196  080b 95            	ld	xh,a
5197  080c cd0208        	call	_modbus_write_request
5199  080f 5b04          	addw	sp,#4
5200  0811               L1172:
5201                     ; 739 				if(encOW)
5203                     	btst	_encOW
5204  0816 2429          	jruge	L3172
5205                     ; 741 					can_transmit(0x18a,52,0,0,0,0,0,0,0);		//Время-
5207  0818 4b00          	push	#0
5208  081a 4b00          	push	#0
5209  081c 4b00          	push	#0
5210  081e 4b00          	push	#0
5211  0820 4b00          	push	#0
5212  0822 4b00          	push	#0
5213  0824 4b00          	push	#0
5214  0826 4b34          	push	#52
5215  0828 ae018a        	ldw	x,#394
5216  082b cd0a9f        	call	_can_transmit
5218  082e 5b08          	addw	sp,#8
5219                     ; 742 					modbus_write_request(200,6,0,52);
5221  0830 ae0034        	ldw	x,#52
5222  0833 89            	pushw	x
5223  0834 5f            	clrw	x
5224  0835 89            	pushw	x
5225  0836 ae0006        	ldw	x,#6
5226  0839 a6c8          	ld	a,#200
5227  083b 95            	ld	xh,a
5228  083c cd0208        	call	_modbus_write_request
5230  083f 5b04          	addw	sp,#4
5231  0841               L3172:
5232                     ; 745 				if(encOW_)
5234                     	btst	_encOW_
5235  0846 2503          	jrult	L221
5236  0848 cc0938        	jp	L1562
5237  084b               L221:
5238                     ; 747 					can_transmit(0x18a,54,0,0,0,0,0,0,0);		//Время--
5240  084b 4b00          	push	#0
5241  084d 4b00          	push	#0
5242  084f 4b00          	push	#0
5243  0851 4b00          	push	#0
5244  0853 4b00          	push	#0
5245  0855 4b00          	push	#0
5246  0857 4b00          	push	#0
5247  0859 4b36          	push	#54
5248  085b ae018a        	ldw	x,#394
5249  085e cd0a9f        	call	_can_transmit
5251  0861 5b08          	addw	sp,#8
5252                     ; 748 					modbus_write_request(200,6,0,54);
5254  0863 ae0036        	ldw	x,#54
5255  0866 89            	pushw	x
5256  0867 5f            	clrw	x
5257  0868 89            	pushw	x
5258  0869 ae0006        	ldw	x,#6
5259  086c a6c8          	ld	a,#200
5260  086e 95            	ld	xh,a
5261  086f cd0208        	call	_modbus_write_request
5263  0872 5b04          	addw	sp,#4
5264  0874 ac380938      	jpf	L1562
5265  0878               L5072:
5266                     ; 753 				if(encCW)
5268                     	btst	_encCW
5269  087d 2429          	jruge	L1272
5270                     ; 755 					can_transmit(0x18a,71,0,0,0,0,0,0,0);
5272  087f 4b00          	push	#0
5273  0881 4b00          	push	#0
5274  0883 4b00          	push	#0
5275  0885 4b00          	push	#0
5276  0887 4b00          	push	#0
5277  0889 4b00          	push	#0
5278  088b 4b00          	push	#0
5279  088d 4b47          	push	#71
5280  088f ae018a        	ldw	x,#394
5281  0892 cd0a9f        	call	_can_transmit
5283  0895 5b08          	addw	sp,#8
5284                     ; 756 					modbus_write_request(200,6,0,71);
5286  0897 ae0047        	ldw	x,#71
5287  089a 89            	pushw	x
5288  089b 5f            	clrw	x
5289  089c 89            	pushw	x
5290  089d ae0006        	ldw	x,#6
5291  08a0 a6c8          	ld	a,#200
5292  08a2 95            	ld	xh,a
5293  08a3 cd0208        	call	_modbus_write_request
5295  08a6 5b04          	addw	sp,#4
5296  08a8               L1272:
5297                     ; 758 				if(encCW_)
5299                     	btst	_encCW_
5300  08ad 2429          	jruge	L3272
5301                     ; 760 					can_transmit(0x18a,73,0,0,0,0,0,0,0);
5303  08af 4b00          	push	#0
5304  08b1 4b00          	push	#0
5305  08b3 4b00          	push	#0
5306  08b5 4b00          	push	#0
5307  08b7 4b00          	push	#0
5308  08b9 4b00          	push	#0
5309  08bb 4b00          	push	#0
5310  08bd 4b49          	push	#73
5311  08bf ae018a        	ldw	x,#394
5312  08c2 cd0a9f        	call	_can_transmit
5314  08c5 5b08          	addw	sp,#8
5315                     ; 761 					modbus_write_request(200,6,0,73);
5317  08c7 ae0049        	ldw	x,#73
5318  08ca 89            	pushw	x
5319  08cb 5f            	clrw	x
5320  08cc 89            	pushw	x
5321  08cd ae0006        	ldw	x,#6
5322  08d0 a6c8          	ld	a,#200
5323  08d2 95            	ld	xh,a
5324  08d3 cd0208        	call	_modbus_write_request
5326  08d6 5b04          	addw	sp,#4
5327  08d8               L3272:
5328                     ; 763 				if(encOW)
5330                     	btst	_encOW
5331  08dd 2429          	jruge	L5272
5332                     ; 765 					can_transmit(0x18a,72,0,0,0,0,0,0,0);
5334  08df 4b00          	push	#0
5335  08e1 4b00          	push	#0
5336  08e3 4b00          	push	#0
5337  08e5 4b00          	push	#0
5338  08e7 4b00          	push	#0
5339  08e9 4b00          	push	#0
5340  08eb 4b00          	push	#0
5341  08ed 4b48          	push	#72
5342  08ef ae018a        	ldw	x,#394
5343  08f2 cd0a9f        	call	_can_transmit
5345  08f5 5b08          	addw	sp,#8
5346                     ; 766 					modbus_write_request(200,6,0,72);
5348  08f7 ae0048        	ldw	x,#72
5349  08fa 89            	pushw	x
5350  08fb 5f            	clrw	x
5351  08fc 89            	pushw	x
5352  08fd ae0006        	ldw	x,#6
5353  0900 a6c8          	ld	a,#200
5354  0902 95            	ld	xh,a
5355  0903 cd0208        	call	_modbus_write_request
5357  0906 5b04          	addw	sp,#4
5358  0908               L5272:
5359                     ; 768 				if(encOW_)
5361                     	btst	_encOW_
5362  090d 2429          	jruge	L1562
5363                     ; 770 					can_transmit(0x18a,74,0,0,0,0,0,0,0);
5365  090f 4b00          	push	#0
5366  0911 4b00          	push	#0
5367  0913 4b00          	push	#0
5368  0915 4b00          	push	#0
5369  0917 4b00          	push	#0
5370  0919 4b00          	push	#0
5371  091b 4b00          	push	#0
5372  091d 4b4a          	push	#74
5373  091f ae018a        	ldw	x,#394
5374  0922 cd0a9f        	call	_can_transmit
5376  0925 5b08          	addw	sp,#8
5377                     ; 771 					modbus_write_request(200,6,0,74);
5379  0927 ae004a        	ldw	x,#74
5380  092a 89            	pushw	x
5381  092b 5f            	clrw	x
5382  092c 89            	pushw	x
5383  092d ae0006        	ldw	x,#6
5384  0930 a6c8          	ld	a,#200
5385  0932 95            	ld	xh,a
5386  0933 cd0208        	call	_modbus_write_request
5388  0936 5b04          	addw	sp,#4
5389  0938               L1562:
5390                     ; 776 	ind_fad_cnt=10;
5392  0938 350a008c      	mov	_ind_fad_cnt,#10
5393                     ; 777 	encCW=0;
5395  093c 72110003      	bres	_encCW
5396                     ; 778 	encCW_=0;
5398  0940 72110001      	bres	_encCW_
5399                     ; 779 	encOW=0;
5401  0944 72110002      	bres	_encOW
5402                     ; 780 	encOW_=0;
5404  0948 72110000      	bres	_encOW_
5405  094c               L7362:
5406                     ; 783 if(cmnd)
5408  094c 3d11          	tnz	_cmnd
5409  094e 272b          	jreq	L1372
5410                     ; 785 	can_transmit(0x18a,90,0,0,0,0,0,0,0);
5412  0950 4b00          	push	#0
5413  0952 4b00          	push	#0
5414  0954 4b00          	push	#0
5415  0956 4b00          	push	#0
5416  0958 4b00          	push	#0
5417  095a 4b00          	push	#0
5418  095c 4b00          	push	#0
5419  095e 4b5a          	push	#90
5420  0960 ae018a        	ldw	x,#394
5421  0963 cd0a9f        	call	_can_transmit
5423  0966 5b08          	addw	sp,#8
5424                     ; 786 	modbus_write_request(200,6,0,90);
5426  0968 ae005a        	ldw	x,#90
5427  096b 89            	pushw	x
5428  096c 5f            	clrw	x
5429  096d 89            	pushw	x
5430  096e ae0006        	ldw	x,#6
5431  0971 a6c8          	ld	a,#200
5432  0973 95            	ld	xh,a
5433  0974 cd0208        	call	_modbus_write_request
5435  0977 5b04          	addw	sp,#4
5436                     ; 787 	cmnd=0;
5438  0979 3f11          	clr	_cmnd
5439  097b               L1372:
5440                     ; 790 }
5443  097b 81            	ret
5466                     ; 794 void uart1_init (void)
5466                     ; 795 {
5467                     	switch	.text
5468  097c               _uart1_init:
5472                     ; 797 GPIOA->DDR&=~(1<<4);
5474  097c 72195002      	bres	20482,#4
5475                     ; 798 GPIOA->CR1|=(1<<4);
5477  0980 72185003      	bset	20483,#4
5478                     ; 799 GPIOA->CR2&=~(1<<4);
5480  0984 72195004      	bres	20484,#4
5481                     ; 802 GPIOA->DDR|=(1<<5);
5483  0988 721a5002      	bset	20482,#5
5484                     ; 803 GPIOA->CR1|=(1<<5);
5486  098c 721a5003      	bset	20483,#5
5487                     ; 804 GPIOA->CR2&=~(1<<5);	
5489  0990 721b5004      	bres	20484,#5
5490                     ; 807 GPIOA->DDR|=(1<<6);
5492  0994 721c5002      	bset	20482,#6
5493                     ; 808 GPIOA->CR1|=(1<<6);
5495  0998 721c5003      	bset	20483,#6
5496                     ; 809 GPIOA->CR2&=~(1<<6);
5498  099c 721d5004      	bres	20484,#6
5499                     ; 813 UART1->CR1&=~UART1_CR1_M;					
5501  09a0 72195234      	bres	21044,#4
5502                     ; 814 UART1->CR3|= (0<<4) & UART1_CR3_STOP;  	
5504  09a4 c65236        	ld	a,21046
5505                     ; 815 UART1->BRR2= 0x02;
5507  09a7 35025233      	mov	21043,#2
5508                     ; 816 UART1->BRR1= 0x41;
5510  09ab 35415232      	mov	21042,#65
5511                     ; 817 UART1->CR2|= UART1_CR2_TEN | UART1_CR2_REN | UART1_CR2_RIEN/*| UART2_CR2_TIEN*/ ;	
5513  09af c65235        	ld	a,21045
5514  09b2 aa2c          	or	a,#44
5515  09b4 c75235        	ld	21045,a
5516                     ; 818 }
5519  09b7 81            	ret
5553                     ; 821 void can_in_an(void)
5553                     ; 822 {
5554                     	switch	.text
5555  09b8               _can_in_an:
5559                     ; 829 if(mess[6]==33)
5561  09b8 b62a          	ld	a,_mess+6
5562  09ba a121          	cp	a,#33
5563  09bc 2636          	jrne	L7572
5564                     ; 834 	ind_U=(mess[7]+(mess[8]*256));
5566  09be b62c          	ld	a,_mess+8
5567  09c0 5f            	clrw	x
5568  09c1 97            	ld	xl,a
5569  09c2 4f            	clr	a
5570  09c3 02            	rlwa	x,a
5571  09c4 01            	rrwa	x,a
5572  09c5 bb2b          	add	a,_mess+7
5573  09c7 2401          	jrnc	L031
5574  09c9 5c            	incw	x
5575  09ca               L031:
5576  09ca b797          	ld	_ind_U+1,a
5577  09cc 9f            	ld	a,xl
5578  09cd b796          	ld	_ind_U,a
5579                     ; 835 	ind_I=(mess[9]+(mess[10]*256));
5581  09cf b62e          	ld	a,_mess+10
5582  09d1 5f            	clrw	x
5583  09d2 97            	ld	xl,a
5584  09d3 4f            	clr	a
5585  09d4 02            	rlwa	x,a
5586  09d5 01            	rrwa	x,a
5587  09d6 bb2d          	add	a,_mess+9
5588  09d8 2401          	jrnc	L231
5589  09da 5c            	incw	x
5590  09db               L231:
5591  09db b795          	ld	_ind_I+1,a
5592  09dd 9f            	ld	a,xl
5593  09de b794          	ld	_ind_I,a
5594                     ; 836 	work_stat=(enum_work_stat)mess[11];
5596  09e0 452f38        	mov	_work_stat,_mess+11
5597                     ; 837 	ind_U_set=(mess[12]+(mess[13]*256));
5599  09e3 b631          	ld	a,_mess+13
5600  09e5 5f            	clrw	x
5601  09e6 97            	ld	xl,a
5602  09e7 4f            	clr	a
5603  09e8 02            	rlwa	x,a
5604  09e9 01            	rrwa	x,a
5605  09ea bb30          	add	a,_mess+12
5606  09ec 2401          	jrnc	L431
5607  09ee 5c            	incw	x
5608  09ef               L431:
5609  09ef b793          	ld	_ind_U_set+1,a
5610  09f1 9f            	ld	a,xl
5611  09f2 b792          	ld	_ind_U_set,a
5612  09f4               L7572:
5613                     ; 847 if(mess[6]==34)
5615  09f4 b62a          	ld	a,_mess+6
5616  09f6 a122          	cp	a,#34
5617  09f8 2633          	jrne	L3472
5618                     ; 849 	time= (mess[7]+(mess[8]*256));
5620  09fa b62c          	ld	a,_mess+8
5621  09fc 5f            	clrw	x
5622  09fd 97            	ld	xl,a
5623  09fe 4f            	clr	a
5624  09ff 02            	rlwa	x,a
5625  0a00 01            	rrwa	x,a
5626  0a01 bb2b          	add	a,_mess+7
5627  0a03 2401          	jrnc	L631
5628  0a05 5c            	incw	x
5629  0a06               L631:
5630  0a06 b79b          	ld	_time+1,a
5631  0a08 9f            	ld	a,xl
5632  0a09 b79a          	ld	_time,a
5633                     ; 850 	time_set= (mess[9]+(mess[10]*256));
5635  0a0b b62e          	ld	a,_mess+10
5636  0a0d 5f            	clrw	x
5637  0a0e 97            	ld	xl,a
5638  0a0f 4f            	clr	a
5639  0a10 02            	rlwa	x,a
5640  0a11 01            	rrwa	x,a
5641  0a12 bb2d          	add	a,_mess+9
5642  0a14 2401          	jrnc	L041
5643  0a16 5c            	incw	x
5644  0a17               L041:
5645  0a17 b799          	ld	_time_set+1,a
5646  0a19 9f            	ld	a,xl
5647  0a1a b798          	ld	_time_set,a
5648                     ; 851 	ind_I_set=(mess[12]+(mess[13]*256));
5650  0a1c b631          	ld	a,_mess+13
5651  0a1e 5f            	clrw	x
5652  0a1f 97            	ld	xl,a
5653  0a20 4f            	clr	a
5654  0a21 02            	rlwa	x,a
5655  0a22 01            	rrwa	x,a
5656  0a23 bb30          	add	a,_mess+12
5657  0a25 2401          	jrnc	L241
5658  0a27 5c            	incw	x
5659  0a28               L241:
5660  0a28 b791          	ld	_ind_I_set+1,a
5661  0a2a 9f            	ld	a,xl
5662  0a2b b790          	ld	_ind_I_set,a
5663  0a2d               L3472:
5664                     ; 863 can_in_an_end:
5664                     ; 864 bCAN_RX=0;
5666  0a2d 3f36          	clr	_bCAN_RX
5667                     ; 865 }   
5670  0a2f 81            	ret
5693                     ; 868 void init_CAN(void) {
5694                     	switch	.text
5695  0a30               _init_CAN:
5699                     ; 869 	CAN->MCR&=~CAN_MCR_SLEEP;					// CAN wake up request
5701  0a30 72135420      	bres	21536,#1
5702                     ; 870 	CAN->MCR|= CAN_MCR_INRQ;					// CAN initialization request
5704  0a34 72105420      	bset	21536,#0
5706  0a38               L5772:
5707                     ; 871 	while((CAN->MSR & CAN_MSR_INAK) == 0);	// waiting for CAN enter the init mode
5709  0a38 c65421        	ld	a,21537
5710  0a3b a501          	bcp	a,#1
5711  0a3d 27f9          	jreq	L5772
5712                     ; 873 	CAN->MCR|= CAN_MCR_NART;					// no automatic retransmition
5714  0a3f 72185420      	bset	21536,#4
5715                     ; 875 	CAN->PSR= 2;							// *** FILTER 0 SETTINGS ***
5717  0a43 35025427      	mov	21543,#2
5718                     ; 884 	CAN->Page.Filter01.F0R1= UKU_MESS_STID>>3;			// 16 bits mode
5720  0a47 35155428      	mov	21544,#21
5721                     ; 885 	CAN->Page.Filter01.F0R2= UKU_MESS_STID<<5;
5723  0a4b 35c05429      	mov	21545,#192
5724                     ; 886 	CAN->Page.Filter01.F0R5= UKU_MESS_STID_MASK>>3;
5726  0a4f 357f542c      	mov	21548,#127
5727                     ; 887 	CAN->Page.Filter01.F0R6= UKU_MESS_STID_MASK<<5;
5729  0a53 35e0542d      	mov	21549,#224
5730                     ; 889 	CAN->Page.Filter01.F1R1= BPS_MESS_STID>>3;			// 16 bits mode
5732  0a57 35335430      	mov	21552,#51
5733                     ; 890 	CAN->Page.Filter01.F1R2= BPS_MESS_STID<<5;
5735  0a5b 35c05431      	mov	21553,#192
5736                     ; 891 	CAN->Page.Filter01.F1R5= BPS_MESS_STID_MASK>>3;
5738  0a5f 357f5434      	mov	21556,#127
5739                     ; 892 	CAN->Page.Filter01.F1R6= BPS_MESS_STID_MASK<<5;
5741  0a63 35e05435      	mov	21557,#224
5742                     ; 896 	CAN->PSR= 6;									// set page 6
5744  0a67 35065427      	mov	21543,#6
5745                     ; 901 	CAN->Page.Config.FMR1&=~3;								//mask mode
5747  0a6b c65430        	ld	a,21552
5748  0a6e a4fc          	and	a,#252
5749  0a70 c75430        	ld	21552,a
5750                     ; 907 	CAN->Page.Config.FCR1= ((3<<1) & (CAN_FCR1_FSC00 | CAN_FCR1_FSC01));		//16 bit scale
5752  0a73 35065432      	mov	21554,#6
5753                     ; 908 	CAN->Page.Config.FCR1= ((3<<5) & (CAN_FCR1_FSC10 | CAN_FCR1_FSC11));		//16 bit scale
5755  0a77 35605432      	mov	21554,#96
5756                     ; 911 	CAN->Page.Config.FCR1|= CAN_FCR1_FACT0;	// filter 0 active
5758  0a7b 72105432      	bset	21554,#0
5759                     ; 912 	CAN->Page.Config.FCR1|= CAN_FCR1_FACT1;
5761  0a7f 72185432      	bset	21554,#4
5762                     ; 915 	CAN->PSR= 6;								// *** BIT TIMING SETTINGS ***
5764  0a83 35065427      	mov	21543,#6
5765                     ; 917 	CAN->Page.Config.BTR1= 4;					// CAN_BTR1_BRP=9, 	tq= fcpu/(9+1)
5767  0a87 3504542c      	mov	21548,#4
5768                     ; 918 	CAN->Page.Config.BTR2= (1<<7)|(6<<4) | 7; 		// BS2=8, BS1=7, 		
5770  0a8b 35e7542d      	mov	21549,#231
5771                     ; 920 	CAN->IER|=(1<<1);
5773  0a8f 72125425      	bset	21541,#1
5774                     ; 923 	CAN->MCR&=~CAN_MCR_INRQ;					// leave initialization request
5776  0a93 72115420      	bres	21536,#0
5778  0a97               L3003:
5779                     ; 924 	while((CAN->MSR & CAN_MSR_INAK) != 0);	// waiting for CAN leave the init mode
5781  0a97 c65421        	ld	a,21537
5782  0a9a a501          	bcp	a,#1
5783  0a9c 26f9          	jrne	L3003
5784                     ; 925 }
5787  0a9e 81            	ret
5895                     ; 929 void can_transmit(unsigned short id_st,char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7)
5895                     ; 930 {
5896                     	switch	.text
5897  0a9f               _can_transmit:
5899  0a9f 89            	pushw	x
5900       00000000      OFST:	set	0
5903                     ; 932 if((can_buff_wr_ptr<0)||(can_buff_wr_ptr>3))can_buff_wr_ptr=0;
5905  0aa0 b637          	ld	a,_can_buff_wr_ptr
5906  0aa2 a104          	cp	a,#4
5907  0aa4 2502          	jrult	L5603
5910  0aa6 3f37          	clr	_can_buff_wr_ptr
5911  0aa8               L5603:
5912                     ; 934 can_out_buff[can_buff_wr_ptr][0]=(char)(id_st>>6);
5914  0aa8 b637          	ld	a,_can_buff_wr_ptr
5915  0aaa 97            	ld	xl,a
5916  0aab a610          	ld	a,#16
5917  0aad 42            	mul	x,a
5918  0aae 1601          	ldw	y,(OFST+1,sp)
5919  0ab0 a606          	ld	a,#6
5920  0ab2               L051:
5921  0ab2 9054          	srlw	y
5922  0ab4 4a            	dec	a
5923  0ab5 26fb          	jrne	L051
5924  0ab7 909f          	ld	a,yl
5925  0ab9 e738          	ld	(_can_out_buff,x),a
5926                     ; 935 can_out_buff[can_buff_wr_ptr][1]=(char)(id_st<<2);
5928  0abb b637          	ld	a,_can_buff_wr_ptr
5929  0abd 97            	ld	xl,a
5930  0abe a610          	ld	a,#16
5931  0ac0 42            	mul	x,a
5932  0ac1 7b02          	ld	a,(OFST+2,sp)
5933  0ac3 48            	sll	a
5934  0ac4 48            	sll	a
5935  0ac5 e739          	ld	(_can_out_buff+1,x),a
5936                     ; 937 can_out_buff[can_buff_wr_ptr][2]=data0;
5938  0ac7 b637          	ld	a,_can_buff_wr_ptr
5939  0ac9 97            	ld	xl,a
5940  0aca a610          	ld	a,#16
5941  0acc 42            	mul	x,a
5942  0acd 7b05          	ld	a,(OFST+5,sp)
5943  0acf e73a          	ld	(_can_out_buff+2,x),a
5944                     ; 938 can_out_buff[can_buff_wr_ptr][3]=data1;
5946  0ad1 b637          	ld	a,_can_buff_wr_ptr
5947  0ad3 97            	ld	xl,a
5948  0ad4 a610          	ld	a,#16
5949  0ad6 42            	mul	x,a
5950  0ad7 7b06          	ld	a,(OFST+6,sp)
5951  0ad9 e73b          	ld	(_can_out_buff+3,x),a
5952                     ; 939 can_out_buff[can_buff_wr_ptr][4]=data2;
5954  0adb b637          	ld	a,_can_buff_wr_ptr
5955  0add 97            	ld	xl,a
5956  0ade a610          	ld	a,#16
5957  0ae0 42            	mul	x,a
5958  0ae1 7b07          	ld	a,(OFST+7,sp)
5959  0ae3 e73c          	ld	(_can_out_buff+4,x),a
5960                     ; 940 can_out_buff[can_buff_wr_ptr][5]=data3;
5962  0ae5 b637          	ld	a,_can_buff_wr_ptr
5963  0ae7 97            	ld	xl,a
5964  0ae8 a610          	ld	a,#16
5965  0aea 42            	mul	x,a
5966  0aeb 7b08          	ld	a,(OFST+8,sp)
5967  0aed e73d          	ld	(_can_out_buff+5,x),a
5968                     ; 941 can_out_buff[can_buff_wr_ptr][6]=data4;
5970  0aef b637          	ld	a,_can_buff_wr_ptr
5971  0af1 97            	ld	xl,a
5972  0af2 a610          	ld	a,#16
5973  0af4 42            	mul	x,a
5974  0af5 7b09          	ld	a,(OFST+9,sp)
5975  0af7 e73e          	ld	(_can_out_buff+6,x),a
5976                     ; 942 can_out_buff[can_buff_wr_ptr][7]=data5;
5978  0af9 b637          	ld	a,_can_buff_wr_ptr
5979  0afb 97            	ld	xl,a
5980  0afc a610          	ld	a,#16
5981  0afe 42            	mul	x,a
5982  0aff 7b0a          	ld	a,(OFST+10,sp)
5983  0b01 e73f          	ld	(_can_out_buff+7,x),a
5984                     ; 943 can_out_buff[can_buff_wr_ptr][8]=data6;
5986  0b03 b637          	ld	a,_can_buff_wr_ptr
5987  0b05 97            	ld	xl,a
5988  0b06 a610          	ld	a,#16
5989  0b08 42            	mul	x,a
5990  0b09 7b0b          	ld	a,(OFST+11,sp)
5991  0b0b e740          	ld	(_can_out_buff+8,x),a
5992                     ; 944 can_out_buff[can_buff_wr_ptr][9]=data7;
5994  0b0d b637          	ld	a,_can_buff_wr_ptr
5995  0b0f 97            	ld	xl,a
5996  0b10 a610          	ld	a,#16
5997  0b12 42            	mul	x,a
5998  0b13 7b0c          	ld	a,(OFST+12,sp)
5999  0b15 e741          	ld	(_can_out_buff+9,x),a
6000                     ; 946 can_buff_wr_ptr++;
6002  0b17 3c37          	inc	_can_buff_wr_ptr
6003                     ; 947 if(can_buff_wr_ptr>3)can_buff_wr_ptr=0;
6005  0b19 b637          	ld	a,_can_buff_wr_ptr
6006  0b1b a104          	cp	a,#4
6007  0b1d 2502          	jrult	L7603
6010  0b1f 3f37          	clr	_can_buff_wr_ptr
6011  0b21               L7603:
6012                     ; 948 } 
6015  0b21 85            	popw	x
6016  0b22 81            	ret
6058                     ; 951 void ind_hndl(void)
6058                     ; 952 {
6059                     	switch	.text
6060  0b23               _ind_hndl:
6062  0b23 89            	pushw	x
6063       00000002      OFST:	set	2
6066                     ; 954 if(ind_fad_cnt)
6068  0b24 3d8c          	tnz	_ind_fad_cnt
6069  0b26 2702          	jreq	L1013
6070                     ; 956 	ind_fad_cnt--;
6072  0b28 3a8c          	dec	_ind_fad_cnt
6073  0b2a               L1013:
6074                     ; 1058 int2ind_slkuf2(ind_U,0,3,1,0,0,0);
6076  0b2a 4b00          	push	#0
6077  0b2c 4b00          	push	#0
6078  0b2e 4b00          	push	#0
6079  0b30 4b01          	push	#1
6080  0b32 4b03          	push	#3
6081  0b34 4b00          	push	#0
6082  0b36 be96          	ldw	x,_ind_U
6083  0b38 cd0414        	call	_int2ind_slkuf2
6085  0b3b 5b06          	addw	sp,#6
6086                     ; 1063 if(work_stat==wsGS)
6088  0b3d b638          	ld	a,_work_stat
6089  0b3f a101          	cp	a,#1
6090  0b41 2703          	jreq	L451
6091  0b43 cc0c5c        	jp	L3013
6092  0b46               L451:
6093                     ; 1065 	if((ind_fad_cnt)&&(but_state==bsOFF))
6095  0b46 3d8c          	tnz	_ind_fad_cnt
6096  0b48 273b          	jreq	L5013
6098  0b4a 3dab          	tnz	_but_state
6099  0b4c 2637          	jrne	L5013
6100                     ; 1068 		if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,1);
6102  0b4e 9c            	rvf
6103  0b4f be90          	ldw	x,_ind_I_set
6104  0b51 a303e8        	cpw	x,#1000
6105  0b54 2e15          	jrsge	L7013
6108  0b56 4b01          	push	#1
6109  0b58 4b00          	push	#0
6110  0b5a 4b01          	push	#1
6111  0b5c 4b01          	push	#1
6112  0b5e 4b03          	push	#3
6113  0b60 4b00          	push	#0
6114  0b62 be90          	ldw	x,_ind_I_set
6115  0b64 cd0371        	call	_int2ind_slkuf1
6117  0b67 5b06          	addw	sp,#6
6119  0b69 204f          	jra	L3113
6120  0b6b               L7013:
6121                     ; 1069 		else int2ind_slkuf1(ind_I_set/10,0,3,0,1,0,1);
6123  0b6b 4b01          	push	#1
6124  0b6d 4b00          	push	#0
6125  0b6f 4b01          	push	#1
6126  0b71 4b00          	push	#0
6127  0b73 4b03          	push	#3
6128  0b75 4b00          	push	#0
6129  0b77 be90          	ldw	x,_ind_I_set
6130  0b79 a60a          	ld	a,#10
6131  0b7b cd0000        	call	c_sdivx
6133  0b7e cd0371        	call	_int2ind_slkuf1
6135  0b81 5b06          	addw	sp,#6
6136  0b83 2035          	jra	L3113
6137  0b85               L5013:
6138                     ; 1074 		if(ind_I<=999)int2ind_slkuf1(ind_I,0,3,1,1,0,0);
6140  0b85 9c            	rvf
6141  0b86 be94          	ldw	x,_ind_I
6142  0b88 a303e8        	cpw	x,#1000
6143  0b8b 2e15          	jrsge	L5113
6146  0b8d 4b00          	push	#0
6147  0b8f 4b00          	push	#0
6148  0b91 4b01          	push	#1
6149  0b93 4b01          	push	#1
6150  0b95 4b03          	push	#3
6151  0b97 4b00          	push	#0
6152  0b99 be94          	ldw	x,_ind_I
6153  0b9b cd0371        	call	_int2ind_slkuf1
6155  0b9e 5b06          	addw	sp,#6
6157  0ba0 2018          	jra	L3113
6158  0ba2               L5113:
6159                     ; 1075 		else int2ind_slkuf1(ind_I/10,0,3,0,1,0,0);
6161  0ba2 4b00          	push	#0
6162  0ba4 4b00          	push	#0
6163  0ba6 4b01          	push	#1
6164  0ba8 4b00          	push	#0
6165  0baa 4b03          	push	#3
6166  0bac 4b00          	push	#0
6167  0bae be94          	ldw	x,_ind_I
6168  0bb0 a60a          	ld	a,#10
6169  0bb2 cd0000        	call	c_sdivx
6171  0bb5 cd0371        	call	_int2ind_slkuf1
6173  0bb8 5b06          	addw	sp,#6
6174  0bba               L3113:
6175                     ; 1079 	if(ind_U<1000){
6177  0bba 9c            	rvf
6178  0bbb be96          	ldw	x,_ind_U
6179  0bbd a303e8        	cpw	x,#1000
6180  0bc0 2e15          	jrsge	L1213
6181                     ; 1080 		int2ind_slkuf2(ind_U,0,3,1,1,0,0);
6183  0bc2 4b00          	push	#0
6184  0bc4 4b00          	push	#0
6185  0bc6 4b01          	push	#1
6186  0bc8 4b01          	push	#1
6187  0bca 4b03          	push	#3
6188  0bcc 4b00          	push	#0
6189  0bce be96          	ldw	x,_ind_U
6190  0bd0 cd0414        	call	_int2ind_slkuf2
6192  0bd3 5b06          	addw	sp,#6
6194  0bd5 2018          	jra	L3213
6195  0bd7               L1213:
6196                     ; 1082 		int2ind_slkuf2(ind_U/10,0,3,0,1,0,0);
6198  0bd7 4b00          	push	#0
6199  0bd9 4b00          	push	#0
6200  0bdb 4b01          	push	#1
6201  0bdd 4b00          	push	#0
6202  0bdf 4b03          	push	#3
6203  0be1 4b00          	push	#0
6204  0be3 be96          	ldw	x,_ind_U
6205  0be5 a60a          	ld	a,#10
6206  0be7 cd0000        	call	c_sdivx
6208  0bea cd0414        	call	_int2ind_slkuf2
6210  0bed 5b06          	addw	sp,#6
6211  0bef               L3213:
6212                     ; 1086 	if(bFL2)	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,2,0,0,0);
6214  0bef 3d7a          	tnz	_bFL2
6215  0bf1 272e          	jreq	L5213
6218  0bf3 4b00          	push	#0
6219  0bf5 4b00          	push	#0
6220  0bf7 4b00          	push	#0
6221  0bf9 4b02          	push	#2
6222  0bfb 4b04          	push	#4
6223  0bfd 4b00          	push	#0
6224  0bff be9a          	ldw	x,_time
6225  0c01 90ae003c      	ldw	y,#60
6226  0c05 65            	divw	x,y
6227  0c06 51            	exgw	x,y
6228  0c07 1f07          	ldw	(OFST+5,sp),x
6229  0c09 be9a          	ldw	x,_time
6230  0c0b 90ae003c      	ldw	y,#60
6231  0c0f 65            	divw	x,y
6232  0c10 90ae0064      	ldw	y,#100
6233  0c14 cd0000        	call	c_imul
6235  0c17 72fb07        	addw	x,(OFST+5,sp)
6236  0c1a cd04d8        	call	_int2ind_slkuf3
6238  0c1d 5b06          	addw	sp,#6
6240  0c1f 202c          	jra	L7213
6241  0c21               L5213:
6242                     ; 1087 	else 	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,0,0,0,0);
6244  0c21 4b00          	push	#0
6245  0c23 4b00          	push	#0
6246  0c25 4b00          	push	#0
6247  0c27 4b00          	push	#0
6248  0c29 4b04          	push	#4
6249  0c2b 4b00          	push	#0
6250  0c2d be9a          	ldw	x,_time
6251  0c2f 90ae003c      	ldw	y,#60
6252  0c33 65            	divw	x,y
6253  0c34 51            	exgw	x,y
6254  0c35 1f07          	ldw	(OFST+5,sp),x
6255  0c37 be9a          	ldw	x,_time
6256  0c39 90ae003c      	ldw	y,#60
6257  0c3d 65            	divw	x,y
6258  0c3e 90ae0064      	ldw	y,#100
6259  0c42 cd0000        	call	c_imul
6261  0c45 72fb07        	addw	x,(OFST+5,sp)
6262  0c48 cd04d8        	call	_int2ind_slkuf3
6264  0c4b 5b06          	addw	sp,#6
6265  0c4d               L7213:
6266                     ; 1089 	if(bFL5)dig1_[3]&=0xdf;
6268  0c4d 3d7b          	tnz	_bFL5
6269  0c4f 2603          	jrne	L651
6270  0c51 cc1062        	jp	L3313
6271  0c54               L651:
6274  0c54 721b0020      	bres	_dig1_+3,#5
6275  0c58 ac621062      	jpf	L3313
6276  0c5c               L3013:
6277                     ; 1091 else if(work_stat==wsPS)
6279  0c5c b638          	ld	a,_work_stat
6280  0c5e a102          	cp	a,#2
6281  0c60 2703          	jreq	L061
6282  0c62 cc0d7b        	jp	L5313
6283  0c65               L061:
6284                     ; 1094 	if(ind_I<=999)int2ind_slkuf1(ind_I,0,3,1,1,0,0);
6286  0c65 9c            	rvf
6287  0c66 be94          	ldw	x,_ind_I
6288  0c68 a303e8        	cpw	x,#1000
6289  0c6b 2e15          	jrsge	L7313
6292  0c6d 4b00          	push	#0
6293  0c6f 4b00          	push	#0
6294  0c71 4b01          	push	#1
6295  0c73 4b01          	push	#1
6296  0c75 4b03          	push	#3
6297  0c77 4b00          	push	#0
6298  0c79 be94          	ldw	x,_ind_I
6299  0c7b cd0371        	call	_int2ind_slkuf1
6301  0c7e 5b06          	addw	sp,#6
6303  0c80 2018          	jra	L1413
6304  0c82               L7313:
6305                     ; 1095 	else int2ind_slkuf1(ind_I/10,0,3,0,1,0,0);
6307  0c82 4b00          	push	#0
6308  0c84 4b00          	push	#0
6309  0c86 4b01          	push	#1
6310  0c88 4b00          	push	#0
6311  0c8a 4b03          	push	#3
6312  0c8c 4b00          	push	#0
6313  0c8e be94          	ldw	x,_ind_I
6314  0c90 a60a          	ld	a,#10
6315  0c92 cd0000        	call	c_sdivx
6317  0c95 cd0371        	call	_int2ind_slkuf1
6319  0c98 5b06          	addw	sp,#6
6320  0c9a               L1413:
6321                     ; 1098 	if((!ind_fad_cnt)||(but_state!=bsOFF)) {
6323  0c9a 3d8c          	tnz	_ind_fad_cnt
6324  0c9c 2704          	jreq	L5413
6326  0c9e 3dab          	tnz	_but_state
6327  0ca0 2767          	jreq	L3413
6328  0ca2               L5413:
6329                     ; 1100 		if(ind_U<1000){
6331  0ca2 9c            	rvf
6332  0ca3 be96          	ldw	x,_ind_U
6333  0ca5 a303e8        	cpw	x,#1000
6334  0ca8 2e15          	jrsge	L7413
6335                     ; 1101 			int2ind_slkuf2(ind_U,0,3,1,1,0,0);
6337  0caa 4b00          	push	#0
6338  0cac 4b00          	push	#0
6339  0cae 4b01          	push	#1
6340  0cb0 4b01          	push	#1
6341  0cb2 4b03          	push	#3
6342  0cb4 4b00          	push	#0
6343  0cb6 be96          	ldw	x,_ind_U
6344  0cb8 cd0414        	call	_int2ind_slkuf2
6346  0cbb 5b06          	addw	sp,#6
6348  0cbd 2018          	jra	L3513
6349  0cbf               L7413:
6350                     ; 1103 			int2ind_slkuf2(ind_U/10,0,3,0,1,0,0);
6352  0cbf 4b00          	push	#0
6353  0cc1 4b00          	push	#0
6354  0cc3 4b01          	push	#1
6355  0cc5 4b00          	push	#0
6356  0cc7 4b03          	push	#3
6357  0cc9 4b00          	push	#0
6358  0ccb be96          	ldw	x,_ind_U
6359  0ccd a60a          	ld	a,#10
6360  0ccf cd0000        	call	c_sdivx
6362  0cd2 cd0414        	call	_int2ind_slkuf2
6364  0cd5 5b06          	addw	sp,#6
6365  0cd7               L3513:
6366                     ; 1118 	if(bFL2)	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,2,0,0,0);
6368  0cd7 3d7a          	tnz	_bFL2
6369  0cd9 2765          	jreq	L1613
6372  0cdb 4b00          	push	#0
6373  0cdd 4b00          	push	#0
6374  0cdf 4b00          	push	#0
6375  0ce1 4b02          	push	#2
6376  0ce3 4b04          	push	#4
6377  0ce5 4b00          	push	#0
6378  0ce7 be9a          	ldw	x,_time
6379  0ce9 90ae003c      	ldw	y,#60
6380  0ced 65            	divw	x,y
6381  0cee 51            	exgw	x,y
6382  0cef 1f07          	ldw	(OFST+5,sp),x
6383  0cf1 be9a          	ldw	x,_time
6384  0cf3 90ae003c      	ldw	y,#60
6385  0cf7 65            	divw	x,y
6386  0cf8 90ae0064      	ldw	y,#100
6387  0cfc cd0000        	call	c_imul
6389  0cff 72fb07        	addw	x,(OFST+5,sp)
6390  0d02 cd04d8        	call	_int2ind_slkuf3
6392  0d05 5b06          	addw	sp,#6
6394  0d07 2063          	jra	L3613
6395  0d09               L3413:
6396                     ; 1108 		if(ind_U_set<1000) {
6398  0d09 9c            	rvf
6399  0d0a be92          	ldw	x,_ind_U_set
6400  0d0c a303e8        	cpw	x,#1000
6401  0d0f 2e15          	jrsge	L5513
6402                     ; 1109 			int2ind_slkuf2(ind_U_set,0,3,1,1,0,1);
6404  0d11 4b01          	push	#1
6405  0d13 4b00          	push	#0
6406  0d15 4b01          	push	#1
6407  0d17 4b01          	push	#1
6408  0d19 4b03          	push	#3
6409  0d1b 4b00          	push	#0
6410  0d1d be92          	ldw	x,_ind_U_set
6411  0d1f cd0414        	call	_int2ind_slkuf2
6413  0d22 5b06          	addw	sp,#6
6415  0d24 20b1          	jra	L3513
6416  0d26               L5513:
6417                     ; 1111 			int2ind_slkuf2(ind_U_set/10,0,3,0,1,0,1);
6419  0d26 4b01          	push	#1
6420  0d28 4b00          	push	#0
6421  0d2a 4b01          	push	#1
6422  0d2c 4b00          	push	#0
6423  0d2e 4b03          	push	#3
6424  0d30 4b00          	push	#0
6425  0d32 be92          	ldw	x,_ind_U_set
6426  0d34 a60a          	ld	a,#10
6427  0d36 cd0000        	call	c_sdivx
6429  0d39 cd0414        	call	_int2ind_slkuf2
6431  0d3c 5b06          	addw	sp,#6
6432  0d3e 2097          	jra	L3513
6433  0d40               L1613:
6434                     ; 1119 	else 	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,0,0,0,0);
6436  0d40 4b00          	push	#0
6437  0d42 4b00          	push	#0
6438  0d44 4b00          	push	#0
6439  0d46 4b00          	push	#0
6440  0d48 4b04          	push	#4
6441  0d4a 4b00          	push	#0
6442  0d4c be9a          	ldw	x,_time
6443  0d4e 90ae003c      	ldw	y,#60
6444  0d52 65            	divw	x,y
6445  0d53 51            	exgw	x,y
6446  0d54 1f07          	ldw	(OFST+5,sp),x
6447  0d56 be9a          	ldw	x,_time
6448  0d58 90ae003c      	ldw	y,#60
6449  0d5c 65            	divw	x,y
6450  0d5d 90ae0064      	ldw	y,#100
6451  0d61 cd0000        	call	c_imul
6453  0d64 72fb07        	addw	x,(OFST+5,sp)
6454  0d67 cd04d8        	call	_int2ind_slkuf3
6456  0d6a 5b06          	addw	sp,#6
6457  0d6c               L3613:
6458                     ; 1121 	if(bFL5)dig2_[3]&=0xdf;
6460  0d6c 3d7b          	tnz	_bFL5
6461  0d6e 2603          	jrne	L261
6462  0d70 cc1062        	jp	L3313
6463  0d73               L261:
6466  0d73 721b0028      	bres	_dig2_+3,#5
6467  0d77 ac621062      	jpf	L3313
6468  0d7b               L5313:
6469                     ; 1125 	if(tmblr_state==tsI)
6471  0d7b b6ac          	ld	a,_tmblr_state
6472  0d7d a102          	cp	a,#2
6473  0d7f 2703          	jreq	L461
6474  0d81 cc0ef1        	jp	L1713
6475  0d84               L461:
6476                     ; 1128 		if((ind_fad_cnt)&&(but_state==bsOFF))
6478  0d84 3d8c          	tnz	_ind_fad_cnt
6479  0d86 273b          	jreq	L3713
6481  0d88 3dab          	tnz	_but_state
6482  0d8a 2637          	jrne	L3713
6483                     ; 1130 			if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,1);
6485  0d8c 9c            	rvf
6486  0d8d be90          	ldw	x,_ind_I_set
6487  0d8f a303e8        	cpw	x,#1000
6488  0d92 2e15          	jrsge	L5713
6491  0d94 4b01          	push	#1
6492  0d96 4b00          	push	#0
6493  0d98 4b01          	push	#1
6494  0d9a 4b01          	push	#1
6495  0d9c 4b03          	push	#3
6496  0d9e 4b00          	push	#0
6497  0da0 be90          	ldw	x,_ind_I_set
6498  0da2 cd0371        	call	_int2ind_slkuf1
6500  0da5 5b06          	addw	sp,#6
6502  0da7 204f          	jra	L1023
6503  0da9               L5713:
6504                     ; 1131 			else int2ind_slkuf1(ind_I_set/10,0,3,0,1,0,1);
6506  0da9 4b01          	push	#1
6507  0dab 4b00          	push	#0
6508  0dad 4b01          	push	#1
6509  0daf 4b00          	push	#0
6510  0db1 4b03          	push	#3
6511  0db3 4b00          	push	#0
6512  0db5 be90          	ldw	x,_ind_I_set
6513  0db7 a60a          	ld	a,#10
6514  0db9 cd0000        	call	c_sdivx
6516  0dbc cd0371        	call	_int2ind_slkuf1
6518  0dbf 5b06          	addw	sp,#6
6519  0dc1 2035          	jra	L1023
6520  0dc3               L3713:
6521                     ; 1135 			if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,0);
6523  0dc3 9c            	rvf
6524  0dc4 be90          	ldw	x,_ind_I_set
6525  0dc6 a303e8        	cpw	x,#1000
6526  0dc9 2e15          	jrsge	L3023
6529  0dcb 4b00          	push	#0
6530  0dcd 4b00          	push	#0
6531  0dcf 4b01          	push	#1
6532  0dd1 4b01          	push	#1
6533  0dd3 4b03          	push	#3
6534  0dd5 4b00          	push	#0
6535  0dd7 be90          	ldw	x,_ind_I_set
6536  0dd9 cd0371        	call	_int2ind_slkuf1
6538  0ddc 5b06          	addw	sp,#6
6540  0dde 2018          	jra	L1023
6541  0de0               L3023:
6542                     ; 1136 			else int2ind_slkuf1(ind_I_set/10,0,3,0,1,0,0);
6544  0de0 4b00          	push	#0
6545  0de2 4b00          	push	#0
6546  0de4 4b01          	push	#1
6547  0de6 4b00          	push	#0
6548  0de8 4b03          	push	#3
6549  0dea 4b00          	push	#0
6550  0dec be90          	ldw	x,_ind_I_set
6551  0dee a60a          	ld	a,#10
6552  0df0 cd0000        	call	c_sdivx
6554  0df3 cd0371        	call	_int2ind_slkuf1
6556  0df6 5b06          	addw	sp,#6
6557  0df8               L1023:
6558                     ; 1140 		if(ind_U_set<1000) {
6560  0df8 9c            	rvf
6561  0df9 be92          	ldw	x,_ind_U_set
6562  0dfb a303e8        	cpw	x,#1000
6563  0dfe 2e15          	jrsge	L7023
6564                     ; 1141 			int2ind_slkuf2(ind_U_set,0,3,1,1,0,0);
6566  0e00 4b00          	push	#0
6567  0e02 4b00          	push	#0
6568  0e04 4b01          	push	#1
6569  0e06 4b01          	push	#1
6570  0e08 4b03          	push	#3
6571  0e0a 4b00          	push	#0
6572  0e0c be92          	ldw	x,_ind_U_set
6573  0e0e cd0414        	call	_int2ind_slkuf2
6575  0e11 5b06          	addw	sp,#6
6577  0e13 2018          	jra	L1123
6578  0e15               L7023:
6579                     ; 1143 			int2ind_slkuf2(ind_U_set/10,0,3,0,1,0,0);
6581  0e15 4b00          	push	#0
6582  0e17 4b00          	push	#0
6583  0e19 4b01          	push	#1
6584  0e1b 4b00          	push	#0
6585  0e1d 4b03          	push	#3
6586  0e1f 4b00          	push	#0
6587  0e21 be92          	ldw	x,_ind_U_set
6588  0e23 a60a          	ld	a,#10
6589  0e25 cd0000        	call	c_sdivx
6591  0e28 cd0414        	call	_int2ind_slkuf2
6593  0e2b 5b06          	addw	sp,#6
6594  0e2d               L1123:
6595                     ; 1146 		dig1_[3]&=0xdf;
6597  0e2d 721b0020      	bres	_dig1_+3,#5
6598                     ; 1149 		if((ind_fad_cnt)&&(but_state==bsON))
6600  0e31 3d8c          	tnz	_ind_fad_cnt
6601  0e33 2761          	jreq	L3123
6603  0e35 b6ab          	ld	a,_but_state
6604  0e37 a101          	cp	a,#1
6605  0e39 265b          	jrne	L3123
6606                     ; 1151 			if(time_set==0xffff)
6608  0e3b be98          	ldw	x,_time_set
6609  0e3d a3ffff        	cpw	x,#65535
6610  0e40 2624          	jrne	L5123
6611                     ; 1153 				dig3[0]=0xbf;
6613  0e42 35bf0015      	mov	_dig3,#191
6614                     ; 1154 				dig3[1]=0xbf;
6616  0e46 35bf0016      	mov	_dig3+1,#191
6617                     ; 1155 				dig3[2]=0xbf;
6619  0e4a 35bf0017      	mov	_dig3+2,#191
6620                     ; 1156 				dig3[3]=0xbf;
6622  0e4e 35bf0018      	mov	_dig3+3,#191
6623                     ; 1157 				dig3_[0]=0xff;
6625  0e52 35ff002d      	mov	_dig3_,#255
6626                     ; 1158 				dig3_[1]=0xff;
6628  0e56 35ff002e      	mov	_dig3_+1,#255
6629                     ; 1159 				dig3_[2]=0xff;
6631  0e5a 35ff002f      	mov	_dig3_+2,#255
6632                     ; 1160 				dig3_[3]=0xff;
6634  0e5e 35ff0030      	mov	_dig3_+3,#255
6636  0e62 ac621062      	jpf	L3313
6637  0e66               L5123:
6638                     ; 1162 			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,1);
6640  0e66 4b01          	push	#1
6641  0e68 4b00          	push	#0
6642  0e6a 4b00          	push	#0
6643  0e6c 4b02          	push	#2
6644  0e6e 4b04          	push	#4
6645  0e70 4b00          	push	#0
6646  0e72 be98          	ldw	x,_time_set
6647  0e74 90ae003c      	ldw	y,#60
6648  0e78 65            	divw	x,y
6649  0e79 51            	exgw	x,y
6650  0e7a 1f07          	ldw	(OFST+5,sp),x
6651  0e7c be98          	ldw	x,_time_set
6652  0e7e 90ae003c      	ldw	y,#60
6653  0e82 65            	divw	x,y
6654  0e83 90ae0064      	ldw	y,#100
6655  0e87 cd0000        	call	c_imul
6657  0e8a 72fb07        	addw	x,(OFST+5,sp)
6658  0e8d cd04d8        	call	_int2ind_slkuf3
6660  0e90 5b06          	addw	sp,#6
6661  0e92 ac621062      	jpf	L3313
6662  0e96               L3123:
6663                     ; 1166 			if(time_set==0xffff)
6665  0e96 be98          	ldw	x,_time_set
6666  0e98 a3ffff        	cpw	x,#65535
6667  0e9b 2624          	jrne	L3223
6668                     ; 1168 				dig3[0]=0xbf;
6670  0e9d 35bf0015      	mov	_dig3,#191
6671                     ; 1169 				dig3[1]=0xbf;
6673  0ea1 35bf0016      	mov	_dig3+1,#191
6674                     ; 1170 				dig3[2]=0xbf;
6676  0ea5 35bf0017      	mov	_dig3+2,#191
6677                     ; 1171 				dig3[3]=0xbf;
6679  0ea9 35bf0018      	mov	_dig3+3,#191
6680                     ; 1172 				dig3_[0]=0xbf;
6682  0ead 35bf002d      	mov	_dig3_,#191
6683                     ; 1173 				dig3_[1]=0xbf;
6685  0eb1 35bf002e      	mov	_dig3_+1,#191
6686                     ; 1174 				dig3_[2]=0xbf;
6688  0eb5 35bf002f      	mov	_dig3_+2,#191
6689                     ; 1175 				dig3_[3]=0xbf;
6691  0eb9 35bf0030      	mov	_dig3_+3,#191
6693  0ebd ac621062      	jpf	L3313
6694  0ec1               L3223:
6695                     ; 1177 			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,0);
6697  0ec1 4b00          	push	#0
6698  0ec3 4b00          	push	#0
6699  0ec5 4b00          	push	#0
6700  0ec7 4b02          	push	#2
6701  0ec9 4b04          	push	#4
6702  0ecb 4b00          	push	#0
6703  0ecd be98          	ldw	x,_time_set
6704  0ecf 90ae003c      	ldw	y,#60
6705  0ed3 65            	divw	x,y
6706  0ed4 51            	exgw	x,y
6707  0ed5 1f07          	ldw	(OFST+5,sp),x
6708  0ed7 be98          	ldw	x,_time_set
6709  0ed9 90ae003c      	ldw	y,#60
6710  0edd 65            	divw	x,y
6711  0ede 90ae0064      	ldw	y,#100
6712  0ee2 cd0000        	call	c_imul
6714  0ee5 72fb07        	addw	x,(OFST+5,sp)
6715  0ee8 cd04d8        	call	_int2ind_slkuf3
6717  0eeb 5b06          	addw	sp,#6
6718  0eed ac621062      	jpf	L3313
6719  0ef1               L1713:
6720                     ; 1180 	else if(tmblr_state==tsU)
6722  0ef1 b6ac          	ld	a,_tmblr_state
6723  0ef3 a101          	cp	a,#1
6724  0ef5 2703          	jreq	L661
6725  0ef7 cc1062        	jp	L3313
6726  0efa               L661:
6727                     ; 1183 		if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,0);
6729  0efa 9c            	rvf
6730  0efb be90          	ldw	x,_ind_I_set
6731  0efd a303e8        	cpw	x,#1000
6732  0f00 2e15          	jrsge	L3323
6735  0f02 4b00          	push	#0
6736  0f04 4b00          	push	#0
6737  0f06 4b01          	push	#1
6738  0f08 4b01          	push	#1
6739  0f0a 4b03          	push	#3
6740  0f0c 4b00          	push	#0
6741  0f0e be90          	ldw	x,_ind_I_set
6742  0f10 cd0371        	call	_int2ind_slkuf1
6744  0f13 5b06          	addw	sp,#6
6746  0f15 2018          	jra	L5323
6747  0f17               L3323:
6748                     ; 1184 		else int2ind_slkuf1(ind_I_set/10,0,3,0,1,0,0);
6750  0f17 4b00          	push	#0
6751  0f19 4b00          	push	#0
6752  0f1b 4b01          	push	#1
6753  0f1d 4b00          	push	#0
6754  0f1f 4b03          	push	#3
6755  0f21 4b00          	push	#0
6756  0f23 be90          	ldw	x,_ind_I_set
6757  0f25 a60a          	ld	a,#10
6758  0f27 cd0000        	call	c_sdivx
6760  0f2a cd0371        	call	_int2ind_slkuf1
6762  0f2d 5b06          	addw	sp,#6
6763  0f2f               L5323:
6764                     ; 1188 		if((!ind_fad_cnt)||(but_state!=bsOFF)) {
6766  0f2f 3d8c          	tnz	_ind_fad_cnt
6767  0f31 2704          	jreq	L1423
6769  0f33 3dab          	tnz	_but_state
6770  0f35 2771          	jreq	L7323
6771  0f37               L1423:
6772                     ; 1189 			if(ind_U_set<1000) {
6774  0f37 9c            	rvf
6775  0f38 be92          	ldw	x,_ind_U_set
6776  0f3a a303e8        	cpw	x,#1000
6777  0f3d 2e15          	jrsge	L3423
6778                     ; 1190 				int2ind_slkuf2(ind_U_set,0,3,1,1,0,0);
6780  0f3f 4b00          	push	#0
6781  0f41 4b00          	push	#0
6782  0f43 4b01          	push	#1
6783  0f45 4b01          	push	#1
6784  0f47 4b03          	push	#3
6785  0f49 4b00          	push	#0
6786  0f4b be92          	ldw	x,_ind_U_set
6787  0f4d cd0414        	call	_int2ind_slkuf2
6789  0f50 5b06          	addw	sp,#6
6791  0f52 2018          	jra	L7423
6792  0f54               L3423:
6793                     ; 1192 				int2ind_slkuf2(ind_U_set/10,0,3,0,1,0,0);
6795  0f54 4b00          	push	#0
6796  0f56 4b00          	push	#0
6797  0f58 4b01          	push	#1
6798  0f5a 4b00          	push	#0
6799  0f5c 4b03          	push	#3
6800  0f5e 4b00          	push	#0
6801  0f60 be92          	ldw	x,_ind_U_set
6802  0f62 a60a          	ld	a,#10
6803  0f64 cd0000        	call	c_sdivx
6805  0f67 cd0414        	call	_int2ind_slkuf2
6807  0f6a 5b06          	addw	sp,#6
6808  0f6c               L7423:
6809                     ; 1201 		dig2_[3]&=0xdf;
6811  0f6c 721b0028      	bres	_dig2_+3,#5
6812                     ; 1204 		if((ind_fad_cnt)&&(but_state==bsON))
6814  0f70 3d8c          	tnz	_ind_fad_cnt
6815  0f72 2603cc100d    	jreq	L5523
6817  0f77 b6ab          	ld	a,_but_state
6818  0f79 a101          	cp	a,#1
6819  0f7b 26f7          	jrne	L5523
6820                     ; 1206 			if(time_set==0xffff)
6822  0f7d be98          	ldw	x,_time_set
6823  0f7f a3ffff        	cpw	x,#65535
6824  0f82 265b          	jrne	L7523
6825                     ; 1208 				dig3[0]=0xbf;
6827  0f84 35bf0015      	mov	_dig3,#191
6828                     ; 1209 				dig3[1]=0xbf;
6830  0f88 35bf0016      	mov	_dig3+1,#191
6831                     ; 1210 				dig3[2]=0xbf;
6833  0f8c 35bf0017      	mov	_dig3+2,#191
6834                     ; 1211 				dig3[3]=0xbf;
6836  0f90 35bf0018      	mov	_dig3+3,#191
6837                     ; 1212 				dig3_[0]=0xff;
6839  0f94 35ff002d      	mov	_dig3_,#255
6840                     ; 1213 				dig3_[1]=0xff;
6842  0f98 35ff002e      	mov	_dig3_+1,#255
6843                     ; 1214 				dig3_[2]=0xff;
6845  0f9c 35ff002f      	mov	_dig3_+2,#255
6846                     ; 1215 				dig3_[3]=0xff;
6848  0fa0 35ff0030      	mov	_dig3_+3,#255
6850  0fa4 ac621062      	jpf	L3313
6851  0fa8               L7323:
6852                     ; 1195 			if(ind_U_set<1000) {
6854  0fa8 9c            	rvf
6855  0fa9 be92          	ldw	x,_ind_U_set
6856  0fab a303e8        	cpw	x,#1000
6857  0fae 2e15          	jrsge	L1523
6858                     ; 1196 				int2ind_slkuf2(ind_U_set,0,3,1,1,0,1);
6860  0fb0 4b01          	push	#1
6861  0fb2 4b00          	push	#0
6862  0fb4 4b01          	push	#1
6863  0fb6 4b01          	push	#1
6864  0fb8 4b03          	push	#3
6865  0fba 4b00          	push	#0
6866  0fbc be92          	ldw	x,_ind_U_set
6867  0fbe cd0414        	call	_int2ind_slkuf2
6869  0fc1 5b06          	addw	sp,#6
6871  0fc3 20a7          	jra	L7423
6872  0fc5               L1523:
6873                     ; 1198 				int2ind_slkuf2(ind_U_set/10,0,3,0,1,0,1);
6875  0fc5 4b01          	push	#1
6876  0fc7 4b00          	push	#0
6877  0fc9 4b01          	push	#1
6878  0fcb 4b00          	push	#0
6879  0fcd 4b03          	push	#3
6880  0fcf 4b00          	push	#0
6881  0fd1 be92          	ldw	x,_ind_U_set
6882  0fd3 a60a          	ld	a,#10
6883  0fd5 cd0000        	call	c_sdivx
6885  0fd8 cd0414        	call	_int2ind_slkuf2
6887  0fdb 5b06          	addw	sp,#6
6888  0fdd 208d          	jra	L7423
6889  0fdf               L7523:
6890                     ; 1217 			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,1);
6892  0fdf 4b01          	push	#1
6893  0fe1 4b00          	push	#0
6894  0fe3 4b00          	push	#0
6895  0fe5 4b02          	push	#2
6896  0fe7 4b04          	push	#4
6897  0fe9 4b00          	push	#0
6898  0feb be98          	ldw	x,_time_set
6899  0fed 90ae003c      	ldw	y,#60
6900  0ff1 65            	divw	x,y
6901  0ff2 51            	exgw	x,y
6902  0ff3 1f07          	ldw	(OFST+5,sp),x
6903  0ff5 be98          	ldw	x,_time_set
6904  0ff7 90ae003c      	ldw	y,#60
6905  0ffb 65            	divw	x,y
6906  0ffc 90ae0064      	ldw	y,#100
6907  1000 cd0000        	call	c_imul
6909  1003 72fb07        	addw	x,(OFST+5,sp)
6910  1006 cd04d8        	call	_int2ind_slkuf3
6912  1009 5b06          	addw	sp,#6
6913  100b 2055          	jra	L3313
6914  100d               L5523:
6915                     ; 1221 			if(time_set==0xffff)
6917  100d be98          	ldw	x,_time_set
6918  100f a3ffff        	cpw	x,#65535
6919  1012 2622          	jrne	L5623
6920                     ; 1223 				dig3[0]=0xbf;
6922  1014 35bf0015      	mov	_dig3,#191
6923                     ; 1224 				dig3[1]=0xbf;
6925  1018 35bf0016      	mov	_dig3+1,#191
6926                     ; 1225 				dig3[2]=0xbf;
6928  101c 35bf0017      	mov	_dig3+2,#191
6929                     ; 1226 				dig3[3]=0xbf;
6931  1020 35bf0018      	mov	_dig3+3,#191
6932                     ; 1227 				dig3_[0]=0xbf;
6934  1024 35bf002d      	mov	_dig3_,#191
6935                     ; 1228 				dig3_[1]=0xbf;
6937  1028 35bf002e      	mov	_dig3_+1,#191
6938                     ; 1229 				dig3_[2]=0xbf;
6940  102c 35bf002f      	mov	_dig3_+2,#191
6941                     ; 1230 				dig3_[3]=0xbf;
6943  1030 35bf0030      	mov	_dig3_+3,#191
6945  1034 202c          	jra	L3313
6946  1036               L5623:
6947                     ; 1232 			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,0);
6949  1036 4b00          	push	#0
6950  1038 4b00          	push	#0
6951  103a 4b00          	push	#0
6952  103c 4b02          	push	#2
6953  103e 4b04          	push	#4
6954  1040 4b00          	push	#0
6955  1042 be98          	ldw	x,_time_set
6956  1044 90ae003c      	ldw	y,#60
6957  1048 65            	divw	x,y
6958  1049 51            	exgw	x,y
6959  104a 1f07          	ldw	(OFST+5,sp),x
6960  104c be98          	ldw	x,_time_set
6961  104e 90ae003c      	ldw	y,#60
6962  1052 65            	divw	x,y
6963  1053 90ae0064      	ldw	y,#100
6964  1057 cd0000        	call	c_imul
6966  105a 72fb07        	addw	x,(OFST+5,sp)
6967  105d cd04d8        	call	_int2ind_slkuf3
6969  1060 5b06          	addw	sp,#6
6970  1062               L3313:
6971                     ; 1241 }
6974  1062 85            	popw	x
6975  1063 81            	ret
7004                     ; 1244 void can_tx_hndl(void)
7004                     ; 1245 {
7005                     	switch	.text
7006  1064               _can_tx_hndl:
7010                     ; 1247 if(bTX_FREE)
7012  1064 3d35          	tnz	_bTX_FREE
7013  1066 2757          	jreq	L1033
7014                     ; 1249 	if(can_buff_rd_ptr!=can_buff_wr_ptr)
7016  1068 b636          	ld	a,_can_buff_rd_ptr
7017  106a b137          	cp	a,_can_buff_wr_ptr
7018  106c 275f          	jreq	L7033
7019                     ; 1251 		bTX_FREE=0;
7021  106e 3f35          	clr	_bTX_FREE
7022                     ; 1253 		CAN->PSR= 0;
7024  1070 725f5427      	clr	21543
7025                     ; 1254 		CAN->Page.TxMailbox.MDLCR=8;
7027  1074 35085429      	mov	21545,#8
7028                     ; 1255 		CAN->Page.TxMailbox.MIDR1=can_out_buff[can_buff_rd_ptr][0];
7030  1078 b636          	ld	a,_can_buff_rd_ptr
7031  107a 97            	ld	xl,a
7032  107b a610          	ld	a,#16
7033  107d 42            	mul	x,a
7034  107e e638          	ld	a,(_can_out_buff,x)
7035  1080 c7542a        	ld	21546,a
7036                     ; 1256 		CAN->Page.TxMailbox.MIDR2=can_out_buff[can_buff_rd_ptr][1];
7038  1083 b636          	ld	a,_can_buff_rd_ptr
7039  1085 97            	ld	xl,a
7040  1086 a610          	ld	a,#16
7041  1088 42            	mul	x,a
7042  1089 e639          	ld	a,(_can_out_buff+1,x)
7043  108b c7542b        	ld	21547,a
7044                     ; 1258 		memcpy(&CAN->Page.TxMailbox.MDAR1, &can_out_buff[can_buff_rd_ptr][2],8);
7046  108e b636          	ld	a,_can_buff_rd_ptr
7047  1090 97            	ld	xl,a
7048  1091 a610          	ld	a,#16
7049  1093 42            	mul	x,a
7050  1094 01            	rrwa	x,a
7051  1095 ab3a          	add	a,#_can_out_buff+2
7052  1097 2401          	jrnc	L271
7053  1099 5c            	incw	x
7054  109a               L271:
7055  109a 5f            	clrw	x
7056  109b 97            	ld	xl,a
7057  109c bf00          	ldw	c_x,x
7058  109e ae0008        	ldw	x,#8
7059  10a1               L471:
7060  10a1 5a            	decw	x
7061  10a2 92d600        	ld	a,([c_x],x)
7062  10a5 d7542e        	ld	(21550,x),a
7063  10a8 5d            	tnzw	x
7064  10a9 26f6          	jrne	L471
7065                     ; 1260 		can_buff_rd_ptr++;
7067  10ab 3c36          	inc	_can_buff_rd_ptr
7068                     ; 1261 		if(can_buff_rd_ptr>3)can_buff_rd_ptr=0;
7070  10ad b636          	ld	a,_can_buff_rd_ptr
7071  10af a104          	cp	a,#4
7072  10b1 2502          	jrult	L5033
7075  10b3 3f36          	clr	_can_buff_rd_ptr
7076  10b5               L5033:
7077                     ; 1263 		CAN->Page.TxMailbox.MCSR|= CAN_MCSR_TXRQ;
7079  10b5 72105428      	bset	21544,#0
7080                     ; 1264 		CAN->IER|=(1<<0);
7082  10b9 72105425      	bset	21541,#0
7083  10bd 200e          	jra	L7033
7084  10bf               L1033:
7085                     ; 1269 	tx_busy_cnt++;
7087  10bf 3c35          	inc	_tx_busy_cnt
7088                     ; 1270 	if(tx_busy_cnt>=100)
7090  10c1 b635          	ld	a,_tx_busy_cnt
7091  10c3 a164          	cp	a,#100
7092  10c5 2506          	jrult	L7033
7093                     ; 1272 		tx_busy_cnt=0;
7095  10c7 3f35          	clr	_tx_busy_cnt
7096                     ; 1273 		bTX_FREE=1;
7098  10c9 35010035      	mov	_bTX_FREE,#1
7099  10cd               L7033:
7100                     ; 1276 }
7103  10cd 81            	ret
7126                     ; 1280 void t4_init(void){
7127                     	switch	.text
7128  10ce               _t4_init:
7132                     ; 1281 	TIM4->PSCR = 7;
7134  10ce 35075345      	mov	21317,#7
7135                     ; 1282 	TIM4->ARR= 66;
7137  10d2 35425346      	mov	21318,#66
7138                     ; 1283 	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
7140  10d6 72105341      	bset	21313,#0
7141                     ; 1285 	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
7143  10da 35855340      	mov	21312,#133
7144                     ; 1287 }
7147  10de 81            	ret
7170                     ; 1290 void t1_init(void)
7170                     ; 1291 {
7171                     	switch	.text
7172  10df               _t1_init:
7176                     ; 1292 TIM1->ARRH= 0x03;
7178  10df 35035262      	mov	21090,#3
7179                     ; 1293 TIM1->ARRL= 0xff;
7181  10e3 35ff5263      	mov	21091,#255
7182                     ; 1294 TIM1->CCR1H= 0x00;	
7184  10e7 725f5265      	clr	21093
7185                     ; 1295 TIM1->CCR1L= 0xff;
7187  10eb 35ff5266      	mov	21094,#255
7188                     ; 1296 TIM1->CCR2H= 0x00;	
7190  10ef 725f5267      	clr	21095
7191                     ; 1297 TIM1->CCR2L= 0x00;
7193  10f3 725f5268      	clr	21096
7194                     ; 1299 TIM1->CCMR1= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE; //OC2 toggle mode, prelouded
7196  10f7 35685258      	mov	21080,#104
7197                     ; 1300 TIM1->CCMR2= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE; //OC2 toggle mode, prelouded
7199  10fb 35685259      	mov	21081,#104
7200                     ; 1301 TIM1->CCER1= TIM1_CCER1_CC1E | TIM1_CCER1_CC2E ; //OC1, OC2 output pins enabled
7202  10ff 3511525c      	mov	21084,#17
7203                     ; 1303 TIM1->CR1=(TIM1_CR1_CEN | TIM1_CR1_ARPE);
7205  1103 35815250      	mov	21072,#129
7206                     ; 1304 TIM1->BKR|= TIM1_BKR_AOE;
7208  1107 721c526d      	bset	21101,#6
7209                     ; 1305 }
7212  110b 81            	ret
7268                     ; 1313 @far @interrupt void TIM4_UPD_Interrupt (void) 
7268                     ; 1314 {
7270                     	switch	.text
7271  110c               f_TIM4_UPD_Interrupt:
7273  110c 3b0002        	push	c_x+2
7274  110f be00          	ldw	x,c_x
7275  1111 89            	pushw	x
7276  1112 3b0002        	push	c_y+2
7277  1115 be00          	ldw	x,c_y
7278  1117 89            	pushw	x
7281                     ; 1315 TIM4->SR1&=~TIM4_SR1_UIF;
7283  1118 72115342      	bres	21314,#0
7284                     ; 1321 cnt_T4++;
7286  111c 3c8f          	inc	_cnt_T4
7287                     ; 1322 if(cnt_T4>=3)cnt_T4=0;
7289  111e b68f          	ld	a,_cnt_T4
7290  1120 a103          	cp	a,#3
7291  1122 2502          	jrult	L3433
7294  1124 3f8f          	clr	_cnt_T4
7295  1126               L3433:
7296                     ; 1326 if(!cnt_T4)
7298  1126 3d8f          	tnz	_cnt_T4
7299  1128 2655          	jrne	L5433
7300                     ; 1328 	strob_cnt++;
7302  112a 3c8e          	inc	_strob_cnt
7303                     ; 1329 	if(strob_cnt>=4)strob_cnt=0;
7305  112c b68e          	ld	a,_strob_cnt
7306  112e a104          	cp	a,#4
7307  1130 2502          	jrult	L7433
7310  1132 3f8e          	clr	_strob_cnt
7311  1134               L7433:
7312                     ; 1330 	(GPIOB->ODR)=(GPIOB->ODR)|0x0f;
7314  1134 c65005        	ld	a,20485
7315  1137 aa0f          	or	a,#15
7316  1139 c75005        	ld	20485,a
7317                     ; 1332 	GPIOD->ODR=dig1[strob_cnt];
7319  113c b68e          	ld	a,_strob_cnt
7320  113e 5f            	clrw	x
7321  113f 97            	ld	xl,a
7322  1140 e605          	ld	a,(_dig1,x)
7323  1142 c7500f        	ld	20495,a
7324                     ; 1333 	spi(dig2[strob_cnt]);
7326  1145 b68e          	ld	a,_strob_cnt
7327  1147 5f            	clrw	x
7328  1148 97            	ld	xl,a
7329  1149 e60d          	ld	a,(_dig2,x)
7330  114b cd02b2        	call	_spi
7332                     ; 1334 	GPIOC->ODR&=~(1<<2);
7334  114e 7215500a      	bres	20490,#2
7335                     ; 1335 	GPIOC->ODR|=(1<<2);
7337  1152 7214500a      	bset	20490,#2
7338                     ; 1336 	spi(dig3[strob_cnt]);
7340  1156 b68e          	ld	a,_strob_cnt
7341  1158 5f            	clrw	x
7342  1159 97            	ld	xl,a
7343  115a e615          	ld	a,(_dig3,x)
7344  115c cd02b2        	call	_spi
7346                     ; 1337 	GPIOC->ODR&=~(1<<3);
7348  115f 7217500a      	bres	20490,#3
7349                     ; 1338 	GPIOC->ODR|=(1<<3);
7351  1163 7216500a      	bset	20490,#3
7352                     ; 1340 	(GPIOB->ODR)&=~(1<<(3-strob_cnt));
7354  1167 a603          	ld	a,#3
7355  1169 b08e          	sub	a,_strob_cnt
7356  116b 5f            	clrw	x
7357  116c 97            	ld	xl,a
7358  116d a601          	ld	a,#1
7359  116f 5d            	tnzw	x
7360  1170 2704          	jreq	L402
7361  1172               L602:
7362  1172 48            	sll	a
7363  1173 5a            	decw	x
7364  1174 26fc          	jrne	L602
7365  1176               L402:
7366  1176 43            	cpl	a
7367  1177 c45005        	and	a,20485
7368  117a c75005        	ld	20485,a
7370  117d 2031          	jra	L1533
7371  117f               L5433:
7372                     ; 1342 else if(cnt_T4==2)
7374  117f b68f          	ld	a,_cnt_T4
7375  1181 a102          	cp	a,#2
7376  1183 262b          	jrne	L1533
7377                     ; 1344 	GPIOD->ODR=dig1_[strob_cnt];
7379  1185 b68e          	ld	a,_strob_cnt
7380  1187 5f            	clrw	x
7381  1188 97            	ld	xl,a
7382  1189 e61d          	ld	a,(_dig1_,x)
7383  118b c7500f        	ld	20495,a
7384                     ; 1345 	spi(dig2_[strob_cnt]);
7386  118e b68e          	ld	a,_strob_cnt
7387  1190 5f            	clrw	x
7388  1191 97            	ld	xl,a
7389  1192 e625          	ld	a,(_dig2_,x)
7390  1194 cd02b2        	call	_spi
7392                     ; 1346 	GPIOC->ODR&=~(1<<2);
7394  1197 7215500a      	bres	20490,#2
7395                     ; 1347 	GPIOC->ODR|=(1<<2);
7397  119b 7214500a      	bset	20490,#2
7398                     ; 1348 	spi(dig3_[strob_cnt]);
7400  119f b68e          	ld	a,_strob_cnt
7401  11a1 5f            	clrw	x
7402  11a2 97            	ld	xl,a
7403  11a3 e62d          	ld	a,(_dig3_,x)
7404  11a5 cd02b2        	call	_spi
7406                     ; 1349 	GPIOC->ODR&=~(1<<3);
7408  11a8 7217500a      	bres	20490,#3
7409                     ; 1350 	GPIOC->ODR|=(1<<3);
7411  11ac 7216500a      	bset	20490,#3
7412  11b0               L1533:
7413                     ; 1354 if(++t0_cnt0>=12)
7415  11b0 3c00          	inc	_t0_cnt0
7416  11b2 b600          	ld	a,_t0_cnt0
7417  11b4 a10c          	cp	a,#12
7418  11b6 2556          	jrult	L5533
7419                     ; 1356 	b100Hz=1;
7421  11b8 72100010      	bset	_b100Hz
7422                     ; 1357 	t0_cnt0=0;
7424  11bc 3f00          	clr	_t0_cnt0
7425                     ; 1358 	if(++t0_cnt1>=10)
7427  11be 3c01          	inc	_t0_cnt1
7428  11c0 b601          	ld	a,_t0_cnt1
7429  11c2 a10a          	cp	a,#10
7430  11c4 2506          	jrult	L7533
7431                     ; 1360 		t0_cnt1=0;
7433  11c6 3f01          	clr	_t0_cnt1
7434                     ; 1361 		b10Hz=1;
7436  11c8 7210000f      	bset	_b10Hz
7437  11cc               L7533:
7438                     ; 1363 	if(++t0_cnt2>=20)
7440  11cc 3c02          	inc	_t0_cnt2
7441  11ce b602          	ld	a,_t0_cnt2
7442  11d0 a114          	cp	a,#20
7443  11d2 2512          	jrult	L1633
7444                     ; 1365 		t0_cnt2=0;
7446  11d4 3f02          	clr	_t0_cnt2
7447                     ; 1366 		b5Hz=1;
7449  11d6 7210000e      	bset	_b5Hz
7450                     ; 1367 		if(bFL5)bFL5=0;
7452  11da 3d7b          	tnz	_bFL5
7453  11dc 2704          	jreq	L3633
7456  11de 3f7b          	clr	_bFL5
7458  11e0 2004          	jra	L1633
7459  11e2               L3633:
7460                     ; 1368 		else bFL5=1;
7462  11e2 3501007b      	mov	_bFL5,#1
7463  11e6               L1633:
7464                     ; 1370 	if(++t0_cnt4>=50)
7466  11e6 3c04          	inc	_t0_cnt4
7467  11e8 b604          	ld	a,_t0_cnt4
7468  11ea a132          	cp	a,#50
7469  11ec 2512          	jrult	L7633
7470                     ; 1372 		t0_cnt4=0;
7472  11ee 3f04          	clr	_t0_cnt4
7473                     ; 1373 		b2Hz=1;
7475  11f0 7210000d      	bset	_b2Hz
7476                     ; 1374 		if(bFL2)bFL2=0;
7478  11f4 3d7a          	tnz	_bFL2
7479  11f6 2704          	jreq	L1733
7482  11f8 3f7a          	clr	_bFL2
7484  11fa 2004          	jra	L7633
7485  11fc               L1733:
7486                     ; 1375 		else bFL2=1;
7488  11fc 3501007a      	mov	_bFL2,#1
7489  1200               L7633:
7490                     ; 1377 	if(++t0_cnt3>=100)
7492  1200 3c03          	inc	_t0_cnt3
7493  1202 b603          	ld	a,_t0_cnt3
7494  1204 a164          	cp	a,#100
7495  1206 2506          	jrult	L5533
7496                     ; 1379 		t0_cnt3=0;
7498  1208 3f03          	clr	_t0_cnt3
7499                     ; 1380 		b1Hz=1;
7501  120a 7210000c      	bset	_b1Hz
7502  120e               L5533:
7503                     ; 1384 if(modbusTimeOutCnt<6)
7505  120e b63b          	ld	a,_modbusTimeOutCnt
7506  1210 a106          	cp	a,#6
7507  1212 240e          	jruge	L7733
7508                     ; 1386 	modbusTimeOutCnt++;
7510  1214 3c3b          	inc	_modbusTimeOutCnt
7511                     ; 1387 	if(modbusTimeOutCnt>=6)
7513  1216 b63b          	ld	a,_modbusTimeOutCnt
7514  1218 a106          	cp	a,#6
7515  121a 2510          	jrult	L3043
7516                     ; 1389 		bMODBUS_TIMEOUT=1;
7518  121c 3501003c      	mov	_bMODBUS_TIMEOUT,#1
7519  1220 200a          	jra	L3043
7520  1222               L7733:
7521                     ; 1393 else if (modbusTimeOutCnt>6)
7523  1222 b63b          	ld	a,_modbusTimeOutCnt
7524  1224 a107          	cp	a,#7
7525  1226 2504          	jrult	L3043
7526                     ; 1395 	modbusTimeOutCnt=0;
7528  1228 3f3b          	clr	_modbusTimeOutCnt
7529                     ; 1396 	bMODBUS_TIMEOUT=0;
7531  122a 3f3c          	clr	_bMODBUS_TIMEOUT
7532  122c               L3043:
7533                     ; 1401 if(GPIOB->IDR&(1<<6))encApin=1;
7535  122c c65006        	ld	a,20486
7536  122f a540          	bcp	a,#64
7537  1231 2706          	jreq	L7043
7540  1233 72100009      	bset	_encApin
7542  1237 2004          	jra	L1143
7543  1239               L7043:
7544                     ; 1402 else encApin=0;
7546  1239 72110009      	bres	_encApin
7547  123d               L1143:
7548                     ; 1404 if(GPIOB->IDR&(1<<4))encBpin=1;
7550  123d c65006        	ld	a,20486
7551  1240 a510          	bcp	a,#16
7552  1242 2706          	jreq	L3143
7555  1244 72100008      	bset	_encBpin
7557  1248 2004          	jra	L5143
7558  124a               L3143:
7559                     ; 1405 else encBpin=0;
7561  124a 72110008      	bres	_encBpin
7562  124e               L5143:
7563                     ; 1407 if(encApin_old==encApin)
7565  124e 7201000707    	btjf	_encApin_old,L012
7566  1253 720100093b    	btjf	_encApin,L7143
7567  1258 2005          	jra	L212
7568  125a               L012:
7569  125a 7200000934    	btjt	_encApin,L7143
7570  125f               L212:
7571                     ; 1409 	if(encAcnt<3)
7573  125f b61d          	ld	a,_encAcnt
7574  1261 a103          	cp	a,#3
7575  1263 2430          	jruge	L1343
7576                     ; 1411 		encAcnt++;
7578  1265 3c1d          	inc	_encAcnt
7579                     ; 1412 		if(encAcnt>=3)
7581  1267 b61d          	ld	a,_encAcnt
7582  1269 a103          	cp	a,#3
7583  126b 2528          	jrult	L1343
7584                     ; 1414 			encA=encApin;
7586                     	btst		_encApin
7587  1272 90110005      	bccm	_encA
7588                     ; 1415 			if(encA==encB)encCW=1;
7590  1276 7201000507    	btjf	_encA,L412
7591  127b 720100040d    	btjf	_encB,L5243
7592  1280 2005          	jra	L612
7593  1282               L412:
7594  1282 7200000406    	btjt	_encB,L5243
7595  1287               L612:
7598  1287 72100003      	bset	_encCW
7600  128b 2008          	jra	L1343
7601  128d               L5243:
7602                     ; 1416 			else encOW=1;
7604  128d 72100002      	bset	_encOW
7605  1291 2002          	jra	L1343
7606  1293               L7143:
7607                     ; 1420 else encAcnt=0;
7609  1293 3f1d          	clr	_encAcnt
7610  1295               L1343:
7611                     ; 1422 if(encBpin_old==encBpin)
7613  1295 7201000607    	btjf	_encBpin_old,L022
7614  129a 7201000820    	btjf	_encBpin,L3343
7615  129f 2005          	jra	L222
7616  12a1               L022:
7617  12a1 7200000819    	btjt	_encBpin,L3343
7618  12a6               L222:
7619                     ; 1424 	if(encBcnt<3)
7621  12a6 b61c          	ld	a,_encBcnt
7622  12a8 a103          	cp	a,#3
7623  12aa 2415          	jruge	L1443
7624                     ; 1426 		encBcnt++;
7626  12ac 3c1c          	inc	_encBcnt
7627                     ; 1427 		if(encBcnt>=3)
7629  12ae b61c          	ld	a,_encBcnt
7630  12b0 a103          	cp	a,#3
7631  12b2 250d          	jrult	L1443
7632                     ; 1429 			encB=encBpin;
7634                     	btst		_encBpin
7635  12b9 90110004      	bccm	_encB
7636  12bd 2002          	jra	L1443
7637  12bf               L3343:
7638                     ; 1433 else encBcnt=0;
7640  12bf 3f1c          	clr	_encBcnt
7641  12c1               L1443:
7642                     ; 1438 encApin_old=encApin;
7644                     	btst		_encApin
7645  12c6 90110007      	bccm	_encApin_old
7646                     ; 1439 encBpin_old=encBpin;
7648                     	btst		_encBpin
7649  12cf 90110006      	bccm	_encBpin_old
7650                     ; 1441 }
7653  12d3 85            	popw	x
7654  12d4 bf00          	ldw	c_y,x
7655  12d6 320002        	pop	c_y+2
7656  12d9 85            	popw	x
7657  12da bf00          	ldw	c_x,x
7658  12dc 320002        	pop	c_x+2
7659  12df 80            	iret
7684                     ; 1444 @far @interrupt void CAN_RX_Interrupt (void) 
7684                     ; 1445 {
7685                     	switch	.text
7686  12e0               f_CAN_RX_Interrupt:
7690                     ; 1447 CAN->PSR= 7;	
7692  12e0 35075427      	mov	21543,#7
7693                     ; 1452 memcpy(&mess[0], &CAN->Page.RxFIFO.MFMI, 14); // compare the message content
7695  12e4 ae000e        	ldw	x,#14
7696  12e7               L622:
7697  12e7 d65427        	ld	a,(21543,x)
7698  12ea e723          	ld	(_mess-1,x),a
7699  12ec 5a            	decw	x
7700  12ed 26f8          	jrne	L622
7701                     ; 1463 bCAN_RX=1;
7703  12ef 35010036      	mov	_bCAN_RX,#1
7704                     ; 1464 CAN->RFR|=(1<<5);
7706  12f3 721a5424      	bset	21540,#5
7707                     ; 1466 }
7710  12f7 80            	iret
7733                     ; 1469 @far @interrupt void CAN_TX_Interrupt (void) 
7733                     ; 1470 {
7734                     	switch	.text
7735  12f8               f_CAN_TX_Interrupt:
7739                     ; 1471 if((CAN->TSR)&(1<<0))
7741  12f8 c65422        	ld	a,21538
7742  12fb a501          	bcp	a,#1
7743  12fd 2708          	jreq	L3643
7744                     ; 1473 	bTX_FREE=1;	
7746  12ff 35010035      	mov	_bTX_FREE,#1
7747                     ; 1475 	CAN->TSR|=(1<<0);
7749  1303 72105422      	bset	21538,#0
7750  1307               L3643:
7751                     ; 1477 }
7754  1307 80            	iret
7787                     ; 1480 @far @interrupt void ADC2_EOC_Interrupt (void) {
7788                     	switch	.text
7789  1308               f_ADC2_EOC_Interrupt:
7791       00000004      OFST:	set	4
7792  1308 5204          	subw	sp,#4
7795                     ; 1484 GPIOE->ODR|=(1<<6);
7797  130a 721c5014      	bset	20500,#6
7798                     ; 1486 ADC2->CSR&=~(1<<7);
7800  130e 721f5400      	bres	21504,#7
7801                     ; 1488 temp_adc=(((short)(ADC2->DRH))<<8)+((short)(ADC2->DRL));
7803  1312 c65405        	ld	a,21509
7804  1315 5f            	clrw	x
7805  1316 97            	ld	xl,a
7806  1317 1f01          	ldw	(OFST-3,sp),x
7807  1319 c65404        	ld	a,21508
7808  131c 5f            	clrw	x
7809  131d 97            	ld	xl,a
7810  131e 4f            	clr	a
7811  131f 02            	rlwa	x,a
7812  1320 72fb01        	addw	x,(OFST-3,sp)
7813                     ; 1496 GPIOE->ODR&=~(1<<6);
7815  1323 721d5014      	bres	20500,#6
7816                     ; 1498 }
7819  1327 5b04          	addw	sp,#4
7820  1329 80            	iret
7859                     ; 1501 @far @interrupt void UART1TxInterrupt (void) 
7859                     ; 1502 {
7860                     	switch	.text
7861  132a               f_UART1TxInterrupt:
7863       00000001      OFST:	set	1
7864  132a 88            	push	a
7867                     ; 1505 tx_status=UART1->SR;
7869  132b c65230        	ld	a,21040
7870  132e 6b01          	ld	(OFST+0,sp),a
7871                     ; 1507 if (tx_status & (UART1_SR_TXE))
7873  1330 7b01          	ld	a,(OFST+0,sp)
7874  1332 a580          	bcp	a,#128
7875  1334 272b          	jreq	L1253
7876                     ; 1509 	if (tx_counter1)
7878  1336 3d0b          	tnz	_tx_counter1
7879  1338 271b          	jreq	L3253
7880                     ; 1511 		--tx_counter1;
7882  133a 3a0b          	dec	_tx_counter1
7883                     ; 1512 		UART1->DR=tx_buffer1[tx_rd_index1];
7885  133c 5f            	clrw	x
7886  133d b609          	ld	a,_tx_rd_index1
7887  133f 2a01          	jrpl	L632
7888  1341 53            	cplw	x
7889  1342               L632:
7890  1342 97            	ld	xl,a
7891  1343 d60000        	ld	a,(_tx_buffer1,x)
7892  1346 c75231        	ld	21041,a
7893                     ; 1513 		if (++tx_rd_index1 == TX_BUFFER_SIZE1) tx_rd_index1=0;
7895  1349 3c09          	inc	_tx_rd_index1
7896  134b b609          	ld	a,_tx_rd_index1
7897  134d a132          	cp	a,#50
7898  134f 2610          	jrne	L1253
7901  1351 3f09          	clr	_tx_rd_index1
7902  1353 200c          	jra	L1253
7903  1355               L3253:
7904                     ; 1517 		tx_stat_cnt=3;
7906  1355 35030000      	mov	_tx_stat_cnt,#3
7907                     ; 1518 			bOUT_FREE=1;
7909  1359 35010002      	mov	_bOUT_FREE,#1
7910                     ; 1519 			UART1->CR2&= ~UART1_CR2_TIEN;
7912  135d 721f5235      	bres	21045,#7
7913  1361               L1253:
7914                     ; 1523 if (tx_status & (UART1_SR_TC))
7916  1361 7b01          	ld	a,(OFST+0,sp)
7917  1363 a540          	bcp	a,#64
7918  1365 270a          	jreq	L1353
7919                     ; 1525 	GPIOA->ODR&=~(1<<6);
7921  1367 721d5000      	bres	20480,#6
7922                     ; 1526 	tx_stat=txsOFF;
7924  136b 3f39          	clr	_tx_stat
7925                     ; 1527 	UART1->SR&=~UART1_SR_TC;
7927  136d 721d5230      	bres	21040,#6
7928  1371               L1353:
7929                     ; 1529 }
7932  1371 84            	pop	a
7933  1372 80            	iret
7988                     ; 1532 @far @interrupt void UART1RxInterrupt (void) 
7988                     ; 1533 {
7989                     	switch	.text
7990  1373               f_UART1RxInterrupt:
7992       00000003      OFST:	set	3
7993  1373 5203          	subw	sp,#3
7996                     ; 1536 rx_status=UART1->SR;
7998  1375 c65230        	ld	a,21040
7999  1378 6b02          	ld	(OFST-1,sp),a
8000                     ; 1537 rx_data=UART1->DR;
8002  137a c65231        	ld	a,21041
8003  137d 6b03          	ld	(OFST+0,sp),a
8004                     ; 1547 if ((rx_status & (UART1_SR_RXNE))&&(tx_stat!=tsON))
8006  137f 7b02          	ld	a,(OFST-1,sp)
8007  1381 a520          	bcp	a,#32
8008  1383 2716          	jreq	L1653
8010  1385 b639          	ld	a,_tx_stat
8011  1387 a101          	cp	a,#1
8012  1389 2710          	jreq	L1653
8013                     ; 1550 	temp=rx_data;
8015                     ; 1551 	rx_buffer[rx_wr_index1]=rx_data;
8017  138b 7b03          	ld	a,(OFST+0,sp)
8018  138d be05          	ldw	x,_rx_wr_index1
8019  138f d70032        	ld	(_rx_buffer,x),a
8020                     ; 1553 	rx_wr_index1++;
8022  1392 be05          	ldw	x,_rx_wr_index1
8023  1394 1c0001        	addw	x,#1
8024  1397 bf05          	ldw	_rx_wr_index1,x
8025                     ; 1555 	modbusTimeOutCnt=0;
8027  1399 3f3b          	clr	_modbusTimeOutCnt
8028  139b               L1653:
8029                     ; 1559 }
8032  139b 5b03          	addw	sp,#3
8033  139d 80            	iret
8078                     ; 1567 main()
8078                     ; 1568 {
8080                     	switch	.text
8081  139e               _main:
8083  139e 88            	push	a
8084       00000001      OFST:	set	1
8087                     ; 1570 CLK->ECKR|=1;
8089  139f 721050c1      	bset	20673,#0
8091  13a3               L5753:
8092                     ; 1571 while((CLK->ECKR & 2) == 0);
8094  13a3 c650c1        	ld	a,20673
8095  13a6 a502          	bcp	a,#2
8096  13a8 27f9          	jreq	L5753
8097                     ; 1572 CLK->SWCR|=2;
8099  13aa 721250c5      	bset	20677,#1
8100                     ; 1573 CLK->SWR=0xB4;
8102  13ae 35b450c4      	mov	20676,#180
8103                     ; 1575 delay_ms(200);
8105  13b2 ae00c8        	ldw	x,#200
8106  13b5 cd0000        	call	_delay_ms
8108                     ; 1576 FLASH_DUKR=0xae;
8110  13b8 35ae5064      	mov	_FLASH_DUKR,#174
8111                     ; 1577 FLASH_DUKR=0x56;
8113  13bc 35565064      	mov	_FLASH_DUKR,#86
8114                     ; 1578 enableInterrupts();
8117  13c0 9a            rim
8119                     ; 1580 GPIOB->DDR|=0x0f;
8122  13c1 c65007        	ld	a,20487
8123  13c4 aa0f          	or	a,#15
8124  13c6 c75007        	ld	20487,a
8125                     ; 1581 GPIOB->CR1&=~(0x0f);
8127  13c9 c65008        	ld	a,20488
8128  13cc a4f0          	and	a,#240
8129  13ce c75008        	ld	20488,a
8130                     ; 1582 GPIOB->CR2&=~(0x0f);
8132  13d1 c65009        	ld	a,20489
8133  13d4 a4f0          	and	a,#240
8134  13d6 c75009        	ld	20489,a
8135                     ; 1584 GPIOD->DDR|=0xff;
8137  13d9 c65011        	ld	a,20497
8138  13dc aaff          	or	a,#255
8139  13de c75011        	ld	20497,a
8140                     ; 1585 GPIOD->CR1&=~(0xff);
8142  13e1 c65012        	ld	a,20498
8143  13e4 a400          	and	a,#0
8144  13e6 c75012        	ld	20498,a
8145                     ; 1586 GPIOD->CR2&=~(0xff);
8147  13e9 c65013        	ld	a,20499
8148  13ec a400          	and	a,#0
8149  13ee c75013        	ld	20499,a
8150                     ; 1588 GPIOB->DDR&=~(1<<5);
8152  13f1 721b5007      	bres	20487,#5
8153                     ; 1589 GPIOB->CR1|=(1<<5);
8155  13f5 721a5008      	bset	20488,#5
8156                     ; 1591 GPIOB->DDR&=~(1<<4);
8158  13f9 72195007      	bres	20487,#4
8159                     ; 1592 GPIOB->CR1|=(1<<4);
8161  13fd 72185008      	bset	20488,#4
8162                     ; 1595 GPIOB->DDR&=~(1<<6);
8164  1401 721d5007      	bres	20487,#6
8165                     ; 1596 GPIOB->CR1|=(1<<6);/*
8167  1405 721c5008      	bset	20488,#6
8168                     ; 1599 GPIOB->DDR&=~(1<<7);
8170  1409 721f5007      	bres	20487,#7
8171                     ; 1600 GPIOB->CR1|=(1<<7);
8173  140d 721e5008      	bset	20488,#7
8174                     ; 1602 GPIOE->DDR&=~(1<<0);
8176  1411 72115016      	bres	20502,#0
8177                     ; 1603 GPIOE->CR1|=(1<<0);
8179  1415 72105017      	bset	20503,#0
8180                     ; 1605 GPIOE->DDR&=~(1<<1);
8182  1419 72135016      	bres	20502,#1
8183                     ; 1606 GPIOE->CR1|=(1<<1);
8185  141d 72125017      	bset	20503,#1
8186                     ; 1617 t4_init();
8188  1421 cd10ce        	call	_t4_init
8190                     ; 1618 spi_init();
8192  1424 cd0255        	call	_spi_init
8194                     ; 1660 uart1_init();
8196  1427 cd097c        	call	_uart1_init
8198  142a               L1063:
8199                     ; 1677 	if(bMODBUS_TIMEOUT)
8201  142a 3d3c          	tnz	_bMODBUS_TIMEOUT
8202  142c 2705          	jreq	L5063
8203                     ; 1679 		bMODBUS_TIMEOUT=0;
8205  142e 3f3c          	clr	_bMODBUS_TIMEOUT
8206                     ; 1681 		modbus_in();
8208  1430 cd009f        	call	_modbus_in
8210  1433               L5063:
8211                     ; 1689 	if(b100Hz)
8213                     	btst	_b100Hz
8214  1438 2413          	jruge	L7063
8215                     ; 1691 		b100Hz=0;
8217  143a 72110010      	bres	_b100Hz
8218                     ; 1697 		can_tx_hndl();
8220  143e cd1064        	call	_can_tx_hndl
8222                     ; 1699 		enc_but_drv();
8224  1441 cd0602        	call	_enc_but_drv
8226                     ; 1700 		enc_an();
8228  1444 cd0622        	call	_enc_an
8230                     ; 1702 		tmblr_drv();
8232  1447 cd057c        	call	_tmblr_drv
8234                     ; 1703 		but_drv();	
8236  144a cd05c0        	call	_but_drv
8238  144d               L7063:
8239                     ; 1706 	if(b10Hz)
8241                     	btst	_b10Hz
8242  1452 2407          	jruge	L1163
8243                     ; 1708 		b10Hz=0;
8245  1454 7211000f      	bres	_b10Hz
8246                     ; 1710 		ind_hndl();
8248  1458 cd0b23        	call	_ind_hndl
8250  145b               L1163:
8251                     ; 1717 	if(b5Hz)
8253                     	btst	_b5Hz
8254  1460 243f          	jruge	L3163
8255                     ; 1719 		b5Hz=0;
8257  1462 7211000e      	bres	_b5Hz
8258                     ; 1721 		GPIOE->DDR|=(1<<1);
8260  1466 72125016      	bset	20502,#1
8261                     ; 1722 		GPIOE->CR1|=(1<<1);
8263  146a 72125017      	bset	20503,#1
8264                     ; 1723 		GPIOE->CR2|=(1<<1);		
8266  146e 72125018      	bset	20504,#1
8267                     ; 1725 		GPIOE->ODR^=(1<<1);
8269  1472 c65014        	ld	a,20500
8270  1475 a802          	xor	a,	#2
8271  1477 c75014        	ld	20500,a
8272                     ; 1727 		modbus_write_request(200,6,1,(tmblr_state&0x0f)+((cmnd<<4)&0xf0));
8274  147a b611          	ld	a,_cmnd
8275  147c 97            	ld	xl,a
8276  147d a610          	ld	a,#16
8277  147f 42            	mul	x,a
8278  1480 9f            	ld	a,xl
8279  1481 a4f0          	and	a,#240
8280  1483 6b01          	ld	(OFST+0,sp),a
8281  1485 b6ac          	ld	a,_tmblr_state
8282  1487 a40f          	and	a,#15
8283  1489 5f            	clrw	x
8284  148a 1b01          	add	a,(OFST+0,sp)
8285  148c 2401          	jrnc	L442
8286  148e 5c            	incw	x
8287  148f               L442:
8288  148f 02            	rlwa	x,a
8289  1490 89            	pushw	x
8290  1491 01            	rrwa	x,a
8291  1492 ae0001        	ldw	x,#1
8292  1495 89            	pushw	x
8293  1496 ae0006        	ldw	x,#6
8294  1499 a6c8          	ld	a,#200
8295  149b 95            	ld	xh,a
8296  149c cd0208        	call	_modbus_write_request
8298  149f 5b04          	addw	sp,#4
8299  14a1               L3163:
8300                     ; 1733 	if(b2Hz)
8302                     	btst	_b2Hz
8303  14a6 2404          	jruge	L5163
8304                     ; 1735 		b2Hz=0;
8306  14a8 7211000d      	bres	_b2Hz
8307  14ac               L5163:
8308                     ; 1745 	if(b1Hz)
8310                     	btst	_b1Hz
8311  14b1 2503cc142a    	jruge	L1063
8312                     ; 1747 		b1Hz=0;
8314  14b6 7211000c      	bres	_b1Hz
8315                     ; 1749 		bB=!bB;
8317  14ba 9010000a      	bcpl	_bB
8318  14be cc142a        	jra	L1063
9367                     	xdef	_main
9368                     	xdef	f_UART1RxInterrupt
9369                     	xdef	f_UART1TxInterrupt
9370                     	xdef	f_ADC2_EOC_Interrupt
9371                     	xdef	f_CAN_TX_Interrupt
9372                     	xdef	f_CAN_RX_Interrupt
9373                     	xdef	f_TIM4_UPD_Interrupt
9374                     	xdef	_t1_init
9375                     	xdef	_t4_init
9376                     	xdef	_can_tx_hndl
9377                     	xdef	_ind_hndl
9378                     	xdef	_init_CAN
9379                     	xdef	_can_in_an
9380                     	xdef	_uart1_init
9381                     	xdef	_enc_an
9382                     	xdef	_enc_but_drv
9383                     	xdef	_but_drv
9384                     	xdef	_tmblr_drv
9385                     	xdef	_int2ind_slkuf3
9386                     	xdef	_int2ind_slkuf2
9387                     	xdef	_int2ind_slkuf1
9388                     	xdef	_spi
9389                     	xdef	_spi_init
9390                     	xdef	_modbus_write_request
9391                     	xdef	_modbus_transmit_request
9392                     	xdef	_putchar1
9393                     	xdef	_modbus_in
9394                     	xdef	_CRC16_2
9395                     	xdef	_delay_ms
9396                     	xdef	_bin2bcd_int
9397                     	xdef	_bcd2ind
9398                     	xdef	_bcd2ind_zero
9399                     	switch	.ubsct
9400  0000               _modbus_plazma:
9401  0000 0000          	ds.b	2
9402                     	xdef	_modbus_plazma
9403                     	xdef	_bMODBUS_TIMEOUT
9404                     	xdef	_modbusTimeOutCnt
9405  0002               _bOUT_FREE:
9406  0002 00            	ds.b	1
9407                     	xdef	_bOUT_FREE
9408                     	xdef	_tx_wd_cnt
9409                     	switch	.bss
9410  0000               _tx_stat_cnt:
9411  0000 00            	ds.b	1
9412                     	xdef	_tx_stat_cnt
9413                     	switch	.ubsct
9414  0003               _rx_rd_index1:
9415  0003 0000          	ds.b	2
9416                     	xdef	_rx_rd_index1
9417  0005               _rx_wr_index1:
9418  0005 0000          	ds.b	2
9419                     	xdef	_rx_wr_index1
9420  0007               _rx_counter1:
9421  0007 0000          	ds.b	2
9422                     	xdef	_rx_counter1
9423                     	xdef	_rx_buffer
9424  0009               _tx_rd_index1:
9425  0009 00            	ds.b	1
9426                     	xdef	_tx_rd_index1
9427  000a               _tx_wr_index1:
9428  000a 00            	ds.b	1
9429                     	xdef	_tx_wr_index1
9430  000b               _tx_counter1:
9431  000b 00            	ds.b	1
9432                     	xdef	_tx_counter1
9433                     	xdef	_tx_buffer1
9434  000c               _bAV:
9435  000c 00            	ds.b	1
9436                     	xdef	_bAV
9437  000d               _bREW:
9438  000d 00            	ds.b	1
9439                     	xdef	_bREW
9440  000e               _wrk_state:
9441  000e 00            	ds.b	1
9442                     	xdef	_wrk_state
9443  000f               _enc_but_drv_cnt:
9444  000f 0000          	ds.b	2
9445                     	xdef	_enc_but_drv_cnt
9446  0011               _cmnd:
9447  0011 00            	ds.b	1
9448                     	xdef	_cmnd
9449                     	xdef	_ch_en
9450  0012               _but_cnt:
9451  0012 0000          	ds.b	2
9452                     	xdef	_but_cnt
9453  0014               _tmblr_cnt:
9454  0014 0000          	ds.b	2
9455                     	xdef	_tmblr_cnt
9456                     .bit:	section	.data,bit
9457  0000               _encOW_:
9458  0000 00            	ds.b	1
9459                     	xdef	_encOW_
9460                     	switch	.ubsct
9461  0016               _encOW_cnt2:
9462  0016 00            	ds.b	1
9463                     	xdef	_encOW_cnt2
9464  0017               _encOW_cnt1:
9465  0017 00            	ds.b	1
9466                     	xdef	_encOW_cnt1
9467                     	switch	.bit
9468  0001               _encCW_:
9469  0001 00            	ds.b	1
9470                     	xdef	_encCW_
9471                     	switch	.ubsct
9472  0018               _encCW_cnt2:
9473  0018 00            	ds.b	1
9474                     	xdef	_encCW_cnt2
9475  0019               _encCW_cnt1:
9476  0019 00            	ds.b	1
9477                     	xdef	_encCW_cnt1
9478  001a               _enc_plazma:
9479  001a 0000          	ds.b	2
9480                     	xdef	_enc_plazma
9481                     	switch	.bit
9482  0002               _encOW:
9483  0002 00            	ds.b	1
9484                     	xdef	_encOW
9485  0003               _encCW:
9486  0003 00            	ds.b	1
9487                     	xdef	_encCW
9488  0004               _encB:
9489  0004 00            	ds.b	1
9490                     	xdef	_encB
9491  0005               _encA:
9492  0005 00            	ds.b	1
9493                     	xdef	_encA
9494                     	switch	.ubsct
9495  001c               _encBcnt:
9496  001c 00            	ds.b	1
9497                     	xdef	_encBcnt
9498  001d               _encAcnt:
9499  001d 00            	ds.b	1
9500                     	xdef	_encAcnt
9501                     	switch	.bit
9502  0006               _encBpin_old:
9503  0006 00            	ds.b	1
9504                     	xdef	_encBpin_old
9505  0007               _encApin_old:
9506  0007 00            	ds.b	1
9507                     	xdef	_encApin_old
9508  0008               _encBpin:
9509  0008 00            	ds.b	1
9510                     	xdef	_encBpin
9511  0009               _encApin:
9512  0009 00            	ds.b	1
9513                     	xdef	_encApin
9514                     	switch	.ubsct
9515  001e               _rdata:
9516  001e 000000000000  	ds.b	6
9517                     	xdef	_rdata
9518  0024               _mess:
9519  0024 000000000000  	ds.b	14
9520                     	xdef	_mess
9521  0032               _can_plazma:
9522  0032 0000          	ds.b	2
9523                     	xdef	_can_plazma
9524  0034               _can_error_cnt:
9525  0034 00            	ds.b	1
9526                     	xdef	_can_error_cnt
9527                     	xdef	_bCAN_RX
9528  0035               _tx_busy_cnt:
9529  0035 00            	ds.b	1
9530                     	xdef	_tx_busy_cnt
9531                     	xdef	_bTX_FREE
9532  0036               _can_buff_rd_ptr:
9533  0036 00            	ds.b	1
9534                     	xdef	_can_buff_rd_ptr
9535  0037               _can_buff_wr_ptr:
9536  0037 00            	ds.b	1
9537                     	xdef	_can_buff_wr_ptr
9538  0038               _can_out_buff:
9539  0038 000000000000  	ds.b	64
9540                     	xdef	_can_out_buff
9541  0078               _bFL_:
9542  0078 00            	ds.b	1
9543                     	xdef	_bFL_
9544  0079               _bFL:
9545  0079 00            	ds.b	1
9546                     	xdef	_bFL
9547  007a               _bFL2:
9548  007a 00            	ds.b	1
9549                     	xdef	_bFL2
9550  007b               _bFL5:
9551  007b 00            	ds.b	1
9552                     	xdef	_bFL5
9553  007c               _ind_out:
9554  007c 0000000000    	ds.b	5
9555                     	xdef	_ind_out
9556  0081               _ind_out_:
9557  0081 0000000000    	ds.b	5
9558                     	xdef	_ind_out_
9559  0086               _zero_on:
9560  0086 00            	ds.b	1
9561                     	xdef	_zero_on
9562  0087               _dig:
9563  0087 0000000000    	ds.b	5
9564                     	xdef	_dig
9565  008c               _ind_fad_cnt:
9566  008c 00            	ds.b	1
9567                     	xdef	_ind_fad_cnt
9568  008d               _ind_cnt:
9569  008d 00            	ds.b	1
9570                     	xdef	_ind_cnt
9571                     	xdef	_dig3_
9572                     	xdef	_dig2_
9573                     	xdef	_dig1_
9574                     	xdef	_dig3
9575                     	xdef	_dig2
9576                     	xdef	_dig1
9577                     	xdef	_DIGISYM
9578  008e               _strob_cnt:
9579  008e 00            	ds.b	1
9580                     	xdef	_strob_cnt
9581  008f               _cnt_T4:
9582  008f 00            	ds.b	1
9583                     	xdef	_cnt_T4
9584                     	switch	.bit
9585  000a               _bB:
9586  000a 00            	ds.b	1
9587                     	xdef	_bB
9588  000b               _bT4:
9589  000b 00            	ds.b	1
9590                     	xdef	_bT4
9591  000c               _b1Hz:
9592  000c 00            	ds.b	1
9593                     	xdef	_b1Hz
9594  000d               _b2Hz:
9595  000d 00            	ds.b	1
9596                     	xdef	_b2Hz
9597  000e               _b5Hz:
9598  000e 00            	ds.b	1
9599                     	xdef	_b5Hz
9600  000f               _b10Hz:
9601  000f 00            	ds.b	1
9602                     	xdef	_b10Hz
9603  0010               _b100Hz:
9604  0010 00            	ds.b	1
9605                     	xdef	_b100Hz
9606                     	xdef	_t0_cnt4
9607                     	xdef	_t0_cnt3
9608                     	xdef	_t0_cnt2
9609                     	xdef	_t0_cnt1
9610                     	xdef	_t0_cnt0
9611                     	xdef	_can_transmit
9612                     	xdef	_work_stat
9613                     	switch	.ubsct
9614  0090               _ind_I_set:
9615  0090 0000          	ds.b	2
9616                     	xdef	_ind_I_set
9617  0092               _ind_U_set:
9618  0092 0000          	ds.b	2
9619                     	xdef	_ind_U_set
9620  0094               _ind_I:
9621  0094 0000          	ds.b	2
9622                     	xdef	_ind_I
9623  0096               _ind_U:
9624  0096 0000          	ds.b	2
9625                     	xdef	_ind_U
9626  0098               _time_set:
9627  0098 0000          	ds.b	2
9628                     	xdef	_time_set
9629  009a               _time:
9630  009a 0000          	ds.b	2
9631                     	xdef	_time
9632  009c               _wrk_mode:
9633  009c 00            	ds.b	1
9634                     	xdef	_wrk_mode
9635  009d               _ust_I_loc:
9636  009d 0000          	ds.b	2
9637                     	xdef	_ust_I_loc
9638  009f               _ust_Iloc:
9639  009f 0000          	ds.b	2
9640                     	xdef	_ust_Iloc
9641  00a1               _ust_I_:
9642  00a1 0000          	ds.b	2
9643                     	xdef	_ust_I_
9644  00a3               _ust_I:
9645  00a3 0000          	ds.b	2
9646                     	xdef	_ust_I
9647  00a5               _out_I_:
9648  00a5 0000          	ds.b	2
9649                     	xdef	_out_I_
9650  00a7               _out_I:
9651  00a7 0000          	ds.b	2
9652                     	xdef	_out_I
9653  00a9               _out_U:
9654  00a9 0000          	ds.b	2
9655                     	xdef	_out_U
9656  00ab               _but_state:
9657  00ab 00            	ds.b	1
9658                     	xdef	_but_state
9659  00ac               _tmblr_state:
9660  00ac 00            	ds.b	1
9661                     	xdef	_tmblr_state
9662                     	xdef	_tx_stat
9663                     	xref.b	c_x
9664                     	xref.b	c_y
9684                     	xref	c_imul
9685                     	xref	c_sdivx
9686                     	xref	c_lcmp
9687                     	xref	c_ltor
9688                     	xref	c_lgadc
9689                     	xref	c_rtol
9690                     	xref	c_vmul
9691                     	end
