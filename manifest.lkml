project_name: "looker_period_over_period"

constant: wtd_measures { value: "wtd_orders,ly_wtd_orders" }
constant: mtd_measures { value: "mtd_orders,ly_mtd_orders" }
constant: qtd_measures { value: "qtd_orders,ly_qtd_orders" }
constant: ytd_measures { value: "ytd_orders,ly_ytd_orders" }

constant: fiscal_comp_filters {
  value: "
  {%- comment -%}1. Declare the variables{%- endcomment -%}
  DECLARE v_report_start_date DATE;
  DECLARE v_report_end_date DATE;
  DECLARE v_partitions_to_scan ARRAY<DATE>;

  {%- comment -%}2. Determine the Report Window (Start/End) based on parameter{%- endcomment -%}

  {%- comment -%} ===================== WEEKS ===================== {%- endcomment -%}

  {%- comment -%} Last Week (LW) {%- endcomment -%}
  {% if v_parameter_selected == 'LW' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT fiscal_week_begin_d, fiscal_week_end_d
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = DATE_SUB({{v_anchor_date}}, INTERVAL 7 DAY)
  );

  {%- comment -%} Last 4 Weeks (L4W) {%- endcomment -%}
  {% elsif v_parameter_selected == 'L4W' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT
  (SELECT fiscal_week_begin_d FROM {{v_fiscal_calendar_table}} WHERE calendar_d = DATE_SUB({{v_anchor_date}}, INTERVAL 28 DAY)),
  (SELECT fiscal_week_end_d FROM {{v_fiscal_calendar_table}} WHERE calendar_d = DATE_SUB({{v_anchor_date}}, INTERVAL 7 DAY))
  );

  {%- comment -%} Last 13 Weeks (L13W) {%- endcomment -%}
  {% elsif v_parameter_selected == 'L13W' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT
  (SELECT fiscal_week_begin_d FROM {{v_fiscal_calendar_table}} WHERE calendar_d = DATE_SUB({{v_anchor_date}}, INTERVAL 91 DAY)),
  (SELECT fiscal_week_end_d FROM {{v_fiscal_calendar_table}} WHERE calendar_d = DATE_SUB({{v_anchor_date}}, INTERVAL 7 DAY))
  );

  {%- comment -%} Week To Date (WTD) {%- endcomment -%}
  {% elsif v_parameter_selected == 'WTD' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT fiscal_week_begin_d, {{v_anchor_date}}
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = {{v_anchor_date}}
  );

  {%- comment -%} ===================== MONTHS ===================== {%- endcomment -%}

  {%- comment -%} Last Month (LM) {%- endcomment -%}
  {% elsif v_parameter_selected == 'LM' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT fiscal_month_begin_d, fiscal_month_end_d
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = DATE_SUB(
  (SELECT fiscal_month_begin_d FROM {{v_fiscal_calendar_table}} WHERE calendar_d = {{v_anchor_date}}),
  INTERVAL 1 DAY
  )
  );

  {%- comment -%} Month To Date (MTD) {%- endcomment -%}
  {% elsif v_parameter_selected == 'MTD' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT fiscal_month_begin_d, {{v_anchor_date}}
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = {{v_anchor_date}}
  );

  {%- comment -%} ===================== QUARTERS ===================== {%- endcomment -%}

  {%- comment -%} Last Quarter (LQ) {%- endcomment -%}
  {% elsif v_parameter_selected == 'LQ' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT fiscal_quarter_begin_d, fiscal_quarter_end_d
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = DATE_SUB(
  (SELECT fiscal_quarter_begin_d FROM {{v_fiscal_calendar_table}} WHERE calendar_d = {{v_anchor_date}}),
  INTERVAL 1 DAY
  )
  );

  {%- comment -%} Quarter To Week (QTW) {%- endcomment -%}
  {% elsif v_parameter_selected == 'QTW' %}
  SET (v_report_start_date, v_report_end_date) = (
  WITH anchor AS (
  SELECT
  {{v_anchor_date}} AS today,
  {%- comment -%} Calculate End Date of the Last Completed Week {%- endcomment -%}
  (SELECT fiscal_week_end_d
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = DATE_SUB({{v_anchor_date}}, INTERVAL 7 DAY)) AS lw_end
  ),
  curr_q AS (
  {%- comment -%} Get the Start Date of the Current Quarter {%- endcomment -%}
  SELECT fiscal_quarter_begin_d
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = (SELECT today FROM anchor)
  )
  SELECT AS STRUCT
  CASE
  WHEN curr_q.fiscal_quarter_begin_d > anchor.lw_end THEN
  (SELECT fiscal_quarter_begin_d
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = DATE_SUB(curr_q.fiscal_quarter_begin_d, INTERVAL 1 DAY))
  ELSE
  curr_q.fiscal_quarter_begin_d
  END,
  anchor.lw_end
  FROM anchor, curr_q
  );

  {%- comment -%}Quarter To Date (QTD){%- endcomment -%}
  {% elsif v_parameter_selected == 'QTD' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT fiscal_quarter_begin_d, {{v_anchor_date}}
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = {{v_anchor_date}}
  );

  {%- comment -%} ===================== YEARS ===================== {%- endcomment -%}

  {%- comment -%} Last Year (LY) {%- endcomment -%}
  {% elsif v_parameter_selected == 'LY' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT fiscal_year_begin_d, fiscal_year_end_d
  FROM {{v_fiscal_calendar_table}}
  WHERE fiscal_year_id = (
  SELECT fiscal_year_id - 1 FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = {{v_anchor_date}}
  )
  GROUP BY 1,2
  );

  {%- comment -%}Year To Date (YTD){%- endcomment -%}
  {% elsif v_parameter_selected == 'YTD' %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT fiscal_year_begin_d, {{v_anchor_date}}
  FROM {{v_fiscal_calendar_table}}
  WHERE calendar_d = {{v_anchor_date}}
  );

  {% else %}
  SET (v_report_start_date, v_report_end_date) = (
  SELECT AS STRUCT MIN(calendar_d), MAX(calendar_d)
  FROM {{v_fiscal_calendar_table}}
  WHERE {% condition fiscal_calendar.calendar_d_date %} calendar_d {% endcondition %}
  );
  {% endif %}

  {%- comment -%}
  3. Build the 'Hit List' of dates using the Comp Table
  {%- endcomment -%}

  SET v_partitions_to_scan = (
  SELECT ARRAY_AGG(DISTINCT relt_greg_d)
  FROM {{v_comp_table}}
  WHERE greg_d BETWEEN v_report_start_date AND v_report_end_date AND CONCAT(cal_type_c, '_', relt_date_type_c) IN ('AC_TY', 'AD_LY')
  );
  "
}
