include: "/views/pop_method_8.view.lkml"

explore: order_items_method_8 {
  label: "PoP Method 8: Compare Any Period to Any Other Period (Flexible)"
  from: pop
  view_name: pop

  always_join: [within_periods, over_periods]
  always_filter: {
    filters: [pop.date_filter: "last 12 weeks", pop.within_period_type: "WEEK", pop.over_period_type: "YEAR"]
  }

  join: within_periods {
    from: numbers
    type: left_outer
    relationship: one_to_many
    fields: []
    sql_on: ${within_periods.n}
          <= (DATE_DIFF(DATE({% date_end pop.date_filter %}), DATE({% date_start pop.date_filter %}), {% parameter pop.within_period_type %}) - 1) ;;
  }

  join: over_periods {
    from: numbers
    view_label: "_PoP"
    type: left_outer
    relationship: one_to_many
    sql_on:
      {% if pop.over_how_many_past_periods._is_filtered %}
        {% condition pop.over_how_many_past_periods %} ${over_periods.n} {% endcondition %}
      {% else %}
        ${over_periods.n} <= 1
      {% endif %} ;;
  }

  join: pop_order_items_created {
    type: left_outer
    relationship: many_to_one
    sql_on: pop_order_items_created.join_date =
      {% assign within_type = pop.within_period_type._parameter_value %}
      {% assign over_type = pop.over_period_type._parameter_value %}
      DATE_TRUNC(
        DATE_SUB(
          DATE_SUB(
            DATE({% date_end pop.date_filter %}),
            INTERVAL ${within_periods.n} {{ within_type }}
          ),
          INTERVAL ${over_periods.n} {{ over_type }}
        ),
        {{ within_type }}
      ) ;;
  }
}
