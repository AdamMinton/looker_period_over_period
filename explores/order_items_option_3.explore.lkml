include: "/views/option_3_pivoted.view.lkml"
include: "/views/anchor_date.view.lkml"

explore: order_items_option_3 {
  view_name: option_3_pivoted
  label: "Order Items - Option 3"

  sql_preamble:
  {%- assign v_fiscal_calendar_table = 'adamminton-sandbox.custom_calendars.fiscal_calendar' -%}
  {%- assign v_comp_table = 'adamminton-sandbox.custom_calendars.cal_day_pryr_day' -%}
  {%- assign v_parameter_selected = 'YTD' -%}
  {%- if anchor_date.anchor_date._in_query -%}
    {%- assign param_val = anchor_date.anchor_date._parameter_value -%}
    {%- assign v_anchor_date = 'DATE(' | append: param_val | append: ')' -%}
  {%- else -%}
     {%- assign v_anchor_date = 'CURRENT_DATE("America/Chicago")' -%}
  {%- endif -%}
  @{fiscal_comp_filters} ;;

  join: anchor_date {
    view_label: "Fiscal Calendar"
    type: inner
    sql:  ;;
    relationship: one_to_one
  }
}
