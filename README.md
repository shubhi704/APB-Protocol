# APB-Protocol

  # Intro
APB is low bandwidth and low performance bus. So, the components requiring lower bandwidth like the peripheral devices such as UART, Keypad, Timer and PIO (Peripheral Input Output) devices are connected to the APB.
The bridge connects the high performance AHB or ASB bus to the APB bus. So, for APB the bridge acts as the master and all the devices connected on the APB bus acts as the slave.


# APB Specification
1. Parallel bus operation. All the data will be captured at rising edge clock.
2. Two slave design.
3. Signal priority: 1.PRESET (active low) 2. PSEL (active high) 3. PENABLE (active high) 4. PREADY (active high) 5. PWRITE 
4. Data width 8 bit and address width 9 bit. 
5. PWRITE=1 indicates write PWDATA to slave.
   PWRITE=0 indicates read PRDATA from slave.
6. Start of data transmission is indicated when PENABLE changes from low to high. End of transmission is indicated by PREADY changes from high to low.


Top Module Name: apb_protocol.v
Testbench Name: test.v
