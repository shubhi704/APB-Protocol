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

APB Interface Block Diagram:

![image](https://user-images.githubusercontent.com/82434808/122651062-0bc74980-d154-11eb-9737-591e928a734e.png)

Operation Of APB

![image](https://user-images.githubusercontent.com/82434808/122651071-1681de80-d154-11eb-9977-9d46bacd77b9.png)



APB PIN Description:

<meta name="ProgId" content="PowerPoint.Slide">
<meta name="Generator" content="Microsoft PowerPoint 15">
<style>
<!--tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
td
	{padding-top:1.0px;
	padding-right:1.0px;
	padding-left:1.0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:18.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;}
.oa1
	{border:1.0pt solid black;
	background:white;
	mso-pattern:auto none;
	text-align:center;
	vertical-align:top;
	padding-bottom:3.6pt;
	padding-left:7.2pt;
	padding-top:3.6pt;
	padding-right:7.2pt;}
.oa2
	{border:1.0pt solid black;
	background:white;
	mso-pattern:auto none;
	vertical-align:top;
	padding-bottom:3.6pt;
	padding-left:7.2pt;
	padding-top:3.6pt;
	padding-right:7.2pt;}
-->
</style>



<!--StartFragment-->


SIGNAL | SOURCE | Description | WIDTH(Bit)
-- | -- | -- | --
Transfer | System Bus | APB enable signal. If high APB is   activated else APB is disabled | 1
PCLK | Clock Source | All APB functionality occurs at a rising edge. | 1
PRESETn | System Bus | An active low signal. | 1
PADDR | APB bridge | The APB address bus can be up to 32   bits. | 8
PSEL1 | APB bridge | There is a PSEL for each slave. It’s an active high signal. | 1
PENABLE | APB bridge | It indicates the 2nd cycle of a data transfer. It’s an active high signal. | 1
PWRITE | APB bridge | Indicates the data transfer direction.   PWRITE=1 indicates APB write   access(Master to slave)    PWRITE=0 indicates APB read   access(Slave to master) | 1
PREADY | Slave Interface | This is an input from Slave. It is used to enter the access state. | 1
PSLVERR | Slave Interface | This indicates a transfer failure by the slave. | 1
PRDATA | Slave Interface | Read Data. The selected slave drives   this bus during reading operation | 8
PWDATA | Slave Interface | Write data. This bus is driven by the peripheral bus bridge unit during write cycles when PWRITE is high. | 8



<!--EndFragment-->

Master Write Operation
![image](https://user-images.githubusercontent.com/82434808/122651100-429d5f80-d154-11eb-9431-494d04a1cbef.png)


Master Read Operation
![image](https://user-images.githubusercontent.com/82434808/122651107-4d57f480-d154-11eb-95a3-cbf353f5a5c9.png)


APB Interface Block Diagram With Slaves:
![image](https://user-images.githubusercontent.com/82434808/122651122-59dc4d00-d154-11eb-8c50-13587aab1ac7.png)

APB Simulation Result with Slaves:

Slave 1 READ-WRITE Operation 
![image](https://user-images.githubusercontent.com/82434808/122651137-6bbdf000-d154-11eb-919b-14d442e1fb8e.png)


Slave 2 READ-WRITE Operation 
![image](https://user-images.githubusercontent.com/82434808/122651145-75dfee80-d154-11eb-96ba-56867b48a86a.png)





