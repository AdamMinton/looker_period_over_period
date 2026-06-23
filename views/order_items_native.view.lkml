include: "/views/order_items.view.lkml"
include: "/views/fiscal_calendar_custom.view.lkml"

view: order_items_native {
  extends: [order_items]

  parameter: pop_comparison_type {
    type: string
    allowed_value: {
      label: "Full Period"
      value: "Full Period"
    }
    allowed_value: {
      label: "Period to Date"
      value: "Period to Date"
    }
    default_value: "Full Period"
  }

  dimension_group: created {
    type: custom_calendar
    based_on_calendar: fiscal_calendar_custom
    custom_timeframes: [custom_date, custom_week, custom_period, custom_quarter, custom_year]
  }

  # Base measure for PoP
  measure: orders_count {
    type: count_distinct
    sql: ${order_id} ;;
    value_format_name: decimal_0
  }

  # PoP Measure for Previous Year
  measure: orders_count_last_year {
    type: period_over_period
    description: "Order count from the previous custom year"
    based_on: orders_count
    based_on_time: created_custom_year
    custom_calendar_period: custom_year
    kind: previous
    value_format_name: decimal_0
  }

  # PoP Measure for YoY % Change
  measure: orders_count_yoy_change {
    type: period_over_period
    description: "Percentage change in order count from previous custom year"
    based_on: orders_count
    based_on_time: created_custom_year
    custom_calendar_period: custom_year
    kind: relative_change
    value_format_name: percent_1
  }
}
