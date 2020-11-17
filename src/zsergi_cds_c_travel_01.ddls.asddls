@EndUserText.label: 'CDS projection per CDS Travel'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZSERGI_CDS_C_TRAVEL_01
  as projection on ZSERGI_CDS_TRAVEL_01 as Travel
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      //Astersiquem ja que les dades del agewncy les traiem del odata remot (Custom entity zsergi_ce_agency)
      // @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID'} }]
      // @ObjectModel.text.element: ['AgencyName']
      @Consumption.valueHelpDefinition: [{ entity : {name: 'zsergi_ce_agency', element: 'AgencyId' } }]
      @Search.defaultSearchElement: true
      AgencyID,
      //Astersisquem el _Agency.Name ja que a les Custom Entities no está permès les associacions a les projection views
      //    _Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,
      Description,
      TravelStatus,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZSERGI_CDS_C_BOOK_01,
      _Currency,
      _Customer
}
