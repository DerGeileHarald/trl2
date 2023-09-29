@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'task 4'

define view entity ZDA588414_Demo07
  as select from ZDA588414_BookingWithCustomer

{
  key CustomerId,
      BookingDate,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      Street,
      PostalCode,
      City,
      CountryCode,
      PhoneNumber,
      @Semantics.amount.currencyCode:'CurrencyCode'
      sum(FlightPrice)                 as TotalRevenure,
      count(distinct CarrierId)        as NumberOfDifferentCarriers,
      avg(DaysAhead as abap.dec(16,0)) as AverageDaysAhead

}
group by
  CustomerId,
  BookingDate,
  CarrierId,
  ConnectionId,
  FlightDate,
  FlightPrice,
  CurrencyCode,
  Street,
  PostalCode,
  City,
  CountryCode,
  PhoneNumber
