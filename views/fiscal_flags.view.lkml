view: fiscal_flags {
  fields_hidden_by_default: yes

  dimension: is_wtd {
    type: yesno
    sql: ${fiscal_calendar.calendar_d_date} BETWEEN ${anchor_calendar.fiscal_week_begin_d_date} AND ${anchor_calendar.calendar_d_date} ;;
  }

  dimension: is_mtd {
    type: yesno
    sql: ${fiscal_calendar.calendar_d_date} BETWEEN ${anchor_calendar.fiscal_month_begin_d_date} AND ${anchor_calendar.calendar_d_date} ;;
  }

  dimension: is_qtd {
    type: yesno
    sql: ${fiscal_calendar.calendar_d_date} BETWEEN ${anchor_calendar.fiscal_quarter_begin_d_date} AND ${anchor_calendar.calendar_d_date} ;;
  }

  dimension: is_ytd {
    type: yesno
    sql: ${fiscal_calendar.calendar_d_date} BETWEEN ${anchor_calendar.fiscal_year_begin_d_date} AND ${anchor_calendar.calendar_d_date} ;;
  }
}
