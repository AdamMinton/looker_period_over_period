include: "/views/pop_method_4.view.lkml"

explore: order_items_method_4 {
  label: "PoP Method 4: Current Period and Many Previous Periods"
  always_filter: {
    filters: [current_date_range: "6 months", compare_to: "YEAR", comparison_periods: "3"]
  }
  sql_always_where:
    {% if order_items_method_4.current_date_range._is_filtered %}
      (
        {% condition order_items_method_4.current_date_range %} ${created_raw} {% endcondition %}
        {% if order_items_method_4.compare_to._in_query %}
          {% if order_items_method_4.comparison_periods._parameter_value == "2" %}
            or ${created_date} between ${period_2_start} and ${period_2_end}
          {% elsif order_items_method_4.comparison_periods._parameter_value == "3" %}
            or ${created_date} between ${period_2_start} and ${period_2_end}
            or ${created_date} between ${period_3_start} and ${period_3_end}
          {% elsif order_items_method_4.comparison_periods._parameter_value == "4" %}
            or ${created_date} between ${period_2_start} and ${period_2_end}
            or ${created_date} between ${period_3_start} and ${period_3_end}
            or ${created_date} between ${period_4_start} and ${period_4_end}
          {% else %}
            or 1 = 1
          {% endif %}
        {% endif %}
      )
    {% else %}
      1 = 1
    {% endif %} ;;
}
