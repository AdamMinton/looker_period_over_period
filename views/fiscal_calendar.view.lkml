view: fiscal_calendar {
  fields_hidden_by_default: yes

  sql_table_name: `adamminton-sandbox.custom_calendars.fiscal_calendar` ;;

  dimension_group: ad_shift_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ad_shift_d ;;
  }
  dimension_group: ad_shift_week_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ad_shift_week_end_d ;;
  }
  dimension: ad_shift_week_id {
    type: number
    sql: ${TABLE}.ad_shift_week_id ;;
  }
  dimension: ad_shift_year_id {
    type: number
    sql: ${TABLE}.ad_shift_year_id ;;
  }
  dimension_group: calendar_d {
    hidden: no
    group_label: "Calendar"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_d ;;
  }
  dimension: calendar_julian_d {
    type: number
    sql: ${TABLE}.calendar_julian_d ;;
  }
  dimension_group: calendar_month_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_month_end_d ;;
  }
  dimension: calendar_month_id {
    type: number
    sql: ${TABLE}.calendar_month_id ;;
  }
  dimension: calendar_month_n {
    type: string
    sql: ${TABLE}.calendar_month_n ;;
  }
  dimension: calendar_month_week_id {
    type: number
    sql: ${TABLE}.calendar_month_week_id ;;
  }
  dimension_group: calendar_previous_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_previous_d ;;
  }
  dimension: calendar_prior_year_id {
    type: number
    sql: ${TABLE}.calendar_prior_year_id ;;
  }
  dimension: calendar_week_count_in_year_id {
    type: number
    sql: ${TABLE}.calendar_week_count_in_year_id ;;
  }
  dimension: calendar_week_id {
    type: number
    sql: ${TABLE}.calendar_week_id ;;
  }
  dimension: calendar_week_n {
    type: string
    sql: ${TABLE}.calendar_week_n ;;
  }
  dimension: calendar_year_day_id {
    type: number
    sql: ${TABLE}.calendar_year_day_id ;;
  }
  dimension: calendar_year_id {
    type: number
    sql: ${TABLE}.calendar_year_id ;;
  }
  dimension: calendar_year_on_week_ending_id {
    type: number
    sql: ${TABLE}.calendar_year_on_week_ending_id ;;
  }
  dimension: day_n {
    type: string
    sql: ${TABLE}.day_n ;;
  }
  dimension: day_sequence_id {
    type: number
    sql: ${TABLE}.day_sequence_id ;;
  }
  dimension: daylight_savings_t {
    type: string
    sql: ${TABLE}.daylight_savings_t ;;
  }
  dimension: fiscal_month_abbreviation_n {
    type: string
    sql: ${TABLE}.fiscal_month_abbreviation_n ;;
  }
  dimension_group: fiscal_month_begin_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_month_begin_d ;;
  }
  dimension: fiscal_month_begin_julian_d {
    type: number
    sql: ${TABLE}.fiscal_month_begin_julian_d ;;
  }
  dimension: fiscal_month_day_id {
    type: number
    sql: ${TABLE}.fiscal_month_day_id ;;
  }
  dimension_group: fiscal_month_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_month_end_d ;;
  }
  dimension: fiscal_month_end_julian_d {
    type: number
    sql: ${TABLE}.fiscal_month_end_julian_d ;;
  }
  dimension: fiscal_month_id {
    type: number
    sql: ${TABLE}.fiscal_month_id ;;
  }
  dimension: fiscal_month_n {
    type: string
    sql: ${TABLE}.fiscal_month_n ;;
  }
  dimension_group: fiscal_month_prior_year_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_month_prior_year_end_d ;;
  }
  dimension: fiscal_month_sequence_id {
    type: number
    sql: ${TABLE}.fiscal_month_sequence_id ;;
  }
  dimension: fiscal_month_week_id {
    type: number
    sql: ${TABLE}.fiscal_month_week_id ;;
  }
  dimension: fiscal_month_week_n {
    type: string
    sql: ${TABLE}.fiscal_month_week_n ;;
  }
  dimension: fiscal_month_week_q {
    type: number
    sql: ${TABLE}.fiscal_month_week_q ;;
  }
  dimension_group: fiscal_prior_year_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_prior_year_d ;;
  }
  dimension: fiscal_prior_year_id {
    type: number
    sql: ${TABLE}.fiscal_prior_year_id ;;
  }
  dimension_group: fiscal_quarter_begin_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_quarter_begin_d ;;
  }
  dimension: fiscal_quarter_begin_julian_d {
    type: number
    sql: ${TABLE}.fiscal_quarter_begin_julian_d ;;
  }
  dimension: fiscal_quarter_day_id {
    type: number
    sql: ${TABLE}.fiscal_quarter_day_id ;;
  }
  dimension_group: fiscal_quarter_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_quarter_end_d ;;
  }
  dimension: fiscal_quarter_end_julian_d {
    type: number
    sql: ${TABLE}.fiscal_quarter_end_julian_d ;;
  }
  dimension: fiscal_quarter_id {
    type: number
    sql: ${TABLE}.fiscal_quarter_id ;;
  }
  dimension: fiscal_quarter_n {
    type: string
    sql: ${TABLE}.fiscal_quarter_n ;;
  }
  dimension_group: fiscal_quarter_prior_year_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_quarter_prior_year_end_d ;;
  }
  dimension: fiscal_quarter_week_id {
    type: number
    sql: ${TABLE}.fiscal_quarter_week_id ;;
  }
  dimension: fiscal_quarter_week_q {
    type: number
    sql: ${TABLE}.fiscal_quarter_week_q ;;
  }
  dimension_group: fiscal_season_begin_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_season_begin_d ;;
  }
  dimension_group: fiscal_season_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_season_end_d ;;
  }
  dimension_group: fiscal_season_prior_year_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_season_prior_year_end_d ;;
  }
  dimension_group: fiscal_week_begin_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_week_begin_d ;;
  }
  dimension: fiscal_week_begin_julian_d {
    type: number
    sql: ${TABLE}.fiscal_week_begin_julian_d ;;
  }
  dimension_group: fiscal_week_end_d {
    group_label: "Fiscal Periods"
    label: "Fiscal Week"
    hidden: no
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_week_end_d ;;
  }
  dimension: fiscal_week_end_julian_d {
    type: number
    sql: ${TABLE}.fiscal_week_end_julian_d ;;
  }
  dimension: fiscal_week_n {
    type: string
    sql: ${TABLE}.fiscal_week_n ;;
  }
  dimension_group: fiscal_week_prior_year_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_week_prior_year_end_d ;;
  }
  dimension_group: fiscal_year_begin_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_year_begin_d ;;
  }
  dimension: fiscal_year_begin_julian_d {
    type: number
    sql: ${TABLE}.fiscal_year_begin_julian_d ;;
  }
  dimension: fiscal_year_day_id {
    type: number
    sql: ${TABLE}.fiscal_year_day_id ;;
  }
  dimension_group: fiscal_year_end_d {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fiscal_year_end_d ;;
  }
  dimension: fiscal_year_end_julian_d {
    type: number
    sql: ${TABLE}.fiscal_year_end_julian_d ;;
  }
  dimension: fiscal_year_id {
    type: number
    sql: ${TABLE}.fiscal_year_id ;;
  }
  dimension: fiscal_year_season_id {
    type: number
    sql: ${TABLE}.fiscal_year_season_id ;;
  }
  dimension: fiscal_year_week_id {
    type: number
    sql: ${TABLE}.fiscal_year_week_id ;;
  }
  dimension: fiscal_year_week_q {
    type: number
    sql: ${TABLE}.fiscal_year_week_q ;;
  }
  dimension: holiday_n {
    type: string
    sql: ${TABLE}.holiday_n ;;
  }
  dimension: week_day_id {
    type: number
    sql: ${TABLE}.week_day_id ;;
  }
  dimension: week_sequence_id {
    type: number
    sql: ${TABLE}.week_sequence_id ;;
  }



  dimension: fiscal_month_begin_date {
    group_label: "Fiscal Periods"
    label: "Fiscal Month"
    hidden: no
    sql: ${fiscal_month_begin_d_date} ;;
  }

  dimension: fiscal_quarter_begin_date {
    group_label: "Fiscal Periods"
    label: "Fiscal Quarter"
    hidden: no
    sql: ${fiscal_quarter_begin_d_date} ;;
  }

  dimension: fiscal_year_begin_date {
    group_label: "Fiscal Periods"
    label: "Fiscal Year"
    hidden: no
    sql: ${fiscal_year_begin_d_date} ;;
  }

  parameter: fiscal_window {
    hidden: no
    label: "Fiscal Window"
    type: unquoted
    default_value: "CUSTOM"

    allowed_value: {
      label: "Last Week"
      value: "LW"
    }
    allowed_value: {
      label: "Last 4 Weeks"
      value: "L4W"
    }
    allowed_value: {
      label: "Last 13 Weeks"
      value: "L13W"
    }
    allowed_value: {
      label: "Last Month"
      value: "LM"
    }
    allowed_value: {
      label: "Last Quarter"
      value: "LQ"
    }
    allowed_value: {
      label: "Last Year"
      value: "LY"
    }
    allowed_value: {
      label: "Week To Date"
      value: "WTD"
    }
    allowed_value: {
      label: "Month To Date"
      value: "MTD"
    }
    allowed_value: {
      label: "Quarter To Week"
      value: "QTW"
    }
    allowed_value: {
      label: "Quarter To Date"
      value: "QTD"
    }
    allowed_value: {
      label: "Year To Date"
      value: "YTD"
    }
    allowed_value: {
      label: "Custom Date"
      value: "CUSTOM"
    }
  }

  parameter: time_grain {
    hidden: no
    type: unquoted
    description: "Use with Trend Scenario Date to have dynamic date ranges"
    default_value: "week"
    allowed_value: { label: "Day"     value: "day" }
    allowed_value: { label: "Week"    value: "week" }
    allowed_value: { label: "Month"   value: "month" }
    allowed_value: { label: "Quarter" value: "quarter" }
  }

  dimension: trend_scenario_date {
    hidden: no
    label: "Trend Scenario"
    description: "Use with Time Grant to select dynamic date ranges"
    type: date
    convert_tz: no
    datatype: date
    allow_fill: no
    sql:
    {% if time_grain._parameter_value == 'day' %}
    ${calendar_d_date}
    {% elsif time_grain._parameter_value == 'week' %}
    ${fiscal_week_begin_d_date}
    {% elsif time_grain._parameter_value == 'month' %}
    ${fiscal_month_begin_d_date}
    {% elsif time_grain._parameter_value == 'quarter' %}
    ${fiscal_quarter_begin_d_date}
    {% else %}  ${fiscal_week_begin_d_date}
    {% endif %}
    ;;
  }

}
