@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Textelement'

define view entity ZI_DA588414_customerText
  as select from ZI_DA588414_Customer
{
  key CustomerId,
  concat_with_space(FirstName, LastName, 1) as CustomerName
  
}
