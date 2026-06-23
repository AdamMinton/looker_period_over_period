include: "/views/order_items.view.lkml"

view: pop {
  sql_table_name: (SELECT NULL) ;;
  view_label: "_PoP"

  filter: date_filter  {
    label: "1. Date Range"
    hidden: yes
    type: date
    convert_tz: no
  }

  filter: over_how_many_past_periods {
    label: "Override past periods"
    description: "Apply this filter to add past periods to compare to (from the default of current vs 1 period ago)"
    type: number
    default_value: "<=1"
  }

  parameter: within_period_type {
    label: "2. Break down date range by"
    type: unquoted
    allowed_value: { value: "YEAR" }
    allowed_value: { value: "QUARTER" }
    allowed_value: { value: "MONTH" }
    allowed_value: { value: "WEEK" }
    allowed_value: { value: "DAY" }
    default_value: "WEEK"
  }

  parameter: over_period_type {
    label: "3. Compare over"
    type: unquoted
    allowed_value: { value: "YEAR" }
    allowed_value: { value: "QUARTER" }
    allowed_value: { value: "MONTH" }
    allowed_value: { value: "WEEK" }
    allowed_value: { value: "DAY" }
    default_value: "YEAR"
  }

  dimension: reference_date {
    hidden: yes
    type: string
    sql:
      {% assign within_type = pop.within_period_type._parameter_value %}
      DATE_TRUNC(
        DATE_SUB(
          DATE({% date_end pop.date_filter %}),
          INTERVAL (${within_periods.n} + 1) {{ within_type }}
        ),
        {{ within_type }}
      ) ;;
  }

  dimension: reference_date_formatted {
    type: string
    order_by_field: reference_date
    label: "Reference date"
    sql:
      CASE '{% parameter pop.within_period_type %}'
      WHEN 'YEAR' THEN FORMAT_TIMESTAMP('%Y', TIMESTAMP(${reference_date}))
      WHEN 'MONTH' THEN FORMAT_TIMESTAMP('%b %y', TIMESTAMP(${reference_date}))
      WHEN 'QUARTER' THEN CONCAT(CAST(EXTRACT(YEAR FROM DATE(${reference_date})) AS STRING), '-Q', CAST(EXTRACT(QUARTER FROM DATE(${reference_date})) AS STRING))
      WHEN 'WEEK' THEN FORMAT_TIMESTAMP('%m/%d/%y', TIMESTAMP(${reference_date}))
      WHEN 'DAY' THEN FORMAT_TIMESTAMP('%m/%d/%y', TIMESTAMP(${reference_date}))
      ELSE FORMAT_TIMESTAMP('%m/%d/%y', TIMESTAMP(${reference_date}))
      END ;;
  }

  dimension: over_periods_ago  {
    label: "Prior Periods"
    description: "Pivot me!"
    sql:
      CASE ${over_periods.n}
      WHEN 0 THEN CONCAT('Current ', '{% parameter pop.over_period_type %}')
      WHEN 1 THEN CONCAT(CAST(${over_periods.n} AS STRING), ' ', '{% parameter pop.over_period_type %}', ' prior')
      ELSE        CONCAT(CAST(${over_periods.n} AS STRING), ' ', '{% parameter pop.over_period_type %}', 's prior')
      END ;;
    order_by_field: over_periods_n_num
  }

  # Helper to make sure over_periods.n is exposed for sorting
  dimension: over_periods_n_num {
    hidden: yes
    type: number
    sql: ${over_periods.n} ;;
  }
}

view: numbers {
  sql_table_name: (
    SELECT 0 as n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL
    SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
    SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL
    SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL
    SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL
    SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL
    SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20 UNION ALL
    SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL
    SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL
    SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL
    SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL
    SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL
    SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL
    SELECT 39 UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL
    SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL
    SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL
    SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50 UNION ALL
    SELECT 51 UNION ALL SELECT 52
  ) ;;

  dimension: n {
    type: number
    hidden: yes
    sql: ${TABLE}.n ;;
  }
}

view: pop_order_items_created {
  view_label: "Order Items (By created date)"
  sql_table_name: (
    SELECT
      DATE_TRUNC(DATE(order_items.created_at), {% parameter pop.within_period_type %}) as join_date,
      COUNT(*) as agg_1,
      SUM(order_items.sale_price) as agg_2
    FROM `bigquery-public-data.thelook_ecommerce.order_items` AS order_items
    GROUP BY 1
  ) ;;

  measure: agg_1 {
    type: number
    label: "Count"
    sql: SUM(${TABLE}.agg_1) ;;
  }

  measure: agg_2 {
    type: number
    label: "Total Sales"
    sql: SUM(${TABLE}.agg_2) ;;
    value_format_name: usd
  }
}
