WITH

rentalcategories AS (

    SELECT * FROM {{ ref('stg_car_rental_rentalcategories') }}

),

int_rentalcategories AS (

    SELECT

        *,
        CASE monthly_rent_price
            WHEN 300.0 
                THEN 'car category 1'
        
            WHEN 400.0 
                THEN 'car category 2'
        
            WHEN 500.0 
                THEN 'car category 3'
        
            ELSE 'car category 4'
        END AS car_category

    FROM rentalcategories
)

SELECT * FROM int_rentalcategories