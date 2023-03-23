WITH

customers AS (

    SELECT * FROM {{ ref('stg_car_rental_customers') }}

),

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

        customers.customer_id,
        customers.full_name,
        rentalcategories.rental_category AS customer_category,
        rentalcategories.monthly_rent_price,
        cars.car_make,
        cars.car_model,
        cars.car_color,
        rentalcategories.car_category
        
    FROM customers

    INNER JOIN rentalorders
    ON customers.customer_id = rentalorders.customer_id

    INNER JOIN cars
    ON rentalorders.car_id = cars.car_id

    INNER JOIN rentalcategories 
    ON customers.rentalcategories_id = rentalcategories.rentalcategories_id

    ORDER BY customers.customer_id

)

SELECT * FROM final
