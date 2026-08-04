  METHOD SET_TAXTYPE.

    SELECT SINGLE
      ztrm_de_cc,
      ztrm_de_cntry,
      ztrm_de_txtyp
      FROM  ztrm_taxrat_gcts
      INTO @DATA(l_wa_data) WHERE ztrm_de_cc = @im_bukrs AND ztrm_de_cntry = @im_land1.
    IF sy-subrc = 0.
      em_taxtype = l_wa_data-ztrm_de_txtyp.
    ENDIF.
  ENDMETHOD.