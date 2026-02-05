with pos as (
    select
        transaction_date as revenue_date,
        store_id,
        store_name,
        store_state,
        product_id,
        product_name,
        category,
        quantity,
        net_sales as revenue_amount,
        'POS' as revenue_channel
    from {{ ref('stg_pos_transactions') }}
),

billings as (
    select
        invoice_date as revenue_date,
        null as store_id,
        null as store_name,
        null as store_state,
        product_id,
        product_name,
        null as category,
        quantity,
        net_amount as revenue_amount,
        'BILLINGS' as revenue_channel
    from {{ ref('stg_billings_invoices') }}
),

unioned as (
    select * from pos
    union all
    select * from billings
)

select * from unioned
