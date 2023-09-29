@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 3: Literals and Cases'

define view entity ZDA588414_Demo03
  as select from /dmo/booking
{
  key booking_id    as KookingId,
  key travel_id     as TravelID,
      'Text'        as TextLiteral,
      42            as integerLiteral,
      0.1           as FloatingPointNumberLiteral,
      currency_code as CurrencyCode,
      case currency_code when 'EUR' then 'Euro'
      when 'USD' then 'US Dollar'
      when 'SGD' then 'Singapur Dollar'
      when 'JPY' then 'Yen'
      else currency_code
      end           as CurrencyCodeText,
      flight_price  as FlightPrice,
      case when currency_code = 'EUR' and flight_price >= 2000 then 'X'
        else ''
       end          as teurio

}
