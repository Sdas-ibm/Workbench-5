class ZCL_FIN_CAL_GCTS definition
  public
  final
  create public .

public section.

  types:
    ty_amount TYPE p LENGTH 8 DECIMALS 2 .
  types:
    ty_rate   TYPE p LENGTH 8 DECIMALS 4 .

  data PRINCIPAL type TY_AMOUNT .
  data INT_RATE type TY_RATE .
  data YEARS type INT2 .
  data FREQ type INT1 .

  methods CALCULATE
    returning
      value(EV_AMOUNT) type FITDQA_TRATE .
  methods CONSTRUCTOR
    importing
      !IV_PRINCIPAL type TY_AMOUNT optional
      !IV_INT_RATE type TY_RATE optional
      !IV_YEAR type INT2 optional
      !IV_FREQ type INT1 optional .