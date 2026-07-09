@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for root travel entity'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define root view entity ZHDS_RTR_TRAVEL_PROCESSOR as projection on ZHDS_RTR_TRAVEL
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    AgencyName,
    CustomerName,
    StatusText,
    OverallStatusColor,
    /* Associations */
    -- Expose associations
    _Agency,
    _Booking : redirected to composition child ZHDS_RTR_BOOKING_PROCESSOR,
    _Currency,
    _Customer,
    _OverallStatus
}
