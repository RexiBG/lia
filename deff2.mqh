//+------------------------------------------------------------------+
//|                                                  MainStrategy803.mq5  |
//|                        Copyright 2024, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict
#property version "1.00"

#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Label.mqh>
#include <Controls\Edit.mqh>
#include <Controls\CheckBox.mqh>
#include <Trade\Trade.mqh>


// Глобални променливи
string g_entryHour = "09";
string g_entryMinute = "00";
double g_dev = 600.0; // Увеличена девиация за US30.c
double g_r1 = 1.0;
double g_r2 = 1.0;
double g_lot = 0.10;
long   g_period = 30;
double g_multiplier = 0.0001;
bool   g_liveMode = false;
input bool reverse = false; // 31


struct TradeLine { // 35
   double opPriceB, opPriceS; // 36
   double tpPriceB, tpPriceS; // 37
   double slPriceB, slPriceS; // 38
   double BH1, SH2, SH3p, BH4p; // 39
   datetime startTime, endTime; // 40
   string prefix; // 41
   double opPrice;
   double tpPrice;
   double slPrice;
   
}; // 42


TradeLine tradeLines[];
int currentLineIndex = -1;

int profitCount = 0, lossCount = 0; // 44
double totalSum = 0.0; // 45

double devValues[]; // 46 


// for w2 
string g_symb ; 
int AccountEquity  = 100000;
int AccountBalance  =100000;
long magic  = 12345 ;

bool btnVariant1, btnVariant2, btnVariant3, btnVariant4, btnVariant5; // 32
bool prevClicked, nextClicked; // 33
input double input_g_lot = 0.1; // 29