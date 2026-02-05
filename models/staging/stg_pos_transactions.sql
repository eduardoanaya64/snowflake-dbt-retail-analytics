with src as (

    select *
    from {{ source('retail_raw', 'POS_TRANSACTIONS') }}

),

final as (

    select
        pos_transaction_id,
        cast(transaction_date as date) as transaction_date,
        cast(store_id as number) as store_id,
        store_name,
        store_state,
        product_id,
        product_name,
        category,
        cast(quantity as number) as quantity,
        cast(unit_price as number(10,2)) as unit_price,
        cast(discount_amount as number(10,2)) as discount_amount,
        cast(net_sales as number(10,2)) as net_sales,
        payment_type
    from src

)

select * from final;
