@EndUserText.label: 'Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_DA588414_Travel
  provider contract transactional_query
  as projection on ZR_DA588414_Travel
{
  key TravelUuid,
      TravelId,
      AgencyId,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZI_DA588414_CustomerVH', element: 'CustomerId' } }]
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_CurrencyStdVH', element: 'Currency' } }]
      CurrencyCode,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'ZI_DA588414_StatusVH', element: 'Status' } }]
      Status,
      /* Admin Data*/
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      StatusCriticality,
      BeginDateCriticality,
      _CustomerText.CustomerName as CustomerName,
      _Bookings : redirected to composition child ZC_DA588414_Booking
}
