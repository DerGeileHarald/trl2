@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rechnen'

define view entity ZDA588414_Demo04
  as select from /dmo/flight
{
  key carrier_id                                                   as CarrierId,
  key connection_id                                                as ConnectionId,
  key flight_date                                                  as FlightDate,
      price                                                        as Price,
      currency_code                                                as CurrencyCode,
      seats_max                                                    as SeatsMax,
      seats_occupied                                               as SeatsOccupied,
      seats_max - seats_occupied                                   as SeatsFree,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price * 2                                                    as DoublePrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast ( price as abap.fltp )* 1.2                             as NewPriceAsFltp,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(price as abap.dec(16,2))* cast ( 1.2 as abap.dec(16,2)) as NewPriceAsDec,
      100 * seats_occupied / seats_max                             as OccupanyRate,
      'LH'                                                         as CarrierId1,
      cast ('LH' as /dmo/carrier_id )                              as Carrierid2

}
