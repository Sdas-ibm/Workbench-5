*&---------------------------------------------------------------------*
*& Report ZGCTS_TEST_AMOUNT_CAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgcts_test_amount_cal.

DATA: lo_finance TYPE REF TO zcl_fin_cal_gcts,
      lv_amount  TYPE p DECIMALS 2.

CREATE OBJECT lo_finance
  EXPORTING
    iv_principal = '100000'
    iv_int_rate  = '8.5'.
*    iv_year      = 5
*    iv_freq      = 4.

lv_amount = lo_finance->calculate( ).

WRITE:
       / 'Maturity Amount:', lv_amount.
*       / lo_finance->currency.