
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'task 5'

define view entity ZDA588414_Demo16 as select from Z588414_Customer as b
association [0..*] to Z588414_Booking as _Booking on b.CustomerId = _Booking.CustomerId
{
key b.CustomerId,
b.FirstName,
b.LastName,
b.Title,
b.Street,
b.PostalCode,
b.City,
b.CountryCode,
b.PhoneNumber,
b.EmailAddress,
_Booking
 }
