**&---------------------------------------------------------------------*
**& Report ZTRM_GTA_CALLBRR_AK
**&---------------------------------------------------------------------*
**&
**&---------------------------------------------------------------------*
REPORT ztrm_gta_callbrr_gcts.
SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_bukrs TYPE bukrs,
              p_land  TYPE land1.
SELECTION-SCREEN: END OF BLOCK b1.

CONSTANTS:lv_function_id TYPE if_fdt_types=>id VALUE '02000827F4BB1FD1A3817507ED9B4000'.
DATA:lv_timestamp     TYPE timestamp,
     lt_name_value    TYPE abap_parmbind_tab,
     ls_name_value    TYPE abap_parmbind,
     lr_data          TYPE REF TO data,
     lx_fdt           TYPE REF TO cx_fdt,
     la_ztrm_de_cc    TYPE if_fdt_types=>element_text,
     la_ztrm_de_cntry TYPE if_fdt_types=>element_text.
FIELD-SYMBOLS <la_any> TYPE any.
****************************************************************************************************
* All method calls within one processing cycle calling the same function must use the same timestamp.
* For subsequent calls of the same function, we recommend to use the same timestamp for all calls.
* This is to improve the system performance.
****************************************************************************************************
* If you are using structures or tables without DDIC binding, you have to declare the respective types
* by yourself. Insert the according data type at the respective source code line.
****************************************************************************************************
GET TIME STAMP FIELD lv_timestamp.
****************************************************************************************************
* Process a function without recording trace data, passing context data objects via a name/value table.
****************************************************************************************************
* Prepare function processing:
****************************************************************************************************
ls_name_value-name = 'ZTRM_DE_CC'.
la_ZTRM_DE_CC = p_bukrs.
GET REFERENCE OF la_ZTRM_DE_CC INTO lr_data.
ls_name_value-value = lr_data.
INSERT ls_name_value INTO TABLE lt_name_value.
CLEAR ls_name_value.
****************************************************************************************************
ls_name_value-name = 'ZTRM_DE_CNTRY'.
la_ZTRM_DE_CNTRY = p_land.
GET REFERENCE OF la_ZTRM_DE_CNTRY INTO lr_data.
ls_name_value-value = lr_data.
INSERT ls_name_value INTO TABLE lt_name_value.
CLEAR ls_name_value.
****************************************************************************************************
* Create the data to store the result value after processing the function
* You can skip the following call, if you already have
* a variable for the result. Please replace also the parameter
* EA_RESULT in the method call CL_FDT_FUNCTION_PROCESS=>PROCESS
* with the desired variable.
****************************************************************************************************
cl_fdt_function_process=>get_data_object_reference( EXPORTING iv_function_id      = lv_function_id
                                                              iv_data_object      = '_V_RESULT'
                                                              iv_timestamp        = lv_timestamp
                                                              iv_trace_generation = abap_false
                                                    IMPORTING er_data             = lr_data ).
ASSIGN lr_data->* TO <la_any>.
TRY.
    cl_fdt_function_process=>process( EXPORTING iv_function_id = lv_function_id
                                                iv_timestamp   = lv_timestamp
                                      IMPORTING ea_result      = <la_any>

                                      CHANGING  ct_name_value  = lt_name_value ).

    WRITE: 'Tax type' && | | && <la_any>.

  CATCH cx_fdt INTO lx_fdt.
****************************************************************************************************
* You can check CX_FDT->MT_MESSAGE for error handling.
****************************************************************************************************
ENDTRY.