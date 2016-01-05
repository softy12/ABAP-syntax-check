REPORT ZMM_ABAP_REP_SYNTAX_CHECK01.
* ver 1 via statement "SYNTAX-CHECK FOR"
PARAMETERS: p_prg TYPE sy-repid.

DATA: lt_source TYPE STANDARD TABLE OF string,
      ls_msg   TYPE string,
      ls_line  TYPE i,
      ls_wrd   TYPE string,
      ls_dir   TYPE trdir.

READ REPORT p_prg INTO lt_source.

SELECT SINGLE * FROM trdir INTO ls_dir WHERE name = sy-repid.

ls_dir-uccheck = ' '.
SYNTAX-CHECK FOR lt_source MESSAGE ls_msg LINE ls_line WORD ls_wrd
             DIRECTORY ENTRY ls_dir.
IF sy-subrc = 4.
  MESSAGE ls_msg TYPE 'I'.
ENDIF.

ls_dir-uccheck = 'X'.
SYNTAX-CHECK FOR lt_source MESSAGE ls_msg LINE ls_line WORD ls_wrd
             DIRECTORY ENTRY ls_dir.
IF sy-subrc = 4.
  MESSAGE ls_msg TYPE 'I'.
ENDIF.
