@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking'
@Metadata.allowExtensions: true
define view entity ZC_DA588414_Booking
  as projection on ZR_DA588414_Booking
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      
      /* Associations */
      _Travel : redirected to parent ZC_DA588414_Travel
}
