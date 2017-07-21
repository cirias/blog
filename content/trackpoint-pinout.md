+++
categories = ["Blog"]
date = "2017-01-28T16:48:04+08:00"
draft = false
slug = ""
title = "Trackpoint pinout"

+++

从某宝弄了块Thinkpad键盘，从上面把Trackpoint拆下来，想折腾一下。

但是网上搜了一圈却没有相关的pinout信息。于是只好自己来小小地逆向工程一下了。

![指点](/images/2017/01/trackpoint_comment.jpg)

经高人指点（见上图），找到了GND和VCC。已知Trackpoint用的是PS/2协议，接下来只要通过Arduino试错，应该就能找到CLK，DATA，RESET了。

焊上导线，接上Arduino准备大干一番：

![接线](/images/2017/01/trackpoint_arduino.jpg)

从网上找了[Arduino PS/2 mouse的代码](http://playground.arduino.cc/uploads/ComponentLib/mouse.txt)，改了下：

```clang
void gohi(int pin)
{
  pinMode(pin, INPUT);
  digitalWrite(pin, HIGH);
}

void golo(int pin)
{
  pinMode(pin, OUTPUT);
  digitalWrite(pin, LOW);
}

int pins[] = {5, 6, 7, 8, 9, 10, 11, 12};
int loop_count = 20000;

void reset() {
  for (int i = 0; i < 8; i++) {
    pinMode(pins[i], OUTPUT);
    digitalWrite(pins[i], HIGH);
  }

  delay(2000);

  for (int i = 0; i < 8; i++) {
    digitalWrite(pins[i], LOW);
  }
}

void setup() {
  Serial.begin(115200);

  for (int i = 3; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      int MCLK = pins[i];
      int MDATA = pins[j];

      if (MCLK == MDATA) continue;

      int n = 0;
      int c = 0;
      char parity = 1;
      char data = 0xff;

      reset();

      Serial.print(MCLK);
      Serial.print("\t");
      Serial.print(MDATA);
      Serial.print("\t");

      gohi(MCLK);
      gohi(MDATA);
      delayMicroseconds(300);
      golo(MCLK);
      delayMicroseconds(300);
      golo(MDATA);
      delayMicroseconds(10);
      gohi(MCLK);

      /* wait for device to take control of clock */
      while (digitalRead(MCLK) == HIGH && n < loop_count) {
        n++;
      }

      for (c = 0; c < 8; c++) {
        if (data & 0x01) {
          gohi(MDATA);
        } 
        else {
          golo(MDATA);
        }

        while (digitalRead(MCLK) == LOW && n < loop_count) {
          n++;
        }
        while (digitalRead(MCLK) == HIGH && n < loop_count) {
          n++;
        }

        parity = parity ^ (data & 0x01);
        data = data >> 1;
      }

      if (parity) {
        gohi(MDATA);
      } 
      else {
        golo(MDATA);
      }
      while (digitalRead(MCLK) == LOW && n < loop_count) {
        n++;
      }
      while (digitalRead(MCLK) == HIGH && n < loop_count) {
        n++;
      }

      gohi(MDATA);
      delayMicroseconds(50);
      while (digitalRead(MCLK) == HIGH && n < loop_count) {
        n++;
      }

      while (((digitalRead(MCLK) == LOW) || (digitalRead(MDATA) == LOW)) && n < loop_count) {
        n++;
      }

      Serial.print(n);
      if (n < loop_count && n > 0) {
        Serial.print("\tchanged\r\n");
      } else {
        Serial.print("\r\n");
      }
    }
  }
}

void loop()
{
}
```

最后，终于测出：

![trackpoint pinout](/images/2017/01/trackpoint.png)
