@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement processor entity'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define view entity ZHDS_RTR_BOOKINGSUPPL_PROCESSO as projection on ZHDS_RTR_BOOKINGSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZHDS_RTR_BOOKING_PROCESSOR,
    _Supplement,
    _SupplementText,
    _Travel : redirected to ZHDS_RTR_TRAVEL_PROCESSOR
}
