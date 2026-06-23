include: "/views/pop_method_3.view.lkml"

view: order_items_method_5 {
  extends: [order_items_method_3]

  filter: previous_date_range {
    type: date
    view_label: "_PoP"
    label: "2a. Previous Date Range (Custom):"
    description: "Select a custom previous period you would like to compare to. Must be used with Current Date Range filter."
  }

  dimension: period_2_start {
    view_label: "_PoP"
    description: "Calculates the start of the previous period"
    type: string
    hidden: yes
    sql:
      {% if compare_to._in_query %}
        {% if compare_to._parameter_value == "Period" %}
          DATE_SUB(DATE({% date_start current_date_range %}, 'US/Eastern'), INTERVAL ${days_in_period} DAY)
        {% else %}
          DATE_SUB(DATE({% date_start current_date_range %}, 'US/Eastern'), INTERVAL 1 {% parameter compare_to %})
        {% endif %}
      {% else %}
        DATE({% date_start previous_date_range %}, 'US/Eastern')
      {% endif %} ;;
  }

  dimension: period_2_end {
    view_label: "_PoP"
    description: "Calculates the end of the previous period"
    type: string
    hidden: yes
    sql:
      {% if compare_to._in_query %}
        {% if compare_to._parameter_value == "Period" %}
          DATE_SUB(DATE({% date_start current_date_range %}, 'US/Eastern'), INTERVAL 1 DAY)
        {% else %}
          DATE_SUB(DATE_SUB(DATE({% date_end current_date_range %}, 'US/Eastern'), INTERVAL 1 DAY), INTERVAL 1 {% parameter compare_to %})
        {% endif %}
      {% else %}
        DATE({% date_end previous_date_range %}, 'US/Eastern')
      {% endif %} ;;
  }
}
