# IRIG-B_MANCHESTER ENCODNG
This project Takes a static time and converts it to Binary Coded Decimal (BCD) and this Binary Coded Decimal (BCD) is encoded into IRIG B format, which is further encoded to Manchester encoding for transmission.

Input is Clock and Reset with an enable signal.

The clock is 50MHZ and reset is set to 1 and switched back to 0.

The initial static time is set in the code.

on Enabling the device it convertes to BCD, this is used to convert into IRIG B encoding which is specific format, 

BCD               IRIG B
1             60% ON and 40% OFF
0             40% ON and 60% OFF

The initial encoding of IRIG B is 50 % ON and 50% OFF to inform about start and ending of a signal, each signal consist of 100 cycles, 
first cycle includes start and 100th cycle includes stop bit.

The remaining is split into 10 divisions(100 Cycles), each division has 8 bit data and 1 starting and 1 ending bit.

Manchester Encoding - For transmission of signals

Encoded IRIG B            Manchester Encoding
1                          50% OFF and 50% ON
0                          50% ON and 50% OFF

The Manchester encoding operates at 1KHZ Frequency, IRIG B encoding operates at 100Hz Frequency.
For a single cycle manchester encoding has 10 cycles.
