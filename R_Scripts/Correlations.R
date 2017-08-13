install.packages('Quandl')
library(Quandl)
library(tseries); 
library(quantmod) ## for manipulating zoo objects

apiKey = 'wz84exA-PQQ6xrbgddsn'

#Quick Note: #Stratis Nem , IOTA, NEO are not on Bitfinex

#### Bitfinex Data Sets ####

### Cryptos compared with the USD ###
Bitfinex_BTCUSD <- Quandl('BITFINEX/BTCUSD', type='zoo', api_key=apiKey) #Bitcoin
Bitfinex_ETHUSD <- Quandl('BITFINEX/ETHUSD', type='zoo', api_key=apiKey) #Etherum
Bitfinex_XRPUSD <- Quandl('BITFINEX/XRPUSD', type='zoo', api_key=apiKey) #Ripple
Bitfinex_LTCUSD <- Quandl('BITFINEX/LTCUSD', type='zoo', api_key=apiKey) #LiteCoin
Bitfinex_DSHUSD <- Quandl('BITFINEX/DSHUSD', type='zoo', apiKey=apiKey)  #Dash
Bitfinex_ETCUSD <- Quandl('BITFINEX/ETCUSD', type='zoo', apiKey=apiKey)  #Etherum Classic
Bitfinex_XMRUSD <- Quandl('BITFINEX/XMRUSD', type='zoo', apiKey=apiKey)  #Monero
Bitfinex_ZECUSD <- Quandl('BITFINEX/ZECUSD', type='zoo', apiKey=apiKey)  #ZCash

### Crypto compared with BTC ###
Bitfinex_ETHBTC <- Quandl('BITFINEX/ETHBTC', type='zoo', api_key=apiKey) #Etherum
Bitfinex_XRPBTC <- Quandl('BITFINEX/XRPBTC', type='zoo', api_key=apiKey) #Ripple
Bitfinex_LTCBTC <- Quandl('BITFINEX/LTCBTC', type='zoo', api_key=apiKey) #LiteCoin
Bitfinex_DSHBTC <- Quandl('BITFINEX/DSHBTC', type='zoo', apiKey=apiKey)  #Dash
Bitfinex_ETCBTC <- Quandl('BITFINEX/ETCBTC', type='zoo', apiKey=apiKey)  #Etherum Classic
Bitfinex_XMRBTC <- Quandl('BITFINEX/XMRBTC', type='zoo', apiKey=apiKey)  #Monero
Bitfinex_ZECBTC <- Quandl('BITFINEX/ZECBTC', type='zoo', apiKey=apiKey)  #ZCash



### Align datasets ont the first common date  ### 
data.usd.midPrices <- merge( Bitfinex_BTCUSD$Mid, Bitfinex_ETHUSD$Mid, Bitfinex_LTCUSD$Mid,
                Bitfinex_DSHUSD$Mid,Bitfinex_ETCUSD$Mid, Bitfinex_XMRUSD$Mid,Bitfinex_ZECUSD$Mid,all=F )

data.usd.volumes   <-merge( Bitfinex_BTCUSD$Volume, Bitfinex_ETHUSD$Volume, Bitfinex_LTCUSD$Volume,
                         Bitfinex_DSHUSD$Volume,Bitfinex_ETCUSD$Volume, Bitfinex_XMRUSD$Volume,Bitfinex_ZECUSD$Volume,all=F )

data.btc.midPrices <-merge( Bitfinex_ETHBTC$Mid, Bitfinex_LTCBTC$Mid,
                         Bitfinex_DSHBTC$Mid,Bitfinex_ETCBTC$Mid, Bitfinex_XMRBTC$Mid,Bitfinex_ZECBTC$Mid,all=F )
  
data.btc.volumes   <-merge( Bitfinex_ETHBTC$Volume, Bitfinex_LTCBTC$Volume,
                         Bitfinex_DSHBTC$Volume,Bitfinex_ETCBTC$Volume, Bitfinex_XMRBTC$Volume,Bitfinex_ZECBTC$Volume,all=F )


## Statistics ##

stat.usd.midPriceCorrelations <- cor(data.usd.midPrices)
stat.usd.volumeCorrelations   <- cor(data.usd.volumes)
stat.btc.midPriceCorrelations <- cor(data.btc.midPrices)
stat.btc.volumeCorrelations   <- cor(data.btc.volumes)

#Clearing console
cat("\014")
## Displaying Statistic ## 

# USD MidPrice R values
stat.usd.midPriceCorrelations

# USD MidPrice R^2 values
stat.usd.midPriceCorrelations ^ 2

# USD Volume R values
stat.usd.volumeCorrelations 

# USD Volume R^2 values
stat.usd.volumeCorrelations ^ 2

# BTC MidPrice R values
stat.btc.midPriceCorrelations

# BTC MidPrice R^2 values
stat.btc.midPriceCorrelations ^ 2

# BTC Volume R values
stat.btc.volumeCorrelations

# BTC Volume R ^ 2 values
stat.btc.volumeCorrelations ^ 2








