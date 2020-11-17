@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS per a taula ZSERGI_TRAVEL_01'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZSERGI_CDS_TRAVEL_01
  as select from zsergi_travel_01 as Travel

  composition [0..*] of ZSERGI_CDS_BOOK_01 as _Booking

  //Asterisquem ja que al week 5 volem que les dades del Agency vinguin d'un odata Remot !!!!
  //association [0..1] to /DMO/I_Agency      as _Agency   on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to zsergi_ce_agency   as _Agency   on $projection.AgencyID = _Agency.AgencyId
  //Per això fem l'associació amb el Custom entity zsergi_cd_agency
  association [0..1] to /DMO/I_Customer    as _Customer on $projection.CustomerID = _Customer.CustomerID
  association [0..1] to I_Currency         as _Currency on $projection.CurrencyCode = _Currency.Currency

{
  key travel_uuid           as TravelUUID,
      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as TravelStatus,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      /* associations */
      _Booking,
      _Agency,
      _Customer,
      _Currency
}
