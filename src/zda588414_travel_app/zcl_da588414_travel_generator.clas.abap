CLASS zcl_da588414_travel_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_da588414_travel_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Deklarationen
    DATA booking TYPE z588414_abooking.
    DATA travel TYPE z588414_travel.
    DATA travels TYPE TABLE OF z588414_travel.
    DATA bookings TYPE TABLE OF z588414_abooking.

    "DBT löschen
    DELETE FROM z588414_abooking.
    DELETE FROM z588414_TRAVEL.

    "Reisedaten erstellen
    travel-client = sy-mandt.
    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    travel-agency_id = '000001'.
    travel-customer_id ='000064'.
    travel-begin_date = '20230707'.
    travel-end_date = '20230707'.
    travel-description = 'Tagesausflug Hamburg'.
    travel-status = 'B'.
    travel-createdby = sy-uname.
    GET TIME STAMP FIELD travel-createdat.
    travel-lastchangedby = sy-uname.
    GET TIME STAMP FIELD travel-lastchangedat.
    APPEND travel TO travels.


    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    travel-agency_id = '000027'.
    travel-customer_id ='000099'.
    travel-begin_date = '20230801'.
    travel-end_date = '20230801'.
    travel-description = 'New York'.
    travel-status = 'B'.
    APPEND travel TO travels.


    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    travel-agency_id = '000012'.
    travel-customer_id ='000099'.
    travel-begin_date = '20231230'.
    travel-end_date = '20240107'.
    travel-description = 'Silvesterausflug nach New York'.
    travel-status = 'P'.
    APPEND travel TO travels.

    travel-travel_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    travel-agency_id = '000009'.
    travel-customer_id ='000027'.
    travel-begin_date = '20240624'.
    travel-end_date = '20240703'.
    travel-description = 'Europarundreise'.
    travel-status = 'N'.
    APPEND travel TO travels.

    booking-client = sy-mandt.
    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    booking-travel_uuid = travels[ 2 ]-travel_uuid.
    booking-booking_date = '20230706'.
    booking-customer_id = travels[ 2 ]-customer_id.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0400'.
    booking-flight_date = travels[ 2 ]-begin_date.
    booking-flight_price = '823.99'.
    booking-currency_code = 'EUR'.
    APPEND booking TO bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    booking-travel_uuid = travels[ 2 ]-travel_uuid.
    booking-booking_date = '20230706'.
    booking-customer_id = travels[ 2 ]-customer_id.
    booking-carrier_id = 'LH'.
    booking-connection_id = '0401'.
    booking-flight_date = travels[ 2 ]-end_date.
    booking-flight_price = '1134.44'.
    booking-currency_code = 'EUR'.
    APPEND booking TO bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    booking-travel_uuid = travels[ 4 ]-travel_uuid.
    booking-booking_date = sy-datum.
    booking-customer_id = travels[ 4 ]-customer_id.
    booking-carrier_id = 'AZ'.
    booking-connection_id = '0788'.
    booking-flight_date = '20240627'.
    booking-flight_price = '555.00'.
    booking-currency_code = 'EUR'.
    APPEND booking TO bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    booking-customer_id = '000128'.
    APPEND booking TO bookings.

    booking-booking_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
    booking-customer_id = '000129'.
    APPEND booking TO bookings.
    "Daten in DBT einfügen
    INSERT z588414_travel FROM TABLE @travels.
    INSERT z588414_abooking FROM TABLE @bookings.

  ENDMETHOD.
ENDCLASS.
