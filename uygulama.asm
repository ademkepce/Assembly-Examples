			ORG 0000H
			SJMP MAIN_BASLA
			ORG 0003H
KESME_INT0:
			RETI
			ORG 000BH
			SJMP ISTENENKESME_T0
			ORG 0013H
KESME_INT1:
			RETI
			ORG 001BH
KESME_T1:
			RETI
			ORG 0023H
KESME_SERI:
			RETI
			ORG 0030H
MAIN_BASLA:
mov P1,#0FFH
mov IE,#82h
BUTTONBASILDIMI_KONTROLET:JB P1.0,BUTTONBASILDIMI_KONTROLET
BASADON:
mov R1,#32H
YANMASI_ICIN_GEREKLI_SURE:
mov TMOD,#01H
mov TH0,#HIGH(15536)
mov TL0,#LOW(15536)
setb TR0;SAYICI �ALISMAYA BASLASIN
BENDENISTENEN_KAAKTERLER:
mov P2,#0fah;ILK SEGMENT
CLR P3.0
setb P3.0

MOV P2,#07ah;IKINCI SEGMENT
CLR P3.1
setb P3.1

mov P2,#0aeh;UCUNCU SEGMENT
CLR P3.2
setb P3.2

mov P2,#09eh;DORDUNCU SEGMENT
CLR P3.3
setb P3.3

BEKLE:JNB TF0, BENDENISTENEN_KAAKTERLER
ISTENENKESME_T0:	CLR TF0
dec R1
CJNE R1,#1EH,YANMASI_ICIN_GEREKLI_SURE
mov R1,#32H
SONMESI_ICIN_GECEN_SURE:
mov TMOD,#01H
mov TH0,#HIGH(15536)
mov TL0,#LOW(15536)
setb TR0;SAYICI �ALISMAYA BASLASIN
mov P3,000H
mov P2,000H
BAYRAK_KONTROL_SONME:JNB TF0,BAYRAK_KONTROL_SONME
CLR TF0
dec R1
CJNE R1,#1EH,SONMESI_ICIN_GECEN_SURE
sjmp basadon
RETI

end
	