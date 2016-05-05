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
2245  0039               _tx_buffer1:
2246  0039 00            	dc.b	0
2247  003a 000000000000  	ds.b	63
2248                     	switch	.data
2249  0000               _rx_buffer:
2250  0000 00            	dc.b	0
2251  0001 000000000000  	ds.b	49
2252                     	bsct
2253  0079               _tx_stat:
2254  0079 00            	dc.b	0
2255  007a               _tx_wd_cnt:
2256  007a 64            	dc.b	100
2257  007b               _modbusTimeOutCnt:
2258  007b 00            	dc.b	0
2259  007c               _bMODBUS_TIMEOUT:
2260  007c 00            	dc.b	0
2327                     ; 129 long delay_ms(short in)
2327                     ; 130 {
2329                     	switch	.text
2330  0000               _delay_ms:
2332  0000 520c          	subw	sp,#12
2333       0000000c      OFST:	set	12
2336                     ; 133 i=((long)in)*100UL;
2338  0002 90ae0064      	ldw	y,#100
2339  0006 cd0000        	call	c_vmul
2341  0009 96            	ldw	x,sp
2342  000a 1c0005        	addw	x,#OFST-7
2343  000d cd0000        	call	c_rtol
2345                     ; 135 for(ii=0;ii<i;ii++)
2347  0010 ae0000        	ldw	x,#0
2348  0013 1f0b          	ldw	(OFST-1,sp),x
2349  0015 ae0000        	ldw	x,#0
2350  0018 1f09          	ldw	(OFST-3,sp),x
2352  001a 2012          	jra	L7641
2353  001c               L3641:
2354                     ; 137 		iii++;
2356  001c 96            	ldw	x,sp
2357  001d 1c0001        	addw	x,#OFST-11
2358  0020 a601          	ld	a,#1
2359  0022 cd0000        	call	c_lgadc
2361                     ; 135 for(ii=0;ii<i;ii++)
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
2381                     ; 140 }
2384  003f 5b0c          	addw	sp,#12
2385  0041 81            	ret
2456                     ; 143 unsigned short CRC16_2(char* buf, short len)
2456                     ; 144 {
2457                     	switch	.text
2458  0042               _CRC16_2:
2460  0042 89            	pushw	x
2461  0043 5206          	subw	sp,#6
2462       00000006      OFST:	set	6
2465                     ; 145 unsigned short crc = 0xFFFF;
2467  0045 aeffff        	ldw	x,#65535
2468  0048 1f05          	ldw	(OFST-1,sp),x
2469                     ; 149 for (pos = 0; pos < len; pos++)
2471  004a 5f            	clrw	x
2472  004b 1f01          	ldw	(OFST-5,sp),x
2474  004d 2044          	jra	L5351
2475  004f               L1351:
2476                     ; 151     	crc ^= (unsigned short)buf[pos];          // XOR byte into least sig. byte of crc
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
2489                     ; 153     	for ( i = 8; i != 0; i--) 
2491  0060 ae0008        	ldw	x,#8
2492  0063 1f03          	ldw	(OFST-3,sp),x
2493  0065               L1451:
2494                     ; 155       	if ((crc & 0x0001) != 0) 
2496  0065 7b06          	ld	a,(OFST+0,sp)
2497  0067 a501          	bcp	a,#1
2498  0069 2712          	jreq	L7451
2499                     ; 157         		crc >>= 1;                    // Shift right and XOR 0xA001
2501  006b 0405          	srl	(OFST-1,sp)
2502  006d 0606          	rrc	(OFST+0,sp)
2503                     ; 158         		crc ^= 0xA001;
2505  006f 7b06          	ld	a,(OFST+0,sp)
2506  0071 a801          	xor	a,#1
2507  0073 6b06          	ld	(OFST+0,sp),a
2508  0075 7b05          	ld	a,(OFST-1,sp)
2509  0077 a8a0          	xor	a,#160
2510  0079 6b05          	ld	(OFST-1,sp),a
2512  007b 2004          	jra	L1551
2513  007d               L7451:
2514                     ; 160       	else  crc >>= 1;                    // Just shift right
2516  007d 0405          	srl	(OFST-1,sp)
2517  007f 0606          	rrc	(OFST+0,sp)
2518  0081               L1551:
2519                     ; 153     	for ( i = 8; i != 0; i--) 
2521  0081 1e03          	ldw	x,(OFST-3,sp)
2522  0083 1d0001        	subw	x,#1
2523  0086 1f03          	ldw	(OFST-3,sp),x
2526  0088 1e03          	ldw	x,(OFST-3,sp)
2527  008a 26d9          	jrne	L1451
2528                     ; 149 for (pos = 0; pos < len; pos++)
2530  008c 1e01          	ldw	x,(OFST-5,sp)
2531  008e 1c0001        	addw	x,#1
2532  0091 1f01          	ldw	(OFST-5,sp),x
2533  0093               L5351:
2536  0093 9c            	rvf
2537  0094 1e01          	ldw	x,(OFST-5,sp)
2538  0096 130b          	cpw	x,(OFST+5,sp)
2539  0098 2fb5          	jrslt	L1351
2540                     ; 164 return crc;
2542  009a 1e05          	ldw	x,(OFST-1,sp)
2545  009c 5b08          	addw	sp,#8
2546  009e 81            	ret
2611                     ; 169 void modbus_in(void)
2611                     ; 170 {
2612                     	switch	.text
2613  009f               _modbus_in:
2615  009f 5226          	subw	sp,#38
2616       00000026      OFST:	set	38
2619                     ; 182 memcpy(modbus_an_buffer,rx_buffer,rx_wr_index1);
2621  00a1 96            	ldw	x,sp
2622  00a2 1c0009        	addw	x,#OFST-29
2623  00a5 bf00          	ldw	c_x,x
2624  00a7 be05          	ldw	x,_rx_wr_index1
2625  00a9 5d            	tnzw	x
2626  00aa 270a          	jreq	L21
2627  00ac               L41:
2628  00ac 5a            	decw	x
2629  00ad d60000        	ld	a,(_rx_buffer,x)
2630  00b0 92d700        	ld	([c_x.w],x),a
2631  00b3 5d            	tnzw	x
2632  00b4 26f6          	jrne	L41
2633  00b6               L21:
2634                     ; 188 crc16_calculated  = CRC16_2(modbus_an_buffer, rx_wr_index1-2);
2636  00b6 be05          	ldw	x,_rx_wr_index1
2637  00b8 5a            	decw	x
2638  00b9 5a            	decw	x
2639  00ba 89            	pushw	x
2640  00bb 96            	ldw	x,sp
2641  00bc 1c000b        	addw	x,#OFST-27
2642  00bf ad81          	call	_CRC16_2
2644  00c1 85            	popw	x
2645                     ; 189 crc16_incapsulated = modbus_an_buffer[rx_wr_index1-2]+(modbus_an_buffer[rx_wr_index1-1])*256;
2647  00c2 96            	ldw	x,sp
2648  00c3 1c0009        	addw	x,#OFST-29
2649  00c6 1f03          	ldw	(OFST-35,sp),x
2650  00c8 be05          	ldw	x,_rx_wr_index1
2651  00ca 5a            	decw	x
2652  00cb 72fb03        	addw	x,(OFST-35,sp)
2653  00ce f6            	ld	a,(x)
2654  00cf 5f            	clrw	x
2655  00d0 97            	ld	xl,a
2656  00d1 4f            	clr	a
2657  00d2 02            	rlwa	x,a
2658  00d3 01            	rrwa	x,a
2659  00d4 9096          	ldw	y,sp
2660  00d6 72a90009      	addw	y,#OFST-29
2661  00da 1701          	ldw	(OFST-37,sp),y
2662  00dc 90be05        	ldw	y,_rx_wr_index1
2663  00df 905a          	decw	y
2664  00e1 905a          	decw	y
2665  00e3 72f901        	addw	y,(OFST-37,sp)
2666  00e6 90fb          	add	a,(y)
2667  00e8 2401          	jrnc	L61
2668  00ea 5c            	incw	x
2669  00eb               L61:
2670                     ; 200 rx_wr_index1=0;
2672  00eb 5f            	clrw	x
2673  00ec bf05          	ldw	_rx_wr_index1,x
2674                     ; 204 	if(modbus_an_buffer[0]==201)	 //anee cai?in io ioeuoa
2676  00ee 7b09          	ld	a,(OFST-29,sp)
2677  00f0 a1c9          	cp	a,#201
2678  00f2 2703          	jreq	L43
2679  00f4 cc017a        	jp	L1061
2680  00f7               L43:
2681                     ; 206 			modbus_plazma++;
2683  00f7 be00          	ldw	x,_modbus_plazma
2684  00f9 1c0001        	addw	x,#1
2685  00fc bf00          	ldw	_modbus_plazma,x
2686                     ; 207 		if((modbus_an_buffer[1]==6)||(modbus_an_buffer[1]==4))		//?oaiea i?iecaieuiiai eie-aa ?aaeno?ia
2688  00fe 7b0a          	ld	a,(OFST-28,sp)
2689  0100 a106          	cp	a,#6
2690  0102 2706          	jreq	L5061
2692  0104 7b0a          	ld	a,(OFST-28,sp)
2693  0106 a104          	cp	a,#4
2694  0108 2670          	jrne	L1061
2695  010a               L5061:
2696                     ; 209 			if(modbus_an_buffer[2]==14)
2698  010a 7b0b          	ld	a,(OFST-27,sp)
2699  010c a10e          	cp	a,#14
2700  010e 266a          	jrne	L1061
2701                     ; 211 				ind_U=(modbus_an_buffer[3]+(modbus_an_buffer[4]*256));
2703  0110 7b0d          	ld	a,(OFST-25,sp)
2704  0112 5f            	clrw	x
2705  0113 97            	ld	xl,a
2706  0114 4f            	clr	a
2707  0115 02            	rlwa	x,a
2708  0116 01            	rrwa	x,a
2709  0117 1b0c          	add	a,(OFST-26,sp)
2710  0119 2401          	jrnc	L02
2711  011b 5c            	incw	x
2712  011c               L02:
2713  011c b75b          	ld	_ind_U+1,a
2714  011e 9f            	ld	a,xl
2715  011f b75a          	ld	_ind_U,a
2716                     ; 212 				ind_I=(modbus_an_buffer[5]+(modbus_an_buffer[6]*256));
2718  0121 7b0f          	ld	a,(OFST-23,sp)
2719  0123 5f            	clrw	x
2720  0124 97            	ld	xl,a
2721  0125 4f            	clr	a
2722  0126 02            	rlwa	x,a
2723  0127 01            	rrwa	x,a
2724  0128 1b0e          	add	a,(OFST-24,sp)
2725  012a 2401          	jrnc	L22
2726  012c 5c            	incw	x
2727  012d               L22:
2728  012d b759          	ld	_ind_I+1,a
2729  012f 9f            	ld	a,xl
2730  0130 b758          	ld	_ind_I,a
2731                     ; 213 				work_stat=(enum_work_stat)modbus_an_buffer[7];
2733  0132 7b10          	ld	a,(OFST-22,sp)
2734  0134 b738          	ld	_work_stat,a
2735                     ; 214 				ind_U_set=(modbus_an_buffer[9]+(modbus_an_buffer[10]*256));
2737  0136 7b13          	ld	a,(OFST-19,sp)
2738  0138 5f            	clrw	x
2739  0139 97            	ld	xl,a
2740  013a 4f            	clr	a
2741  013b 02            	rlwa	x,a
2742  013c 01            	rrwa	x,a
2743  013d 1b12          	add	a,(OFST-20,sp)
2744  013f 2401          	jrnc	L42
2745  0141 5c            	incw	x
2746  0142               L42:
2747  0142 b757          	ld	_ind_U_set+1,a
2748  0144 9f            	ld	a,xl
2749  0145 b756          	ld	_ind_U_set,a
2750                     ; 215 				time= (modbus_an_buffer[11]+(modbus_an_buffer[12]*256));
2752  0147 7b15          	ld	a,(OFST-17,sp)
2753  0149 5f            	clrw	x
2754  014a 97            	ld	xl,a
2755  014b 4f            	clr	a
2756  014c 02            	rlwa	x,a
2757  014d 01            	rrwa	x,a
2758  014e 1b14          	add	a,(OFST-18,sp)
2759  0150 2401          	jrnc	L62
2760  0152 5c            	incw	x
2761  0153               L62:
2762  0153 b75f          	ld	_time+1,a
2763  0155 9f            	ld	a,xl
2764  0156 b75e          	ld	_time,a
2765                     ; 216 				time_set= (modbus_an_buffer[13]+(modbus_an_buffer[14]*256));
2767  0158 7b17          	ld	a,(OFST-15,sp)
2768  015a 5f            	clrw	x
2769  015b 97            	ld	xl,a
2770  015c 4f            	clr	a
2771  015d 02            	rlwa	x,a
2772  015e 01            	rrwa	x,a
2773  015f 1b16          	add	a,(OFST-16,sp)
2774  0161 2401          	jrnc	L03
2775  0163 5c            	incw	x
2776  0164               L03:
2777  0164 b75d          	ld	_time_set+1,a
2778  0166 9f            	ld	a,xl
2779  0167 b75c          	ld	_time_set,a
2780                     ; 217 				ind_I_set=(modbus_an_buffer[15]+(modbus_an_buffer[16]*256));	
2782  0169 7b19          	ld	a,(OFST-13,sp)
2783  016b 5f            	clrw	x
2784  016c 97            	ld	xl,a
2785  016d 4f            	clr	a
2786  016e 02            	rlwa	x,a
2787  016f 01            	rrwa	x,a
2788  0170 1b18          	add	a,(OFST-14,sp)
2789  0172 2401          	jrnc	L23
2790  0174 5c            	incw	x
2791  0175               L23:
2792  0175 b755          	ld	_ind_I_set+1,a
2793  0177 9f            	ld	a,xl
2794  0178 b754          	ld	_ind_I_set,a
2795  017a               L1061:
2796                     ; 222 }
2799  017a 5b26          	addw	sp,#38
2800  017c 81            	ret
2838                     ; 226 void putchar1(char c)
2838                     ; 227 {
2839                     	switch	.text
2840  017d               _putchar1:
2842  017d 88            	push	a
2843       00000000      OFST:	set	0
2846  017e               L1361:
2847                     ; 228 while (tx_counter1 == TX_BUFFER_SIZE1);
2849  017e b60b          	ld	a,_tx_counter1
2850  0180 a140          	cp	a,#64
2851  0182 27fa          	jreq	L1361
2852                     ; 230 if (tx_counter1 || ((UART1->SR & UART1_SR_TXE)==0))
2854  0184 3d0b          	tnz	_tx_counter1
2855  0186 2607          	jrne	L7361
2857  0188 c65230        	ld	a,21040
2858  018b a580          	bcp	a,#128
2859  018d 2621          	jrne	L5361
2860  018f               L7361:
2861                     ; 232    tx_buffer1[tx_wr_index1]=c;
2863  018f 5f            	clrw	x
2864  0190 b60a          	ld	a,_tx_wr_index1
2865  0192 2a01          	jrpl	L04
2866  0194 53            	cplw	x
2867  0195               L04:
2868  0195 97            	ld	xl,a
2869  0196 7b01          	ld	a,(OFST+1,sp)
2870  0198 e739          	ld	(_tx_buffer1,x),a
2871                     ; 233    if (++tx_wr_index1 == TX_BUFFER_SIZE1) tx_wr_index1=0;
2873  019a 3c0a          	inc	_tx_wr_index1
2874  019c b60a          	ld	a,_tx_wr_index1
2875  019e a140          	cp	a,#64
2876  01a0 2602          	jrne	L1461
2879  01a2 3f0a          	clr	_tx_wr_index1
2880  01a4               L1461:
2881                     ; 234    ++tx_counter1;
2883  01a4 3c0b          	inc	_tx_counter1
2885  01a6               L3461:
2886                     ; 244 UART1->CR2|= UART1_CR2_TIEN | UART1_CR2_TCIEN;
2888  01a6 c65235        	ld	a,21045
2889  01a9 aac0          	or	a,#192
2890  01ab c75235        	ld	21045,a
2891                     ; 245 }
2894  01ae 84            	pop	a
2895  01af 81            	ret
2896  01b0               L5361:
2897                     ; 238 	UART1->DR=c;
2899  01b0 7b01          	ld	a,(OFST+1,sp)
2900  01b2 c75231        	ld	21041,a
2901                     ; 239 	GPIOA->ODR|=(1<<6);
2903  01b5 721c5000      	bset	20480,#6
2904                     ; 240 	tx_stat=tsON;
2906  01b9 35010079      	mov	_tx_stat,#1
2907  01bd 20e7          	jra	L3461
2999                     ; 248 void modbus_transmit_request(char addr,char func,short reg_adr,short reg_quant)
2999                     ; 249 {
3000                     	switch	.text
3001  01bf               _modbus_transmit_request:
3003  01bf 89            	pushw	x
3004  01c0 5217          	subw	sp,#23
3005       00000017      OFST:	set	23
3008                     ; 253 modbus_buff[0] = addr;
3010  01c2 9e            	ld	a,xh
3011  01c3 6b04          	ld	(OFST-19,sp),a
3012                     ; 254 modbus_buff[1] = func;
3014  01c5 9f            	ld	a,xl
3015  01c6 6b05          	ld	(OFST-18,sp),a
3016                     ; 255 modbus_buff[2] = (char)(reg_adr>>8);
3018  01c8 7b1c          	ld	a,(OFST+5,sp)
3019  01ca 6b06          	ld	(OFST-17,sp),a
3020                     ; 256 modbus_buff[3] = (char)reg_adr;
3022  01cc 7b1d          	ld	a,(OFST+6,sp)
3023  01ce 6b07          	ld	(OFST-16,sp),a
3024                     ; 257 modbus_buff[4] = (char)(reg_quant>>8);
3026  01d0 7b1e          	ld	a,(OFST+7,sp)
3027  01d2 6b08          	ld	(OFST-15,sp),a
3028                     ; 258 modbus_buff[5] = (char)reg_quant;
3030  01d4 7b1f          	ld	a,(OFST+8,sp)
3031  01d6 6b09          	ld	(OFST-14,sp),a
3032                     ; 260 crc_temp= CRC16_2(modbus_buff,6);
3034  01d8 ae0006        	ldw	x,#6
3035  01db 89            	pushw	x
3036  01dc 96            	ldw	x,sp
3037  01dd 1c0006        	addw	x,#OFST-17
3038  01e0 cd0042        	call	_CRC16_2
3040  01e3 5b02          	addw	sp,#2
3041  01e5 1f01          	ldw	(OFST-22,sp),x
3042                     ; 262 modbus_buff[6]= (char)crc_temp;
3044  01e7 7b02          	ld	a,(OFST-21,sp)
3045  01e9 6b0a          	ld	(OFST-13,sp),a
3046                     ; 263 modbus_buff[7]= (char)(crc_temp>>8);
3048  01eb 7b01          	ld	a,(OFST-22,sp)
3049  01ed 6b0b          	ld	(OFST-12,sp),a
3050                     ; 265 for (i=0;i<8;i++)
3052  01ef 0f03          	clr	(OFST-20,sp)
3053  01f1               L3171:
3054                     ; 267 	putchar1(modbus_buff[i]);
3056  01f1 96            	ldw	x,sp
3057  01f2 1c0004        	addw	x,#OFST-19
3058  01f5 9f            	ld	a,xl
3059  01f6 5e            	swapw	x
3060  01f7 1b03          	add	a,(OFST-20,sp)
3061  01f9 2401          	jrnc	L44
3062  01fb 5c            	incw	x
3063  01fc               L44:
3064  01fc 02            	rlwa	x,a
3065  01fd f6            	ld	a,(x)
3066  01fe cd017d        	call	_putchar1
3068                     ; 265 for (i=0;i<8;i++)
3070  0201 0c03          	inc	(OFST-20,sp)
3073  0203 7b03          	ld	a,(OFST-20,sp)
3074  0205 a108          	cp	a,#8
3075  0207 25e8          	jrult	L3171
3076                     ; 270 }
3079  0209 5b19          	addw	sp,#25
3080  020b 81            	ret
3172                     ; 273 void modbus_write_request(char addr,char func,short reg_adr, short arg)
3172                     ; 274 {
3173                     	switch	.text
3174  020c               _modbus_write_request:
3176  020c 89            	pushw	x
3177  020d 5217          	subw	sp,#23
3178       00000017      OFST:	set	23
3181                     ; 278 modbus_buff[0] = addr;
3183  020f 9e            	ld	a,xh
3184  0210 6b04          	ld	(OFST-19,sp),a
3185                     ; 279 modbus_buff[1] = func;
3187  0212 9f            	ld	a,xl
3188  0213 6b05          	ld	(OFST-18,sp),a
3189                     ; 280 modbus_buff[2] = (char)(reg_adr>>8);
3191  0215 7b1c          	ld	a,(OFST+5,sp)
3192  0217 6b06          	ld	(OFST-17,sp),a
3193                     ; 281 modbus_buff[3] = (char)reg_adr;
3195  0219 7b1d          	ld	a,(OFST+6,sp)
3196  021b 6b07          	ld	(OFST-16,sp),a
3197                     ; 282 modbus_buff[4] = (char)(arg>>8);
3199  021d 7b1e          	ld	a,(OFST+7,sp)
3200  021f 6b08          	ld	(OFST-15,sp),a
3201                     ; 283 modbus_buff[5] = (char)arg;
3203  0221 7b1f          	ld	a,(OFST+8,sp)
3204  0223 6b09          	ld	(OFST-14,sp),a
3205                     ; 285 crc_temp= CRC16_2(modbus_buff,6);
3207  0225 ae0006        	ldw	x,#6
3208  0228 89            	pushw	x
3209  0229 96            	ldw	x,sp
3210  022a 1c0006        	addw	x,#OFST-17
3211  022d cd0042        	call	_CRC16_2
3213  0230 5b02          	addw	sp,#2
3214  0232 1f01          	ldw	(OFST-22,sp),x
3215                     ; 287 modbus_buff[6]= (char)crc_temp;
3217  0234 7b02          	ld	a,(OFST-21,sp)
3218  0236 6b0a          	ld	(OFST-13,sp),a
3219                     ; 288 modbus_buff[7]= (char)(crc_temp>>8);
3221  0238 7b01          	ld	a,(OFST-22,sp)
3222  023a 6b0b          	ld	(OFST-12,sp),a
3223                     ; 291 for (i=0;i<8;i++)
3225  023c 0f03          	clr	(OFST-20,sp)
3226  023e               L7671:
3227                     ; 293 	putchar1(modbus_buff[i]);
3229  023e 96            	ldw	x,sp
3230  023f 1c0004        	addw	x,#OFST-19
3231  0242 9f            	ld	a,xl
3232  0243 5e            	swapw	x
3233  0244 1b03          	add	a,(OFST-20,sp)
3234  0246 2401          	jrnc	L05
3235  0248 5c            	incw	x
3236  0249               L05:
3237  0249 02            	rlwa	x,a
3238  024a f6            	ld	a,(x)
3239  024b cd017d        	call	_putchar1
3241                     ; 291 for (i=0;i<8;i++)
3243  024e 0c03          	inc	(OFST-20,sp)
3246  0250 7b03          	ld	a,(OFST-20,sp)
3247  0252 a108          	cp	a,#8
3248  0254 25e8          	jrult	L7671
3249                     ; 298 }
3252  0256 5b19          	addw	sp,#25
3253  0258 81            	ret
3276                     ; 303 void spi_init(void){
3277                     	switch	.text
3278  0259               _spi_init:
3282                     ; 305 	GPIOE->DDR|=(1<<5);
3284  0259 721a5016      	bset	20502,#5
3285                     ; 306 	GPIOE->CR1|=(1<<5);
3287  025d 721a5017      	bset	20503,#5
3288                     ; 307 	GPIOE->CR2&=~(1<<5);
3290  0261 721b5018      	bres	20504,#5
3291                     ; 308 	GPIOE->ODR|=(1<<5);	
3293  0265 721a5014      	bset	20500,#5
3294                     ; 310 	GPIOC->DDR|=(1<<3);
3296  0269 7216500c      	bset	20492,#3
3297                     ; 311 	GPIOC->CR1|=(1<<3);
3299  026d 7216500d      	bset	20493,#3
3300                     ; 312 	GPIOC->CR2&=~(1<<3);
3302  0271 7217500e      	bres	20494,#3
3303                     ; 313 	GPIOC->ODR|=(1<<3);	
3305  0275 7216500a      	bset	20490,#3
3306                     ; 315 	GPIOC->DDR|=(1<<2);
3308  0279 7214500c      	bset	20492,#2
3309                     ; 316 	GPIOC->CR1|=(1<<2);
3311  027d 7214500d      	bset	20493,#2
3312                     ; 317 	GPIOC->CR2&=~(1<<2);
3314  0281 7215500e      	bres	20494,#2
3315                     ; 318 	GPIOC->ODR|=(1<<2);		
3317  0285 7214500a      	bset	20490,#2
3318                     ; 320 	GPIOC->DDR|=(1<<5);
3320  0289 721a500c      	bset	20492,#5
3321                     ; 321 	GPIOC->CR1|=(1<<5);
3323  028d 721a500d      	bset	20493,#5
3324                     ; 322 	GPIOC->CR2|=(1<<5);
3326  0291 721a500e      	bset	20494,#5
3327                     ; 323 	GPIOC->ODR|=(1<<5);	
3329  0295 721a500a      	bset	20490,#5
3330                     ; 325 	GPIOC->DDR|=(1<<6);
3332  0299 721c500c      	bset	20492,#6
3333                     ; 326 	GPIOC->CR1|=(1<<6);
3335  029d 721c500d      	bset	20493,#6
3336                     ; 327 	GPIOC->CR2|=(1<<6);
3338  02a1 721c500e      	bset	20494,#6
3339                     ; 328 	GPIOC->ODR|=(1<<6);	
3341  02a5 721c500a      	bset	20490,#6
3342                     ; 335 	SPI->CR1= /*SPI_CR1_LSBFIRST |*/
3342                     ; 336 			SPI_CR1_SPE | 
3342                     ; 337 			( (0<< 3) & SPI_CR1_BR ) |
3342                     ; 338 			SPI_CR1_MSTR |
3342                     ; 339 			SPI_CR1_CPOL |
3342                     ; 340 			SPI_CR1_CPHA; 
3344  02a9 35475200      	mov	20992,#71
3345                     ; 342 	SPI->CR2= SPI_CR2_SSM | SPI_CR2_SSI;
3347  02ad 35035201      	mov	20993,#3
3348                     ; 343 	SPI->ICR= 0;	
3350  02b1 725f5202      	clr	20994
3351                     ; 344 }
3354  02b5 81            	ret
3397                     ; 347 char spi(char in){
3398                     	switch	.text
3399  02b6               _spi:
3401  02b6 88            	push	a
3402  02b7 88            	push	a
3403       00000001      OFST:	set	1
3406  02b8               L1302:
3407                     ; 349 	while(!((SPI->SR)&SPI_SR_TXE));
3409  02b8 c65203        	ld	a,20995
3410  02bb a502          	bcp	a,#2
3411  02bd 27f9          	jreq	L1302
3412                     ; 350 	SPI->DR=in;
3414  02bf 7b02          	ld	a,(OFST+1,sp)
3415  02c1 c75204        	ld	20996,a
3417  02c4               L1402:
3418                     ; 351 	while(!((SPI->SR)&SPI_SR_RXNE));
3420  02c4 c65203        	ld	a,20995
3421  02c7 a501          	bcp	a,#1
3422  02c9 27f9          	jreq	L1402
3423                     ; 352 	c=SPI->DR;	
3425  02cb c65204        	ld	a,20996
3426  02ce 6b01          	ld	(OFST+0,sp),a
3427                     ; 353 	return c;
3429  02d0 7b01          	ld	a,(OFST+0,sp)
3432  02d2 85            	popw	x
3433  02d3 81            	ret
3477                     ; 357 void bin2bcd_int(unsigned int in)
3477                     ; 358 {
3478                     	switch	.text
3479  02d4               _bin2bcd_int:
3481  02d4 89            	pushw	x
3482  02d5 88            	push	a
3483       00000001      OFST:	set	1
3486                     ; 360 char i=5;
3488                     ; 361 for(i=0;i<5;i++)
3490  02d6 0f01          	clr	(OFST+0,sp)
3491  02d8               L7602:
3492                     ; 363 	dig[i]=in%10;
3494  02d8 1e02          	ldw	x,(OFST+1,sp)
3495  02da 90ae000a      	ldw	y,#10
3496  02de 65            	divw	x,y
3497  02df 51            	exgw	x,y
3498  02e0 7b01          	ld	a,(OFST+0,sp)
3499  02e2 905f          	clrw	y
3500  02e4 9097          	ld	yl,a
3501  02e6 01            	rrwa	x,a
3502  02e7 90e74b        	ld	(_dig,y),a
3503  02ea 02            	rlwa	x,a
3504                     ; 364 	in/=10;
3506  02eb 1e02          	ldw	x,(OFST+1,sp)
3507  02ed 90ae000a      	ldw	y,#10
3508  02f1 65            	divw	x,y
3509  02f2 1f02          	ldw	(OFST+1,sp),x
3510                     ; 361 for(i=0;i<5;i++)
3512  02f4 0c01          	inc	(OFST+0,sp)
3515  02f6 7b01          	ld	a,(OFST+0,sp)
3516  02f8 a105          	cp	a,#5
3517  02fa 25dc          	jrult	L7602
3518                     ; 366 }
3521  02fc 5b03          	addw	sp,#3
3522  02fe 81            	ret
3560                     ; 369 void bcd2ind_zero()
3560                     ; 370 {
3561                     	switch	.text
3562  02ff               _bcd2ind_zero:
3564  02ff 88            	push	a
3565       00000001      OFST:	set	1
3568                     ; 372 zero_on=1;
3570  0300 3501004a      	mov	_zero_on,#1
3571                     ; 373 for (i=4;i>0;i--)
3573  0304 a604          	ld	a,#4
3574  0306 6b01          	ld	(OFST+0,sp),a
3575  0308               L3112:
3576                     ; 375 	if(zero_on&&(!dig[i-1])&&(i-1))
3578  0308 3d4a          	tnz	_zero_on
3579  030a 271e          	jreq	L1212
3581  030c 7b01          	ld	a,(OFST+0,sp)
3582  030e 5f            	clrw	x
3583  030f 97            	ld	xl,a
3584  0310 5a            	decw	x
3585  0311 6d4b          	tnz	(_dig,x)
3586  0313 2615          	jrne	L1212
3588  0315 7b01          	ld	a,(OFST+0,sp)
3589  0317 5f            	clrw	x
3590  0318 97            	ld	xl,a
3591  0319 5a            	decw	x
3592  031a a30000        	cpw	x,#0
3593  031d 270b          	jreq	L1212
3594                     ; 377 		ind_out_[i-1]=DIGISYM[10];
3596  031f 7b01          	ld	a,(OFST+0,sp)
3597  0321 5f            	clrw	x
3598  0322 97            	ld	xl,a
3599  0323 5a            	decw	x
3600  0324 a6ff          	ld	a,#255
3601  0326 e745          	ld	(_ind_out_,x),a
3603  0328 201c          	jra	L3212
3604  032a               L1212:
3605                     ; 381 		ind_out_[i-1]=DIGISYM[dig[i-1]];
3607  032a 7b01          	ld	a,(OFST+0,sp)
3608  032c 5f            	clrw	x
3609  032d 97            	ld	xl,a
3610  032e 5a            	decw	x
3611  032f 7b01          	ld	a,(OFST+0,sp)
3612  0331 905f          	clrw	y
3613  0333 9097          	ld	yl,a
3614  0335 905a          	decw	y
3615  0337 90e64b        	ld	a,(_dig,y)
3616  033a 905f          	clrw	y
3617  033c 9097          	ld	yl,a
3618  033e 90d60000      	ld	a,(_DIGISYM,y)
3619  0342 e745          	ld	(_ind_out_,x),a
3620                     ; 382 		zero_on=0;
3622  0344 3f4a          	clr	_zero_on
3623  0346               L3212:
3624                     ; 373 for (i=4;i>0;i--)
3626  0346 0a01          	dec	(OFST+0,sp)
3629  0348 0d01          	tnz	(OFST+0,sp)
3630  034a 26bc          	jrne	L3112
3631                     ; 385 }
3634  034c 84            	pop	a
3635  034d 81            	ret
3672                     ; 388 void bcd2ind()
3672                     ; 389 {
3673                     	switch	.text
3674  034e               _bcd2ind:
3676  034e 88            	push	a
3677       00000001      OFST:	set	1
3680                     ; 392 for (i=4;i>0;i--)
3682  034f a604          	ld	a,#4
3683  0351 6b01          	ld	(OFST+0,sp),a
3684  0353               L3412:
3685                     ; 394 	ind_out_[i-1]=DIGISYM[dig[i-1]];
3687  0353 7b01          	ld	a,(OFST+0,sp)
3688  0355 5f            	clrw	x
3689  0356 97            	ld	xl,a
3690  0357 5a            	decw	x
3691  0358 7b01          	ld	a,(OFST+0,sp)
3692  035a 905f          	clrw	y
3693  035c 9097          	ld	yl,a
3694  035e 905a          	decw	y
3695  0360 90e64b        	ld	a,(_dig,y)
3696  0363 905f          	clrw	y
3697  0365 9097          	ld	yl,a
3698  0367 90d60000      	ld	a,(_DIGISYM,y)
3699  036b e745          	ld	(_ind_out_,x),a
3700                     ; 392 for (i=4;i>0;i--)
3702  036d 0a01          	dec	(OFST+0,sp)
3705  036f 0d01          	tnz	(OFST+0,sp)
3706  0371 26e0          	jrne	L3412
3707                     ; 396 }
3710  0373 84            	pop	a
3711  0374 81            	ret
3816                     ; 399 void int2ind_slkuf1(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
3816                     ; 400 {
3817                     	switch	.text
3818  0375               _int2ind_slkuf1:
3820  0375 89            	pushw	x
3821  0376 88            	push	a
3822       00000001      OFST:	set	1
3825                     ; 403 bin2bcd_int(in);
3827  0377 cd02d4        	call	_bin2bcd_int
3829                     ; 404 if(unzero)bcd2ind_zero();
3831  037a 0d09          	tnz	(OFST+8,sp)
3832  037c 2705          	jreq	L3222
3835  037e cd02ff        	call	_bcd2ind_zero
3838  0381 2002          	jra	L5222
3839  0383               L3222:
3840                     ; 405 else bcd2ind();
3842  0383 adc9          	call	_bcd2ind
3844  0385               L5222:
3845                     ; 406 if(komma)
3847  0385 0d08          	tnz	(OFST+7,sp)
3848  0387 271c          	jreq	L7222
3849                     ; 408 	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
3851  0389 7b08          	ld	a,(OFST+7,sp)
3852  038b 5f            	clrw	x
3853  038c 97            	ld	xl,a
3854  038d e645          	ld	a,(_ind_out_,x)
3855  038f a1ff          	cp	a,#255
3856  0391 2608          	jrne	L1322
3859  0393 7b08          	ld	a,(OFST+7,sp)
3860  0395 5f            	clrw	x
3861  0396 97            	ld	xl,a
3862  0397 a6c0          	ld	a,#192
3863  0399 e745          	ld	(_ind_out_,x),a
3864  039b               L1322:
3865                     ; 409 	ind_out_[komma]&=0b01111111;
3867  039b 7b08          	ld	a,(OFST+7,sp)
3868  039d 5f            	clrw	x
3869  039e 97            	ld	xl,a
3870  039f e645          	ld	a,(_ind_out_,x)
3871  03a1 a47f          	and	a,#127
3872  03a3 e745          	ld	(_ind_out_,x),a
3873  03a5               L7222:
3874                     ; 411 if(fl&&bFL5)
3876  03a5 0d0a          	tnz	(OFST+9,sp)
3877  03a7 2718          	jreq	L3322
3879  03a9 3d3f          	tnz	_bFL5
3880  03ab 2714          	jreq	L3322
3881                     ; 413 	for(i=0;i<len;i++)
3883  03ad 0f01          	clr	(OFST+0,sp)
3885  03af 200a          	jra	L1422
3886  03b1               L5322:
3887                     ; 415 		ind_out_[i]=DIGISYM[10];
3889  03b1 7b01          	ld	a,(OFST+0,sp)
3890  03b3 5f            	clrw	x
3891  03b4 97            	ld	xl,a
3892  03b5 a6ff          	ld	a,#255
3893  03b7 e745          	ld	(_ind_out_,x),a
3894                     ; 413 	for(i=0;i<len;i++)
3896  03b9 0c01          	inc	(OFST+0,sp)
3897  03bb               L1422:
3900  03bb 7b01          	ld	a,(OFST+0,sp)
3901  03bd 1107          	cp	a,(OFST+6,sp)
3902  03bf 25f0          	jrult	L5322
3903  03c1               L3322:
3904                     ; 419 for(i=0;i<len;i++)
3906  03c1 0f01          	clr	(OFST+0,sp)
3908  03c3 2016          	jra	L1522
3909  03c5               L5422:
3910                     ; 421 		dig1[start+i]=ind_out_[i];
3912  03c5 7b06          	ld	a,(OFST+5,sp)
3913  03c7 5f            	clrw	x
3914  03c8 1b01          	add	a,(OFST+0,sp)
3915  03ca 2401          	jrnc	L66
3916  03cc 5c            	incw	x
3917  03cd               L66:
3918  03cd 02            	rlwa	x,a
3919  03ce 7b01          	ld	a,(OFST+0,sp)
3920  03d0 905f          	clrw	y
3921  03d2 9097          	ld	yl,a
3922  03d4 90e645        	ld	a,(_ind_out_,y)
3923  03d7 e705          	ld	(_dig1,x),a
3924                     ; 419 for(i=0;i<len;i++)
3926  03d9 0c01          	inc	(OFST+0,sp)
3927  03db               L1522:
3930  03db 7b01          	ld	a,(OFST+0,sp)
3931  03dd 1107          	cp	a,(OFST+6,sp)
3932  03df 25e4          	jrult	L5422
3933                     ; 423 if(len==0)
3935  03e1 0d07          	tnz	(OFST+6,sp)
3936  03e3 2610          	jrne	L5522
3937                     ; 425 	dig1[0]=0xff;
3939  03e5 35ff0005      	mov	_dig1,#255
3940                     ; 426 	dig1[1]=0xff;
3942  03e9 35ff0006      	mov	_dig1+1,#255
3943                     ; 427 	dig1[2]=0xff;
3945  03ed 35ff0007      	mov	_dig1+2,#255
3946                     ; 428 	dig1[3]=0xff;
3948  03f1 35ff0008      	mov	_dig1+3,#255
3949  03f5               L5522:
3950                     ; 430 dig1_[0]=dig1[0];
3952  03f5 45051d        	mov	_dig1_,_dig1
3953                     ; 431 dig1_[1]=dig1[1];
3955  03f8 45061e        	mov	_dig1_+1,_dig1+1
3956                     ; 432 dig1_[2]=dig1[2];
3958  03fb 45071f        	mov	_dig1_+2,_dig1+2
3959                     ; 433 dig1_[3]=dig1[3];
3961  03fe 450820        	mov	_dig1_+3,_dig1+3
3962                     ; 434 if(fad)
3964  0401 0d0b          	tnz	(OFST+10,sp)
3965  0403 2710          	jreq	L7522
3966                     ; 436 	dig1[0]=0xff;
3968  0405 35ff0005      	mov	_dig1,#255
3969                     ; 437 	dig1[1]=0xff;
3971  0409 35ff0006      	mov	_dig1+1,#255
3972                     ; 438 	dig1[2]=0xff;
3974  040d 35ff0007      	mov	_dig1+2,#255
3975                     ; 439 	dig1[3]=0xff;
3977  0411 35ff0008      	mov	_dig1+3,#255
3978  0415               L7522:
3979                     ; 441 }
3982  0415 5b03          	addw	sp,#3
3983  0417 81            	ret
4088                     ; 444 void int2ind_slkuf2(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
4088                     ; 445 {
4089                     	switch	.text
4090  0418               _int2ind_slkuf2:
4092  0418 89            	pushw	x
4093  0419 88            	push	a
4094       00000001      OFST:	set	1
4097                     ; 448 	dig2[0]=0xff;
4099  041a 35ff000d      	mov	_dig2,#255
4100                     ; 449 	dig2[1]=0xff;
4102  041e 35ff000e      	mov	_dig2+1,#255
4103                     ; 450 	dig2[2]=0xff;
4105  0422 35ff000f      	mov	_dig2+2,#255
4106                     ; 451 	dig2[3]=0xff;
4108  0426 35ff0010      	mov	_dig2+3,#255
4109                     ; 452 	dig2_[0]=0xff;
4111  042a 35ff0025      	mov	_dig2_,#255
4112                     ; 453 	dig2_[1]=0xff;
4114  042e 35ff0026      	mov	_dig2_+1,#255
4115                     ; 454 	dig2_[2]=0xff;
4117  0432 35ff0027      	mov	_dig2_+2,#255
4118                     ; 455 	dig2_[3]=0xff;
4120  0436 35ff0028      	mov	_dig2_+3,#255
4121                     ; 456 bin2bcd_int(in);
4123  043a cd02d4        	call	_bin2bcd_int
4125                     ; 457 if(unzero)bcd2ind_zero();
4127  043d 0d09          	tnz	(OFST+8,sp)
4128  043f 2705          	jreq	L3332
4131  0441 cd02ff        	call	_bcd2ind_zero
4134  0444 2003          	jra	L5332
4135  0446               L3332:
4136                     ; 458 else bcd2ind();
4138  0446 cd034e        	call	_bcd2ind
4140  0449               L5332:
4141                     ; 459 if(komma)
4143  0449 0d08          	tnz	(OFST+7,sp)
4144  044b 271c          	jreq	L7332
4145                     ; 461 	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
4147  044d 7b08          	ld	a,(OFST+7,sp)
4148  044f 5f            	clrw	x
4149  0450 97            	ld	xl,a
4150  0451 e645          	ld	a,(_ind_out_,x)
4151  0453 a1ff          	cp	a,#255
4152  0455 2608          	jrne	L1432
4155  0457 7b08          	ld	a,(OFST+7,sp)
4156  0459 5f            	clrw	x
4157  045a 97            	ld	xl,a
4158  045b a6c0          	ld	a,#192
4159  045d e745          	ld	(_ind_out_,x),a
4160  045f               L1432:
4161                     ; 462 	ind_out_[komma]&=0b01111111;
4163  045f 7b08          	ld	a,(OFST+7,sp)
4164  0461 5f            	clrw	x
4165  0462 97            	ld	xl,a
4166  0463 e645          	ld	a,(_ind_out_,x)
4167  0465 a47f          	and	a,#127
4168  0467 e745          	ld	(_ind_out_,x),a
4169  0469               L7332:
4170                     ; 464 if(fl&&bFL5)
4172  0469 0d0a          	tnz	(OFST+9,sp)
4173  046b 2718          	jreq	L3432
4175  046d 3d3f          	tnz	_bFL5
4176  046f 2714          	jreq	L3432
4177                     ; 466 	for(i=0;i<len;i++)
4179  0471 0f01          	clr	(OFST+0,sp)
4181  0473 200a          	jra	L1532
4182  0475               L5432:
4183                     ; 468 		ind_out_[i]=DIGISYM[10];
4185  0475 7b01          	ld	a,(OFST+0,sp)
4186  0477 5f            	clrw	x
4187  0478 97            	ld	xl,a
4188  0479 a6ff          	ld	a,#255
4189  047b e745          	ld	(_ind_out_,x),a
4190                     ; 466 	for(i=0;i<len;i++)
4192  047d 0c01          	inc	(OFST+0,sp)
4193  047f               L1532:
4196  047f 7b01          	ld	a,(OFST+0,sp)
4197  0481 1107          	cp	a,(OFST+6,sp)
4198  0483 25f0          	jrult	L5432
4199  0485               L3432:
4200                     ; 472 for(i=0;i<len;i++)
4202  0485 0f01          	clr	(OFST+0,sp)
4204  0487 2016          	jra	L1632
4205  0489               L5532:
4206                     ; 474 		dig2[start+i]=ind_out_[i];
4208  0489 7b06          	ld	a,(OFST+5,sp)
4209  048b 5f            	clrw	x
4210  048c 1b01          	add	a,(OFST+0,sp)
4211  048e 2401          	jrnc	L27
4212  0490 5c            	incw	x
4213  0491               L27:
4214  0491 02            	rlwa	x,a
4215  0492 7b01          	ld	a,(OFST+0,sp)
4216  0494 905f          	clrw	y
4217  0496 9097          	ld	yl,a
4218  0498 90e645        	ld	a,(_ind_out_,y)
4219  049b e70d          	ld	(_dig2,x),a
4220                     ; 472 for(i=0;i<len;i++)
4222  049d 0c01          	inc	(OFST+0,sp)
4223  049f               L1632:
4226  049f 7b01          	ld	a,(OFST+0,sp)
4227  04a1 1107          	cp	a,(OFST+6,sp)
4228  04a3 25e4          	jrult	L5532
4229                     ; 476 if(len==0)
4231  04a5 0d07          	tnz	(OFST+6,sp)
4232  04a7 2610          	jrne	L5632
4233                     ; 478 	dig2[0]=0xff;
4235  04a9 35ff000d      	mov	_dig2,#255
4236                     ; 479 	dig2[1]=0xff;
4238  04ad 35ff000e      	mov	_dig2+1,#255
4239                     ; 480 	dig2[2]=0xff;
4241  04b1 35ff000f      	mov	_dig2+2,#255
4242                     ; 481 	dig2[3]=0xff;
4244  04b5 35ff0010      	mov	_dig2+3,#255
4245  04b9               L5632:
4246                     ; 483 dig2_[0]=dig2[0];
4248  04b9 450d25        	mov	_dig2_,_dig2
4249                     ; 484 dig2_[1]=dig2[1];
4251  04bc 450e26        	mov	_dig2_+1,_dig2+1
4252                     ; 485 dig2_[2]=dig2[2];
4254  04bf 450f27        	mov	_dig2_+2,_dig2+2
4255                     ; 486 dig2_[3]=dig2[3];
4257  04c2 451028        	mov	_dig2_+3,_dig2+3
4258                     ; 487 if(fad)
4260  04c5 0d0b          	tnz	(OFST+10,sp)
4261  04c7 2710          	jreq	L7632
4262                     ; 489 	dig2[0]=0xff;
4264  04c9 35ff000d      	mov	_dig2,#255
4265                     ; 490 	dig2[1]=0xff;
4267  04cd 35ff000e      	mov	_dig2+1,#255
4268                     ; 491 	dig2[2]=0xff;
4270  04d1 35ff000f      	mov	_dig2+2,#255
4271                     ; 492 	dig2[3]=0xff;
4273  04d5 35ff0010      	mov	_dig2+3,#255
4274  04d9               L7632:
4275                     ; 494 }
4278  04d9 5b03          	addw	sp,#3
4279  04db 81            	ret
4384                     ; 496 void int2ind_slkuf3(unsigned short in, char start, char len, char komma, char unzero, char fl, char fad)
4384                     ; 497 {
4385                     	switch	.text
4386  04dc               _int2ind_slkuf3:
4388  04dc 89            	pushw	x
4389  04dd 88            	push	a
4390       00000001      OFST:	set	1
4393                     ; 500 bin2bcd_int(in);
4395  04de cd02d4        	call	_bin2bcd_int
4397                     ; 501 if(unzero)bcd2ind_zero();
4399  04e1 0d09          	tnz	(OFST+8,sp)
4400  04e3 2705          	jreq	L3442
4403  04e5 cd02ff        	call	_bcd2ind_zero
4406  04e8 2003          	jra	L5442
4407  04ea               L3442:
4408                     ; 502 else bcd2ind();
4410  04ea cd034e        	call	_bcd2ind
4412  04ed               L5442:
4413                     ; 503 if(komma)
4415  04ed 0d08          	tnz	(OFST+7,sp)
4416  04ef 271c          	jreq	L7442
4417                     ; 505 	if(ind_out_[komma]==DIGISYM[10])ind_out_[komma]=DIGISYM[0];
4419  04f1 7b08          	ld	a,(OFST+7,sp)
4420  04f3 5f            	clrw	x
4421  04f4 97            	ld	xl,a
4422  04f5 e645          	ld	a,(_ind_out_,x)
4423  04f7 a1ff          	cp	a,#255
4424  04f9 2608          	jrne	L1542
4427  04fb 7b08          	ld	a,(OFST+7,sp)
4428  04fd 5f            	clrw	x
4429  04fe 97            	ld	xl,a
4430  04ff a6c0          	ld	a,#192
4431  0501 e745          	ld	(_ind_out_,x),a
4432  0503               L1542:
4433                     ; 506 	ind_out_[komma]&=0b01111111;
4435  0503 7b08          	ld	a,(OFST+7,sp)
4436  0505 5f            	clrw	x
4437  0506 97            	ld	xl,a
4438  0507 e645          	ld	a,(_ind_out_,x)
4439  0509 a47f          	and	a,#127
4440  050b e745          	ld	(_ind_out_,x),a
4441  050d               L7442:
4442                     ; 508 if(fl&&bFL5)
4444  050d 0d0a          	tnz	(OFST+9,sp)
4445  050f 2718          	jreq	L3542
4447  0511 3d3f          	tnz	_bFL5
4448  0513 2714          	jreq	L3542
4449                     ; 510 	for(i=0;i<len;i++)
4451  0515 0f01          	clr	(OFST+0,sp)
4453  0517 200a          	jra	L1642
4454  0519               L5542:
4455                     ; 512 		ind_out_[i]=DIGISYM[10];
4457  0519 7b01          	ld	a,(OFST+0,sp)
4458  051b 5f            	clrw	x
4459  051c 97            	ld	xl,a
4460  051d a6ff          	ld	a,#255
4461  051f e745          	ld	(_ind_out_,x),a
4462                     ; 510 	for(i=0;i<len;i++)
4464  0521 0c01          	inc	(OFST+0,sp)
4465  0523               L1642:
4468  0523 7b01          	ld	a,(OFST+0,sp)
4469  0525 1107          	cp	a,(OFST+6,sp)
4470  0527 25f0          	jrult	L5542
4471  0529               L3542:
4472                     ; 516 for(i=0;i<len;i++)
4474  0529 0f01          	clr	(OFST+0,sp)
4476  052b 2016          	jra	L1742
4477  052d               L5642:
4478                     ; 518 		dig3[start+i]=ind_out_[i];
4480  052d 7b06          	ld	a,(OFST+5,sp)
4481  052f 5f            	clrw	x
4482  0530 1b01          	add	a,(OFST+0,sp)
4483  0532 2401          	jrnc	L67
4484  0534 5c            	incw	x
4485  0535               L67:
4486  0535 02            	rlwa	x,a
4487  0536 7b01          	ld	a,(OFST+0,sp)
4488  0538 905f          	clrw	y
4489  053a 9097          	ld	yl,a
4490  053c 90e645        	ld	a,(_ind_out_,y)
4491  053f e715          	ld	(_dig3,x),a
4492                     ; 516 for(i=0;i<len;i++)
4494  0541 0c01          	inc	(OFST+0,sp)
4495  0543               L1742:
4498  0543 7b01          	ld	a,(OFST+0,sp)
4499  0545 1107          	cp	a,(OFST+6,sp)
4500  0547 25e4          	jrult	L5642
4501                     ; 520 if(len==0)
4503  0549 0d07          	tnz	(OFST+6,sp)
4504  054b 2610          	jrne	L5742
4505                     ; 522 	dig3[0]=0xff;
4507  054d 35ff0015      	mov	_dig3,#255
4508                     ; 523 	dig3[1]=0xff;
4510  0551 35ff0016      	mov	_dig3+1,#255
4511                     ; 524 	dig3[2]=0xff;
4513  0555 35ff0017      	mov	_dig3+2,#255
4514                     ; 525 	dig3[3]=0xff;
4516  0559 35ff0018      	mov	_dig3+3,#255
4517  055d               L5742:
4518                     ; 527 dig3_[0]=dig3[0];
4520  055d 45152d        	mov	_dig3_,_dig3
4521                     ; 528 dig3_[1]=dig3[1];
4523  0560 45162e        	mov	_dig3_+1,_dig3+1
4524                     ; 529 dig3_[2]=dig3[2];
4526  0563 45172f        	mov	_dig3_+2,_dig3+2
4527                     ; 530 dig3_[3]=dig3[3];
4529  0566 451830        	mov	_dig3_+3,_dig3+3
4530                     ; 531 if(fad)
4532  0569 0d0b          	tnz	(OFST+10,sp)
4533  056b 2710          	jreq	L7742
4534                     ; 533 	dig3[0]=0xff;
4536  056d 35ff0015      	mov	_dig3,#255
4537                     ; 534 	dig3[1]=0xff;
4539  0571 35ff0016      	mov	_dig3+1,#255
4540                     ; 535 	dig3[2]=0xff;
4542  0575 35ff0017      	mov	_dig3+2,#255
4543                     ; 536 	dig3[3]=0xff;
4545  0579 35ff0018      	mov	_dig3+3,#255
4546  057d               L7742:
4547                     ; 539 }
4550  057d 5b03          	addw	sp,#3
4551  057f 81            	ret
4576                     ; 542 void tmblr_drv(void)
4576                     ; 543 {
4577                     	switch	.text
4578  0580               _tmblr_drv:
4582                     ; 544 if(GPIOB->IDR&0b10000000)
4584  0580 c65006        	ld	a,20486
4585  0583 a580          	bcp	a,#128
4586  0585 2716          	jreq	L1152
4587                     ; 546 	tmblr_cnt++;
4589  0587 be18          	ldw	x,_tmblr_cnt
4590  0589 1c0001        	addw	x,#1
4591  058c bf18          	ldw	_tmblr_cnt,x
4592                     ; 547 	if(tmblr_cnt>=10)tmblr_cnt=10;
4594  058e 9c            	rvf
4595  058f be18          	ldw	x,_tmblr_cnt
4596  0591 a3000a        	cpw	x,#10
4597  0594 2f16          	jrslt	L5152
4600  0596 ae000a        	ldw	x,#10
4601  0599 bf18          	ldw	_tmblr_cnt,x
4602  059b 200f          	jra	L5152
4603  059d               L1152:
4604                     ; 551 	tmblr_cnt--;
4606  059d be18          	ldw	x,_tmblr_cnt
4607  059f 1d0001        	subw	x,#1
4608  05a2 bf18          	ldw	_tmblr_cnt,x
4609                     ; 552 	if(tmblr_cnt<=0)tmblr_cnt=0;
4611  05a4 9c            	rvf
4612  05a5 be18          	ldw	x,_tmblr_cnt
4613  05a7 2c03          	jrsgt	L5152
4616  05a9 5f            	clrw	x
4617  05aa bf18          	ldw	_tmblr_cnt,x
4618  05ac               L5152:
4619                     ; 555 if(tmblr_cnt>=9)tmblr_state=tsU;
4621  05ac 9c            	rvf
4622  05ad be18          	ldw	x,_tmblr_cnt
4623  05af a30009        	cpw	x,#9
4624  05b2 2f06          	jrslt	L1252
4627  05b4 35010070      	mov	_tmblr_state,#1
4629  05b8 2009          	jra	L3252
4630  05ba               L1252:
4631                     ; 556 else if(tmblr_cnt<=0)tmblr_state=tsI;
4633  05ba 9c            	rvf
4634  05bb be18          	ldw	x,_tmblr_cnt
4635  05bd 2c04          	jrsgt	L3252
4638  05bf 35020070      	mov	_tmblr_state,#2
4639  05c3               L3252:
4640                     ; 561 }
4643  05c3 81            	ret
4668                     ; 565 void but_drv(void)
4668                     ; 566 {
4669                     	switch	.text
4670  05c4               _but_drv:
4674                     ; 567 if(GPIOE->IDR&0b00000001)
4676  05c4 c65015        	ld	a,20501
4677  05c7 a501          	bcp	a,#1
4678  05c9 2716          	jreq	L7352
4679                     ; 569 	but_cnt++;
4681  05cb be16          	ldw	x,_but_cnt
4682  05cd 1c0001        	addw	x,#1
4683  05d0 bf16          	ldw	_but_cnt,x
4684                     ; 570 	if(but_cnt>=10)but_cnt=10;
4686  05d2 9c            	rvf
4687  05d3 be16          	ldw	x,_but_cnt
4688  05d5 a3000a        	cpw	x,#10
4689  05d8 2f16          	jrslt	L3452
4692  05da ae000a        	ldw	x,#10
4693  05dd bf16          	ldw	_but_cnt,x
4694  05df 200f          	jra	L3452
4695  05e1               L7352:
4696                     ; 574 	but_cnt--;
4698  05e1 be16          	ldw	x,_but_cnt
4699  05e3 1d0001        	subw	x,#1
4700  05e6 bf16          	ldw	_but_cnt,x
4701                     ; 575 	if(but_cnt<=0)but_cnt=0;
4703  05e8 9c            	rvf
4704  05e9 be16          	ldw	x,_but_cnt
4705  05eb 2c03          	jrsgt	L3452
4708  05ed 5f            	clrw	x
4709  05ee bf16          	ldw	_but_cnt,x
4710  05f0               L3452:
4711                     ; 578 if(but_cnt>=9)but_state=bsOFF;
4713  05f0 9c            	rvf
4714  05f1 be16          	ldw	x,_but_cnt
4715  05f3 a30009        	cpw	x,#9
4716  05f6 2f04          	jrslt	L7452
4719  05f8 3f6f          	clr	_but_state
4721  05fa 2009          	jra	L1552
4722  05fc               L7452:
4723                     ; 579 else if(but_cnt<=0)but_state=bsON;
4725  05fc 9c            	rvf
4726  05fd be16          	ldw	x,_but_cnt
4727  05ff 2c04          	jrsgt	L1552
4730  0601 3501006f      	mov	_but_state,#1
4731  0605               L1552:
4732                     ; 584 }
4735  0605 81            	ret
4760                     ; 588 void enc_but_drv(void)
4760                     ; 589 {
4761                     	switch	.text
4762  0606               _enc_but_drv:
4766                     ; 590 if(!((GPIOB->IDR)&(1<<5)))
4768  0606 c65006        	ld	a,20486
4769  0609 a520          	bcp	a,#32
4770  060b 2609          	jrne	L5652
4771                     ; 592 	enc_but_drv_cnt++;
4773  060d be0f          	ldw	x,_enc_but_drv_cnt
4774  060f 1c0001        	addw	x,#1
4775  0612 bf0f          	ldw	_enc_but_drv_cnt,x
4777  0614 200f          	jra	L7652
4778  0616               L5652:
4779                     ; 596 	if(enc_but_drv_cnt>=10)
4781  0616 9c            	rvf
4782  0617 be0f          	ldw	x,_enc_but_drv_cnt
4783  0619 a3000a        	cpw	x,#10
4784  061c 2f04          	jrslt	L1752
4785                     ; 598 		cmnd=1;
4787  061e 35010015      	mov	_cmnd,#1
4788  0622               L1752:
4789                     ; 600 	enc_but_drv_cnt=0;
4791  0622 5f            	clrw	x
4792  0623 bf0f          	ldw	_enc_but_drv_cnt,x
4793  0625               L7652:
4794                     ; 602 }
4797  0625 81            	ret
4835                     ; 605 void enc_an(void)
4835                     ; 606 {
4836                     	switch	.text
4837  0626               _enc_an:
4841                     ; 608 if(encCW)
4843                     	btst	_encCW
4844  062b 2420          	jruge	L3062
4845                     ; 610 	if(encCW_cnt1)
4847  062d 3d1d          	tnz	_encCW_cnt1
4848  062f 2708          	jreq	L5062
4849                     ; 612 		if(encCW_cnt2<10)
4851  0631 b61c          	ld	a,_encCW_cnt2
4852  0633 a10a          	cp	a,#10
4853  0635 2402          	jruge	L5062
4854                     ; 614 			encCW_cnt2++;
4856  0637 3c1c          	inc	_encCW_cnt2
4857  0639               L5062:
4858                     ; 617 	encCW_cnt1=80;
4860  0639 3550001d      	mov	_encCW_cnt1,#80
4861                     ; 619 	if(encCW_cnt2>8)
4863  063d b61c          	ld	a,_encCW_cnt2
4864  063f a109          	cp	a,#9
4865  0641 251a          	jrult	L3162
4866                     ; 621 		encCW_=1;
4868  0643 72100001      	bset	_encCW_
4869                     ; 622 		encCW=0;
4871  0647 72110003      	bres	_encCW
4872  064b 2010          	jra	L3162
4873  064d               L3062:
4874                     ; 627 	if(encCW_cnt1)
4876  064d 3d1d          	tnz	_encCW_cnt1
4877  064f 270c          	jreq	L3162
4878                     ; 629 		encCW_cnt1--;
4880  0651 3a1d          	dec	_encCW_cnt1
4881                     ; 630 		if(encCW_cnt1==0)
4883  0653 3d1d          	tnz	_encCW_cnt1
4884  0655 2606          	jrne	L3162
4885                     ; 632 			encCW_cnt2=0;
4887  0657 3f1c          	clr	_encCW_cnt2
4888                     ; 633 			encCW_=0;
4890  0659 72110001      	bres	_encCW_
4891  065d               L3162:
4892                     ; 639 if(encOW)
4894                     	btst	_encOW
4895  0662 2420          	jruge	L1262
4896                     ; 641 	if(encOW_cnt1)
4898  0664 3d1b          	tnz	_encOW_cnt1
4899  0666 2708          	jreq	L3262
4900                     ; 643 		if(encOW_cnt2<10)
4902  0668 b61a          	ld	a,_encOW_cnt2
4903  066a a10a          	cp	a,#10
4904  066c 2402          	jruge	L3262
4905                     ; 645 			encOW_cnt2++;
4907  066e 3c1a          	inc	_encOW_cnt2
4908  0670               L3262:
4909                     ; 648 	encOW_cnt1=50;
4911  0670 3532001b      	mov	_encOW_cnt1,#50
4912                     ; 649 	if(encOW_cnt2>5)
4914  0674 b61a          	ld	a,_encOW_cnt2
4915  0676 a106          	cp	a,#6
4916  0678 251a          	jrult	L1362
4917                     ; 651 		encOW_=1;
4919  067a 72100000      	bset	_encOW_
4920                     ; 652 		encOW=0;
4922  067e 72110002      	bres	_encOW
4923  0682 2010          	jra	L1362
4924  0684               L1262:
4925                     ; 657 	if(encOW_cnt1)
4927  0684 3d1b          	tnz	_encOW_cnt1
4928  0686 270c          	jreq	L1362
4929                     ; 659 		encOW_cnt1--;
4931  0688 3a1b          	dec	_encOW_cnt1
4932                     ; 660 		if(encOW_cnt1==0)
4934  068a 3d1b          	tnz	_encOW_cnt1
4935  068c 2606          	jrne	L1362
4936                     ; 662 			encOW_cnt2=0;
4938  068e 3f1a          	clr	_encOW_cnt2
4939                     ; 663 			encOW_=0;
4941  0690 72110000      	bres	_encOW_
4942  0694               L1362:
4943                     ; 668 if(encCW||encOW||encCW_||encOW_)
4945                     	btst	_encCW
4946  0699 2518          	jrult	L1462
4948                     	btst	_encOW
4949  06a0 2511          	jrult	L1462
4951                     	btst	_encCW_
4952  06a7 250a          	jrult	L1462
4954                     	btst	_encOW_
4955  06ae 2503          	jrult	L011
4956  06b0 cc083f        	jp	L7362
4957  06b3               L011:
4958  06b3               L1462:
4959                     ; 670 		enc_plazma++;
4961  06b3 be1e          	ldw	x,_enc_plazma
4962  06b5 1c0001        	addw	x,#1
4963  06b8 bf1e          	ldw	_enc_plazma,x
4964                     ; 671 	if(!ind_fad_cnt)
4966  06ba 3d50          	tnz	_ind_fad_cnt
4967  06bc 2608          	jrne	L7462
4968                     ; 673 		ind_fad_cnt=10;
4970  06be 350a0050      	mov	_ind_fad_cnt,#10
4972  06c2 ac200820      	jpf	L1562
4973  06c6               L7462:
4974                     ; 677 		if(tmblr_state==tsI)
4976  06c6 b670          	ld	a,_tmblr_state
4977  06c8 a102          	cp	a,#2
4978  06ca 2703          	jreq	L211
4979  06cc cc077a        	jp	L3562
4980  06cf               L211:
4981                     ; 680 			if(but_state==bsON)
4983  06cf b66f          	ld	a,_but_state
4984  06d1 a101          	cp	a,#1
4985  06d3 2653          	jrne	L5562
4986                     ; 682 				if(encCW)
4988                     	btst	_encCW
4989  06da 240c          	jruge	L7562
4990                     ; 686 					enc_cmnd=51;
4992  06dc ae0033        	ldw	x,#51
4993  06df bf13          	ldw	_enc_cmnd,x
4994                     ; 687 					enc_cmnd_cnt++;
4996  06e1 be11          	ldw	x,_enc_cmnd_cnt
4997  06e3 1c0001        	addw	x,#1
4998  06e6 bf11          	ldw	_enc_cmnd_cnt,x
4999  06e8               L7562:
5000                     ; 689 				if(encCW_)
5002                     	btst	_encCW_
5003  06ed 240c          	jruge	L1662
5004                     ; 693 					enc_cmnd=53;
5006  06ef ae0035        	ldw	x,#53
5007  06f2 bf13          	ldw	_enc_cmnd,x
5008                     ; 694 					enc_cmnd_cnt++;
5010  06f4 be11          	ldw	x,_enc_cmnd_cnt
5011  06f6 1c0001        	addw	x,#1
5012  06f9 bf11          	ldw	_enc_cmnd_cnt,x
5013  06fb               L1662:
5014                     ; 697 				if(encOW)
5016                     	btst	_encOW
5017  0700 240c          	jruge	L3662
5018                     ; 701 					enc_cmnd=52;
5020  0702 ae0034        	ldw	x,#52
5021  0705 bf13          	ldw	_enc_cmnd,x
5022                     ; 702 					enc_cmnd_cnt++;
5024  0707 be11          	ldw	x,_enc_cmnd_cnt
5025  0709 1c0001        	addw	x,#1
5026  070c bf11          	ldw	_enc_cmnd_cnt,x
5027  070e               L3662:
5028                     ; 705 				if(encOW_)
5030                     	btst	_encOW_
5031  0713 2503          	jrult	L411
5032  0715 cc0820        	jp	L1562
5033  0718               L411:
5034                     ; 709 					enc_cmnd=54;
5036  0718 ae0036        	ldw	x,#54
5037  071b bf13          	ldw	_enc_cmnd,x
5038                     ; 710 					enc_cmnd_cnt++;
5040  071d be11          	ldw	x,_enc_cmnd_cnt
5041  071f 1c0001        	addw	x,#1
5042  0722 bf11          	ldw	_enc_cmnd_cnt,x
5043  0724 ac200820      	jpf	L1562
5044  0728               L5562:
5045                     ; 715 				if(encCW)
5047                     	btst	_encCW
5048  072d 240c          	jruge	L1762
5049                     ; 719 					enc_cmnd=61;
5051  072f ae003d        	ldw	x,#61
5052  0732 bf13          	ldw	_enc_cmnd,x
5053                     ; 720 					enc_cmnd_cnt++;
5055  0734 be11          	ldw	x,_enc_cmnd_cnt
5056  0736 1c0001        	addw	x,#1
5057  0739 bf11          	ldw	_enc_cmnd_cnt,x
5058  073b               L1762:
5059                     ; 722 				if(encCW_)
5061                     	btst	_encCW_
5062  0740 240c          	jruge	L3762
5063                     ; 726 					enc_cmnd=63;
5065  0742 ae003f        	ldw	x,#63
5066  0745 bf13          	ldw	_enc_cmnd,x
5067                     ; 727 					enc_cmnd_cnt++;
5069  0747 be11          	ldw	x,_enc_cmnd_cnt
5070  0749 1c0001        	addw	x,#1
5071  074c bf11          	ldw	_enc_cmnd_cnt,x
5072  074e               L3762:
5073                     ; 729 				if(encOW)
5075                     	btst	_encOW
5076  0753 240c          	jruge	L5762
5077                     ; 733 					enc_cmnd=62;
5079  0755 ae003e        	ldw	x,#62
5080  0758 bf13          	ldw	_enc_cmnd,x
5081                     ; 734 					enc_cmnd_cnt++;
5083  075a be11          	ldw	x,_enc_cmnd_cnt
5084  075c 1c0001        	addw	x,#1
5085  075f bf11          	ldw	_enc_cmnd_cnt,x
5086  0761               L5762:
5087                     ; 736 				if(encOW_)
5089                     	btst	_encOW_
5090  0766 2503          	jrult	L611
5091  0768 cc0820        	jp	L1562
5092  076b               L611:
5093                     ; 740 					enc_cmnd=64;
5095  076b ae0040        	ldw	x,#64
5096  076e bf13          	ldw	_enc_cmnd,x
5097                     ; 741 					enc_cmnd_cnt++;
5099  0770 be11          	ldw	x,_enc_cmnd_cnt
5100  0772 1c0001        	addw	x,#1
5101  0775 bf11          	ldw	_enc_cmnd_cnt,x
5102  0777 cc0820        	jra	L1562
5103  077a               L3562:
5104                     ; 745 		else	if(tmblr_state==tsU)
5106  077a b670          	ld	a,_tmblr_state
5107  077c a101          	cp	a,#1
5108  077e 26f7          	jrne	L1562
5109                     ; 748 			if(but_state==bsON)
5111  0780 b66f          	ld	a,_but_state
5112  0782 a101          	cp	a,#1
5113  0784 264e          	jrne	L5072
5114                     ; 750 				if(encCW)
5116                     	btst	_encCW
5117  078b 240c          	jruge	L7072
5118                     ; 754 					enc_cmnd=51;
5120  078d ae0033        	ldw	x,#51
5121  0790 bf13          	ldw	_enc_cmnd,x
5122                     ; 755 					enc_cmnd_cnt++;
5124  0792 be11          	ldw	x,_enc_cmnd_cnt
5125  0794 1c0001        	addw	x,#1
5126  0797 bf11          	ldw	_enc_cmnd_cnt,x
5127  0799               L7072:
5128                     ; 757 				if(encCW_)
5130                     	btst	_encCW_
5131  079e 240c          	jruge	L1172
5132                     ; 761 					enc_cmnd=53;
5134  07a0 ae0035        	ldw	x,#53
5135  07a3 bf13          	ldw	_enc_cmnd,x
5136                     ; 762 					enc_cmnd_cnt++;
5138  07a5 be11          	ldw	x,_enc_cmnd_cnt
5139  07a7 1c0001        	addw	x,#1
5140  07aa bf11          	ldw	_enc_cmnd_cnt,x
5141  07ac               L1172:
5142                     ; 765 				if(encOW)
5144                     	btst	_encOW
5145  07b1 240c          	jruge	L3172
5146                     ; 769 					enc_cmnd=52;
5148  07b3 ae0034        	ldw	x,#52
5149  07b6 bf13          	ldw	_enc_cmnd,x
5150                     ; 770 					enc_cmnd_cnt++;
5152  07b8 be11          	ldw	x,_enc_cmnd_cnt
5153  07ba 1c0001        	addw	x,#1
5154  07bd bf11          	ldw	_enc_cmnd_cnt,x
5155  07bf               L3172:
5156                     ; 773 				if(encOW_)
5158                     	btst	_encOW_
5159  07c4 245a          	jruge	L1562
5160                     ; 777 					enc_cmnd=54;
5162  07c6 ae0036        	ldw	x,#54
5163  07c9 bf13          	ldw	_enc_cmnd,x
5164                     ; 778 					enc_cmnd_cnt++;
5166  07cb be11          	ldw	x,_enc_cmnd_cnt
5167  07cd 1c0001        	addw	x,#1
5168  07d0 bf11          	ldw	_enc_cmnd_cnt,x
5169  07d2 204c          	jra	L1562
5170  07d4               L5072:
5171                     ; 783 				if(encCW)
5173                     	btst	_encCW
5174  07d9 240c          	jruge	L1272
5175                     ; 787 					enc_cmnd=71;
5177  07db ae0047        	ldw	x,#71
5178  07de bf13          	ldw	_enc_cmnd,x
5179                     ; 788 					enc_cmnd_cnt++;
5181  07e0 be11          	ldw	x,_enc_cmnd_cnt
5182  07e2 1c0001        	addw	x,#1
5183  07e5 bf11          	ldw	_enc_cmnd_cnt,x
5184  07e7               L1272:
5185                     ; 790 				if(encCW_)
5187                     	btst	_encCW_
5188  07ec 240c          	jruge	L3272
5189                     ; 794 					enc_cmnd=73;
5191  07ee ae0049        	ldw	x,#73
5192  07f1 bf13          	ldw	_enc_cmnd,x
5193                     ; 795 					enc_cmnd_cnt++;
5195  07f3 be11          	ldw	x,_enc_cmnd_cnt
5196  07f5 1c0001        	addw	x,#1
5197  07f8 bf11          	ldw	_enc_cmnd_cnt,x
5198  07fa               L3272:
5199                     ; 797 				if(encOW)
5201                     	btst	_encOW
5202  07ff 240c          	jruge	L5272
5203                     ; 801 					enc_cmnd=72;
5205  0801 ae0048        	ldw	x,#72
5206  0804 bf13          	ldw	_enc_cmnd,x
5207                     ; 802 					enc_cmnd_cnt++;
5209  0806 be11          	ldw	x,_enc_cmnd_cnt
5210  0808 1c0001        	addw	x,#1
5211  080b bf11          	ldw	_enc_cmnd_cnt,x
5212  080d               L5272:
5213                     ; 804 				if(encOW_)
5215                     	btst	_encOW_
5216  0812 240c          	jruge	L1562
5217                     ; 808 					enc_cmnd=74;
5219  0814 ae004a        	ldw	x,#74
5220  0817 bf13          	ldw	_enc_cmnd,x
5221                     ; 809 					enc_cmnd_cnt++;
5223  0819 be11          	ldw	x,_enc_cmnd_cnt
5224  081b 1c0001        	addw	x,#1
5225  081e bf11          	ldw	_enc_cmnd_cnt,x
5226  0820               L1562:
5227                     ; 814 	ind_fad_cnt=10;
5229  0820 350a0050      	mov	_ind_fad_cnt,#10
5230                     ; 815 	encCW=0;
5232  0824 72110003      	bres	_encCW
5233                     ; 816 	encCW_=0;
5235  0828 72110001      	bres	_encCW_
5236                     ; 817 	encOW=0;
5238  082c 72110002      	bres	_encOW
5239                     ; 818 	encOW_=0;
5241  0830 72110000      	bres	_encOW_
5242                     ; 819 	if(enc_cmnd_cnt>15)enc_cmnd_cnt=0;
5244  0834 9c            	rvf
5245  0835 be11          	ldw	x,_enc_cmnd_cnt
5246  0837 a30010        	cpw	x,#16
5247  083a 2f03          	jrslt	L7362
5250  083c 5f            	clrw	x
5251  083d bf11          	ldw	_enc_cmnd_cnt,x
5252  083f               L7362:
5253                     ; 822 if(cmnd)
5255  083f 3d15          	tnz	_cmnd
5256  0841 2719          	jreq	L3372
5257                     ; 826 	cmnd=0;
5259  0843 3f15          	clr	_cmnd
5260                     ; 827 	enc_cmnd=1;
5262  0845 ae0001        	ldw	x,#1
5263  0848 bf13          	ldw	_enc_cmnd,x
5264                     ; 828 	enc_cmnd_cnt++;
5266  084a be11          	ldw	x,_enc_cmnd_cnt
5267  084c 1c0001        	addw	x,#1
5268  084f bf11          	ldw	_enc_cmnd_cnt,x
5269                     ; 829 	if(enc_cmnd_cnt>15)enc_cmnd_cnt=0;
5271  0851 9c            	rvf
5272  0852 be11          	ldw	x,_enc_cmnd_cnt
5273  0854 a30010        	cpw	x,#16
5274  0857 2f03          	jrslt	L3372
5277  0859 5f            	clrw	x
5278  085a bf11          	ldw	_enc_cmnd_cnt,x
5279  085c               L3372:
5280                     ; 832 }
5283  085c 81            	ret
5306                     ; 836 void uart1_init (void)
5306                     ; 837 {
5307                     	switch	.text
5308  085d               _uart1_init:
5312                     ; 839 GPIOA->DDR&=~(1<<4);
5314  085d 72195002      	bres	20482,#4
5315                     ; 840 GPIOA->CR1|=(1<<4);
5317  0861 72185003      	bset	20483,#4
5318                     ; 841 GPIOA->CR2&=~(1<<4);
5320  0865 72195004      	bres	20484,#4
5321                     ; 844 GPIOA->DDR|=(1<<5);
5323  0869 721a5002      	bset	20482,#5
5324                     ; 845 GPIOA->CR1|=(1<<5);
5326  086d 721a5003      	bset	20483,#5
5327                     ; 846 GPIOA->CR2&=~(1<<5);	
5329  0871 721b5004      	bres	20484,#5
5330                     ; 849 GPIOA->DDR|=(1<<6);
5332  0875 721c5002      	bset	20482,#6
5333                     ; 850 GPIOA->CR1|=(1<<6);
5335  0879 721c5003      	bset	20483,#6
5336                     ; 851 GPIOA->CR2&=~(1<<6);
5338  087d 721d5004      	bres	20484,#6
5339                     ; 855 UART1->CR1&=~UART1_CR1_M;					
5341  0881 72195234      	bres	21044,#4
5342                     ; 856 UART1->CR3|= (0<<4) & UART1_CR3_STOP;  	
5344  0885 c65236        	ld	a,21046
5345                     ; 857 UART1->BRR2= 0x02;
5347  0888 35025233      	mov	21043,#2
5348                     ; 858 UART1->BRR1= 0x41;
5350  088c 35415232      	mov	21042,#65
5351                     ; 859 UART1->CR2|= UART1_CR2_TEN | UART1_CR2_REN | UART1_CR2_RIEN/*| UART2_CR2_TIEN*/ ;	
5353  0890 c65235        	ld	a,21045
5354  0893 aa2c          	or	a,#44
5355  0895 c75235        	ld	21045,a
5356                     ; 860 }
5359  0898 81            	ret
5393                     ; 863 void can_in_an(void)
5393                     ; 864 {
5394                     	switch	.text
5395  0899               _can_in_an:
5399                     ; 871 if(mess[6]==33)
5401  0899 b62e          	ld	a,_mess+6
5402  089b a121          	cp	a,#33
5403  089d 2636          	jrne	L3672
5404                     ; 876 	ind_U=(mess[7]+(mess[8]*256));
5406  089f b630          	ld	a,_mess+8
5407  08a1 5f            	clrw	x
5408  08a2 97            	ld	xl,a
5409  08a3 4f            	clr	a
5410  08a4 02            	rlwa	x,a
5411  08a5 01            	rrwa	x,a
5412  08a6 bb2f          	add	a,_mess+7
5413  08a8 2401          	jrnc	L421
5414  08aa 5c            	incw	x
5415  08ab               L421:
5416  08ab b75b          	ld	_ind_U+1,a
5417  08ad 9f            	ld	a,xl
5418  08ae b75a          	ld	_ind_U,a
5419                     ; 877 	ind_I=(mess[9]+(mess[10]*256));
5421  08b0 b632          	ld	a,_mess+10
5422  08b2 5f            	clrw	x
5423  08b3 97            	ld	xl,a
5424  08b4 4f            	clr	a
5425  08b5 02            	rlwa	x,a
5426  08b6 01            	rrwa	x,a
5427  08b7 bb31          	add	a,_mess+9
5428  08b9 2401          	jrnc	L621
5429  08bb 5c            	incw	x
5430  08bc               L621:
5431  08bc b759          	ld	_ind_I+1,a
5432  08be 9f            	ld	a,xl
5433  08bf b758          	ld	_ind_I,a
5434                     ; 878 	work_stat=(enum_work_stat)mess[11];
5436  08c1 453338        	mov	_work_stat,_mess+11
5437                     ; 879 	ind_U_set=(mess[12]+(mess[13]*256));
5439  08c4 b635          	ld	a,_mess+13
5440  08c6 5f            	clrw	x
5441  08c7 97            	ld	xl,a
5442  08c8 4f            	clr	a
5443  08c9 02            	rlwa	x,a
5444  08ca 01            	rrwa	x,a
5445  08cb bb34          	add	a,_mess+12
5446  08cd 2401          	jrnc	L031
5447  08cf 5c            	incw	x
5448  08d0               L031:
5449  08d0 b757          	ld	_ind_U_set+1,a
5450  08d2 9f            	ld	a,xl
5451  08d3 b756          	ld	_ind_U_set,a
5452  08d5               L3672:
5453                     ; 889 if(mess[6]==34)
5455  08d5 b62e          	ld	a,_mess+6
5456  08d7 a122          	cp	a,#34
5457  08d9 2633          	jrne	L7472
5458                     ; 891 	time= (mess[7]+(mess[8]*256));
5460  08db b630          	ld	a,_mess+8
5461  08dd 5f            	clrw	x
5462  08de 97            	ld	xl,a
5463  08df 4f            	clr	a
5464  08e0 02            	rlwa	x,a
5465  08e1 01            	rrwa	x,a
5466  08e2 bb2f          	add	a,_mess+7
5467  08e4 2401          	jrnc	L231
5468  08e6 5c            	incw	x
5469  08e7               L231:
5470  08e7 b75f          	ld	_time+1,a
5471  08e9 9f            	ld	a,xl
5472  08ea b75e          	ld	_time,a
5473                     ; 892 	time_set= (mess[9]+(mess[10]*256));
5475  08ec b632          	ld	a,_mess+10
5476  08ee 5f            	clrw	x
5477  08ef 97            	ld	xl,a
5478  08f0 4f            	clr	a
5479  08f1 02            	rlwa	x,a
5480  08f2 01            	rrwa	x,a
5481  08f3 bb31          	add	a,_mess+9
5482  08f5 2401          	jrnc	L431
5483  08f7 5c            	incw	x
5484  08f8               L431:
5485  08f8 b75d          	ld	_time_set+1,a
5486  08fa 9f            	ld	a,xl
5487  08fb b75c          	ld	_time_set,a
5488                     ; 893 	ind_I_set=(mess[12]+(mess[13]*256));
5490  08fd b635          	ld	a,_mess+13
5491  08ff 5f            	clrw	x
5492  0900 97            	ld	xl,a
5493  0901 4f            	clr	a
5494  0902 02            	rlwa	x,a
5495  0903 01            	rrwa	x,a
5496  0904 bb34          	add	a,_mess+12
5497  0906 2401          	jrnc	L631
5498  0908 5c            	incw	x
5499  0909               L631:
5500  0909 b755          	ld	_ind_I_set+1,a
5501  090b 9f            	ld	a,xl
5502  090c b754          	ld	_ind_I_set,a
5503  090e               L7472:
5504                     ; 905 can_in_an_end:
5504                     ; 906 bCAN_RX=0;
5506  090e 3f36          	clr	_bCAN_RX
5507                     ; 907 }   
5510  0910 81            	ret
5533                     ; 910 void init_CAN(void) {
5534                     	switch	.text
5535  0911               _init_CAN:
5539                     ; 911 	CAN->MCR&=~CAN_MCR_SLEEP;					// CAN wake up request
5541  0911 72135420      	bres	21536,#1
5542                     ; 912 	CAN->MCR|= CAN_MCR_INRQ;					// CAN initialization request
5544  0915 72105420      	bset	21536,#0
5546  0919               L1003:
5547                     ; 913 	while((CAN->MSR & CAN_MSR_INAK) == 0);	// waiting for CAN enter the init mode
5549  0919 c65421        	ld	a,21537
5550  091c a501          	bcp	a,#1
5551  091e 27f9          	jreq	L1003
5552                     ; 915 	CAN->MCR|= CAN_MCR_NART;					// no automatic retransmition
5554  0920 72185420      	bset	21536,#4
5555                     ; 917 	CAN->PSR= 2;							// *** FILTER 0 SETTINGS ***
5557  0924 35025427      	mov	21543,#2
5558                     ; 926 	CAN->Page.Filter01.F0R1= UKU_MESS_STID>>3;			// 16 bits mode
5560  0928 35155428      	mov	21544,#21
5561                     ; 927 	CAN->Page.Filter01.F0R2= UKU_MESS_STID<<5;
5563  092c 35c05429      	mov	21545,#192
5564                     ; 928 	CAN->Page.Filter01.F0R5= UKU_MESS_STID_MASK>>3;
5566  0930 357f542c      	mov	21548,#127
5567                     ; 929 	CAN->Page.Filter01.F0R6= UKU_MESS_STID_MASK<<5;
5569  0934 35e0542d      	mov	21549,#224
5570                     ; 931 	CAN->Page.Filter01.F1R1= BPS_MESS_STID>>3;			// 16 bits mode
5572  0938 35335430      	mov	21552,#51
5573                     ; 932 	CAN->Page.Filter01.F1R2= BPS_MESS_STID<<5;
5575  093c 35c05431      	mov	21553,#192
5576                     ; 933 	CAN->Page.Filter01.F1R5= BPS_MESS_STID_MASK>>3;
5578  0940 357f5434      	mov	21556,#127
5579                     ; 934 	CAN->Page.Filter01.F1R6= BPS_MESS_STID_MASK<<5;
5581  0944 35e05435      	mov	21557,#224
5582                     ; 938 	CAN->PSR= 6;									// set page 6
5584  0948 35065427      	mov	21543,#6
5585                     ; 943 	CAN->Page.Config.FMR1&=~3;								//mask mode
5587  094c c65430        	ld	a,21552
5588  094f a4fc          	and	a,#252
5589  0951 c75430        	ld	21552,a
5590                     ; 949 	CAN->Page.Config.FCR1= ((3<<1) & (CAN_FCR1_FSC00 | CAN_FCR1_FSC01));		//16 bit scale
5592  0954 35065432      	mov	21554,#6
5593                     ; 950 	CAN->Page.Config.FCR1= ((3<<5) & (CAN_FCR1_FSC10 | CAN_FCR1_FSC11));		//16 bit scale
5595  0958 35605432      	mov	21554,#96
5596                     ; 953 	CAN->Page.Config.FCR1|= CAN_FCR1_FACT0;	// filter 0 active
5598  095c 72105432      	bset	21554,#0
5599                     ; 954 	CAN->Page.Config.FCR1|= CAN_FCR1_FACT1;
5601  0960 72185432      	bset	21554,#4
5602                     ; 957 	CAN->PSR= 6;								// *** BIT TIMING SETTINGS ***
5604  0964 35065427      	mov	21543,#6
5605                     ; 959 	CAN->Page.Config.BTR1= 4;					// CAN_BTR1_BRP=9, 	tq= fcpu/(9+1)
5607  0968 3504542c      	mov	21548,#4
5608                     ; 960 	CAN->Page.Config.BTR2= (1<<7)|(6<<4) | 7; 		// BS2=8, BS1=7, 		
5610  096c 35e7542d      	mov	21549,#231
5611                     ; 962 	CAN->IER|=(1<<1);
5613  0970 72125425      	bset	21541,#1
5614                     ; 965 	CAN->MCR&=~CAN_MCR_INRQ;					// leave initialization request
5616  0974 72115420      	bres	21536,#0
5618  0978               L7003:
5619                     ; 966 	while((CAN->MSR & CAN_MSR_INAK) != 0);	// waiting for CAN leave the init mode
5621  0978 c65421        	ld	a,21537
5622  097b a501          	bcp	a,#1
5623  097d 26f9          	jrne	L7003
5624                     ; 967 }
5627  097f 81            	ret
5735                     ; 971 void can_transmit(unsigned short id_st,char data0,char data1,char data2,char data3,char data4,char data5,char data6,char data7)
5735                     ; 972 {
5736                     	switch	.text
5737  0980               _can_transmit:
5739  0980 89            	pushw	x
5740       00000000      OFST:	set	0
5743                     ; 974 if((can_buff_wr_ptr<0)||(can_buff_wr_ptr>3))can_buff_wr_ptr=0;
5745  0981 b63b          	ld	a,_can_buff_wr_ptr
5746  0983 a104          	cp	a,#4
5747  0985 2502          	jrult	L1703
5750  0987 3f3b          	clr	_can_buff_wr_ptr
5751  0989               L1703:
5752                     ; 976 can_out_buff[can_buff_wr_ptr][0]=(char)(id_st>>6);
5754  0989 b63b          	ld	a,_can_buff_wr_ptr
5755  098b 97            	ld	xl,a
5756  098c a610          	ld	a,#16
5757  098e 42            	mul	x,a
5758  098f 1601          	ldw	y,(OFST+1,sp)
5759  0991 a606          	ld	a,#6
5760  0993               L441:
5761  0993 9054          	srlw	y
5762  0995 4a            	dec	a
5763  0996 26fb          	jrne	L441
5764  0998 909f          	ld	a,yl
5765  099a d70001        	ld	(_can_out_buff,x),a
5766                     ; 977 can_out_buff[can_buff_wr_ptr][1]=(char)(id_st<<2);
5768  099d b63b          	ld	a,_can_buff_wr_ptr
5769  099f 97            	ld	xl,a
5770  09a0 a610          	ld	a,#16
5771  09a2 42            	mul	x,a
5772  09a3 7b02          	ld	a,(OFST+2,sp)
5773  09a5 48            	sll	a
5774  09a6 48            	sll	a
5775  09a7 d70002        	ld	(_can_out_buff+1,x),a
5776                     ; 979 can_out_buff[can_buff_wr_ptr][2]=data0;
5778  09aa b63b          	ld	a,_can_buff_wr_ptr
5779  09ac 97            	ld	xl,a
5780  09ad a610          	ld	a,#16
5781  09af 42            	mul	x,a
5782  09b0 7b05          	ld	a,(OFST+5,sp)
5783  09b2 d70003        	ld	(_can_out_buff+2,x),a
5784                     ; 980 can_out_buff[can_buff_wr_ptr][3]=data1;
5786  09b5 b63b          	ld	a,_can_buff_wr_ptr
5787  09b7 97            	ld	xl,a
5788  09b8 a610          	ld	a,#16
5789  09ba 42            	mul	x,a
5790  09bb 7b06          	ld	a,(OFST+6,sp)
5791  09bd d70004        	ld	(_can_out_buff+3,x),a
5792                     ; 981 can_out_buff[can_buff_wr_ptr][4]=data2;
5794  09c0 b63b          	ld	a,_can_buff_wr_ptr
5795  09c2 97            	ld	xl,a
5796  09c3 a610          	ld	a,#16
5797  09c5 42            	mul	x,a
5798  09c6 7b07          	ld	a,(OFST+7,sp)
5799  09c8 d70005        	ld	(_can_out_buff+4,x),a
5800                     ; 982 can_out_buff[can_buff_wr_ptr][5]=data3;
5802  09cb b63b          	ld	a,_can_buff_wr_ptr
5803  09cd 97            	ld	xl,a
5804  09ce a610          	ld	a,#16
5805  09d0 42            	mul	x,a
5806  09d1 7b08          	ld	a,(OFST+8,sp)
5807  09d3 d70006        	ld	(_can_out_buff+5,x),a
5808                     ; 983 can_out_buff[can_buff_wr_ptr][6]=data4;
5810  09d6 b63b          	ld	a,_can_buff_wr_ptr
5811  09d8 97            	ld	xl,a
5812  09d9 a610          	ld	a,#16
5813  09db 42            	mul	x,a
5814  09dc 7b09          	ld	a,(OFST+9,sp)
5815  09de d70007        	ld	(_can_out_buff+6,x),a
5816                     ; 984 can_out_buff[can_buff_wr_ptr][7]=data5;
5818  09e1 b63b          	ld	a,_can_buff_wr_ptr
5819  09e3 97            	ld	xl,a
5820  09e4 a610          	ld	a,#16
5821  09e6 42            	mul	x,a
5822  09e7 7b0a          	ld	a,(OFST+10,sp)
5823  09e9 d70008        	ld	(_can_out_buff+7,x),a
5824                     ; 985 can_out_buff[can_buff_wr_ptr][8]=data6;
5826  09ec b63b          	ld	a,_can_buff_wr_ptr
5827  09ee 97            	ld	xl,a
5828  09ef a610          	ld	a,#16
5829  09f1 42            	mul	x,a
5830  09f2 7b0b          	ld	a,(OFST+11,sp)
5831  09f4 d70009        	ld	(_can_out_buff+8,x),a
5832                     ; 986 can_out_buff[can_buff_wr_ptr][9]=data7;
5834  09f7 b63b          	ld	a,_can_buff_wr_ptr
5835  09f9 97            	ld	xl,a
5836  09fa a610          	ld	a,#16
5837  09fc 42            	mul	x,a
5838  09fd 7b0c          	ld	a,(OFST+12,sp)
5839  09ff d7000a        	ld	(_can_out_buff+9,x),a
5840                     ; 988 can_buff_wr_ptr++;
5842  0a02 3c3b          	inc	_can_buff_wr_ptr
5843                     ; 989 if(can_buff_wr_ptr>3)can_buff_wr_ptr=0;
5845  0a04 b63b          	ld	a,_can_buff_wr_ptr
5846  0a06 a104          	cp	a,#4
5847  0a08 2502          	jrult	L3703
5850  0a0a 3f3b          	clr	_can_buff_wr_ptr
5851  0a0c               L3703:
5852                     ; 990 } 
5855  0a0c 85            	popw	x
5856  0a0d 81            	ret
5898                     ; 993 void ind_hndl(void)
5898                     ; 994 {
5899                     	switch	.text
5900  0a0e               _ind_hndl:
5902  0a0e 89            	pushw	x
5903       00000002      OFST:	set	2
5906                     ; 996 if(ind_fad_cnt)
5908  0a0f 3d50          	tnz	_ind_fad_cnt
5909  0a11 2702          	jreq	L5013
5910                     ; 998 	ind_fad_cnt--;
5912  0a13 3a50          	dec	_ind_fad_cnt
5913  0a15               L5013:
5914                     ; 1005 int2ind_slkuf2(ind_U,0,3,1,0,0,0);
5916  0a15 4b00          	push	#0
5917  0a17 4b00          	push	#0
5918  0a19 4b00          	push	#0
5919  0a1b 4b01          	push	#1
5920  0a1d 4b03          	push	#3
5921  0a1f 4b00          	push	#0
5922  0a21 be5a          	ldw	x,_ind_U
5923  0a23 cd0418        	call	_int2ind_slkuf2
5925  0a26 5b06          	addw	sp,#6
5926                     ; 1010 if(work_stat==wsGS)
5928  0a28 b638          	ld	a,_work_stat
5929  0a2a a101          	cp	a,#1
5930  0a2c 2703          	jreq	L051
5931  0a2e cc0b47        	jp	L7013
5932  0a31               L051:
5933                     ; 1012 	if((ind_fad_cnt)&&(but_state==bsOFF))
5935  0a31 3d50          	tnz	_ind_fad_cnt
5936  0a33 273b          	jreq	L1113
5938  0a35 3d6f          	tnz	_but_state
5939  0a37 2637          	jrne	L1113
5940                     ; 1015 		if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,1);
5942  0a39 9c            	rvf
5943  0a3a be54          	ldw	x,_ind_I_set
5944  0a3c a303e8        	cpw	x,#1000
5945  0a3f 2e15          	jrsge	L3113
5948  0a41 4b01          	push	#1
5949  0a43 4b00          	push	#0
5950  0a45 4b01          	push	#1
5951  0a47 4b01          	push	#1
5952  0a49 4b03          	push	#3
5953  0a4b 4b00          	push	#0
5954  0a4d be54          	ldw	x,_ind_I_set
5955  0a4f cd0375        	call	_int2ind_slkuf1
5957  0a52 5b06          	addw	sp,#6
5959  0a54 204f          	jra	L7113
5960  0a56               L3113:
5961                     ; 1016 		else int2ind_slkuf1(ind_I_set/10,0,3,0,1,0,1);
5963  0a56 4b01          	push	#1
5964  0a58 4b00          	push	#0
5965  0a5a 4b01          	push	#1
5966  0a5c 4b00          	push	#0
5967  0a5e 4b03          	push	#3
5968  0a60 4b00          	push	#0
5969  0a62 be54          	ldw	x,_ind_I_set
5970  0a64 a60a          	ld	a,#10
5971  0a66 cd0000        	call	c_sdivx
5973  0a69 cd0375        	call	_int2ind_slkuf1
5975  0a6c 5b06          	addw	sp,#6
5976  0a6e 2035          	jra	L7113
5977  0a70               L1113:
5978                     ; 1021 		if(ind_I<=999)int2ind_slkuf1(ind_I,0,3,1,1,0,0);
5980  0a70 9c            	rvf
5981  0a71 be58          	ldw	x,_ind_I
5982  0a73 a303e8        	cpw	x,#1000
5983  0a76 2e15          	jrsge	L1213
5986  0a78 4b00          	push	#0
5987  0a7a 4b00          	push	#0
5988  0a7c 4b01          	push	#1
5989  0a7e 4b01          	push	#1
5990  0a80 4b03          	push	#3
5991  0a82 4b00          	push	#0
5992  0a84 be58          	ldw	x,_ind_I
5993  0a86 cd0375        	call	_int2ind_slkuf1
5995  0a89 5b06          	addw	sp,#6
5997  0a8b 2018          	jra	L7113
5998  0a8d               L1213:
5999                     ; 1022 		else int2ind_slkuf1(ind_I/10,0,3,0,1,0,0);
6001  0a8d 4b00          	push	#0
6002  0a8f 4b00          	push	#0
6003  0a91 4b01          	push	#1
6004  0a93 4b00          	push	#0
6005  0a95 4b03          	push	#3
6006  0a97 4b00          	push	#0
6007  0a99 be58          	ldw	x,_ind_I
6008  0a9b a60a          	ld	a,#10
6009  0a9d cd0000        	call	c_sdivx
6011  0aa0 cd0375        	call	_int2ind_slkuf1
6013  0aa3 5b06          	addw	sp,#6
6014  0aa5               L7113:
6015                     ; 1026 	if(ind_U<1000){
6017  0aa5 9c            	rvf
6018  0aa6 be5a          	ldw	x,_ind_U
6019  0aa8 a303e8        	cpw	x,#1000
6020  0aab 2e15          	jrsge	L5213
6021                     ; 1027 		int2ind_slkuf2(ind_U,0,3,1,1,0,0);
6023  0aad 4b00          	push	#0
6024  0aaf 4b00          	push	#0
6025  0ab1 4b01          	push	#1
6026  0ab3 4b01          	push	#1
6027  0ab5 4b03          	push	#3
6028  0ab7 4b00          	push	#0
6029  0ab9 be5a          	ldw	x,_ind_U
6030  0abb cd0418        	call	_int2ind_slkuf2
6032  0abe 5b06          	addw	sp,#6
6034  0ac0 2018          	jra	L7213
6035  0ac2               L5213:
6036                     ; 1029 		int2ind_slkuf2(ind_U/10,0,3,0,1,0,0);
6038  0ac2 4b00          	push	#0
6039  0ac4 4b00          	push	#0
6040  0ac6 4b01          	push	#1
6041  0ac8 4b00          	push	#0
6042  0aca 4b03          	push	#3
6043  0acc 4b00          	push	#0
6044  0ace be5a          	ldw	x,_ind_U
6045  0ad0 a60a          	ld	a,#10
6046  0ad2 cd0000        	call	c_sdivx
6048  0ad5 cd0418        	call	_int2ind_slkuf2
6050  0ad8 5b06          	addw	sp,#6
6051  0ada               L7213:
6052                     ; 1033 	if(bFL2)	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,2,0,0,0);
6054  0ada 3d3e          	tnz	_bFL2
6055  0adc 272e          	jreq	L1313
6058  0ade 4b00          	push	#0
6059  0ae0 4b00          	push	#0
6060  0ae2 4b00          	push	#0
6061  0ae4 4b02          	push	#2
6062  0ae6 4b04          	push	#4
6063  0ae8 4b00          	push	#0
6064  0aea be5e          	ldw	x,_time
6065  0aec 90ae003c      	ldw	y,#60
6066  0af0 65            	divw	x,y
6067  0af1 51            	exgw	x,y
6068  0af2 1f07          	ldw	(OFST+5,sp),x
6069  0af4 be5e          	ldw	x,_time
6070  0af6 90ae003c      	ldw	y,#60
6071  0afa 65            	divw	x,y
6072  0afb 90ae0064      	ldw	y,#100
6073  0aff cd0000        	call	c_imul
6075  0b02 72fb07        	addw	x,(OFST+5,sp)
6076  0b05 cd04dc        	call	_int2ind_slkuf3
6078  0b08 5b06          	addw	sp,#6
6080  0b0a 202c          	jra	L3313
6081  0b0c               L1313:
6082                     ; 1034 	else 	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,0,0,0,0);
6084  0b0c 4b00          	push	#0
6085  0b0e 4b00          	push	#0
6086  0b10 4b00          	push	#0
6087  0b12 4b00          	push	#0
6088  0b14 4b04          	push	#4
6089  0b16 4b00          	push	#0
6090  0b18 be5e          	ldw	x,_time
6091  0b1a 90ae003c      	ldw	y,#60
6092  0b1e 65            	divw	x,y
6093  0b1f 51            	exgw	x,y
6094  0b20 1f07          	ldw	(OFST+5,sp),x
6095  0b22 be5e          	ldw	x,_time
6096  0b24 90ae003c      	ldw	y,#60
6097  0b28 65            	divw	x,y
6098  0b29 90ae0064      	ldw	y,#100
6099  0b2d cd0000        	call	c_imul
6101  0b30 72fb07        	addw	x,(OFST+5,sp)
6102  0b33 cd04dc        	call	_int2ind_slkuf3
6104  0b36 5b06          	addw	sp,#6
6105  0b38               L3313:
6106                     ; 1036 	if(bFL5)dig1_[3]&=0xdf;
6108  0b38 3d3f          	tnz	_bFL5
6109  0b3a 2603          	jrne	L251
6110  0b3c cc0f4d        	jp	L7313
6111  0b3f               L251:
6114  0b3f 721b0020      	bres	_dig1_+3,#5
6115  0b43 ac4d0f4d      	jpf	L7313
6116  0b47               L7013:
6117                     ; 1038 else if(work_stat==wsPS)
6119  0b47 b638          	ld	a,_work_stat
6120  0b49 a102          	cp	a,#2
6121  0b4b 2703          	jreq	L451
6122  0b4d cc0c66        	jp	L1413
6123  0b50               L451:
6124                     ; 1041 	if(ind_I<=999)int2ind_slkuf1(ind_I,0,3,1,1,0,0);
6126  0b50 9c            	rvf
6127  0b51 be58          	ldw	x,_ind_I
6128  0b53 a303e8        	cpw	x,#1000
6129  0b56 2e15          	jrsge	L3413
6132  0b58 4b00          	push	#0
6133  0b5a 4b00          	push	#0
6134  0b5c 4b01          	push	#1
6135  0b5e 4b01          	push	#1
6136  0b60 4b03          	push	#3
6137  0b62 4b00          	push	#0
6138  0b64 be58          	ldw	x,_ind_I
6139  0b66 cd0375        	call	_int2ind_slkuf1
6141  0b69 5b06          	addw	sp,#6
6143  0b6b 2018          	jra	L5413
6144  0b6d               L3413:
6145                     ; 1042 	else int2ind_slkuf1(ind_I/10,0,3,0,1,0,0);
6147  0b6d 4b00          	push	#0
6148  0b6f 4b00          	push	#0
6149  0b71 4b01          	push	#1
6150  0b73 4b00          	push	#0
6151  0b75 4b03          	push	#3
6152  0b77 4b00          	push	#0
6153  0b79 be58          	ldw	x,_ind_I
6154  0b7b a60a          	ld	a,#10
6155  0b7d cd0000        	call	c_sdivx
6157  0b80 cd0375        	call	_int2ind_slkuf1
6159  0b83 5b06          	addw	sp,#6
6160  0b85               L5413:
6161                     ; 1045 	if((!ind_fad_cnt)||(but_state!=bsOFF)) {
6163  0b85 3d50          	tnz	_ind_fad_cnt
6164  0b87 2704          	jreq	L1513
6166  0b89 3d6f          	tnz	_but_state
6167  0b8b 2767          	jreq	L7413
6168  0b8d               L1513:
6169                     ; 1047 		if(ind_U<1000){
6171  0b8d 9c            	rvf
6172  0b8e be5a          	ldw	x,_ind_U
6173  0b90 a303e8        	cpw	x,#1000
6174  0b93 2e15          	jrsge	L3513
6175                     ; 1048 			int2ind_slkuf2(ind_U,0,3,1,1,0,0);
6177  0b95 4b00          	push	#0
6178  0b97 4b00          	push	#0
6179  0b99 4b01          	push	#1
6180  0b9b 4b01          	push	#1
6181  0b9d 4b03          	push	#3
6182  0b9f 4b00          	push	#0
6183  0ba1 be5a          	ldw	x,_ind_U
6184  0ba3 cd0418        	call	_int2ind_slkuf2
6186  0ba6 5b06          	addw	sp,#6
6188  0ba8 2018          	jra	L7513
6189  0baa               L3513:
6190                     ; 1050 			int2ind_slkuf2(ind_U/10,0,3,0,1,0,0);
6192  0baa 4b00          	push	#0
6193  0bac 4b00          	push	#0
6194  0bae 4b01          	push	#1
6195  0bb0 4b00          	push	#0
6196  0bb2 4b03          	push	#3
6197  0bb4 4b00          	push	#0
6198  0bb6 be5a          	ldw	x,_ind_U
6199  0bb8 a60a          	ld	a,#10
6200  0bba cd0000        	call	c_sdivx
6202  0bbd cd0418        	call	_int2ind_slkuf2
6204  0bc0 5b06          	addw	sp,#6
6205  0bc2               L7513:
6206                     ; 1065 	if(bFL2)	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,2,0,0,0);
6208  0bc2 3d3e          	tnz	_bFL2
6209  0bc4 2765          	jreq	L5613
6212  0bc6 4b00          	push	#0
6213  0bc8 4b00          	push	#0
6214  0bca 4b00          	push	#0
6215  0bcc 4b02          	push	#2
6216  0bce 4b04          	push	#4
6217  0bd0 4b00          	push	#0
6218  0bd2 be5e          	ldw	x,_time
6219  0bd4 90ae003c      	ldw	y,#60
6220  0bd8 65            	divw	x,y
6221  0bd9 51            	exgw	x,y
6222  0bda 1f07          	ldw	(OFST+5,sp),x
6223  0bdc be5e          	ldw	x,_time
6224  0bde 90ae003c      	ldw	y,#60
6225  0be2 65            	divw	x,y
6226  0be3 90ae0064      	ldw	y,#100
6227  0be7 cd0000        	call	c_imul
6229  0bea 72fb07        	addw	x,(OFST+5,sp)
6230  0bed cd04dc        	call	_int2ind_slkuf3
6232  0bf0 5b06          	addw	sp,#6
6234  0bf2 2063          	jra	L7613
6235  0bf4               L7413:
6236                     ; 1055 		if(ind_U_set<1000) {
6238  0bf4 9c            	rvf
6239  0bf5 be56          	ldw	x,_ind_U_set
6240  0bf7 a303e8        	cpw	x,#1000
6241  0bfa 2e15          	jrsge	L1613
6242                     ; 1056 			int2ind_slkuf2(ind_U_set,0,3,1,1,0,1);
6244  0bfc 4b01          	push	#1
6245  0bfe 4b00          	push	#0
6246  0c00 4b01          	push	#1
6247  0c02 4b01          	push	#1
6248  0c04 4b03          	push	#3
6249  0c06 4b00          	push	#0
6250  0c08 be56          	ldw	x,_ind_U_set
6251  0c0a cd0418        	call	_int2ind_slkuf2
6253  0c0d 5b06          	addw	sp,#6
6255  0c0f 20b1          	jra	L7513
6256  0c11               L1613:
6257                     ; 1058 			int2ind_slkuf2(ind_U_set/10,0,3,0,1,0,1);
6259  0c11 4b01          	push	#1
6260  0c13 4b00          	push	#0
6261  0c15 4b01          	push	#1
6262  0c17 4b00          	push	#0
6263  0c19 4b03          	push	#3
6264  0c1b 4b00          	push	#0
6265  0c1d be56          	ldw	x,_ind_U_set
6266  0c1f a60a          	ld	a,#10
6267  0c21 cd0000        	call	c_sdivx
6269  0c24 cd0418        	call	_int2ind_slkuf2
6271  0c27 5b06          	addw	sp,#6
6272  0c29 2097          	jra	L7513
6273  0c2b               L5613:
6274                     ; 1066 	else 	int2ind_slkuf3(((time/60)*100)+(time%60),0,4,0,0,0,0);
6276  0c2b 4b00          	push	#0
6277  0c2d 4b00          	push	#0
6278  0c2f 4b00          	push	#0
6279  0c31 4b00          	push	#0
6280  0c33 4b04          	push	#4
6281  0c35 4b00          	push	#0
6282  0c37 be5e          	ldw	x,_time
6283  0c39 90ae003c      	ldw	y,#60
6284  0c3d 65            	divw	x,y
6285  0c3e 51            	exgw	x,y
6286  0c3f 1f07          	ldw	(OFST+5,sp),x
6287  0c41 be5e          	ldw	x,_time
6288  0c43 90ae003c      	ldw	y,#60
6289  0c47 65            	divw	x,y
6290  0c48 90ae0064      	ldw	y,#100
6291  0c4c cd0000        	call	c_imul
6293  0c4f 72fb07        	addw	x,(OFST+5,sp)
6294  0c52 cd04dc        	call	_int2ind_slkuf3
6296  0c55 5b06          	addw	sp,#6
6297  0c57               L7613:
6298                     ; 1068 	if(bFL5)dig2_[3]&=0xdf;
6300  0c57 3d3f          	tnz	_bFL5
6301  0c59 2603          	jrne	L651
6302  0c5b cc0f4d        	jp	L7313
6303  0c5e               L651:
6306  0c5e 721b0028      	bres	_dig2_+3,#5
6307  0c62 ac4d0f4d      	jpf	L7313
6308  0c66               L1413:
6309                     ; 1072 	if(tmblr_state==tsI)
6311  0c66 b670          	ld	a,_tmblr_state
6312  0c68 a102          	cp	a,#2
6313  0c6a 2703          	jreq	L061
6314  0c6c cc0ddc        	jp	L5713
6315  0c6f               L061:
6316                     ; 1075 		if((ind_fad_cnt)&&(but_state==bsOFF))
6318  0c6f 3d50          	tnz	_ind_fad_cnt
6319  0c71 273b          	jreq	L7713
6321  0c73 3d6f          	tnz	_but_state
6322  0c75 2637          	jrne	L7713
6323                     ; 1077 			if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,1);
6325  0c77 9c            	rvf
6326  0c78 be54          	ldw	x,_ind_I_set
6327  0c7a a303e8        	cpw	x,#1000
6328  0c7d 2e15          	jrsge	L1023
6331  0c7f 4b01          	push	#1
6332  0c81 4b00          	push	#0
6333  0c83 4b01          	push	#1
6334  0c85 4b01          	push	#1
6335  0c87 4b03          	push	#3
6336  0c89 4b00          	push	#0
6337  0c8b be54          	ldw	x,_ind_I_set
6338  0c8d cd0375        	call	_int2ind_slkuf1
6340  0c90 5b06          	addw	sp,#6
6342  0c92 204f          	jra	L5023
6343  0c94               L1023:
6344                     ; 1078 			else int2ind_slkuf1(ind_I_set/10,0,3,0,1,0,1);
6346  0c94 4b01          	push	#1
6347  0c96 4b00          	push	#0
6348  0c98 4b01          	push	#1
6349  0c9a 4b00          	push	#0
6350  0c9c 4b03          	push	#3
6351  0c9e 4b00          	push	#0
6352  0ca0 be54          	ldw	x,_ind_I_set
6353  0ca2 a60a          	ld	a,#10
6354  0ca4 cd0000        	call	c_sdivx
6356  0ca7 cd0375        	call	_int2ind_slkuf1
6358  0caa 5b06          	addw	sp,#6
6359  0cac 2035          	jra	L5023
6360  0cae               L7713:
6361                     ; 1082 			if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,0);
6363  0cae 9c            	rvf
6364  0caf be54          	ldw	x,_ind_I_set
6365  0cb1 a303e8        	cpw	x,#1000
6366  0cb4 2e15          	jrsge	L7023
6369  0cb6 4b00          	push	#0
6370  0cb8 4b00          	push	#0
6371  0cba 4b01          	push	#1
6372  0cbc 4b01          	push	#1
6373  0cbe 4b03          	push	#3
6374  0cc0 4b00          	push	#0
6375  0cc2 be54          	ldw	x,_ind_I_set
6376  0cc4 cd0375        	call	_int2ind_slkuf1
6378  0cc7 5b06          	addw	sp,#6
6380  0cc9 2018          	jra	L5023
6381  0ccb               L7023:
6382                     ; 1083 			else int2ind_slkuf1(ind_I_set/10,0,3,0,1,0,0);
6384  0ccb 4b00          	push	#0
6385  0ccd 4b00          	push	#0
6386  0ccf 4b01          	push	#1
6387  0cd1 4b00          	push	#0
6388  0cd3 4b03          	push	#3
6389  0cd5 4b00          	push	#0
6390  0cd7 be54          	ldw	x,_ind_I_set
6391  0cd9 a60a          	ld	a,#10
6392  0cdb cd0000        	call	c_sdivx
6394  0cde cd0375        	call	_int2ind_slkuf1
6396  0ce1 5b06          	addw	sp,#6
6397  0ce3               L5023:
6398                     ; 1087 		if(ind_U_set<1000) {
6400  0ce3 9c            	rvf
6401  0ce4 be56          	ldw	x,_ind_U_set
6402  0ce6 a303e8        	cpw	x,#1000
6403  0ce9 2e15          	jrsge	L3123
6404                     ; 1088 			int2ind_slkuf2(ind_U_set,0,3,1,1,0,0);
6406  0ceb 4b00          	push	#0
6407  0ced 4b00          	push	#0
6408  0cef 4b01          	push	#1
6409  0cf1 4b01          	push	#1
6410  0cf3 4b03          	push	#3
6411  0cf5 4b00          	push	#0
6412  0cf7 be56          	ldw	x,_ind_U_set
6413  0cf9 cd0418        	call	_int2ind_slkuf2
6415  0cfc 5b06          	addw	sp,#6
6417  0cfe 2018          	jra	L5123
6418  0d00               L3123:
6419                     ; 1090 			int2ind_slkuf2(ind_U_set/10,0,3,0,1,0,0);
6421  0d00 4b00          	push	#0
6422  0d02 4b00          	push	#0
6423  0d04 4b01          	push	#1
6424  0d06 4b00          	push	#0
6425  0d08 4b03          	push	#3
6426  0d0a 4b00          	push	#0
6427  0d0c be56          	ldw	x,_ind_U_set
6428  0d0e a60a          	ld	a,#10
6429  0d10 cd0000        	call	c_sdivx
6431  0d13 cd0418        	call	_int2ind_slkuf2
6433  0d16 5b06          	addw	sp,#6
6434  0d18               L5123:
6435                     ; 1093 		dig1_[3]&=0xdf;
6437  0d18 721b0020      	bres	_dig1_+3,#5
6438                     ; 1096 		if((ind_fad_cnt)&&(but_state==bsON))
6440  0d1c 3d50          	tnz	_ind_fad_cnt
6441  0d1e 2761          	jreq	L7123
6443  0d20 b66f          	ld	a,_but_state
6444  0d22 a101          	cp	a,#1
6445  0d24 265b          	jrne	L7123
6446                     ; 1098 			if(time_set==0xffff)
6448  0d26 be5c          	ldw	x,_time_set
6449  0d28 a3ffff        	cpw	x,#65535
6450  0d2b 2624          	jrne	L1223
6451                     ; 1100 				dig3[0]=0xbf;
6453  0d2d 35bf0015      	mov	_dig3,#191
6454                     ; 1101 				dig3[1]=0xbf;
6456  0d31 35bf0016      	mov	_dig3+1,#191
6457                     ; 1102 				dig3[2]=0xbf;
6459  0d35 35bf0017      	mov	_dig3+2,#191
6460                     ; 1103 				dig3[3]=0xbf;
6462  0d39 35bf0018      	mov	_dig3+3,#191
6463                     ; 1104 				dig3_[0]=0xff;
6465  0d3d 35ff002d      	mov	_dig3_,#255
6466                     ; 1105 				dig3_[1]=0xff;
6468  0d41 35ff002e      	mov	_dig3_+1,#255
6469                     ; 1106 				dig3_[2]=0xff;
6471  0d45 35ff002f      	mov	_dig3_+2,#255
6472                     ; 1107 				dig3_[3]=0xff;
6474  0d49 35ff0030      	mov	_dig3_+3,#255
6476  0d4d ac4d0f4d      	jpf	L7313
6477  0d51               L1223:
6478                     ; 1109 			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,1);
6480  0d51 4b01          	push	#1
6481  0d53 4b00          	push	#0
6482  0d55 4b00          	push	#0
6483  0d57 4b02          	push	#2
6484  0d59 4b04          	push	#4
6485  0d5b 4b00          	push	#0
6486  0d5d be5c          	ldw	x,_time_set
6487  0d5f 90ae003c      	ldw	y,#60
6488  0d63 65            	divw	x,y
6489  0d64 51            	exgw	x,y
6490  0d65 1f07          	ldw	(OFST+5,sp),x
6491  0d67 be5c          	ldw	x,_time_set
6492  0d69 90ae003c      	ldw	y,#60
6493  0d6d 65            	divw	x,y
6494  0d6e 90ae0064      	ldw	y,#100
6495  0d72 cd0000        	call	c_imul
6497  0d75 72fb07        	addw	x,(OFST+5,sp)
6498  0d78 cd04dc        	call	_int2ind_slkuf3
6500  0d7b 5b06          	addw	sp,#6
6501  0d7d ac4d0f4d      	jpf	L7313
6502  0d81               L7123:
6503                     ; 1113 			if(time_set==0xffff)
6505  0d81 be5c          	ldw	x,_time_set
6506  0d83 a3ffff        	cpw	x,#65535
6507  0d86 2624          	jrne	L7223
6508                     ; 1115 				dig3[0]=0xbf;
6510  0d88 35bf0015      	mov	_dig3,#191
6511                     ; 1116 				dig3[1]=0xbf;
6513  0d8c 35bf0016      	mov	_dig3+1,#191
6514                     ; 1117 				dig3[2]=0xbf;
6516  0d90 35bf0017      	mov	_dig3+2,#191
6517                     ; 1118 				dig3[3]=0xbf;
6519  0d94 35bf0018      	mov	_dig3+3,#191
6520                     ; 1119 				dig3_[0]=0xbf;
6522  0d98 35bf002d      	mov	_dig3_,#191
6523                     ; 1120 				dig3_[1]=0xbf;
6525  0d9c 35bf002e      	mov	_dig3_+1,#191
6526                     ; 1121 				dig3_[2]=0xbf;
6528  0da0 35bf002f      	mov	_dig3_+2,#191
6529                     ; 1122 				dig3_[3]=0xbf;
6531  0da4 35bf0030      	mov	_dig3_+3,#191
6533  0da8 ac4d0f4d      	jpf	L7313
6534  0dac               L7223:
6535                     ; 1124 			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,0);
6537  0dac 4b00          	push	#0
6538  0dae 4b00          	push	#0
6539  0db0 4b00          	push	#0
6540  0db2 4b02          	push	#2
6541  0db4 4b04          	push	#4
6542  0db6 4b00          	push	#0
6543  0db8 be5c          	ldw	x,_time_set
6544  0dba 90ae003c      	ldw	y,#60
6545  0dbe 65            	divw	x,y
6546  0dbf 51            	exgw	x,y
6547  0dc0 1f07          	ldw	(OFST+5,sp),x
6548  0dc2 be5c          	ldw	x,_time_set
6549  0dc4 90ae003c      	ldw	y,#60
6550  0dc8 65            	divw	x,y
6551  0dc9 90ae0064      	ldw	y,#100
6552  0dcd cd0000        	call	c_imul
6554  0dd0 72fb07        	addw	x,(OFST+5,sp)
6555  0dd3 cd04dc        	call	_int2ind_slkuf3
6557  0dd6 5b06          	addw	sp,#6
6558  0dd8 ac4d0f4d      	jpf	L7313
6559  0ddc               L5713:
6560                     ; 1127 	else if(tmblr_state==tsU)
6562  0ddc b670          	ld	a,_tmblr_state
6563  0dde a101          	cp	a,#1
6564  0de0 2703          	jreq	L261
6565  0de2 cc0f4d        	jp	L7313
6566  0de5               L261:
6567                     ; 1130 		if(ind_I_set<=999)int2ind_slkuf1(ind_I_set,0,3,1,1,0,0);
6569  0de5 9c            	rvf
6570  0de6 be54          	ldw	x,_ind_I_set
6571  0de8 a303e8        	cpw	x,#1000
6572  0deb 2e15          	jrsge	L7323
6575  0ded 4b00          	push	#0
6576  0def 4b00          	push	#0
6577  0df1 4b01          	push	#1
6578  0df3 4b01          	push	#1
6579  0df5 4b03          	push	#3
6580  0df7 4b00          	push	#0
6581  0df9 be54          	ldw	x,_ind_I_set
6582  0dfb cd0375        	call	_int2ind_slkuf1
6584  0dfe 5b06          	addw	sp,#6
6586  0e00 2018          	jra	L1423
6587  0e02               L7323:
6588                     ; 1131 		else int2ind_slkuf1(ind_I_set/10,0,3,0,1,0,0);
6590  0e02 4b00          	push	#0
6591  0e04 4b00          	push	#0
6592  0e06 4b01          	push	#1
6593  0e08 4b00          	push	#0
6594  0e0a 4b03          	push	#3
6595  0e0c 4b00          	push	#0
6596  0e0e be54          	ldw	x,_ind_I_set
6597  0e10 a60a          	ld	a,#10
6598  0e12 cd0000        	call	c_sdivx
6600  0e15 cd0375        	call	_int2ind_slkuf1
6602  0e18 5b06          	addw	sp,#6
6603  0e1a               L1423:
6604                     ; 1135 		if((!ind_fad_cnt)||(but_state!=bsOFF)) {
6606  0e1a 3d50          	tnz	_ind_fad_cnt
6607  0e1c 2704          	jreq	L5423
6609  0e1e 3d6f          	tnz	_but_state
6610  0e20 2771          	jreq	L3423
6611  0e22               L5423:
6612                     ; 1136 			if(ind_U_set<1000) {
6614  0e22 9c            	rvf
6615  0e23 be56          	ldw	x,_ind_U_set
6616  0e25 a303e8        	cpw	x,#1000
6617  0e28 2e15          	jrsge	L7423
6618                     ; 1137 				int2ind_slkuf2(ind_U_set,0,3,1,1,0,0);
6620  0e2a 4b00          	push	#0
6621  0e2c 4b00          	push	#0
6622  0e2e 4b01          	push	#1
6623  0e30 4b01          	push	#1
6624  0e32 4b03          	push	#3
6625  0e34 4b00          	push	#0
6626  0e36 be56          	ldw	x,_ind_U_set
6627  0e38 cd0418        	call	_int2ind_slkuf2
6629  0e3b 5b06          	addw	sp,#6
6631  0e3d 2018          	jra	L3523
6632  0e3f               L7423:
6633                     ; 1139 				int2ind_slkuf2(ind_U_set/10,0,3,0,1,0,0);
6635  0e3f 4b00          	push	#0
6636  0e41 4b00          	push	#0
6637  0e43 4b01          	push	#1
6638  0e45 4b00          	push	#0
6639  0e47 4b03          	push	#3
6640  0e49 4b00          	push	#0
6641  0e4b be56          	ldw	x,_ind_U_set
6642  0e4d a60a          	ld	a,#10
6643  0e4f cd0000        	call	c_sdivx
6645  0e52 cd0418        	call	_int2ind_slkuf2
6647  0e55 5b06          	addw	sp,#6
6648  0e57               L3523:
6649                     ; 1148 		dig2_[3]&=0xdf;
6651  0e57 721b0028      	bres	_dig2_+3,#5
6652                     ; 1151 		if((ind_fad_cnt)&&(but_state==bsON))
6654  0e5b 3d50          	tnz	_ind_fad_cnt
6655  0e5d 2603cc0ef8    	jreq	L1623
6657  0e62 b66f          	ld	a,_but_state
6658  0e64 a101          	cp	a,#1
6659  0e66 26f7          	jrne	L1623
6660                     ; 1153 			if(time_set==0xffff)
6662  0e68 be5c          	ldw	x,_time_set
6663  0e6a a3ffff        	cpw	x,#65535
6664  0e6d 265b          	jrne	L3623
6665                     ; 1155 				dig3[0]=0xbf;
6667  0e6f 35bf0015      	mov	_dig3,#191
6668                     ; 1156 				dig3[1]=0xbf;
6670  0e73 35bf0016      	mov	_dig3+1,#191
6671                     ; 1157 				dig3[2]=0xbf;
6673  0e77 35bf0017      	mov	_dig3+2,#191
6674                     ; 1158 				dig3[3]=0xbf;
6676  0e7b 35bf0018      	mov	_dig3+3,#191
6677                     ; 1159 				dig3_[0]=0xff;
6679  0e7f 35ff002d      	mov	_dig3_,#255
6680                     ; 1160 				dig3_[1]=0xff;
6682  0e83 35ff002e      	mov	_dig3_+1,#255
6683                     ; 1161 				dig3_[2]=0xff;
6685  0e87 35ff002f      	mov	_dig3_+2,#255
6686                     ; 1162 				dig3_[3]=0xff;
6688  0e8b 35ff0030      	mov	_dig3_+3,#255
6690  0e8f ac4d0f4d      	jpf	L7313
6691  0e93               L3423:
6692                     ; 1142 			if(ind_U_set<1000) {
6694  0e93 9c            	rvf
6695  0e94 be56          	ldw	x,_ind_U_set
6696  0e96 a303e8        	cpw	x,#1000
6697  0e99 2e15          	jrsge	L5523
6698                     ; 1143 				int2ind_slkuf2(ind_U_set,0,3,1,1,0,1);
6700  0e9b 4b01          	push	#1
6701  0e9d 4b00          	push	#0
6702  0e9f 4b01          	push	#1
6703  0ea1 4b01          	push	#1
6704  0ea3 4b03          	push	#3
6705  0ea5 4b00          	push	#0
6706  0ea7 be56          	ldw	x,_ind_U_set
6707  0ea9 cd0418        	call	_int2ind_slkuf2
6709  0eac 5b06          	addw	sp,#6
6711  0eae 20a7          	jra	L3523
6712  0eb0               L5523:
6713                     ; 1145 				int2ind_slkuf2(ind_U_set/10,0,3,0,1,0,1);
6715  0eb0 4b01          	push	#1
6716  0eb2 4b00          	push	#0
6717  0eb4 4b01          	push	#1
6718  0eb6 4b00          	push	#0
6719  0eb8 4b03          	push	#3
6720  0eba 4b00          	push	#0
6721  0ebc be56          	ldw	x,_ind_U_set
6722  0ebe a60a          	ld	a,#10
6723  0ec0 cd0000        	call	c_sdivx
6725  0ec3 cd0418        	call	_int2ind_slkuf2
6727  0ec6 5b06          	addw	sp,#6
6728  0ec8 208d          	jra	L3523
6729  0eca               L3623:
6730                     ; 1164 			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,1);
6732  0eca 4b01          	push	#1
6733  0ecc 4b00          	push	#0
6734  0ece 4b00          	push	#0
6735  0ed0 4b02          	push	#2
6736  0ed2 4b04          	push	#4
6737  0ed4 4b00          	push	#0
6738  0ed6 be5c          	ldw	x,_time_set
6739  0ed8 90ae003c      	ldw	y,#60
6740  0edc 65            	divw	x,y
6741  0edd 51            	exgw	x,y
6742  0ede 1f07          	ldw	(OFST+5,sp),x
6743  0ee0 be5c          	ldw	x,_time_set
6744  0ee2 90ae003c      	ldw	y,#60
6745  0ee6 65            	divw	x,y
6746  0ee7 90ae0064      	ldw	y,#100
6747  0eeb cd0000        	call	c_imul
6749  0eee 72fb07        	addw	x,(OFST+5,sp)
6750  0ef1 cd04dc        	call	_int2ind_slkuf3
6752  0ef4 5b06          	addw	sp,#6
6753  0ef6 2055          	jra	L7313
6754  0ef8               L1623:
6755                     ; 1168 			if(time_set==0xffff)
6757  0ef8 be5c          	ldw	x,_time_set
6758  0efa a3ffff        	cpw	x,#65535
6759  0efd 2622          	jrne	L1723
6760                     ; 1170 				dig3[0]=0xbf;
6762  0eff 35bf0015      	mov	_dig3,#191
6763                     ; 1171 				dig3[1]=0xbf;
6765  0f03 35bf0016      	mov	_dig3+1,#191
6766                     ; 1172 				dig3[2]=0xbf;
6768  0f07 35bf0017      	mov	_dig3+2,#191
6769                     ; 1173 				dig3[3]=0xbf;
6771  0f0b 35bf0018      	mov	_dig3+3,#191
6772                     ; 1174 				dig3_[0]=0xbf;
6774  0f0f 35bf002d      	mov	_dig3_,#191
6775                     ; 1175 				dig3_[1]=0xbf;
6777  0f13 35bf002e      	mov	_dig3_+1,#191
6778                     ; 1176 				dig3_[2]=0xbf;
6780  0f17 35bf002f      	mov	_dig3_+2,#191
6781                     ; 1177 				dig3_[3]=0xbf;
6783  0f1b 35bf0030      	mov	_dig3_+3,#191
6785  0f1f 202c          	jra	L7313
6786  0f21               L1723:
6787                     ; 1179 			else int2ind_slkuf3(((time_set/60)*100)+(time_set%60),0,4,2,0,0,0);
6789  0f21 4b00          	push	#0
6790  0f23 4b00          	push	#0
6791  0f25 4b00          	push	#0
6792  0f27 4b02          	push	#2
6793  0f29 4b04          	push	#4
6794  0f2b 4b00          	push	#0
6795  0f2d be5c          	ldw	x,_time_set
6796  0f2f 90ae003c      	ldw	y,#60
6797  0f33 65            	divw	x,y
6798  0f34 51            	exgw	x,y
6799  0f35 1f07          	ldw	(OFST+5,sp),x
6800  0f37 be5c          	ldw	x,_time_set
6801  0f39 90ae003c      	ldw	y,#60
6802  0f3d 65            	divw	x,y
6803  0f3e 90ae0064      	ldw	y,#100
6804  0f42 cd0000        	call	c_imul
6806  0f45 72fb07        	addw	x,(OFST+5,sp)
6807  0f48 cd04dc        	call	_int2ind_slkuf3
6809  0f4b 5b06          	addw	sp,#6
6810  0f4d               L7313:
6811                     ; 1189 }
6814  0f4d 85            	popw	x
6815  0f4e 81            	ret
6844                     ; 1192 void can_tx_hndl(void)
6844                     ; 1193 {
6845                     	switch	.text
6846  0f4f               _can_tx_hndl:
6850                     ; 1195 if(bTX_FREE)
6852  0f4f 3d35          	tnz	_bTX_FREE
6853  0f51 2754          	jreq	L5033
6854                     ; 1197 	if(can_buff_rd_ptr!=can_buff_wr_ptr)
6856  0f53 b63a          	ld	a,_can_buff_rd_ptr
6857  0f55 b13b          	cp	a,_can_buff_wr_ptr
6858  0f57 275c          	jreq	L3133
6859                     ; 1199 		bTX_FREE=0;
6861  0f59 3f35          	clr	_bTX_FREE
6862                     ; 1201 		CAN->PSR= 0;
6864  0f5b 725f5427      	clr	21543
6865                     ; 1202 		CAN->Page.TxMailbox.MDLCR=8;
6867  0f5f 35085429      	mov	21545,#8
6868                     ; 1203 		CAN->Page.TxMailbox.MIDR1=can_out_buff[can_buff_rd_ptr][0];
6870  0f63 b63a          	ld	a,_can_buff_rd_ptr
6871  0f65 97            	ld	xl,a
6872  0f66 a610          	ld	a,#16
6873  0f68 42            	mul	x,a
6874  0f69 d60001        	ld	a,(_can_out_buff,x)
6875  0f6c c7542a        	ld	21546,a
6876                     ; 1204 		CAN->Page.TxMailbox.MIDR2=can_out_buff[can_buff_rd_ptr][1];
6878  0f6f b63a          	ld	a,_can_buff_rd_ptr
6879  0f71 97            	ld	xl,a
6880  0f72 a610          	ld	a,#16
6881  0f74 42            	mul	x,a
6882  0f75 d60002        	ld	a,(_can_out_buff+1,x)
6883  0f78 c7542b        	ld	21547,a
6884                     ; 1206 		memcpy(&CAN->Page.TxMailbox.MDAR1, &can_out_buff[can_buff_rd_ptr][2],8);
6886  0f7b b63a          	ld	a,_can_buff_rd_ptr
6887  0f7d 97            	ld	xl,a
6888  0f7e a610          	ld	a,#16
6889  0f80 42            	mul	x,a
6890  0f81 1c0003        	addw	x,#_can_out_buff+2
6891  0f84 bf00          	ldw	c_x,x
6892  0f86 ae0008        	ldw	x,#8
6893  0f89               L661:
6894  0f89 5a            	decw	x
6895  0f8a 92d600        	ld	a,([c_x.w],x)
6896  0f8d d7542e        	ld	(21550,x),a
6897  0f90 5d            	tnzw	x
6898  0f91 26f6          	jrne	L661
6899                     ; 1208 		can_buff_rd_ptr++;
6901  0f93 3c3a          	inc	_can_buff_rd_ptr
6902                     ; 1209 		if(can_buff_rd_ptr>3)can_buff_rd_ptr=0;
6904  0f95 b63a          	ld	a,_can_buff_rd_ptr
6905  0f97 a104          	cp	a,#4
6906  0f99 2502          	jrult	L1133
6909  0f9b 3f3a          	clr	_can_buff_rd_ptr
6910  0f9d               L1133:
6911                     ; 1211 		CAN->Page.TxMailbox.MCSR|= CAN_MCSR_TXRQ;
6913  0f9d 72105428      	bset	21544,#0
6914                     ; 1212 		CAN->IER|=(1<<0);
6916  0fa1 72105425      	bset	21541,#0
6917  0fa5 200e          	jra	L3133
6918  0fa7               L5033:
6919                     ; 1217 	tx_busy_cnt++;
6921  0fa7 3c39          	inc	_tx_busy_cnt
6922                     ; 1218 	if(tx_busy_cnt>=100)
6924  0fa9 b639          	ld	a,_tx_busy_cnt
6925  0fab a164          	cp	a,#100
6926  0fad 2506          	jrult	L3133
6927                     ; 1220 		tx_busy_cnt=0;
6929  0faf 3f39          	clr	_tx_busy_cnt
6930                     ; 1221 		bTX_FREE=1;
6932  0fb1 35010035      	mov	_bTX_FREE,#1
6933  0fb5               L3133:
6934                     ; 1224 }
6937  0fb5 81            	ret
6960                     ; 1228 void t4_init(void){
6961                     	switch	.text
6962  0fb6               _t4_init:
6966                     ; 1229 	TIM4->PSCR = 7;
6968  0fb6 35075345      	mov	21317,#7
6969                     ; 1230 	TIM4->ARR= 66;
6971  0fba 35425346      	mov	21318,#66
6972                     ; 1231 	TIM4->IER|= TIM4_IER_UIE;					// enable break interrupt
6974  0fbe 72105341      	bset	21313,#0
6975                     ; 1233 	TIM4->CR1=(TIM4_CR1_URS | TIM4_CR1_CEN | TIM4_CR1_ARPE);	
6977  0fc2 35855340      	mov	21312,#133
6978                     ; 1235 }
6981  0fc6 81            	ret
7004                     ; 1238 void t1_init(void)
7004                     ; 1239 {
7005                     	switch	.text
7006  0fc7               _t1_init:
7010                     ; 1240 TIM1->ARRH= 0x03;
7012  0fc7 35035262      	mov	21090,#3
7013                     ; 1241 TIM1->ARRL= 0xff;
7015  0fcb 35ff5263      	mov	21091,#255
7016                     ; 1242 TIM1->CCR1H= 0x00;	
7018  0fcf 725f5265      	clr	21093
7019                     ; 1243 TIM1->CCR1L= 0xff;
7021  0fd3 35ff5266      	mov	21094,#255
7022                     ; 1244 TIM1->CCR2H= 0x00;	
7024  0fd7 725f5267      	clr	21095
7025                     ; 1245 TIM1->CCR2L= 0x00;
7027  0fdb 725f5268      	clr	21096
7028                     ; 1247 TIM1->CCMR1= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE; //OC2 toggle mode, prelouded
7030  0fdf 35685258      	mov	21080,#104
7031                     ; 1248 TIM1->CCMR2= ((6<<4) & TIM1_CCMR_OCM) | TIM1_CCMR_OCxPE; //OC2 toggle mode, prelouded
7033  0fe3 35685259      	mov	21081,#104
7034                     ; 1249 TIM1->CCER1= TIM1_CCER1_CC1E | TIM1_CCER1_CC2E ; //OC1, OC2 output pins enabled
7036  0fe7 3511525c      	mov	21084,#17
7037                     ; 1251 TIM1->CR1=(TIM1_CR1_CEN | TIM1_CR1_ARPE);
7039  0feb 35815250      	mov	21072,#129
7040                     ; 1252 TIM1->BKR|= TIM1_BKR_AOE;
7042  0fef 721c526d      	bset	21101,#6
7043                     ; 1253 }
7046  0ff3 81            	ret
7102                     ; 1261 @far @interrupt void TIM4_UPD_Interrupt (void) 
7102                     ; 1262 {
7104                     	switch	.text
7105  0ff4               f_TIM4_UPD_Interrupt:
7107  0ff4 3b0002        	push	c_x+2
7108  0ff7 be00          	ldw	x,c_x
7109  0ff9 89            	pushw	x
7110  0ffa 3b0002        	push	c_y+2
7111  0ffd be00          	ldw	x,c_y
7112  0fff 89            	pushw	x
7115                     ; 1263 TIM4->SR1&=~TIM4_SR1_UIF;
7117  1000 72115342      	bres	21314,#0
7118                     ; 1269 cnt_T4++;
7120  1004 3c53          	inc	_cnt_T4
7121                     ; 1270 if(cnt_T4>=3)cnt_T4=0;
7123  1006 b653          	ld	a,_cnt_T4
7124  1008 a103          	cp	a,#3
7125  100a 2502          	jrult	L7433
7128  100c 3f53          	clr	_cnt_T4
7129  100e               L7433:
7130                     ; 1274 if(!cnt_T4)
7132  100e 3d53          	tnz	_cnt_T4
7133  1010 2655          	jrne	L1533
7134                     ; 1276 	strob_cnt++;
7136  1012 3c52          	inc	_strob_cnt
7137                     ; 1277 	if(strob_cnt>=4)strob_cnt=0;
7139  1014 b652          	ld	a,_strob_cnt
7140  1016 a104          	cp	a,#4
7141  1018 2502          	jrult	L3533
7144  101a 3f52          	clr	_strob_cnt
7145  101c               L3533:
7146                     ; 1278 	(GPIOB->ODR)=(GPIOB->ODR)|0x0f;
7148  101c c65005        	ld	a,20485
7149  101f aa0f          	or	a,#15
7150  1021 c75005        	ld	20485,a
7151                     ; 1280 	GPIOD->ODR=dig1[strob_cnt];
7153  1024 b652          	ld	a,_strob_cnt
7154  1026 5f            	clrw	x
7155  1027 97            	ld	xl,a
7156  1028 e605          	ld	a,(_dig1,x)
7157  102a c7500f        	ld	20495,a
7158                     ; 1281 	spi(dig2[strob_cnt]);
7160  102d b652          	ld	a,_strob_cnt
7161  102f 5f            	clrw	x
7162  1030 97            	ld	xl,a
7163  1031 e60d          	ld	a,(_dig2,x)
7164  1033 cd02b6        	call	_spi
7166                     ; 1282 	GPIOC->ODR&=~(1<<2);
7168  1036 7215500a      	bres	20490,#2
7169                     ; 1283 	GPIOC->ODR|=(1<<2);
7171  103a 7214500a      	bset	20490,#2
7172                     ; 1284 	spi(dig3[strob_cnt]);
7174  103e b652          	ld	a,_strob_cnt
7175  1040 5f            	clrw	x
7176  1041 97            	ld	xl,a
7177  1042 e615          	ld	a,(_dig3,x)
7178  1044 cd02b6        	call	_spi
7180                     ; 1285 	GPIOC->ODR&=~(1<<3);
7182  1047 7217500a      	bres	20490,#3
7183                     ; 1286 	GPIOC->ODR|=(1<<3);
7185  104b 7216500a      	bset	20490,#3
7186                     ; 1288 	(GPIOB->ODR)&=~(1<<(3-strob_cnt));
7188  104f a603          	ld	a,#3
7189  1051 b052          	sub	a,_strob_cnt
7190  1053 5f            	clrw	x
7191  1054 97            	ld	xl,a
7192  1055 a601          	ld	a,#1
7193  1057 5d            	tnzw	x
7194  1058 2704          	jreq	L671
7195  105a               L002:
7196  105a 48            	sll	a
7197  105b 5a            	decw	x
7198  105c 26fc          	jrne	L002
7199  105e               L671:
7200  105e 43            	cpl	a
7201  105f c45005        	and	a,20485
7202  1062 c75005        	ld	20485,a
7204  1065 2031          	jra	L5533
7205  1067               L1533:
7206                     ; 1290 else if(cnt_T4==2)
7208  1067 b653          	ld	a,_cnt_T4
7209  1069 a102          	cp	a,#2
7210  106b 262b          	jrne	L5533
7211                     ; 1292 	GPIOD->ODR=dig1_[strob_cnt];
7213  106d b652          	ld	a,_strob_cnt
7214  106f 5f            	clrw	x
7215  1070 97            	ld	xl,a
7216  1071 e61d          	ld	a,(_dig1_,x)
7217  1073 c7500f        	ld	20495,a
7218                     ; 1293 	spi(dig2_[strob_cnt]);
7220  1076 b652          	ld	a,_strob_cnt
7221  1078 5f            	clrw	x
7222  1079 97            	ld	xl,a
7223  107a e625          	ld	a,(_dig2_,x)
7224  107c cd02b6        	call	_spi
7226                     ; 1294 	GPIOC->ODR&=~(1<<2);
7228  107f 7215500a      	bres	20490,#2
7229                     ; 1295 	GPIOC->ODR|=(1<<2);
7231  1083 7214500a      	bset	20490,#2
7232                     ; 1296 	spi(dig3_[strob_cnt]);
7234  1087 b652          	ld	a,_strob_cnt
7235  1089 5f            	clrw	x
7236  108a 97            	ld	xl,a
7237  108b e62d          	ld	a,(_dig3_,x)
7238  108d cd02b6        	call	_spi
7240                     ; 1297 	GPIOC->ODR&=~(1<<3);
7242  1090 7217500a      	bres	20490,#3
7243                     ; 1298 	GPIOC->ODR|=(1<<3);
7245  1094 7216500a      	bset	20490,#3
7246  1098               L5533:
7247                     ; 1302 if(++t0_cnt0>=12)
7249  1098 3c00          	inc	_t0_cnt0
7250  109a b600          	ld	a,_t0_cnt0
7251  109c a10c          	cp	a,#12
7252  109e 2556          	jrult	L1633
7253                     ; 1304 	b100Hz=1;
7255  10a0 72100010      	bset	_b100Hz
7256                     ; 1305 	t0_cnt0=0;
7258  10a4 3f00          	clr	_t0_cnt0
7259                     ; 1306 	if(++t0_cnt1>=10)
7261  10a6 3c01          	inc	_t0_cnt1
7262  10a8 b601          	ld	a,_t0_cnt1
7263  10aa a10a          	cp	a,#10
7264  10ac 2506          	jrult	L3633
7265                     ; 1308 		t0_cnt1=0;
7267  10ae 3f01          	clr	_t0_cnt1
7268                     ; 1309 		b10Hz=1;
7270  10b0 7210000f      	bset	_b10Hz
7271  10b4               L3633:
7272                     ; 1311 	if(++t0_cnt2>=20)
7274  10b4 3c02          	inc	_t0_cnt2
7275  10b6 b602          	ld	a,_t0_cnt2
7276  10b8 a114          	cp	a,#20
7277  10ba 2512          	jrult	L5633
7278                     ; 1313 		t0_cnt2=0;
7280  10bc 3f02          	clr	_t0_cnt2
7281                     ; 1314 		b5Hz=1;
7283  10be 7210000e      	bset	_b5Hz
7284                     ; 1315 		if(bFL5)bFL5=0;
7286  10c2 3d3f          	tnz	_bFL5
7287  10c4 2704          	jreq	L7633
7290  10c6 3f3f          	clr	_bFL5
7292  10c8 2004          	jra	L5633
7293  10ca               L7633:
7294                     ; 1316 		else bFL5=1;
7296  10ca 3501003f      	mov	_bFL5,#1
7297  10ce               L5633:
7298                     ; 1318 	if(++t0_cnt4>=50)
7300  10ce 3c04          	inc	_t0_cnt4
7301  10d0 b604          	ld	a,_t0_cnt4
7302  10d2 a132          	cp	a,#50
7303  10d4 2512          	jrult	L3733
7304                     ; 1320 		t0_cnt4=0;
7306  10d6 3f04          	clr	_t0_cnt4
7307                     ; 1321 		b2Hz=1;
7309  10d8 7210000d      	bset	_b2Hz
7310                     ; 1322 		if(bFL2)bFL2=0;
7312  10dc 3d3e          	tnz	_bFL2
7313  10de 2704          	jreq	L5733
7316  10e0 3f3e          	clr	_bFL2
7318  10e2 2004          	jra	L3733
7319  10e4               L5733:
7320                     ; 1323 		else bFL2=1;
7322  10e4 3501003e      	mov	_bFL2,#1
7323  10e8               L3733:
7324                     ; 1325 	if(++t0_cnt3>=100)
7326  10e8 3c03          	inc	_t0_cnt3
7327  10ea b603          	ld	a,_t0_cnt3
7328  10ec a164          	cp	a,#100
7329  10ee 2506          	jrult	L1633
7330                     ; 1327 		t0_cnt3=0;
7332  10f0 3f03          	clr	_t0_cnt3
7333                     ; 1328 		b1Hz=1;
7335  10f2 7210000c      	bset	_b1Hz
7336  10f6               L1633:
7337                     ; 1332 if(modbusTimeOutCnt<6)
7339  10f6 b67b          	ld	a,_modbusTimeOutCnt
7340  10f8 a106          	cp	a,#6
7341  10fa 240e          	jruge	L3043
7342                     ; 1334 	modbusTimeOutCnt++;
7344  10fc 3c7b          	inc	_modbusTimeOutCnt
7345                     ; 1335 	if(modbusTimeOutCnt>=6)
7347  10fe b67b          	ld	a,_modbusTimeOutCnt
7348  1100 a106          	cp	a,#6
7349  1102 2510          	jrult	L7043
7350                     ; 1337 		bMODBUS_TIMEOUT=1;
7352  1104 3501007c      	mov	_bMODBUS_TIMEOUT,#1
7353  1108 200a          	jra	L7043
7354  110a               L3043:
7355                     ; 1341 else if (modbusTimeOutCnt>6)
7357  110a b67b          	ld	a,_modbusTimeOutCnt
7358  110c a107          	cp	a,#7
7359  110e 2504          	jrult	L7043
7360                     ; 1343 	modbusTimeOutCnt=0;
7362  1110 3f7b          	clr	_modbusTimeOutCnt
7363                     ; 1344 	bMODBUS_TIMEOUT=0;
7365  1112 3f7c          	clr	_bMODBUS_TIMEOUT
7366  1114               L7043:
7367                     ; 1349 if(GPIOB->IDR&(1<<6))encApin=1;
7369  1114 c65006        	ld	a,20486
7370  1117 a540          	bcp	a,#64
7371  1119 2706          	jreq	L3143
7374  111b 72100009      	bset	_encApin
7376  111f 2004          	jra	L5143
7377  1121               L3143:
7378                     ; 1350 else encApin=0;
7380  1121 72110009      	bres	_encApin
7381  1125               L5143:
7382                     ; 1352 if(GPIOB->IDR&(1<<4))encBpin=1;
7384  1125 c65006        	ld	a,20486
7385  1128 a510          	bcp	a,#16
7386  112a 2706          	jreq	L7143
7389  112c 72100008      	bset	_encBpin
7391  1130 2004          	jra	L1243
7392  1132               L7143:
7393                     ; 1353 else encBpin=0;
7395  1132 72110008      	bres	_encBpin
7396  1136               L1243:
7397                     ; 1355 if(encApin_old==encApin)
7399  1136 7201000707    	btjf	_encApin_old,L202
7400  113b 720100093b    	btjf	_encApin,L3243
7401  1140 2005          	jra	L402
7402  1142               L202:
7403  1142 7200000934    	btjt	_encApin,L3243
7404  1147               L402:
7405                     ; 1357 	if(encAcnt<3)
7407  1147 b621          	ld	a,_encAcnt
7408  1149 a103          	cp	a,#3
7409  114b 2430          	jruge	L5343
7410                     ; 1359 		encAcnt++;
7412  114d 3c21          	inc	_encAcnt
7413                     ; 1360 		if(encAcnt>=3)
7415  114f b621          	ld	a,_encAcnt
7416  1151 a103          	cp	a,#3
7417  1153 2528          	jrult	L5343
7418                     ; 1362 			encA=encApin;
7420                     	btst		_encApin
7421  115a 90110005      	bccm	_encA
7422                     ; 1363 			if(encA==encB)encCW=1;
7424  115e 7201000507    	btjf	_encA,L602
7425  1163 720100040d    	btjf	_encB,L1343
7426  1168 2005          	jra	L012
7427  116a               L602:
7428  116a 7200000406    	btjt	_encB,L1343
7429  116f               L012:
7432  116f 72100003      	bset	_encCW
7434  1173 2008          	jra	L5343
7435  1175               L1343:
7436                     ; 1364 			else encOW=1;
7438  1175 72100002      	bset	_encOW
7439  1179 2002          	jra	L5343
7440  117b               L3243:
7441                     ; 1368 else encAcnt=0;
7443  117b 3f21          	clr	_encAcnt
7444  117d               L5343:
7445                     ; 1370 if(encBpin_old==encBpin)
7447  117d 7201000607    	btjf	_encBpin_old,L212
7448  1182 7201000820    	btjf	_encBpin,L7343
7449  1187 2005          	jra	L412
7450  1189               L212:
7451  1189 7200000819    	btjt	_encBpin,L7343
7452  118e               L412:
7453                     ; 1372 	if(encBcnt<3)
7455  118e b620          	ld	a,_encBcnt
7456  1190 a103          	cp	a,#3
7457  1192 2415          	jruge	L5443
7458                     ; 1374 		encBcnt++;
7460  1194 3c20          	inc	_encBcnt
7461                     ; 1375 		if(encBcnt>=3)
7463  1196 b620          	ld	a,_encBcnt
7464  1198 a103          	cp	a,#3
7465  119a 250d          	jrult	L5443
7466                     ; 1377 			encB=encBpin;
7468                     	btst		_encBpin
7469  11a1 90110004      	bccm	_encB
7470  11a5 2002          	jra	L5443
7471  11a7               L7343:
7472                     ; 1381 else encBcnt=0;
7474  11a7 3f20          	clr	_encBcnt
7475  11a9               L5443:
7476                     ; 1386 encApin_old=encApin;
7478                     	btst		_encApin
7479  11ae 90110007      	bccm	_encApin_old
7480                     ; 1387 encBpin_old=encBpin;
7482                     	btst		_encBpin
7483  11b7 90110006      	bccm	_encBpin_old
7484                     ; 1389 }
7487  11bb 85            	popw	x
7488  11bc bf00          	ldw	c_y,x
7489  11be 320002        	pop	c_y+2
7490  11c1 85            	popw	x
7491  11c2 bf00          	ldw	c_x,x
7492  11c4 320002        	pop	c_x+2
7493  11c7 80            	iret
7518                     ; 1392 @far @interrupt void CAN_RX_Interrupt (void) 
7518                     ; 1393 {
7519                     	switch	.text
7520  11c8               f_CAN_RX_Interrupt:
7524                     ; 1395 CAN->PSR= 7;	
7526  11c8 35075427      	mov	21543,#7
7527                     ; 1400 memcpy(&mess[0], &CAN->Page.RxFIFO.MFMI, 14); // compare the message content
7529  11cc ae000e        	ldw	x,#14
7530  11cf               L022:
7531  11cf d65427        	ld	a,(21543,x)
7532  11d2 e727          	ld	(_mess-1,x),a
7533  11d4 5a            	decw	x
7534  11d5 26f8          	jrne	L022
7535                     ; 1411 bCAN_RX=1;
7537  11d7 35010036      	mov	_bCAN_RX,#1
7538                     ; 1412 CAN->RFR|=(1<<5);
7540  11db 721a5424      	bset	21540,#5
7541                     ; 1414 }
7544  11df 80            	iret
7567                     ; 1417 @far @interrupt void CAN_TX_Interrupt (void) 
7567                     ; 1418 {
7568                     	switch	.text
7569  11e0               f_CAN_TX_Interrupt:
7573                     ; 1419 if((CAN->TSR)&(1<<0))
7575  11e0 c65422        	ld	a,21538
7576  11e3 a501          	bcp	a,#1
7577  11e5 2708          	jreq	L7643
7578                     ; 1421 	bTX_FREE=1;	
7580  11e7 35010035      	mov	_bTX_FREE,#1
7581                     ; 1423 	CAN->TSR|=(1<<0);
7583  11eb 72105422      	bset	21538,#0
7584  11ef               L7643:
7585                     ; 1425 }
7588  11ef 80            	iret
7621                     ; 1428 @far @interrupt void ADC2_EOC_Interrupt (void) {
7622                     	switch	.text
7623  11f0               f_ADC2_EOC_Interrupt:
7625       00000004      OFST:	set	4
7626  11f0 5204          	subw	sp,#4
7629                     ; 1432 GPIOE->ODR|=(1<<6);
7631  11f2 721c5014      	bset	20500,#6
7632                     ; 1434 ADC2->CSR&=~(1<<7);
7634  11f6 721f5400      	bres	21504,#7
7635                     ; 1436 temp_adc=(((short)(ADC2->DRH))<<8)+((short)(ADC2->DRL));
7637  11fa c65405        	ld	a,21509
7638  11fd 5f            	clrw	x
7639  11fe 97            	ld	xl,a
7640  11ff 1f01          	ldw	(OFST-3,sp),x
7641  1201 c65404        	ld	a,21508
7642  1204 5f            	clrw	x
7643  1205 97            	ld	xl,a
7644  1206 4f            	clr	a
7645  1207 02            	rlwa	x,a
7646  1208 72fb01        	addw	x,(OFST-3,sp)
7647                     ; 1444 GPIOE->ODR&=~(1<<6);
7649  120b 721d5014      	bres	20500,#6
7650                     ; 1446 }
7653  120f 5b04          	addw	sp,#4
7654  1211 80            	iret
7693                     ; 1449 @far @interrupt void UART1TxInterrupt (void) 
7693                     ; 1450 {
7694                     	switch	.text
7695  1212               f_UART1TxInterrupt:
7697       00000001      OFST:	set	1
7698  1212 88            	push	a
7701                     ; 1453 tx_status=UART1->SR;
7703  1213 c65230        	ld	a,21040
7704  1216 6b01          	ld	(OFST+0,sp),a
7705                     ; 1455 if (tx_status & (UART1_SR_TXE))
7707  1218 7b01          	ld	a,(OFST+0,sp)
7708  121a a580          	bcp	a,#128
7709  121c 272a          	jreq	L5253
7710                     ; 1457 	if (tx_counter1)
7712  121e 3d0b          	tnz	_tx_counter1
7713  1220 271a          	jreq	L7253
7714                     ; 1459 		--tx_counter1;
7716  1222 3a0b          	dec	_tx_counter1
7717                     ; 1460 		UART1->DR=tx_buffer1[tx_rd_index1];
7719  1224 5f            	clrw	x
7720  1225 b609          	ld	a,_tx_rd_index1
7721  1227 2a01          	jrpl	L032
7722  1229 53            	cplw	x
7723  122a               L032:
7724  122a 97            	ld	xl,a
7725  122b e639          	ld	a,(_tx_buffer1,x)
7726  122d c75231        	ld	21041,a
7727                     ; 1461 		if (++tx_rd_index1 == TX_BUFFER_SIZE1) tx_rd_index1=0;
7729  1230 3c09          	inc	_tx_rd_index1
7730  1232 b609          	ld	a,_tx_rd_index1
7731  1234 a140          	cp	a,#64
7732  1236 2610          	jrne	L5253
7735  1238 3f09          	clr	_tx_rd_index1
7736  123a 200c          	jra	L5253
7737  123c               L7253:
7738                     ; 1465 		tx_stat_cnt=3;
7740  123c 35030000      	mov	_tx_stat_cnt,#3
7741                     ; 1466 			bOUT_FREE=1;
7743  1240 35010002      	mov	_bOUT_FREE,#1
7744                     ; 1467 			UART1->CR2&= ~UART1_CR2_TIEN;
7746  1244 721f5235      	bres	21045,#7
7747  1248               L5253:
7748                     ; 1471 if (tx_status & (UART1_SR_TC))
7750  1248 7b01          	ld	a,(OFST+0,sp)
7751  124a a540          	bcp	a,#64
7752  124c 270a          	jreq	L5353
7753                     ; 1473 	GPIOA->ODR&=~(1<<6);
7755  124e 721d5000      	bres	20480,#6
7756                     ; 1474 	tx_stat=txsOFF;
7758  1252 3f79          	clr	_tx_stat
7759                     ; 1475 	UART1->SR&=~UART1_SR_TC;
7761  1254 721d5230      	bres	21040,#6
7762  1258               L5353:
7763                     ; 1477 }
7766  1258 84            	pop	a
7767  1259 80            	iret
7822                     ; 1480 @far @interrupt void UART1RxInterrupt (void) 
7822                     ; 1481 {
7823                     	switch	.text
7824  125a               f_UART1RxInterrupt:
7826       00000003      OFST:	set	3
7827  125a 5203          	subw	sp,#3
7830                     ; 1484 rx_status=UART1->SR;
7832  125c c65230        	ld	a,21040
7833  125f 6b02          	ld	(OFST-1,sp),a
7834                     ; 1485 rx_data=UART1->DR;
7836  1261 c65231        	ld	a,21041
7837  1264 6b03          	ld	(OFST+0,sp),a
7838                     ; 1495 if ((rx_status & (UART1_SR_RXNE))&&(tx_stat!=tsON))
7840  1266 7b02          	ld	a,(OFST-1,sp)
7841  1268 a520          	bcp	a,#32
7842  126a 2716          	jreq	L5653
7844  126c b679          	ld	a,_tx_stat
7845  126e a101          	cp	a,#1
7846  1270 2710          	jreq	L5653
7847                     ; 1498 	temp=rx_data;
7849                     ; 1499 	rx_buffer[rx_wr_index1]=rx_data;
7851  1272 7b03          	ld	a,(OFST+0,sp)
7852  1274 be05          	ldw	x,_rx_wr_index1
7853  1276 d70000        	ld	(_rx_buffer,x),a
7854                     ; 1501 	rx_wr_index1++;
7856  1279 be05          	ldw	x,_rx_wr_index1
7857  127b 1c0001        	addw	x,#1
7858  127e bf05          	ldw	_rx_wr_index1,x
7859                     ; 1503 	modbusTimeOutCnt=0;
7861  1280 3f7b          	clr	_modbusTimeOutCnt
7862  1282               L5653:
7863                     ; 1507 }
7866  1282 5b03          	addw	sp,#3
7867  1284 80            	iret
7914                     ; 1515 main()
7914                     ; 1516 {
7916                     	switch	.text
7917  1285               _main:
7919  1285 5205          	subw	sp,#5
7920       00000005      OFST:	set	5
7923                     ; 1518 CLK->ECKR|=1;
7925  1287 721050c1      	bset	20673,#0
7927  128b               L1063:
7928                     ; 1519 while((CLK->ECKR & 2) == 0);
7930  128b c650c1        	ld	a,20673
7931  128e a502          	bcp	a,#2
7932  1290 27f9          	jreq	L1063
7933                     ; 1520 CLK->SWCR|=2;
7935  1292 721250c5      	bset	20677,#1
7936                     ; 1521 CLK->SWR=0xB4;
7938  1296 35b450c4      	mov	20676,#180
7939                     ; 1523 delay_ms(200);
7941  129a ae00c8        	ldw	x,#200
7942  129d cd0000        	call	_delay_ms
7944                     ; 1524 FLASH_DUKR=0xae;
7946  12a0 35ae5064      	mov	_FLASH_DUKR,#174
7947                     ; 1525 FLASH_DUKR=0x56;
7949  12a4 35565064      	mov	_FLASH_DUKR,#86
7950                     ; 1526 enableInterrupts();
7953  12a8 9a            rim
7955                     ; 1528 GPIOB->DDR|=0x0f;
7958  12a9 c65007        	ld	a,20487
7959  12ac aa0f          	or	a,#15
7960  12ae c75007        	ld	20487,a
7961                     ; 1529 GPIOB->CR1&=~(0x0f);
7963  12b1 c65008        	ld	a,20488
7964  12b4 a4f0          	and	a,#240
7965  12b6 c75008        	ld	20488,a
7966                     ; 1530 GPIOB->CR2&=~(0x0f);
7968  12b9 c65009        	ld	a,20489
7969  12bc a4f0          	and	a,#240
7970  12be c75009        	ld	20489,a
7971                     ; 1532 GPIOD->DDR|=0xff;
7973  12c1 c65011        	ld	a,20497
7974  12c4 aaff          	or	a,#255
7975  12c6 c75011        	ld	20497,a
7976                     ; 1533 GPIOD->CR1&=~(0xff);
7978  12c9 c65012        	ld	a,20498
7979  12cc a400          	and	a,#0
7980  12ce c75012        	ld	20498,a
7981                     ; 1534 GPIOD->CR2&=~(0xff);
7983  12d1 c65013        	ld	a,20499
7984  12d4 a400          	and	a,#0
7985  12d6 c75013        	ld	20499,a
7986                     ; 1536 GPIOB->DDR&=~(1<<5);
7988  12d9 721b5007      	bres	20487,#5
7989                     ; 1537 GPIOB->CR1|=(1<<5);
7991  12dd 721a5008      	bset	20488,#5
7992                     ; 1539 GPIOB->DDR&=~(1<<4);
7994  12e1 72195007      	bres	20487,#4
7995                     ; 1540 GPIOB->CR1|=(1<<4);
7997  12e5 72185008      	bset	20488,#4
7998                     ; 1543 GPIOB->DDR&=~(1<<6);
8000  12e9 721d5007      	bres	20487,#6
8001                     ; 1544 GPIOB->CR1|=(1<<6);/*
8003  12ed 721c5008      	bset	20488,#6
8004                     ; 1547 GPIOB->DDR&=~(1<<7);
8006  12f1 721f5007      	bres	20487,#7
8007                     ; 1548 GPIOB->CR1|=(1<<7);
8009  12f5 721e5008      	bset	20488,#7
8010                     ; 1550 GPIOE->DDR&=~(1<<0);
8012  12f9 72115016      	bres	20502,#0
8013                     ; 1551 GPIOE->CR1|=(1<<0);
8015  12fd 72105017      	bset	20503,#0
8016                     ; 1553 GPIOE->DDR&=~(1<<1);
8018  1301 72135016      	bres	20502,#1
8019                     ; 1554 GPIOE->CR1|=(1<<1);
8021  1305 72125017      	bset	20503,#1
8022                     ; 1565 t4_init();
8024  1309 cd0fb6        	call	_t4_init
8026                     ; 1566 spi_init();
8028  130c cd0259        	call	_spi_init
8030                     ; 1608 uart1_init();
8032  130f cd085d        	call	_uart1_init
8034  1312               L5063:
8035                     ; 1625 	if(bMODBUS_TIMEOUT)
8037  1312 3d7c          	tnz	_bMODBUS_TIMEOUT
8038  1314 2705          	jreq	L1163
8039                     ; 1627 		bMODBUS_TIMEOUT=0;
8041  1316 3f7c          	clr	_bMODBUS_TIMEOUT
8042                     ; 1629 		modbus_in();
8044  1318 cd009f        	call	_modbus_in
8046  131b               L1163:
8047                     ; 1637 	if(b100Hz)
8049                     	btst	_b100Hz
8050  1320 2413          	jruge	L3163
8051                     ; 1639 		b100Hz=0;
8053  1322 72110010      	bres	_b100Hz
8054                     ; 1645 		can_tx_hndl();
8056  1326 cd0f4f        	call	_can_tx_hndl
8058                     ; 1647 		enc_but_drv();
8060  1329 cd0606        	call	_enc_but_drv
8062                     ; 1648 		enc_an();
8064  132c cd0626        	call	_enc_an
8066                     ; 1650 		tmblr_drv();
8068  132f cd0580        	call	_tmblr_drv
8070                     ; 1651 		but_drv();	
8072  1332 cd05c4        	call	_but_drv
8074  1335               L3163:
8075                     ; 1654 	if(b10Hz)
8077                     	btst	_b10Hz
8078  133a 2407          	jruge	L5163
8079                     ; 1656 		b10Hz=0;
8081  133c 7211000f      	bres	_b10Hz
8082                     ; 1658 		ind_hndl();
8084  1340 cd0a0e        	call	_ind_hndl
8086  1343               L5163:
8087                     ; 1665 	if(b5Hz)
8089                     	btst	_b5Hz
8090  1348 2459          	jruge	L7163
8091                     ; 1667 		b5Hz=0;
8093  134a 7211000e      	bres	_b5Hz
8094                     ; 1669 		GPIOE->DDR|=(1<<1);
8096  134e 72125016      	bset	20502,#1
8097                     ; 1670 		GPIOE->CR1|=(1<<1);
8099  1352 72125017      	bset	20503,#1
8100                     ; 1671 		GPIOE->CR2|=(1<<1);		
8102  1356 72125018      	bset	20504,#1
8103                     ; 1673 		GPIOE->ODR^=(1<<1);
8105  135a c65014        	ld	a,20500
8106  135d a802          	xor	a,	#2
8107  135f c75014        	ld	20500,a
8108                     ; 1675 		modbus_write_request(200,6,1,(enc_cmnd_cnt&0x0f)+(((cmnd<<4)&0xf0)+(tmblr_state&0x01)<<15)+((enc_cmnd&0x7f)<<8));
8110  1362 b614          	ld	a,_enc_cmnd+1
8111  1364 a47f          	and	a,#127
8112  1366 5f            	clrw	x
8113  1367 97            	ld	xl,a
8114  1368 4f            	clr	a
8115  1369 02            	rlwa	x,a
8116  136a 1f04          	ldw	(OFST-1,sp),x
8117  136c b670          	ld	a,_tmblr_state
8118  136e a401          	and	a,#1
8119  1370 6b03          	ld	(OFST-2,sp),a
8120  1372 b615          	ld	a,_cmnd
8121  1374 97            	ld	xl,a
8122  1375 a610          	ld	a,#16
8123  1377 42            	mul	x,a
8124  1378 9f            	ld	a,xl
8125  1379 a4f0          	and	a,#240
8126  137b 5f            	clrw	x
8127  137c 1b03          	add	a,(OFST-2,sp)
8128  137e 2401          	jrnc	L632
8129  1380 5c            	incw	x
8130  1381               L632:
8131  1381 02            	rlwa	x,a
8132  1382 54            	srlw	x
8133  1383 5f            	clrw	x
8134  1384 56            	rrcw	x
8135  1385 1f01          	ldw	(OFST-4,sp),x
8136  1387 b612          	ld	a,_enc_cmnd_cnt+1
8137  1389 a40f          	and	a,#15
8138  138b 5f            	clrw	x
8139  138c 97            	ld	xl,a
8140  138d 72fb01        	addw	x,(OFST-4,sp)
8141  1390 72fb04        	addw	x,(OFST-1,sp)
8142  1393 89            	pushw	x
8143  1394 ae0001        	ldw	x,#1
8144  1397 89            	pushw	x
8145  1398 ae0006        	ldw	x,#6
8146  139b a6c8          	ld	a,#200
8147  139d 95            	ld	xh,a
8148  139e cd020c        	call	_modbus_write_request
8150  13a1 5b04          	addw	sp,#4
8151  13a3               L7163:
8152                     ; 1690 	if(b2Hz)
8154                     	btst	_b2Hz
8155  13a8 2404          	jruge	L1263
8156                     ; 1692 		b2Hz=0;
8158  13aa 7211000d      	bres	_b2Hz
8159  13ae               L1263:
8160                     ; 1702 	if(b1Hz)
8162                     	btst	_b1Hz
8163  13b3 2503          	jrult	L042
8164  13b5 cc1312        	jp	L5063
8165  13b8               L042:
8166                     ; 1704 		b1Hz=0;
8168  13b8 7211000c      	bres	_b1Hz
8169                     ; 1706 		bB=!bB;
8171  13bc 9010000a      	bcpl	_bB
8172  13c0 ac121312      	jpf	L5063
9239                     	xdef	_main
9240                     	xdef	f_UART1RxInterrupt
9241                     	xdef	f_UART1TxInterrupt
9242                     	xdef	f_ADC2_EOC_Interrupt
9243                     	xdef	f_CAN_TX_Interrupt
9244                     	xdef	f_CAN_RX_Interrupt
9245                     	xdef	f_TIM4_UPD_Interrupt
9246                     	xdef	_t1_init
9247                     	xdef	_t4_init
9248                     	xdef	_can_tx_hndl
9249                     	xdef	_ind_hndl
9250                     	xdef	_init_CAN
9251                     	xdef	_can_in_an
9252                     	xdef	_uart1_init
9253                     	xdef	_enc_an
9254                     	xdef	_enc_but_drv
9255                     	xdef	_but_drv
9256                     	xdef	_tmblr_drv
9257                     	xdef	_int2ind_slkuf3
9258                     	xdef	_int2ind_slkuf2
9259                     	xdef	_int2ind_slkuf1
9260                     	xdef	_spi
9261                     	xdef	_spi_init
9262                     	xdef	_modbus_write_request
9263                     	xdef	_modbus_transmit_request
9264                     	xdef	_putchar1
9265                     	xdef	_modbus_in
9266                     	xdef	_CRC16_2
9267                     	xdef	_delay_ms
9268                     	xdef	_bin2bcd_int
9269                     	xdef	_bcd2ind
9270                     	xdef	_bcd2ind_zero
9271                     	switch	.ubsct
9272  0000               _modbus_plazma:
9273  0000 0000          	ds.b	2
9274                     	xdef	_modbus_plazma
9275                     	xdef	_bMODBUS_TIMEOUT
9276                     	xdef	_modbusTimeOutCnt
9277  0002               _bOUT_FREE:
9278  0002 00            	ds.b	1
9279                     	xdef	_bOUT_FREE
9280                     	xdef	_tx_wd_cnt
9281                     	switch	.bss
9282  0000               _tx_stat_cnt:
9283  0000 00            	ds.b	1
9284                     	xdef	_tx_stat_cnt
9285                     	switch	.ubsct
9286  0003               _rx_rd_index1:
9287  0003 0000          	ds.b	2
9288                     	xdef	_rx_rd_index1
9289  0005               _rx_wr_index1:
9290  0005 0000          	ds.b	2
9291                     	xdef	_rx_wr_index1
9292  0007               _rx_counter1:
9293  0007 0000          	ds.b	2
9294                     	xdef	_rx_counter1
9295                     	xdef	_rx_buffer
9296  0009               _tx_rd_index1:
9297  0009 00            	ds.b	1
9298                     	xdef	_tx_rd_index1
9299  000a               _tx_wr_index1:
9300  000a 00            	ds.b	1
9301                     	xdef	_tx_wr_index1
9302  000b               _tx_counter1:
9303  000b 00            	ds.b	1
9304                     	xdef	_tx_counter1
9305                     	xdef	_tx_buffer1
9306  000c               _bAV:
9307  000c 00            	ds.b	1
9308                     	xdef	_bAV
9309  000d               _bREW:
9310  000d 00            	ds.b	1
9311                     	xdef	_bREW
9312  000e               _wrk_state:
9313  000e 00            	ds.b	1
9314                     	xdef	_wrk_state
9315  000f               _enc_but_drv_cnt:
9316  000f 0000          	ds.b	2
9317                     	xdef	_enc_but_drv_cnt
9318  0011               _enc_cmnd_cnt:
9319  0011 0000          	ds.b	2
9320                     	xdef	_enc_cmnd_cnt
9321  0013               _enc_cmnd:
9322  0013 0000          	ds.b	2
9323                     	xdef	_enc_cmnd
9324  0015               _cmnd:
9325  0015 00            	ds.b	1
9326                     	xdef	_cmnd
9327                     	xdef	_ch_en
9328  0016               _but_cnt:
9329  0016 0000          	ds.b	2
9330                     	xdef	_but_cnt
9331  0018               _tmblr_cnt:
9332  0018 0000          	ds.b	2
9333                     	xdef	_tmblr_cnt
9334                     .bit:	section	.data,bit
9335  0000               _encOW_:
9336  0000 00            	ds.b	1
9337                     	xdef	_encOW_
9338                     	switch	.ubsct
9339  001a               _encOW_cnt2:
9340  001a 00            	ds.b	1
9341                     	xdef	_encOW_cnt2
9342  001b               _encOW_cnt1:
9343  001b 00            	ds.b	1
9344                     	xdef	_encOW_cnt1
9345                     	switch	.bit
9346  0001               _encCW_:
9347  0001 00            	ds.b	1
9348                     	xdef	_encCW_
9349                     	switch	.ubsct
9350  001c               _encCW_cnt2:
9351  001c 00            	ds.b	1
9352                     	xdef	_encCW_cnt2
9353  001d               _encCW_cnt1:
9354  001d 00            	ds.b	1
9355                     	xdef	_encCW_cnt1
9356  001e               _enc_plazma:
9357  001e 0000          	ds.b	2
9358                     	xdef	_enc_plazma
9359                     	switch	.bit
9360  0002               _encOW:
9361  0002 00            	ds.b	1
9362                     	xdef	_encOW
9363  0003               _encCW:
9364  0003 00            	ds.b	1
9365                     	xdef	_encCW
9366  0004               _encB:
9367  0004 00            	ds.b	1
9368                     	xdef	_encB
9369  0005               _encA:
9370  0005 00            	ds.b	1
9371                     	xdef	_encA
9372                     	switch	.ubsct
9373  0020               _encBcnt:
9374  0020 00            	ds.b	1
9375                     	xdef	_encBcnt
9376  0021               _encAcnt:
9377  0021 00            	ds.b	1
9378                     	xdef	_encAcnt
9379                     	switch	.bit
9380  0006               _encBpin_old:
9381  0006 00            	ds.b	1
9382                     	xdef	_encBpin_old
9383  0007               _encApin_old:
9384  0007 00            	ds.b	1
9385                     	xdef	_encApin_old
9386  0008               _encBpin:
9387  0008 00            	ds.b	1
9388                     	xdef	_encBpin
9389  0009               _encApin:
9390  0009 00            	ds.b	1
9391                     	xdef	_encApin
9392                     	switch	.ubsct
9393  0022               _rdata:
9394  0022 000000000000  	ds.b	6
9395                     	xdef	_rdata
9396  0028               _mess:
9397  0028 000000000000  	ds.b	14
9398                     	xdef	_mess
9399  0036               _can_plazma:
9400  0036 0000          	ds.b	2
9401                     	xdef	_can_plazma
9402  0038               _can_error_cnt:
9403  0038 00            	ds.b	1
9404                     	xdef	_can_error_cnt
9405                     	xdef	_bCAN_RX
9406  0039               _tx_busy_cnt:
9407  0039 00            	ds.b	1
9408                     	xdef	_tx_busy_cnt
9409                     	xdef	_bTX_FREE
9410  003a               _can_buff_rd_ptr:
9411  003a 00            	ds.b	1
9412                     	xdef	_can_buff_rd_ptr
9413  003b               _can_buff_wr_ptr:
9414  003b 00            	ds.b	1
9415                     	xdef	_can_buff_wr_ptr
9416                     	switch	.bss
9417  0001               _can_out_buff:
9418  0001 000000000000  	ds.b	64
9419                     	xdef	_can_out_buff
9420                     	switch	.ubsct
9421  003c               _bFL_:
9422  003c 00            	ds.b	1
9423                     	xdef	_bFL_
9424  003d               _bFL:
9425  003d 00            	ds.b	1
9426                     	xdef	_bFL
9427  003e               _bFL2:
9428  003e 00            	ds.b	1
9429                     	xdef	_bFL2
9430  003f               _bFL5:
9431  003f 00            	ds.b	1
9432                     	xdef	_bFL5
9433  0040               _ind_out:
9434  0040 0000000000    	ds.b	5
9435                     	xdef	_ind_out
9436  0045               _ind_out_:
9437  0045 0000000000    	ds.b	5
9438                     	xdef	_ind_out_
9439  004a               _zero_on:
9440  004a 00            	ds.b	1
9441                     	xdef	_zero_on
9442  004b               _dig:
9443  004b 0000000000    	ds.b	5
9444                     	xdef	_dig
9445  0050               _ind_fad_cnt:
9446  0050 00            	ds.b	1
9447                     	xdef	_ind_fad_cnt
9448  0051               _ind_cnt:
9449  0051 00            	ds.b	1
9450                     	xdef	_ind_cnt
9451                     	xdef	_dig3_
9452                     	xdef	_dig2_
9453                     	xdef	_dig1_
9454                     	xdef	_dig3
9455                     	xdef	_dig2
9456                     	xdef	_dig1
9457                     	xdef	_DIGISYM
9458  0052               _strob_cnt:
9459  0052 00            	ds.b	1
9460                     	xdef	_strob_cnt
9461  0053               _cnt_T4:
9462  0053 00            	ds.b	1
9463                     	xdef	_cnt_T4
9464                     	switch	.bit
9465  000a               _bB:
9466  000a 00            	ds.b	1
9467                     	xdef	_bB
9468  000b               _bT4:
9469  000b 00            	ds.b	1
9470                     	xdef	_bT4
9471  000c               _b1Hz:
9472  000c 00            	ds.b	1
9473                     	xdef	_b1Hz
9474  000d               _b2Hz:
9475  000d 00            	ds.b	1
9476                     	xdef	_b2Hz
9477  000e               _b5Hz:
9478  000e 00            	ds.b	1
9479                     	xdef	_b5Hz
9480  000f               _b10Hz:
9481  000f 00            	ds.b	1
9482                     	xdef	_b10Hz
9483  0010               _b100Hz:
9484  0010 00            	ds.b	1
9485                     	xdef	_b100Hz
9486                     	xdef	_t0_cnt4
9487                     	xdef	_t0_cnt3
9488                     	xdef	_t0_cnt2
9489                     	xdef	_t0_cnt1
9490                     	xdef	_t0_cnt0
9491                     	xdef	_can_transmit
9492                     	xdef	_work_stat
9493                     	switch	.ubsct
9494  0054               _ind_I_set:
9495  0054 0000          	ds.b	2
9496                     	xdef	_ind_I_set
9497  0056               _ind_U_set:
9498  0056 0000          	ds.b	2
9499                     	xdef	_ind_U_set
9500  0058               _ind_I:
9501  0058 0000          	ds.b	2
9502                     	xdef	_ind_I
9503  005a               _ind_U:
9504  005a 0000          	ds.b	2
9505                     	xdef	_ind_U
9506  005c               _time_set:
9507  005c 0000          	ds.b	2
9508                     	xdef	_time_set
9509  005e               _time:
9510  005e 0000          	ds.b	2
9511                     	xdef	_time
9512  0060               _wrk_mode:
9513  0060 00            	ds.b	1
9514                     	xdef	_wrk_mode
9515  0061               _ust_I_loc:
9516  0061 0000          	ds.b	2
9517                     	xdef	_ust_I_loc
9518  0063               _ust_Iloc:
9519  0063 0000          	ds.b	2
9520                     	xdef	_ust_Iloc
9521  0065               _ust_I_:
9522  0065 0000          	ds.b	2
9523                     	xdef	_ust_I_
9524  0067               _ust_I:
9525  0067 0000          	ds.b	2
9526                     	xdef	_ust_I
9527  0069               _out_I_:
9528  0069 0000          	ds.b	2
9529                     	xdef	_out_I_
9530  006b               _out_I:
9531  006b 0000          	ds.b	2
9532                     	xdef	_out_I
9533  006d               _out_U:
9534  006d 0000          	ds.b	2
9535                     	xdef	_out_U
9536  006f               _but_state:
9537  006f 00            	ds.b	1
9538                     	xdef	_but_state
9539  0070               _tmblr_state:
9540  0070 00            	ds.b	1
9541                     	xdef	_tmblr_state
9542                     	xdef	_tx_stat
9543                     	xref.b	c_x
9544                     	xref.b	c_y
9564                     	xref	c_imul
9565                     	xref	c_sdivx
9566                     	xref	c_lcmp
9567                     	xref	c_ltor
9568                     	xref	c_lgadc
9569                     	xref	c_rtol
9570                     	xref	c_vmul
9571                     	end
