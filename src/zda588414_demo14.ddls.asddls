
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Path Expressions'

define view entity ZDA588414_Demo14 as select from ZDA588414_Demo114
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
  Price,
  CurrencyCode,
  PlaneTypeId,
  SeatsMax,
  SeatsOccupied,
  _Connection.airport_from_id as AirportFromId,
  _Connection.airport_to_id as AirportToId,
  /* Associations */
  _Bookings
}
