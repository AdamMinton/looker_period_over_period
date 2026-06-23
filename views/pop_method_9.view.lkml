include: "/views/order_items.view.lkml"

view: order_items_method_9 {
  extends: [order_items]

  measure: sales_last_year {
    type: period_over_period
    description: "Total Sales from the previous year"
    based_on: total_sale_price
    based_on_time: created_year
    period: year
    kind: previous
    value_format_name: usd
  }

  measure: sales_difference_last_year {
    type: period_over_period
    description: "Difference in Total Sales vs the previous year"
    based_on: total_sale_price
    based_on_time: created_year
    period: year
    kind: difference
    value_format_name: usd
  }

  measure: sales_relative_change_last_year {
    type: period_over_period
    description: "Relative change in Total Sales vs the previous year"
    based_on: total_sale_price
    based_on_time: created_year
    period: year
    kind: relative_change
    value_format_name: percent_2
  }
}
