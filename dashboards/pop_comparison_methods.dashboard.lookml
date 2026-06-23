- dashboard: pop_comparison_methods
  title: Period over Period (PoP) Comparison Methods
  preferred_viewer: dashboards-next
  layout: newspaper
  filters_location_top: false

  filters:
  # Method 1
  - name: m1_date_filter
    title: "M1: Year Filter"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_1
    field: order_items_method_1.created_year
    default_value: "this year, last year"

  # Method 2
  - name: m2_date_filter
    title: "M2: Date Filter"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_2
    field: order_items_method_2.created_date
    default_value: "last 2 years"
  - name: m2_breakdown
    title: "M2: Group By (Row)"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_2
    field: order_items_method_2.choose_breakdown
    default_value: "Month"
  - name: m2_comparison
    title: "M2: Compare By (Pivot)"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_2
    field: order_items_method_2.choose_comparison
    default_value: "Year"

  # Method 3
  - name: m3_date_range
    title: "M3: Date Range"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_3
    field: order_items_method_3.current_date_range
    default_value: "this year"
  - name: m3_compare_to
    title: "M3: Compare To"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_3
    field: order_items_method_3.compare_to
    default_value: "YEAR"

  # Method 4
  - name: m4_date_range
    title: "M4: Date Range"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_4
    field: order_items_method_4.current_date_range
    default_value: "this year"
  - name: m4_compare_to
    title: "M4: Compare To"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_4
    field: order_items_method_4.compare_to
    default_value: "YEAR"
  - name: m4_periods
    title: "M4: Prior Periods Count"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_4
    field: order_items_method_4.comparison_periods
    default_value: "1"

  # Method 5
  - name: m5_date_range
    title: "M5: Current Date Range"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_5
    field: order_items_method_5.current_date_range
    default_value: "this year"
  - name: m5_previous_range
    title: "M5: Custom Prior Date Range"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_5
    field: order_items_method_5.previous_date_range
    default_value: "last year"

  # Method 6
  - name: m6_first_range
    title: "M6: First Period Filter"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_6
    field: order_items_method_6.first_period_filter
    default_value: "2025-01-01 to 2025-12-31"
  - name: m6_second_range
    title: "M6: Second Period Filter"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_6
    field: order_items_method_6.second_period_filter
    default_value: "2026-01-01 to 2026-12-31"

  # Method 7
  - name: m7_date_range
    title: "M7: Date Range"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_7
    field: order_items_method_7.date_filter
    default_value: "this year"

  # Method 8
  - name: m8_date_range
    title: "M8: Date Range"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_8
    field: pop.date_filter
    default_value: "this year"
  - name: m8_breakdown
    title: "M8: Break Down By"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_8
    field: pop.within_period_type
    default_value: "MONTH"
  - name: m8_compare_over
    title: "M8: Compare Over"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_8
    field: pop.over_period_type
    default_value: "YEAR"
  - name: m8_past_periods
    title: "M8: Prior Periods Count"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_8
    field: pop.over_how_many_past_periods
    default_value: "<=1"

  # Method 9
  - name: m9_date_range
    title: "M9: Date Range"
    type: field_filter
    model: looker_period_over_period
    explore: order_items_method_9
    field: order_items_method_9.created_month
    default_value: "this year"

  tabs:
  - name: 'Tab 1: Native & Parameter-Based'
    label: 'Tab 1: Native & Parameter-Based'
  - name: 'Tab 2: Custom & Arbitrary Date Ranges'
    label: 'Tab 2: Custom & Arbitrary Date Ranges'

  elements:

  # =============================================================
  # TAB 1: NATIVE & PARAMETER-BASED POP METHODS
  # =============================================================

  # Method 1
  - name: 'Method 1 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 1: Any Two Native Timeframes</span>
          <a href="https://discuss.google.dev/t/methods-for-period-over-period-pop-analysis-in-looker-method-1-any-two-native-timeframes/119255" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> This method uses Looker's built-in date dimension groups (like <code>created_month_name</code> and <code>created_year</code>) and pivots in the Explore to compare periods.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Easiest to build; requires zero Liquid or custom database SQL.</li>
              <li>Fully self-serve; users can pivot by any timeframe in the Explore.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Filters cannot be dynamically updated by a single dashboard parameter.</li>
              <li>Year-to-Date (YTD) comparisons require custom filters or table calculations.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 1: Native & Parameter-Based'

  - title: Method 1 - Data Table
    name: Method 1 - Data Table
    model: looker_period_over_period
    explore: order_items_method_1
    type: looker_grid
    fields: [order_items_method_1.created_month_name, order_items_method_1.created_month_num, order_items_method_1.created_year, order_items_method_1.total_sale_price]
    pivots: [order_items_method_1.created_year]
    sorts: [order_items_method_1.created_month_num]
    limit: 500
    show_view_names: false
    hidden_fields: [order_items_method_1.created_month_num]
    table_calculations:
    - table_calculation: relative_change
      label: "Relative Change %"
      expression: "(${order_items_method_1.total_sale_price} / pivot_offset(${order_items_method_1.total_sale_price}, -1)) - 1"
      value_format_name: percent_2
    listen:
      m1_date_filter: order_items_method_1.created_year
    row: 6
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 1: Native & Parameter-Based'

  - title: Method 1 - Chart
    name: Method 1 - Chart
    model: looker_period_over_period
    explore: order_items_method_1
    type: looker_line
    fields: [order_items_method_1.created_month_name, order_items_method_1.created_month_num, order_items_method_1.created_year, order_items_method_1.total_sale_price]
    pivots: [order_items_method_1.created_year]
    sorts: [order_items_method_1.created_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [order_items_method_1.created_month_num]
    listen:
      m1_date_filter: order_items_method_1.created_year
    row: 6
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 1: Native & Parameter-Based'

  # Method 2
  - name: 'Method 2 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 2: Any Two Native Timeframes (with Liquid)</span>
          <a href="https://discuss.google.dev/t/methods-for-pop-analysis-in-looker-method-2-any-two-native-timeframes-with-liquid/119257" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> Adds parameters to let users dynamically select the row breakdown granularity and pivot comparison period directly on a dashboard using drop-downs.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Highly dynamic user experience; great for general dashboard exploration.</li>
              <li>Allows switching from monthly to daily comparisons on the fly.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Filtered measures are incompatible with this dynamic dimension approach.</li>
              <li>Cannot define arbitrary event date ranges (requires standard calendars).</li>
            </ul>
          </div>
        </div>
      </div>
    row: 13
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 1: Native & Parameter-Based'

  - title: Method 2 - Data Table
    name: Method 2 - Data Table
    model: looker_period_over_period
    explore: order_items_method_2
    type: looker_grid
    fields: [order_items_method_2.pop_row, order_items_method_2.pop_pivot, order_items_method_2.total_sale_price]
    pivots: [order_items_method_2.pop_pivot]
    sorts: [order_items_method_2.pop_row]
    limit: 500
    show_view_names: false
    table_calculations:
    - table_calculation: relative_change
      label: "Relative Change %"
      expression: "(${order_items_method_2.total_sale_price} / pivot_offset(${order_items_method_2.total_sale_price}, -1)) - 1"
      value_format_name: percent_2
    listen:
      m2_date_filter: order_items_method_2.created_date
      m2_breakdown: order_items_method_2.choose_breakdown
      m2_comparison: order_items_method_2.choose_comparison
    row: 19
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 1: Native & Parameter-Based'

  - title: Method 2 - Chart
    name: Method 2 - Chart
    model: looker_period_over_period
    explore: order_items_method_2
    type: looker_line
    fields: [order_items_method_2.pop_row, order_items_method_2.pop_pivot, order_items_method_2.total_sale_price]
    pivots: [order_items_method_2.pop_pivot]
    sorts: [order_items_method_2.pop_row]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      m2_date_filter: order_items_method_2.created_date
      m2_breakdown: order_items_method_2.choose_breakdown
      m2_comparison: order_items_method_2.choose_comparison
    row: 19
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 1: Native & Parameter-Based'

  # Method 9
  - name: 'Method 9 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 9: Looker Built-in PoP Measures</span>
          <a href="https://docs.cloud.google.com/looker/docs/period-over-period" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> Uses Looker's built-in <code>type: period_over_period</code> measures. Looker automatically computes the SQL for previous period, difference, and percent change.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Native Looker support; very clean LookML.</li>
              <li>Doesn't require complex SQL queries, parameters, or table calculations.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Only supported on certain database dialects (e.g., BigQuery, Snowflake).</li>
              <li>Requires strict query construction rules (timeframe size compatibility constraints).</li>
            </ul>
          </div>
        </div>
      </div>
    row: 26
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 1: Native & Parameter-Based'

  - title: Method 9 - Data Table
    name: Method 9 - Data Table
    model: looker_period_over_period
    explore: order_items_method_9
    type: looker_grid
    fields: [order_items_method_9.created_month, order_items_method_9.total_sale_price, order_items_method_9.sales_last_year, order_items_method_9.sales_difference_last_year, order_items_method_9.sales_relative_change_last_year]
    sorts: [order_items_method_9.created_month desc]
    limit: 500
    show_view_names: false
    listen:
      m9_date_range: order_items_method_9.created_month
    row: 32
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 1: Native & Parameter-Based'

  - title: Method 9 - Chart
    name: Method 9 - Chart
    model: looker_period_over_period
    explore: order_items_method_9
    type: looker_line
    fields: [order_items_method_9.created_month, order_items_method_9.total_sale_price, order_items_method_9.sales_last_year]
    sorts: [order_items_method_9.created_month desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      m9_date_range: order_items_method_9.created_month
    row: 32
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 1: Native & Parameter-Based'


  # =============================================================
  # TAB 2: CUSTOM & ARBITRARY DATE RANGE POP METHODS
  # =============================================================

  # Method 3
  - name: 'Method 3 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 3: Current Period and Previous Period</span>
          <a href="https://discuss.google.dev/t/methods-for-period-over-period-pop-analysis-in-looker-method-3-current-period-and-previous-period/119259" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> Dynamically calculates the previous period of the exact same length using a Date filter and Liquid, and aligns them on a relative day-of-period axis.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Dynamically adjusts the previous period range based on whatever date range is selected.</li>
              <li>Fully compatible with filtered measures.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Relatively complex LookML view setup.</li>
              <li>Cannot support overlapping periods.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 3 - Data Table
    name: Method 3 - Data Table
    model: looker_period_over_period
    explore: order_items_method_3
    type: looker_grid
    fields: [order_items_method_3.date_in_period_month_name, order_items_method_3.date_in_period_month_num, order_items_method_3.period, order_items_method_3.total_sale_price]
    pivots: [order_items_method_3.period]
    sorts: [order_items_method_3.date_in_period_month_num]
    limit: 500
    show_view_names: false
    hidden_fields: [order_items_method_3.date_in_period_month_num]
    table_calculations:
    - table_calculation: relative_change
      label: "Relative Change %"
      expression: "(${order_items_method_3.total_sale_price} / pivot_offset(${order_items_method_3.total_sale_price}, -1)) - 1"
      value_format_name: percent_2
    listen:
      m3_date_range: order_items_method_3.current_date_range
      m3_compare_to: order_items_method_3.compare_to
    row: 4
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 3 - Chart
    name: Method 3 - Chart
    model: looker_period_over_period
    explore: order_items_method_3
    type: looker_line
    fields: [order_items_method_3.date_in_period_month_name, order_items_method_3.date_in_period_month_num, order_items_method_3.period, order_items_method_3.total_sale_price]
    pivots: [order_items_method_3.period]
    sorts: [order_items_method_3.date_in_period_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    hidden_fields: [order_items_method_3.date_in_period_month_num]
    listen:
      m3_date_range: order_items_method_3.current_date_range
      m3_compare_to: order_items_method_3.compare_to
    row: 4
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  # Method 4
  - name: 'Method 4 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 4: Current Period and Many Previous Periods</span>
          <a href="https://discuss.google.dev/t/methods-for-period-over-period-pop-analysis-in-looker-method-4-current-period-and-many-previous-periods/119262" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> Extends Method 3, using a parameter to dynamically select the number of prior periods to compare against side-by-side (e.g., 2, 3, or 4 periods ago).
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Allows multi-period comparison side-by-side.</li>
              <li>Maintains the dynamic alignment of the date axes.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>LookML view gets very verbose due to case statements for each period.</li>
              <li>Hardcoded upper limit on the number of comparisons.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 13
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 4 - Data Table
    name: Method 4 - Data Table
    model: looker_period_over_period
    explore: order_items_method_4
    type: looker_grid
    fields: [order_items_method_4.date_in_period_month_name, order_items_method_4.date_in_period_month_num, order_items_method_4.period, order_items_method_4.total_sale_price]
    pivots: [order_items_method_4.period]
    sorts: [order_items_method_4.date_in_period_month_num]
    limit: 500
    show_view_names: false
    hidden_fields: [order_items_method_4.date_in_period_month_num]
    table_calculations:
    - table_calculation: relative_change
      label: "Relative Change %"
      expression: "(${order_items_method_4.total_sale_price} / pivot_offset(${order_items_method_4.total_sale_price}, -1)) - 1"
      value_format_name: percent_2
    listen:
      m4_date_range: order_items_method_4.current_date_range
      m4_compare_to: order_items_method_4.compare_to
      m4_periods: order_items_method_4.comparison_periods
    row: 19
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 4 - Chart
    name: Method 4 - Chart
    model: looker_period_over_period
    explore: order_items_method_4
    type: looker_line
    fields: [order_items_method_4.date_in_period_month_name, order_items_method_4.date_in_period_month_num, order_items_method_4.period, order_items_method_4.total_sale_price]
    pivots: [order_items_method_4.period]
    sorts: [order_items_method_4.date_in_period_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    hidden_fields: [order_items_method_4.date_in_period_month_num]
    listen:
      m4_date_range: order_items_method_4.current_date_range
      m4_compare_to: order_items_method_4.compare_to
      m4_periods: order_items_method_4.comparison_periods
    row: 19
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  # Method 5
  - name: 'Method 5 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 5: Current Period and Any Arbitrary Period</span>
          <a href="https://discuss.google.dev/t/methods-for-period-over-period-pop-analysis-in-looker-method-5-current-period-and-any-arbitrary-period/119258" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> Allows users to define a completely custom, arbitrary previous date range to compare against the current period, aligning the date axes.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Complete flexibility on the comparison range; doesn't have to be identical in length or calendar bounds.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>High LookML complexity.</li>
              <li>Only supports comparing one custom period range at a time.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 26
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 5 - Data Table
    name: Method 5 - Data Table
    model: looker_period_over_period
    explore: order_items_method_5
    type: looker_grid
    fields: [order_items_method_5.date_in_period_month_name, order_items_method_5.date_in_period_month_num, order_items_method_5.period, order_items_method_5.total_sale_price]
    pivots: [order_items_method_5.period]
    sorts: [order_items_method_5.date_in_period_month_num]
    limit: 500
    show_view_names: false
    hidden_fields: [order_items_method_5.date_in_period_month_num]
    table_calculations:
    - table_calculation: relative_change
      label: "Relative Change %"
      expression: "(${order_items_method_5.total_sale_price} / pivot_offset(${order_items_method_5.total_sale_price}, -1)) - 1"
      value_format_name: percent_2
    listen:
      m5_date_range: order_items_method_5.current_date_range
      m5_previous_range: order_items_method_5.previous_date_range
    row: 32
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 5 - Chart
    name: Method 5 - Chart
    model: looker_period_over_period
    explore: order_items_method_5
    type: looker_line
    fields: [order_items_method_5.date_in_period_month_name, order_items_method_5.date_in_period_month_num, order_items_method_5.period, order_items_method_5.total_sale_price]
    pivots: [order_items_method_5.period]
    sorts: [order_items_method_5.date_in_period_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    hidden_fields: [order_items_method_5.date_in_period_month_num]
    listen:
      m5_date_range: order_items_method_5.current_date_range
      m5_previous_range: order_items_method_5.previous_date_range
    row: 32
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  # Method 6
  - name: 'Method 6 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 6: Any Two Arbitrary Periods</span>
          <a href="https://discuss.google.dev/t/methods-for-period-over-period-pop-analysis-in-looker-method-6-any-two-arbitrary-periods/119273" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> Google Analytics style PoP. Compares two manually-defined arbitrary periods by calculating the days elapsed since the start of each range.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Ideal for campaign/event comparison (e.g. Black Friday 2024 vs. Cyber Monday 2025).</li>
              <li>Allows custom offsets and different range lengths.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Slow user experience (requires typing two separate date filters).</li>
              <li>The first period must chronologically precede the second period.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 39
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 6 - Data Table
    name: Method 6 - Data Table
    model: looker_period_over_period
    explore: order_items_method_6
    type: looker_grid
    fields: [order_items_method_6.created_month_name, order_items_method_6.created_month_num, order_items_method_6.period_selected, order_items_method_6.total_sale_price]
    pivots: [order_items_method_6.period_selected]
    sorts: [order_items_method_6.created_month_num]
    limit: 500
    show_view_names: false
    hidden_fields: [order_items_method_6.created_month_num]
    table_calculations:
    - table_calculation: relative_change
      label: "Relative Change %"
      expression: "(${order_items_method_6.total_sale_price} / pivot_offset(${order_items_method_6.total_sale_price}, -1)) - 1"
      value_format_name: percent_2
    listen:
      m6_first_range: order_items_method_6.first_period_filter
      m6_second_range: order_items_method_6.second_period_filter
    row: 45
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 6 - Chart
    name: Method 6 - Chart
    model: looker_period_over_period
    explore: order_items_method_6
    type: looker_line
    fields: [order_items_method_6.created_month_name, order_items_method_6.created_month_num, order_items_method_6.period_selected, order_items_method_6.total_sale_price]
    pivots: [order_items_method_6.period_selected]
    sorts: [order_items_method_6.created_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    hidden_fields: [order_items_method_6.created_month_num]
    listen:
      m6_first_range: order_items_method_6.first_period_filter
      m6_second_range: order_items_method_6.second_period_filter
    row: 45
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  # Method 7
  - name: 'Method 7 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 7: Arbitrary Period and Directly Previous Period</span>
          <a href="https://discuss.google.dev/t/methods-for-period-over-period-pop-analysis-in-looker-method-7-arbitrary-period-and-directly-previous-period/119267" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> Dynamically calculates the preceding period of the exact same length as the selected date range. Best suited for Single Value visualization comparison tiles.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Completely dynamic interval sizing.</li>
              <li>Works well on dashboards for single value KPI comparisons.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Does not support gaps between the comparison periods.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 52
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 7 - Data Table
    name: Method 7 - Data Table
    model: looker_period_over_period
    explore: order_items_method_7
    type: looker_grid
    fields: [order_items_method_7.timeframes, order_items_method_7.selected_period_order_revenue, order_items_method_7.previous_period_order_revenue, order_items_method_7.sales_pop_change]
    limit: 500
    show_view_names: false
    listen:
      m7_date_range: order_items_method_7.date_filter
    row: 58
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 7 - Single Value KPI
    name: Method 7 - Single Value KPI
    model: looker_period_over_period
    explore: order_items_method_7
    type: looker_single_record
    fields: [order_items_method_7.timeframes, order_items_method_7.selected_period_order_revenue, order_items_method_7.previous_period_order_revenue, order_items_method_7.sales_pop_change]
    limit: 500
    show_view_names: false
    listen:
      m7_date_range: order_items_method_7.date_filter
    row: 58
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  # Method 8
  - name: 'Method 8 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px; display: flex; justify-content: space-between; align-items: center;">
          <span>Method 8: Arbitrary Period and Many Previous Periods</span>
          <a href="https://discuss.google.dev/t/methods-for-period-over-period-pop-analysis-in-looker-method-8-arbitrary-period-and-many-previous-periods/119275" target="_blank" style="font-size: 13px; color: #1A73E8; text-decoration: none; font-weight: normal; border: 1px solid #1A73E8; padding: 4px 8px; border-radius: 4px;">Original Docs ↗</a>
        </h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>Overview:</strong> The most complex but flexible method. Joins a numbers table twice to compute dynamic date offsets for rows and pivots, avoiding symmetric aggregates.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 16px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 8px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Completely modular and scalable.</li>
              <li>Supports comparing multiple arbitrary prior periods side-by-side (e.g. 1 prior vs 2 prior).</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 8px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Requires a dedicated explore solely for PoP analysis.</li>
              <li>High LookML complexity.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 65
    col: 0
    width: 24
    height: 6
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 8 - Data Table
    name: Method 8 - Data Table
    model: looker_period_over_period
    explore: order_items_method_8
    type: looker_grid
    fields: [pop.reference_date_formatted, pop.over_periods_ago, pop_order_items_created.agg_2]
    pivots: [pop.over_periods_ago]
    sorts: [pop.reference_date_formatted]
    limit: 500
    show_view_names: false
    table_calculations:
    - table_calculation: relative_change
      label: "Relative Change %"
      expression: "(${pop_order_items_created.agg_2} / pivot_offset(${pop_order_items_created.agg_2}, -1)) - 1"
      value_format_name: percent_2
    listen:
      m8_date_range: pop.date_filter
      m8_breakdown: pop.within_period_type
      m8_compare_over: pop.over_period_type
      m8_past_periods: pop.over_how_many_past_periods
    row: 71
    col: 0
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'

  - title: Method 8 - Chart
    name: Method 8 - Chart
    model: looker_period_over_period
    explore: order_items_method_8
    type: looker_line
    fields: [pop.reference_date_formatted, pop.over_periods_ago, pop_order_items_created.agg_2]
    pivots: [pop.over_periods_ago]
    sorts: [pop.reference_date_formatted]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen:
      m8_date_range: pop.date_filter
      m8_breakdown: pop.within_period_type
      m8_compare_over: pop.over_period_type
      m8_past_periods: pop.over_how_many_past_periods
    row: 71
    col: 12
    width: 12
    height: 7
    tab_name: 'Tab 2: Custom & Arbitrary Date Ranges'
