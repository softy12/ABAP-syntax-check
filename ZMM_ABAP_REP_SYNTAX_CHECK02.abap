REPORT ZMM_ABAP_REP_SYNTAX_CHECK01.
* ver 2 interactive version via FM EXTENDED_PROGRAM_CHECK, output comes in SAP screen nicely formatted 
PARAMETERS: p_prg TYPE sy-repid.
DATA: lt_result     TYPE slin_result,
      lt_resultstat TYPE slin_result_stat.

CALL FUNCTION 'EXTENDED_PROGRAM_CHECK'
  EXPORTING
    program     = p_prg
  IMPORTING
    result      = lt_result
    result_stat = lt_resultstat.

CALL FUNCTION 'EXTENDED_PROGRAM_CHECK_SHOW'
  EXPORTING
    result      = lt_result
    result_stat = lt_resultstat
    repid       = p_prg.
