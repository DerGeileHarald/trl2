@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TAsk 3'

define view entity ZDA588414_BookingWithCustomer
  as select from /dmo/booking
    inner join   /dmo/customer as Customer on /dmo/booking.customer_id = Customer.customer_id
{
  key /dmo/booking.travel_id                                                      as TravelId,
  key /dmo/booking.booking_id                                                     as BookingId,
  key Customer.customer_id                                                        as CustomerId,
      /dmo/booking.booking_date                                                   as BookingDate,
      // /dmo/booking.customer_id as CustomerId,
      /dmo/booking.carrier_id                                                     as CarrierId,
      /dmo/booking.connection_id                                                  as ConnectionId,
      /dmo/booking.flight_date                                                    as FlightDate,


      Customer.street                                                             as Street,
      Customer.postal_code                                                        as PostalCode,
      Customer.city                                                               as City,
      Customer.country_code                                                       as CountryCode,
      Customer.phone_number                                                       as PhoneNumber,
      Customer.email_address                                                      as EmailAddress,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText: {label: 'Flight Price in Euro', quickInfo: 'Flight Price'}
      currency_conversion(
      amount => round(/dmo/booking.flight_price, -1),
       source_currency => /dmo/booking.currency_code,
        target_currency => cast('EUR'as abap.cuky),
         exchange_rate_date => /dmo/booking.booking_date,
        error_handling => 'KEEP_UNCONVERTED')                                     as Flightprice,

      cast('EUR'as abap.cuky)                                                     as CurrencyCode,

      dats_days_between( /dmo/booking.booking_date , /dmo/booking.flight_date   ) as DaysAhead,
      case Customer.title
      when '' then concat_with_space(Customer.first_name, Customer.last_name, 1)
      else concat_with_space(concat(Customer.title, Customer.first_name), Customer.last_name,1)
      end                                                                         as Customer
}
