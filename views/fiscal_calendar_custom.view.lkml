view: fiscal_calendar_custom {
  sql_table_name: `adamminton-sandbox.custom_calendars.fiscal_calendar_looker` ;;

  calendar_definition: {
    reference_date: reference_date
    timeframe_mapping: {
      custom_year: fiscal_year
      custom_quarter: fiscal_quarter_of_year
      custom_date: fiscal_date
      custom_week: fiscal_week_of_year
      custom_period: fiscal_period_of_year
      custom_season: season
    }
    timeframe_ordinal_mapping: {
      custom_year: fiscal_year_num
      custom_quarter: fiscal_quarter_of_year_num
      custom_date: fiscal_date_num
      custom_week: fiscal_week_of_year_num
      custom_period: fiscal_period_of_year_num
      custom_season: season_num
    }
    previous_ordinal_mapping: {
      custom_date: prev_custom_date
      custom_week: prev_custom_week
    }
  }

  dimension: reference_date {
    type: date
    datatype: timestamp
    sql: ${TABLE}.reference_date ;;
    primary_key: yes
  }

  dimension: fiscal_date {
    type: string
    sql: CAST(${TABLE}.reference_date AS STRING) ;;
  }

  dimension: fiscal_date_num {
    type: number
    sql: ${TABLE}.fiscal_date_num ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: fiscal_year_num {
    type: number
    sql: ${TABLE}.fiscal_year_num ;;
  }

  dimension: fiscal_quarter_of_year {
    type: string
    sql: ${TABLE}.fiscal_quarter_of_year ;;
  }

  dimension: fiscal_quarter_of_year_num {
    type: number
    sql: ${TABLE}.fiscal_quarter_of_year_num ;;
  }

  dimension: fiscal_period_of_year {
    type: string
    sql: ${TABLE}.fiscal_period_of_year ;;
  }

  dimension: fiscal_period_of_year_num {
    type: number
    sql: ${TABLE}.fiscal_period_of_year_num ;;
  }

  dimension: fiscal_week_of_year {
    type: string
    sql: ${TABLE}.fiscal_week_of_year ;;
  }

  dimension: fiscal_week_of_year_num {
    type: number
    sql: ${TABLE}.fiscal_week_of_year_num ;;
  }

  dimension: prev_custom_date {
    type: number
    sql: ${TABLE}.prev_custom_date ;;
  }

  dimension: prev_custom_week {
    type: number
    sql: ${TABLE}.prev_custom_week ;;
  }

  dimension: season {
    type: string
    sql: 'N/A' ;;
    hidden: yes
  }

  dimension: season_num {
    type: number
    sql: 0 ;;
    hidden: yes
  }

  dimension: day_of_fiscal_year {
    type: number
    sql: DATE_DIFF(DATE(${TABLE}.reference_date), (SELECT MIN(DATE(r2.reference_date)) FROM `adamminton-sandbox.custom_calendars.fiscal_calendar_looker` r2 WHERE r2.fiscal_year_num = ${TABLE}.fiscal_year_num), DAY) + 1 ;;
  }

  dimension: passes_pop_filter {
    type: yesno
    sql:
      CASE
        WHEN {% parameter order_items_native.pop_comparison_type %} = 'Full Period' THEN TRUE
        WHEN {% parameter order_items_native.pop_comparison_type %} = 'Period to Date' THEN
          ${day_of_fiscal_year} <= (
            SELECT DATE_DIFF(CURRENT_DATE("America/Chicago"), MIN(DATE(r2.reference_date)), DAY) + 1
            FROM `adamminton-sandbox.custom_calendars.fiscal_calendar_looker` r2
            WHERE r2.fiscal_year_num = (
              SELECT r3.fiscal_year_num
              FROM `adamminton-sandbox.custom_calendars.fiscal_calendar_looker` r3
              WHERE DATE(r3.reference_date) = CURRENT_DATE("America/Chicago")
            )
          )
        ELSE TRUE
      END ;;
  }
}
