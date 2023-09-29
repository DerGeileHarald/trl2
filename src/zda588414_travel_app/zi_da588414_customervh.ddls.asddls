@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'customer Value Help'

define view entity ZI_DA588414_CustomerVH
  as select from ZI_DA588414_Customer
{
  key CustomerId,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      CountryCode
}
