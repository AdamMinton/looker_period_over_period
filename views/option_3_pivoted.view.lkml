include: "/views/option_3_ndt.view.lkml"

view: option_3_pivoted {
  derived_table: {
    sql:
      SELECT 'WTD' as period, 'Total Orders' as measure_name, wtd_orders as ty_val, ly_wtd_orders as ly_val FROM ${option_3_ndt.SQL_TABLE_NAME}
      UNION ALL
      SELECT 'MTD' as period, 'Total Orders' as measure_name, mtd_orders as ty_val, ly_mtd_orders as ly_val FROM ${option_3_ndt.SQL_TABLE_NAME}
      UNION ALL
      SELECT 'QTD' as period, 'Total Orders' as measure_name, qtd_orders as ty_val, ly_qtd_orders as ly_val FROM ${option_3_ndt.SQL_TABLE_NAME}
      UNION ALL
      SELECT 'YTD' as period, 'Total Orders' as measure_name, ytd_orders as ty_val, ly_ytd_orders as ly_val FROM ${option_3_ndt.SQL_TABLE_NAME}
      
      UNION ALL
      
      SELECT 'WTD' as period, 'Total Items' as measure_name, wtd_items as ty_val, ly_wtd_items as ly_val FROM ${option_3_ndt.SQL_TABLE_NAME}
      UNION ALL
      SELECT 'MTD' as period, 'Total Items' as measure_name, mtd_items as ty_val, ly_mtd_items as ly_val FROM ${option_3_ndt.SQL_TABLE_NAME}
      UNION ALL
      SELECT 'QTD' as period, 'Total Items' as measure_name, qtd_items as ty_val, ly_qtd_items as ly_val FROM ${option_3_ndt.SQL_TABLE_NAME}
      UNION ALL
      SELECT 'YTD' as period, 'Total Items' as measure_name, ytd_items as ty_val, ly_ytd_items as ly_val FROM ${option_3_ndt.SQL_TABLE_NAME}
    ;;
  }

  dimension: period_sort_order {
    hidden: yes
    type: number
    sql:
      CASE ${TABLE}.period
        WHEN 'WTD' THEN 1
        WHEN 'MTD' THEN 2
        WHEN 'QTD' THEN 3
        WHEN 'YTD' THEN 4
        ELSE 5
      END ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
    order_by_field: period_sort_order
  }

  dimension: measure_name {
    type: string
    sql: ${TABLE}.measure_name ;;
  }

  measure: ty_value {
    type: sum
    sql: ${TABLE}.ty_val ;;
    value_format_name: decimal_0
  }

  measure: ly_value {
    type: sum
    sql: ${TABLE}.ly_val ;;
    value_format_name: decimal_0
  }

  measure: yoy_change {
    type: number
    sql: SAFE_DIVIDE( (${ty_value} - ${ly_value}), ${ly_value} ) ;;
    value_format_name: percent_1
  }
}
