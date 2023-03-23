with

rentalorders as (
    select * from {{ source('car_rental', 'rentalorders') }}
),

renamed as (
    select
        rentalorders.rentalorderid as rentalorder_id,
        rentalorders.customerid as customer_id,
        rentalorders.carid as car_id,
        rentalorders.orderstatus as order_status,
        rentalorders.mileagestart as mileage_start,
        rentalorders.mileageend as mileage_end
    from rentalorders
)

select * renamed