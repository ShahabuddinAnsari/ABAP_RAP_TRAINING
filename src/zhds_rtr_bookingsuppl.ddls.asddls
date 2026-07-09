@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppliment Child Entity'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view entity ZHDS_RTR_BOOKINGSUPPL as select from /dmo/booksuppl_m
association to parent ZHDS_RTR_BOOKING as _Booking
    on $projection.TravelId = _Booking.TravelId and
    $projection.BookingId = _Booking.BookingId

association[1..1] to ZHDS_RTR_TRAVEL as _Travel
on $projection.TravelId = _Travel.TravelId

association[1..1] to /DMO/I_Supplement as _Supplement 
on $projection.SupplementId = _Supplement.SupplementID

association[1..*] to /DMO/I_SupplementText as _SupplementText
on $projection.SupplementId = _SupplementText.SupplementID

association of one to one I_Currency as _Currency on
$projection.CurrencyCode = _Currency.Currency



{
    key /dmo/booksuppl_m.travel_id as TravelId,
    key /dmo/booksuppl_m.booking_id as BookingId,
    

    key /dmo/booksuppl_m.booking_supplement_id as BookingSupplementId,
    
    @Consumption.valueHelpDefinition: [{ 
        entity: {
            name: '/DMO/I_Supplement',
            element: 'SupplementID'
        }
    }] 
    /dmo/booksuppl_m.supplement_id as SupplementId,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    /dmo/booksuppl_m.price as Price,
    
    @Consumption.valueHelpDefinition: [{ 
        entity: {
            name: 'I_Currency',
            element: 'Currency'
        }
    }] 
    /dmo/booksuppl_m.currency_code as CurrencyCode,
    
    @Semantics.systemDateTime.lastChangedAt: true
    /dmo/booksuppl_m.last_changed_at as LastChangedAt,
    
    -- Exposed Associations
    _Booking,
    _Travel,
    _Supplement,
    _SupplementText
}
