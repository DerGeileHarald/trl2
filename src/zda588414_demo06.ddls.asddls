@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 06: Agregat Funktionen'


define view entity ZDA588414_Demo06
  as select from /dmo/flight
{
  carrier_id                                                        as CarrierId,
  count(*)                                                         as NumberOfFlights,
  count(distinct plane_type_id)                                    as NumberOfDifferentPlaneTypeIds,
  sum(seats_max)                                                   as TotalSeatsMax,
  sum(seats_occupied)                                              as NumberOfSeatsOccupied,
  min(seats_occupied)                                              as MinSeatsOccupied,
  max(seats_occupied)                                              as MaxSeatsOccupied,
  sum(case when seats_max = seats_occupied then 1 else 0 end)      as NumberOfBookedUpFlights,
  sum(case when seats_occupied / seats_max <0.5 then 1 else 0 end) as NumbeOfHalfEmptyFlights,
  @Semantics.amount.currencyCode:'CurrencyCode'
  avg(price as abap.curr(16,2))                                    as AveragePrice,
  currency_code                                                    as CurrencyCode


}
group by
  currency_code,
  carrier_id,
  connection_id
having 
  avg(price as abap.curr(16,2)) >5000
