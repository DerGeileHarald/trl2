@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Task 5'
define view entity ZDA588414_Demo13

  with parameters
    P_City : /dmo/city
  as select from ZDA588414_Demo07

{

  key CustomerId,
      CurrencyCode,
      Street,
      PostalCode,
      City,
      TotalRevenure,
      NumberOfDifferentCarriers,
      AverageDaysAhead,
      BookingDate
}
where
      City        = $parameters.P_City
  and BookingDate < $session.system_date
