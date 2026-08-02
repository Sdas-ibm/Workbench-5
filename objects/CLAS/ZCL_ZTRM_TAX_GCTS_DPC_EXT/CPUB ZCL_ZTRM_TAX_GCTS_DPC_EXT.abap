class ZCL_ZTRM_TAX_GCTS_DPC_EXT definition
  public
  inheriting from ZCL_ZTRM_TAX_GCTS_DPC
  create public .

public section.

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
    redefinition .