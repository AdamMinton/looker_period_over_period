view: cal_day_pryr_day {
  fields_hidden_by_default: yes

  sql_table_name: `@{GCP_PROJECT}.@{CALENDAR_DATASET}.cal_day_pryr_day` ;;

  dimension: greg_d {
    type: date
    datatype: date
    sql: ${TABLE}.greg_d ;;
  }

  dimension_group: greg {
    type: time
    timeframes: [raw,date]
    datatype: date
    sql: ${TABLE}.greg_d ;;
  }

  dimension: cal_type_c {
    type: string
    sql: ${TABLE}.cal_type_c ;;
  }

  dimension: relt_date_type_c {
    type: string
    sql: ${TABLE}.relt_date_type_c ;;
  }

  dimension: relt_greg_d {
    type: date
    datatype: date
    sql: ${TABLE}.relt_greg_d ;;
  }

  dimension_group: relt_greg {
    type: time
    timeframes: [raw,date]
    datatype: date
    sql: ${TABLE}.relt_greg_d ;;
  }

  dimension: scenario {
    type: string
    sql: CONCAT(${cal_type_c}, '_', ${relt_date_type_c}) ;;
  }

  dimension: is_actual_current {
    type: yesno
    sql: ${cal_type_c} = 'AC' ;;
  }

  dimension: is_adjusted {
    type: yesno
    sql: ${cal_type_c} = 'AD' ;;
  }

  dimension: is_this_year {
    type: yesno
    sql: ${relt_date_type_c} = 'TY' ;;
  }

  dimension: is_last_year {
    type: yesno
    sql: ${relt_date_type_c} = 'LY' ;;
  }

}
