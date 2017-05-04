nc_for_net_checking
=====
using nc command to check net request and respond
監聽 port 並在收到觸發後，等兩秒，回傳被觸發時間給 server

## Client
放在 rpi 的程式

### ex.sh
接收 port 資訊並回傳給 server 資訊
- info: 暫存資訊的檔案
- server_ip: Server 所在的 ip 位址
- server_port: server 上接收 client 監聽資訊的 port
- wait_time: rpi 收到資訊後，等幾秒才回傳資訊

### start.sh
啟動監聽程式
- client_port: Client 端接被戳的 port
- check_time: rpi 每隔幾秒自動與 pool.ntp.org 對時

## Server
放在電腦上固定時間觸發 rpi 並接收 rpi 被觸發時間，以及監控的程式

### thro.sh
固定時間戳 rpi 並接收 rpi 回傳的資訊
- list: 所有 rpi 所在的 ip 清單（以空白隔開）
- time_file: 儲存 rpi 回傳的時間資訊
- server_port: server 上接收 client 回傳的資訊
- client_port: rpi 上負責被戳的 port
- due_tiem: server 每隔幾秒戳一次 rpi

### board.sh
- tiem_file: 儲存 rpi 回傳的時間資訊的檔案
- reflash_time: 顯示程式的刷新時間

## both
rpi 跟 電腦都可以使用

### clean.sh
結束後，把多餘的 processing 砍掉，每次跑 script 前最好都做一次
