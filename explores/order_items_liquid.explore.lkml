include: "/views/order_items_liquid.view.lkml"
include: "/views/fiscal_calendar.view.lkml"
include: "/views/cal_day_pryr_day.view.lkml"
include: "/views/anchor_date.view.lkml"


explore: order_items_liquid {
  view_name: order_items_liquid
  label: "Order Items - Liquid-Based Custom Calendar"

  conditionally_filter: {
    filters: [fiscal_calendar.calendar_d_date: "7 days ago for 7 days"]
    unless: [fiscal_calendar.fiscal_window]
  }

  sql_preamble:
  {%- assign v_fiscal_calendar_table = '@{GCP_PROJECT}.@{CALENDAR_DATASET}.fiscal_calendar' -%}
  {%- assign v_comp_table = '@{GCP_PROJECT}.@{CALENDAR_DATASET}.cal_day_pryr_day' -%}
  {%- assign v_parameter_selected = fiscal_calendar.fiscal_window._parameter_value -%}
  {%- if anchor_date.anchor_date._in_query -%}
    {%- assign param_val = anchor_date.anchor_date._parameter_value -%}
    {%- assign v_anchor_date = 'DATE(' | append: param_val | append: ')' -%}
  {%- else -%}
     {%- assign v_anchor_date = 'CURRENT_DATE("America/Chicago")' -%}
  {%- endif -%}
  @{fiscal_comp_filters} ;;

  sql_always_where: TRUE
    AND ${order_items_liquid.created_date} IN UNNEST(v_partitions_to_scan)
    AND ${cal_day_pryr_day.greg_d} BETWEEN v_report_start_date AND v_report_end_date
    AND CONCAT(${cal_day_pryr_day.cal_type_c}, '_', ${cal_day_pryr_day.relt_date_type_c}) IN ('AC_TY', 'AD_LY')
  ;;

  join: cal_day_pryr_day {
    type: inner
    sql_on: ${order_items_liquid.created_date} = ${cal_day_pryr_day.relt_greg_d} ;;
    relationship: many_to_one
  }

  join: fiscal_calendar {
    type: inner
    sql_on: ${cal_day_pryr_day.greg_d} = ${fiscal_calendar.calendar_d_raw} ;;
    relationship: many_to_one
  }

  join: anchor_date {
    view_label: "Fiscal Calendar"
    type: inner
    sql:  ;;
    relationship: one_to_one
  }

}
