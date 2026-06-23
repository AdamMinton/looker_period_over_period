include: "/views/order_items.view.lkml"

view: order_items_option_2 {
  extends: [order_items]

  measure: wtd_orders {
    group_label: "Orders"
    label: "WTD Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      fiscal_flags.is_wtd: "yes",
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_wtd_orders {
    group_label: "Orders"
    label: "LY WTD Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      fiscal_flags.is_wtd: "yes",
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: mtd_orders {
    group_label: "Orders"
    label: "MTD Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      fiscal_flags.is_mtd: "yes",
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_mtd_orders {
    group_label: "Orders"
    label: "LY MTD Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      fiscal_flags.is_mtd: "yes",
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: qtd_orders {
    group_label: "Orders"
    label: "QTD Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      fiscal_flags.is_qtd: "yes",
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_qtd_orders {
    group_label: "Orders"
    label: "LY QTD Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      fiscal_flags.is_qtd: "yes",
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ytd_orders {
    group_label: "Orders"
    label: "YTD Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      fiscal_flags.is_ytd: "yes",
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_ytd_orders {
    group_label: "Orders"
    label: "LY YTD Orders"
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      fiscal_flags.is_ytd: "yes",
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }
  measure: wtd_items {
    group_label: "Items"
    label: "WTD Items"
    type: count
    filters: [
      fiscal_flags.is_wtd: "yes",
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_wtd_items {
    group_label: "Items"
    label: "LY WTD Items"
    type: count
    filters: [
      fiscal_flags.is_wtd: "yes",
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: mtd_items {
    group_label: "Items"
    label: "MTD Items"
    type: count
    filters: [
      fiscal_flags.is_mtd: "yes",
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_mtd_items {
    group_label: "Items"
    label: "LY MTD Items"
    type: count
    filters: [
      fiscal_flags.is_mtd: "yes",
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: qtd_items {
    group_label: "Items"
    label: "QTD Items"
    type: count
    filters: [
      fiscal_flags.is_qtd: "yes",
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_qtd_items {
    group_label: "Items"
    label: "LY QTD Items"
    type: count
    filters: [
      fiscal_flags.is_qtd: "yes",
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ytd_items {
    group_label: "Items"
    label: "YTD Items"
    type: count
    filters: [
      fiscal_flags.is_ytd: "yes",
      cal_day_pryr_day.is_actual_current: "yes",
      cal_day_pryr_day.is_this_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }

  measure: ly_ytd_items {
    group_label: "Items"
    label: "LY YTD Items"
    type: count
    filters: [
      fiscal_flags.is_ytd: "yes",
      cal_day_pryr_day.is_adjusted: "yes",
      cal_day_pryr_day.is_last_year: "yes"
    ]
    value_format_name: decimal_0
    html:@{html_large_value_format};;
  }
}
