
    with adjustments as (

    select * from DEV01.LAVAS.TBL_GRUBHUB_ADJUSTMENTS_DBT

),

operations as (

    select * from DEV01.LAVAS.TBL_GRUBHUB_OPERATIONS_DBT

),

orders as (

    select * from DEV01.LAVAS.TBL_GRUBHUB_ORDERS_DBT

),

lineitems as (

    select * from DEV01.LAVAS.TBL_GRUBHUB_LINE_ITEMS_DBT

),

ratings as (

    select * from DEV01.LAVAS.TBL_GRUBHUB_RATINGS_DBT

),


final as (

    select
        adjustments.gh_cust_name,
        adjustments.partner_restaurant_id,
        adjustments.gh_cust_id,
        adjustments.transaction_type,
        adjustments.gh_order_number,
        adjustments.partner_order_id,
        adjustments.order_type,
        lineitems.menu_item_id,
        lineitems.menu_item_name,
        lineitems.menu_category_name,
        lineitems.menu_item_price,
        lineitems.menu_item_quantity,
        lineitems.menu_item_modifiers,
        adjustments.food_and_beverage_usd,
        adjustments.disbursed_tax_usd,
        adjustments.order_processing_fee_usd,
        adjustments.ad_fee_usd,
        adjustments.managed_delivery_fee_usd,
        adjustments.restaurant_targeted_promotion_usd,
        adjustments.restaurant_funded_reward_usd,
        adjustments.self_delivery_fee_usd,
        adjustments.tip_usd,
        adjustments.restaurant_service_fee_usd,
        adjustments.adjustment_reason,
        adjustments.adjustment_reason_category,
        adjustments.adjustment_item_name,
        orders.future_order_ind,
        orders.future_order_placed_date_time_utc,
        operations.restaurant_confirmable_date_time_utc,
        operations.restaurant_confirmed_date_time_utc,
        operations.delivery_pickup_arrived_date_time_utc,
        operations.delivery_pickup_departed_date_time_utc,
        operations.order_fulfilled_date_time_utc,
        operations.future_order_ind as is_future_order,
        operations.future_order_placed_date_time_utc as future_order_time_utc,
        ratings.overall_rating,
        ratings.order_correct_rating,
        ratings.food_good_rating,
        ratings.packaged_neatly_rating,
        ratings.review_text,
        ratings.feedback_date_time_utc,
        adjustments.transaction_date_time_utc,
        adjustments.time_zone,
        adjustments.order_uuid,
        adjustments.enterprise_brand,
        adjustments.corporate_entity_name,
        adjustments.created_at

        

    from adjustments

    left join operations using (gh_order_number)
    left join orders using (gh_order_number)
    left join lineitems using (gh_order_number)
    left join ratings using (gh_order_number)

)

select * from final
  );