@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking processor projection entity'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define view entity ZHDS_RTR_BOOKING_PROCESSOR as projection on ZHDS_RTR_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingStatus,
    _BookingSuppl : redirected to composition child ZHDS_RTR_BOOKINGSUPPL_PROCESSO,
    _Carrier,
    _Connection,
    _Customer,
    _Travel : redirected to parent ZHDS_RTR_TRAVEL_PROCESSOR
}
