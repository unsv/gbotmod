@echo off

REM ������������ ���� GBOT � �������� �������
REM -------------

SET KEY=*******
SET SECRET=*********

SET EXCHANGE=demo

SET DEMO_EXCHANGE=poloniex
SET BALANCE_COIN=0.05
SET BALANCE_COIN_TWO=0

SET NAME_COIN=BTC
SET NAME_COIN_TWO=LTC

SET DEPOSIT_LIMIT=100%%
SET ONE_ORDERS_SELL=true
SET ONE_ORDERS_PROFIT_PERCENT=0.5
SET ONE_ORDERS_OFFSET=0.6
SET OFFSET_FIRST_ORDERS_PERCENT=0.5
SET SIZE_ORDERS_MARTINGALE=30%%
SET OFFSET_ORDERS_EXPONENTIAL=2
SET QUANTITY_ORDERS_IN_BLOCKS=3

SET EXCHANGE_FEE=0.25
SET FIRST_LOADING_HISTORY=true

SET DELAY_REQUEST_API=100
SET DELAY_BETWEEN_MODULES=2
SET RESTART_TRADER_TIME=20
SET TIME_UPDATE_AUTO_SETTINGS=1

SET LOG=true
SET LOG_DEBUG=true
SET LOG_TRANSPORTS=2
SET LOG_TREE=true

REM -------------

set APPURL=https://github.com/steeply/gbot-trader/archive/master.zip

where /q "node.exe"
if ERRORLEVEL 1  (
  echo Instali NodeJS! https://nodejs.org
  pause
  exit
)
where /q "download.cmd"
if ERRORLEVEL 1  (
  call npm install -g download-cli
)
if not exist "LICENSE" (
  call download -e -s 1 -o . %APPURL%
  call npm i
  pause
  exit
)
if not exist "node_modules" (
  call npm i
  pause
  exit
)
if "%1" == "update" (
  call download -e -s 1 -o . %APPURL%
  call npm i
  pause
  exit
)
if "%1" == "dep" (
  call npm i
)

cmd /K node ./build/server
