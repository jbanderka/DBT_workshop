WITH

rentalorders AS (
    
    SELECT * FROM {{ ref('stg_car_rental_rentalorders') }}

),

cars AS (
    
    SELECT * FROM {{ ref('stg_car_rental_cars') }}

),

rentalcategories AS (
    
    SELECT * FROM {{ ref('int_rentalcategories') }}

),

final AS (

    SELECT

        cars.car_make,
        cars.car_model,
        rentalorders.mileage_start,
        rentalorders.mileage_end,
        rentalcategories.car_category

    FROM rentalorders

    inner join cars
    ON rentalorders.car_id = cars.car_id

    inner join rentalcategories 
    ON cars.rentalcategories_id = rentalcategories.rentalcategories_id

)

SELECT * FROM final