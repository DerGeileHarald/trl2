@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Carrier'

define view entity ZDA588414_Carrier
  as select from /dmo/carrier
{
  key carrier_id as CarrierId,
      name       as Name
}
