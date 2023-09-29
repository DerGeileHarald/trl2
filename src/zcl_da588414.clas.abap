CLASS zcl_da588414 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_da588414 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT  FROM ZDA588414_Demo01
     FIELDS *
     WHERE CarrierId = 'LH'
     INTO TABLE @DATA(connections).
    out->write(  connections ).
  ENDMETHOD.
ENDCLASS.
