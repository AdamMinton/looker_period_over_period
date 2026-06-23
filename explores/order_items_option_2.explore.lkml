include: "/views/order_items_option_2.view.lkml"
include: "/views/fiscal_calendar.view.lkml"
include: "/views/cal_day_pryr_day.view.lkml"
include: "/views/anchor_date.view.lkml"
include: "/views/fiscal_flags.view.lkml"

explore: order_items_option_2 {
  view_name: order_items_option_2
  label: "Order Items - Option 2"



  sql_preamble:
  {%- assign v_fiscal_calendar_table = 'adamminton-sandbox.custom_calendars.fiscal_calendar' -%}
  {%- assign v_comp_table = 'adamminton-sandbox.custom_calendars.cal_day_pryr_day' -%}

  {%- comment -%} Detect period based on measures {%- endcomment -%}
  {%- assign v_parameter_selected = 'MTD' -%} {%- comment -%} Default {%- endcomment -%}

  {%- if order_items_option_2.ytd_orders._in_query or order_items_option_2.ly_ytd_orders._in_query or order_items_option_2.ytd_items._in_query or order_items_option_2.ly_ytd_items._in_query -%}
    {%- assign v_parameter_selected = 'YTD' -%}
  {%- elsif order_items_option_2.qtd_orders._in_query or order_items_option_2.ly_qtd_orders._in_query or order_items_option_2.qtd_items._in_query or order_items_option_2.ly_qtd_items._in_query -%}
    {%- assign v_parameter_selected = 'QTD' -%}
  {%- elsif order_items_option_2.mtd_orders._in_query or order_items_option_2.ly_mtd_orders._in_query or order_items_option_2.mtd_items._in_query or order_items_option_2.ly_mtd_items._in_query -%}
    {%- assign v_parameter_selected = 'MTD' -%}
  {%- elsif order_items_option_2.wtd_orders._in_query or order_items_option_2.ly_wtd_orders._in_query or order_items_option_2.wtd_items._in_query or order_items_option_2.ly_wtd_items._in_query -%}
    {%- assign v_parameter_selected = 'WTD' -%}
  {%- endif -%}

  {%- if anchor_date.anchor_date._in_query -%}
    {%- assign param_val = anchor_date.anchor_date._parameter_value -%}
    {%- assign v_anchor_date = 'DATE(' | append: param_val | append: ')' -%}
  {%- else -%}
     {%- assign v_anchor_date = 'CURRENT_DATE("America/Chicago")' -%}
  {%- endif -%}
  @{fiscal_comp_filters} ;;

  sql_always_where: TRUE
    AND ${order_items_option_2.created_date} IN UNNEST(v_partitions_to_scan)
    AND ${cal_day_pryr_day.greg_d} BETWEEN v_report_start_date AND v_report_end_date
    AND CONCAT(${cal_day_pryr_day.cal_type_c}, '_', ${cal_day_pryr_day.relt_date_type_c}) IN ('AC_TY', 'AD_LY')
  ;;

  join: cal_day_pryr_day {
    type: inner
    sql_on: ${order_items_option_2.created_date} = ${cal_day_pryr_day.relt_greg_d} ;;
    relationship: many_to_one
  }

  join: fiscal_calendar {
    type: inner
    sql_on: ${cal_day_pryr_day.greg_d} = ${fiscal_calendar.calendar_d_raw} ;;
    relationship: many_to_one
  }

  join: anchor_calendar {
    from: fiscal_calendar
    type: inner
    sql_on: ${anchor_calendar.calendar_d_raw} = 
      {% if anchor_date.anchor_date._in_query %}
        DATE({% parameter anchor_date.anchor_date %})
      {% else %}
        CURRENT_DATE("America/Chicago")
      {% endif %} ;;
    relationship: many_to_one
  }

  join: anchor_date {
    view_label: "Fiscal Calendar"
    type: inner
    sql:  ;;
    relationship: one_to_one
  }

  join: fiscal_flags {
    type: inner
    sql:  ;;
    relationship: one_to_one
  }

}
