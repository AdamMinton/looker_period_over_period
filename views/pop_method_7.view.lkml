include: "/views/order_items.view.lkml"

view: order_items_method_7 {
  extends: [order_items]

  filter: date_filter {
    view_label: "_PoP"
    description: "Use this date filter in combination with the timeframes dimension for dynamic date filtering"
    type: date
  }

  dimension_group: filter_start_date {
    hidden: yes
    type: time
    timeframes: [raw, date]
    sql: CASE WHEN {% date_start date_filter %} IS NULL THEN TIMESTAMP('2013-01-01 00:00:00') ELSE TIMESTAMP({% date_start date_filter %}) END ;;
  }

  dimension_group: filter_end_date {
    hidden: yes
    type: time
    timeframes: [raw, date]
    sql: CASE WHEN {% date_end date_filter %} IS NULL THEN CURRENT_TIMESTAMP() ELSE TIMESTAMP({% date_end date_filter %}) END ;;
  }

  dimension: interval {
    hidden: yes
    type: number
    sql: DATE_DIFF(${filter_end_date_date}, ${filter_start_date_date}, DAY) ;;
  }

  # start date of the previous period
  dimension: previous_start_date {
    hidden: yes
    type: string
    sql: DATE_SUB(${filter_start_date_date}, INTERVAL ${interval} DAY) ;;
  }

  dimension: timeframes {
    view_label: "_PoP"
    type: string
    case: {
      when: {
        sql: ${is_current_period} = true ;;
        label: "Selected Period"
      }
      when: {
        sql: ${is_previous_period} = true ;;
        label: "Previous Period"
      }
      else: "Not in time period"
    }
  }

  ## For filtered measures

  dimension: is_current_period {
    hidden: yes
    type: yesno
    sql: ${created_date} >= ${filter_start_date_date} AND ${created_date} < ${filter_end_date_date} ;;
  }

  dimension: is_previous_period {
    hidden: yes
    type: yesno
    sql: ${created_date} >= DATE(${previous_start_date}) AND ${created_date} < ${filter_start_date_date} ;;
  }

  measure: selected_period_order_revenue {
    view_label: "_PoP"
    type: sum
    sql: ${sale_price} ;;
    filters: [is_current_period: "yes"]
    value_format_name: usd
  }

  measure: previous_period_order_revenue {
    view_label: "_PoP"
    type: sum
    sql: ${sale_price} ;;
    filters: [is_previous_period: "yes"]
    value_format_name: usd
  }

  measure: sales_pop_change {
    view_label: "_PoP"
    label: "Total Sales period-over-period % change"
    type: number
    sql: CASE WHEN ${previous_period_order_revenue} = 0
            THEN NULL
            ELSE (1.0 * ${selected_period_order_revenue} / NULLIF(${previous_period_order_revenue}, 0)) - 1 END ;;
    value_format_name: percent_2
  }
}
