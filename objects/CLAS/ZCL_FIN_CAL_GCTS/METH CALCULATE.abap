  METHOD calculate.

    DATA:
      lv_rate_per_period TYPE f,
      lv_total_periods   TYPE i,
      lv_amount          TYPE f.

    lv_rate_per_period = int_rate / 100 / freq.
    lv_total_periods   = freq * years.

    lv_amount = principal * ( ( 1 + lv_rate_per_period ) ** lv_total_periods ).

    ev_amount = lv_amount.

  ENDMETHOD.