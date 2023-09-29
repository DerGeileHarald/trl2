@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'numerische Funktionen'

define view entity ZDA588414_Demo05
  as select from /dmo/booking
{
  5.0 / 3.0                               as Fltp1,
  division( 5, 3, 2)                      as Dec1,
  div(5, 3 )                              as Div1,
  mod(5, 3)                               as mod1,
  /* Zeichenkettenfunktionen*/
  concat_with_space('Hello', 'World', 1)  as String1,
  length('X ')                            as LengthXSS,
  length(' X')                            as LengthSSX,
  currency_code                           as OriginalCurrencyCode,
  @Semantics.amount.currencyCode: 'ConvertedCurrencyCode'
  currency_conversion(
  amount => flight_price,
   source_currency => currency_code,
    target_currency => cast('EUR'as abap.cuky),
     exchange_rate_date => booking_date ,
    error_handling => 'KEEP_UNCONVERTED') as ConvertedFlightPrice,
  cast('EUR'as abap.cuky)                 as ConvertedCurrencyCode,
  /* Datums- und Zeit Funktionen */
  booking_date as BookingDate,
  dats_add_days(booking_date, 14, 'FAIL') as Deadline
  
}
