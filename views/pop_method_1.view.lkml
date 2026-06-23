include: "/views/order_items.view.lkml"

view: order_items_method_1 {
  extends: [order_items]

  dimension: wtd_only {
    group_label: "To-Date Filters"
    label: "WTD"
    view_label: "_PoP"
    type: yesno
    sql:
      (EXTRACT(DAYOFWEEK FROM ${created_raw}) < EXTRACT(DAYOFWEEK FROM CURRENT_TIMESTAMP())
      OR
      (EXTRACT(DAYOFWEEK FROM ${created_raw}) = EXTRACT(DAYOFWEEK FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(HOUR FROM ${created_raw}) < EXTRACT(HOUR FROM CURRENT_TIMESTAMP()))
      OR
      (EXTRACT(DAYOFWEEK FROM ${created_raw}) = EXTRACT(DAYOFWEEK FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(HOUR FROM ${created_raw}) = EXTRACT(HOUR FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(MINUTE FROM ${created_raw}) < EXTRACT(MINUTE FROM CURRENT_TIMESTAMP()))) ;;
  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "_PoP"
    type: yesno
    sql:
      (EXTRACT(DAY FROM ${created_raw}) < EXTRACT(DAY FROM CURRENT_TIMESTAMP())
      OR
      (EXTRACT(DAY FROM ${created_raw}) = EXTRACT(DAY FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(HOUR FROM ${created_raw}) < EXTRACT(HOUR FROM CURRENT_TIMESTAMP()))
      OR
      (EXTRACT(DAY FROM ${created_raw}) = EXTRACT(DAY FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(HOUR FROM ${created_raw}) = EXTRACT(HOUR FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(MINUTE FROM ${created_raw}) < EXTRACT(MINUTE FROM CURRENT_TIMESTAMP()))) ;;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "_PoP"
    type: yesno
    sql:
      (EXTRACT(DAYOFYEAR FROM ${created_raw}) < EXTRACT(DAYOFYEAR FROM CURRENT_TIMESTAMP())
      OR
      (EXTRACT(DAYOFYEAR FROM ${created_raw}) = EXTRACT(DAYOFYEAR FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(HOUR FROM ${created_raw}) < EXTRACT(HOUR FROM CURRENT_TIMESTAMP()))
      OR
      (EXTRACT(DAYOFYEAR FROM ${created_raw}) = EXTRACT(DAYOFYEAR FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(HOUR FROM ${created_raw}) = EXTRACT(HOUR FROM CURRENT_TIMESTAMP()) AND
       EXTRACT(MINUTE FROM ${created_raw}) < EXTRACT(MINUTE FROM CURRENT_TIMESTAMP()))) ;;
  }
}
