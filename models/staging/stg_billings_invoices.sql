with src as (

    select *
    from {{ source('retail_raw', 'BILLINGS_INVOICES') }}

),

final as (

    select
        invoice_id,
        cast(invoice_date as date) as invoice_date,
        customer_id,
        customer_name,
        customer_type,
        product_id,
        product_name,
        cast(quantity as number) as quantity,
        cast(unit_price as number(10,2)) as unit_price,
        cast(gross_amount as number(12,2)) as gross_amount,
        cast(discount_amount as number(12,2)) as discount_amount,
        cast(net_amount as number(12,2)) as net_amount,
        invoice_status,
        payment_terms
    from src

)

select * from final;
