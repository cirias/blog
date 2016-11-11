+++
categories = ["Blog"]
date = "2016-11-11T08:08:38+08:00"
draft = false
slug = ""
title = "BMPCC Remove Control with Arduino"

+++

整个控制过程分为两部分：

1. 解析接收机的PWM
2. 与BMPCC交互

---

先来说第二部分。BMPCC支持通过SONY的LANC来控制。
关于LANC协议的细节直接看[这里](http://controlyourcamera.blogspot.com/2011/02/arduino-controlled-video-recording-over.html)。其中详细介绍了如何利用Arduino实现BMPCC的录像控制。

---

再来谈谈PWM的解析。由于PWM信号数量较多，Arduino自带的Interrupt Pin数量不够，需要利用[PinChangeInterrupt](http://playground.arduino.cc/Main/PinChangeInterrupt)这个库。
使用它的时候有一点需要注意，**每个PIN只能绑定一个事件**。

具体实现如下：

```
#include <Arduino.h>
#include "PinChangeInterrupt.h"

volatile int currentPWM1 = 0;
volatile int lastPWM1 = 0;
volatile int startTime1 = 0;
int pin1;

void (*handler1)(volatile int, volatile int);

void onPWMChange1() {
  if (digitalRead(pin1) == HIGH) {
    startTime1 = micros();
    return;
  }

  if (startTime1 == 0) {
    return;
  }

  lastPWM1 = currentPWM1;
  currentPWM1 = micros() - startTime1;

  handler1(lastPWM1, currentPWM1);
}

void attachPWM1(int pin, int pcint,
    void (*handler)(volatile int, volatile int)) {
  pinMode(pcint, INPUT_PULLUP);

  pin1 = pin;
  handler1 = handler;

  attachPCINT(pcint, onPWMChange1, CHANGE);
}
```
