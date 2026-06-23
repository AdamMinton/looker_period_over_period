include: "/views/order_items.view.lkml"

view: order_items_liquid {
  extends: [order_items]

  # --- Total Orders ---
  measure: ty_orders {
    group_label: "Orders"
    label: "TY Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_orders {
    group_label: "Orders"
    label: "LY Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: yoy_orders {
    group_label: "Orders"
    label: "Orders % Chg (AD-AD)"
    type: number
    sql: SAFE_DIVIDE( (${ty_orders} - ${ly_orders}), ${ly_orders} ) ;;
    value_format_name: percent_1
  }

  measure: ty_items {
    group_label: "Items"
    label: "TY Items"
    type: count
    filters: [
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_items {
    group_label: "Items"
    label: "LY Items"
    type: count
    filters: [
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: yoy_items {
    group_label: "Items"
    label: "Items % Chg (AD-AD)"
    type: number
    sql: SAFE_DIVIDE( (${ty_items} - ${ly_items}), ${ly_items} ) ;;
    value_format_name: percent_1
  }
}
