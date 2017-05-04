nc_for_net_checking
=====
- using nc command to check net request and respond
- 監聽 port 並在收到觸發後，等兩秒，回傳被觸發時間給 server

## Dependency & Require
1. software: ncat, bash
```
apt/yum install bash nmap
```
2. network: you must has the right to open all the port you need

## How to used it
1. clone the file to both your server and client
```script
git clone https://github.com/calee0219/nc_for_net_checking.git
```
2. go to the folder and make all script executable
```script
cd /the/path/of/where/you/clone
chmod +x *.sh
```
3. change the [config](https://github.com/calee0219/nc_for_net_checking/blob/master/config) file to where you put your config
- see [what to change](https://github.com/calee0219/nc_for_net_checking#config)
- if you need to check time for every period, go to [start](https://github.com/calee0219/nc_for_net_checking/blob/master/start.sh), adding '&' behind `ncat` command to put it as background, and remove the comment below `while`. So your code must look like below:

  ```script
  #!/bin/bash

  source config

  ncat -k -vc ./ex.sh -l ${client_port} &

  while [ 1 -eq 1 ]
  do
      sleep ${check_time}
      sudo ntpdate pool.ntp.org
  done
  ```

4. On server, execute thro script to send msg to client and used board to see the respond (in different screen)
```script
./thro.sh
./board
```
5. On client, execute start to receive and send back info
```script
./start.sh
```
6. if you end the test, used clean script to clean up all processing
```script
./clean.sh
```

## Config
所有的設定參數
- server_ip: Server 所在的 ip 位址
- server_port: server 上負責接收 client 資訊的監聽 port
- client_ip_list: 所有 rpi 所在的 ip 清單（以空白隔開）
- client_port: Client 端接負責被戳的 port (每一台 client 必需統一)

- due_time: server 每隔幾秒戳一次 rpi
- wait_time: rpi 收到資訊後，等幾秒才回傳資訊

- check_time: rpi 每隔幾秒自動與 pool.ntp.org 對時
- info: client 上暫存資訊的檔案
- time_file: 儲存 rpi 回傳的時間資訊 (這個參數沒有有用了)

## Client
放在 rpi 的程式
### ex.sh
接收 port 資訊並回傳給 server 資訊
### start.sh
啟動監聽程式

## Server
放在電腦上固定時間觸發 rpi 並接收 rpi 被觸發時間，以及監控的程式
### thro.sh
固定時間戳 rpi 並接收 rpi 回傳的資訊
### board.sh
顯示回傳資訊的檔案

## both
rpi 跟 電腦都需要使用
### clean.sh
結束後，把多餘的 processing 砍掉，每次跑 script 前最好都做一次
