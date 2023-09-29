CLASS lhc_ZR_DA588414_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.
    METHODS show_test_message FOR MODIFY
      IMPORTING keys FOR ACTION travel~show_test_message.
    METHODS cancel_booking FOR MODIFY
      IMPORTING keys FOR ACTION travel~cancel_booking.
    METHODS maintain_booking_fees FOR MODIFY
      IMPORTING keys FOR ACTION travel~maintain_booking_fees.

ENDCLASS.

CLASS lhc_ZR_DA588414_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD show_test_message.
    DATA(message) =  NEW zcm_588414_travel(
      i_textid    =  zcm_588414_travel=>test_message
      i_severity  = if_abap_behv_message=>severity-information
      i_user_name = sy-uname
    ).
    APPEND message TO reported-%other.


  ENDMETHOD.

  METHOD cancel_booking.
    "Ausgewählte Daten (Reisen) lesen
    READ ENTITY IN LOCAL MODE   ZR_DA588414_Travel
      FIELDS ( TravelUuid Status Description )
      WITH CORRESPONDING #( keys )
      RESULT DATA(travels).
    "SELECT FROM zda588515_atravel
    " Field TravelUuid, Status
    "Where TravelUuid in key
    "Into Table @DATA(travels).


    "Über die Daten (Reisen) iterieren
    LOOP AT travels REFERENCE INTO DATA(travel).

      IF travel->Status = 'X'.


        "Daten (Reisen) ändern und ggbfs. Nachrichten erzeugen

        DATA(message) = NEW ZCM_588414_Travel(
        i_textid = ZCM_588414_Travel=>travel_already_cancelled
        i_severity = if_abap_behv_message=>severity-error
        i_travel = travel->Description ).
        APPEND VALUE #( %tky = travel->%tky %msg = message ) TO reported-travel.
        APPEND VALUE #( %tky = travel->%tky ) TO failed-travel.
        CONTINUE.
      ENDIF.
      travel->Status = 'X'.
      message = NEW ZCM_588414_Travel(
            i_textid = ZCM_588414_Travel=>travel_cancelled_successfully
            i_severity = if_abap_behv_message=>severity-success
            i_travel = travel->Description ).
      APPEND VALUE #( %tky = travel->%tky %msg = message ) TO reported-travel.
      "Daten (Reisen) zurückschreiben
      MODIFY ENTITY IN LOCAL MODE ZR_DA588414_Travel
      UPDATE FIELDS ( Status )
      WITH VALUE #( ( %tky = travel->%tky Status = travel->Status ) ).
    ENDLOOP.

  ENDMETHOD.

  METHOD maintain_booking_fees.

    READ ENTITY IN LOCAL MODE zr_da588414_travel
    FIELDS ( TravelUuid )
    WITH CORRESPONDING #( keys )
    RESULT DATA(travels).

    LOOP AT travels REFERENCE INTO DATA(travel).
      travel->BookingFee = keys[ sy-tabix ]-%param-BookingFee.
      travel->CurrencyCode = keys[ sy-tabix ]-%param-CurrencyCode.
      MODIFY ENTITY IN LOCAL MODE ZR_DA588414_Travel
      UPDATE FIELDS (  BookingFee CurrencyCode )
      WITH VALUE #( ( %tky = travel->%tky
                      BookingFee = travel->BookingFee
                      CurrencyCode = travel->CurrencyCode
      ) ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
