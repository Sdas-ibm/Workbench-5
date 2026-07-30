class ZCL_GET_TAXTYPE_GCTS1 definition
  public
  final
  create public .

public section.

  class-methods SET_TAXTYPE
    importing
      !IM_BUKRS type BUKRS optional
      !IM_LAND1 type LAND1 optional
    exporting
      !EM_TAXTYPE type MWART .