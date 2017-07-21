+++
categories = ["Blog"]
date = "2017-05-22T20:34:56+08:00"
draft = false
slug = ""
title = "Mifare Cracking"

+++

上周偶然遇到机会需要复制RFID卡。
于是搜索了一番后，在某宝买了个PN532，居然很轻松地就复制了Mifare Classic的卡。

## 准备工作

#### 硬件

1. PN532
2. USB串口转换模块（CP2102）
3. UID可写的空白卡
4. 需要复制的卡

PN532是nfc的读写器，不仅如此它将nfc的协议转换成UART协议，更容易与其他模块交互。<br/>
CP2102将UART转换成USB协议，这样才能插在电脑上直接用。<br/>
空白卡必须是uid可写的，又称sector0可写，不然无法完全复制。<br/>

#### 接线

```
PN532     CP2102
RX    <-> TX
TX    <-> RX
GND   <-> GND
VCC   <-> +5V
```

#### 软件

1. [libnfc](https://github.com/nfc-tools/libnfc)
2. [mfoc](https://github.com/nfc-tools/mfoc)

libnfc提供了基本nfc交互工具。<br/>
安装完之后需要配置它通过usb识别PN532

```bash
> cat /etc/nfc/devices.d/pn532_via_uart2usb.conf 
## Typical configuration file for PN532 board (ie. microbuilder.eu / Adafruit) device
name = "Adafruit PN532 board via UART"
connstring = pn532_uart:/dev/ttyUSB0
```

mfoc是真正用来crack的工具，它依赖于libnfc。

## 实作
crack部分其实很简单，因为困难的工作工具都替你做了。

先把cp2102插上PC，把要复制的卡放在PN532上。

```
> nfc-list
nfc-list uses libnfc 1.7.1

NFC device: pn532_uart:/dev/ttyUSB0 opened
1 ISO14443A passive target(s) found:
ISO/IEC 14443A (106 kbps) target:
    ATQA (SENS_RES): 00  04  
       UID (NFCID1): 50  0a  be  72  
      SAK (SEL_RES): 08  

```

看到能读到信息就成功一大半啦。接下来破解并保存到文件

```
> mfoc -O cracked.mfd
```

没多久就全部破解出来了。
换上白卡之后再dump一遍，因为写也需要加密信息。

```
> mfoc -O empty.mfd
```
127.0.0.1:
之后拷贝到空白卡。

```
nfc-mfclassic W b cracked.mfd empty.mfd
```

完啦!

### Reference

- https://firefart.at/post/how-to-crack-mifare-classic-cards/

