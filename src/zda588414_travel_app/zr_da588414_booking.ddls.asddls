@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'bpplomg'
define view entity ZR_DA588414_Booking
  as select from z588414_abooking
  association to parent ZR_DA588414_Travel as _Travel on $projection.TravelUuid = _Travel.TravelUuid
{

  key booking_uuid  as BookingUuid,
      travel_uuid   as TravelUuid,
      booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      _Travel
}
