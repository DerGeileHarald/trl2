@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Value Helü'
define view entity ZI_DA588414_StatusVH
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/STATUS' )
{
      @UI.hidden: true
  key domain_name,
  key value_position,
  key language,
      @EndUserText: {label: 'Status', quickInfo: 'Status'}
      value_low as Status,
      @EndUserText: {label: 'Status Text ', quickInfo: 'Status Text '}
      text as StatusText

}
