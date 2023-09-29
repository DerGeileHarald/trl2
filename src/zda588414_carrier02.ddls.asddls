
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CARRIER'

define view entity ZDA588414_Carrier02 as select from ZDA588414_Carrier
{
  key CarrierId,
  Name
}
