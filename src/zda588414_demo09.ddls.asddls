@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union and Union All'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDA588414_Demo09
  as select from /dmo/customer
{
  key customer_id as CustomerId,

      first_name  as FirstName,
      last_name   as LastName,
      city        as City
}
where
  city = 'Berlin'

union all select from /dmo/customer as customer

  inner join          /dmo/travel   as Travel on Travel.customer_id = customer.customer_id
  inner join          /dmo/agency   as Agency on Agency.agency_id = Travel.agency_id
{
  key customer.customer_id as CustomerId,
      customer.first_name  as FirstName,
      customer.last_name   as LastName,
      customer.city        as City
}
where
  Agency.city = 'Berlin'
