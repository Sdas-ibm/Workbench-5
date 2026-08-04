CLASS zcl_fin_cal_gcts DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      ty_amount TYPE p LENGTH 8 DECIMALS 2 .
    TYPES:
      ty_rate   TYPE p LENGTH 8 DECIMALS 4 .

    DATA principal TYPE ty_amount .
    DATA int_rate TYPE ty_rate .
    DATA years TYPE int2 .
    DATA freq TYPE int1 .
    DATA currency      TYPE waers.

    METHODS calculate
      RETURNING
        VALUE(ev_amount) TYPE fitdqa_trate .
    METHODS constructor
      IMPORTING
        !iv_principal TYPE ty_amount
        !iv_int_rate  TYPE ty_rate
        !iv_year      TYPE int2 OPTIONAL
        !iv_freq      TYPE int1 OPTIONAL
        !iv_currency  TYPE waers OPTIONAl .