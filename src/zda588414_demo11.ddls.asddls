@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Enviroment System Fields'

define view entity ZDA588414_Demo11
  with parameters
    p_carrierId    : /dmo/carrier_id,
    P_connectionId : /dmo/connection_id,
    @Environment.systemField: #SYSTEM_DATE 
    P_Deadline     : abap.dats
  as select from /dmo/flight
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied
}
where
      carrier_id    = $parameters.p_carrierId
  and connection_id = $parameters.P_connectionId
  and flight_date   >= $parameters.P_Deadline
