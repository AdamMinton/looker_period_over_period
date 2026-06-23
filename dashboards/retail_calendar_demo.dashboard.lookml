---
- dashboard: retail_calendar_demo
  title: Retail Calendar Demo
  preferred_viewer: dashboards-next
  layout: newspaper
  filters_location_top: false

  tabs:
  - name: 'Option 1: Parameter Based'
    label: 'Option 1: Parameter Based'
  - name: 'Option 2: Measure Based'
    label: 'Option 2: Measure Based'
  - name: 'Option 3: Pivoted Grid'
    label: 'Option 3: Pivoted Grid'
  - name: 'Option 4: Custom Calendar'
    label: 'Option 4: Custom Calendar'

  elements:
  # ==========================================
  # OPTION 1
  # ==========================================
  - name: 'Option 1 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px;">Option 1: Parameter-Based Custom Calendar</h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>How it works:</strong> The user selects a time frame (e.g., WTD, MTD, YTD) via the <code>Fiscal Window</code> parameter. A SQL preamble runs first to compute the exact calendar dates for this year and last year, and restricts the scan range in <code>sql_always_where</code>.
        </p>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043; border-top: 1px dashed #E0E0E0; padding-top: 8px;">
          <strong>Partition Scan Critique:</strong> <span style="color: #137333; font-weight: bold;">Highly Efficient</span>. BigQuery successfully prunes partitions because the fact table is filtered using <code>IN UNNEST(constant_array)</code> where the array of dates is pre-computed by the preamble.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 12px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 6px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Extremely performant, scanning only the needed days.</li>
              <li>Clean, accurate prior-period mappings via bridge tables.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 6px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Cannot show different periods (MTD vs YTD) side-by-side in columns in the same explore query.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 1: Parameter Based'

  - title: Option 1 - Data Table
    name: Option 1 - Data Table
    model: looker_period_over_period
    explore: order_items_option_1
    type: looker_grid
    fields: [fiscal_calendar.calendar_d_date, order_items_option_1.ty_orders, order_items_option_1.ly_orders]
    sorts: [fiscal_calendar.calendar_d_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    table_calculations:
    - table_calculation: relative_change
      label: "YoY % Change"
      expression: "(${order_items_option_1.ty_orders} - ${order_items_option_1.ly_orders}) / ${order_items_option_1.ly_orders}"
      value_format_name: percent_1
    listen:
      Fiscal Window: fiscal_calendar.fiscal_window
      Anchor Date: anchor_date.anchor_date
    row: 6
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 1: Parameter Based'

  - title: Option 1 - Orders Over Time
    name: Option 1 - Orders Over Time
    model: looker_period_over_period
    explore: order_items_option_1
    type: looker_line
    fields: [order_items_option_1.ty_orders, order_items_option_1.ly_orders, fiscal_calendar.calendar_d_date]
    fill_fields: [fiscal_calendar.calendar_d_date]
    sorts: [fiscal_calendar.calendar_d_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    listen:
      Fiscal Window: fiscal_calendar.fiscal_window
      Anchor Date: anchor_date.anchor_date
    row: 12
    col: 0
    width: 24
    height: 8
    tab_name: 'Option 1: Parameter Based'

  # ==========================================
  # OPTION 2
  # ==========================================
  - name: 'Option 2 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px;">Option 2: Measure-Based Auto-Detection</h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>How it works:</strong> Liquid logic in the explore checks which measures are in the query (e.g. MTD, YTD) and auto-sets the preamble date range to the largest period requested.
        </p>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043; border-top: 1px dashed #E0E0E0; padding-top: 8px;">
          <strong>Partition Scan Critique:</strong> <span style="color: #137333; font-weight: bold;">Efficient</span>. It prunes partitions using the preamble's array. However, if a user queries both MTD and YTD columns, BigQuery must scan all YTD partitions.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 12px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 6px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Displays different time frames (MTD, YTD) side-by-side as columns.</li>
              <li>No parameter selections required by dashboard users.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 6px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Scans the maximum period requested (e.g., scans full YTD even if only a few days are needed for MTD column).</li>
            </ul>
          </div>
        </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 2: Measure Based'

  - title: Option 2 - Data Table
    name: Option 2 - Data Table
    model: looker_period_over_period
    explore: order_items_option_2
    type: looker_grid
    fields: [fiscal_calendar.calendar_d_date, order_items_option_2.wtd_orders, order_items_option_2.mtd_orders, order_items_option_2.qtd_orders, order_items_option_2.ytd_orders]
    sorts: [fiscal_calendar.calendar_d_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    listen:
      Anchor Date: anchor_date.anchor_date
    row: 6
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 2: Measure Based'

  - title: Option 2 - Period Summary
    name: Option 2 - Period Summary
    model: looker_period_over_period
    explore: order_items_option_2
    type: looker_line
    fields: [order_items_option_2.wtd_orders, order_items_option_2.mtd_orders, order_items_option_2.qtd_orders,
      order_items_option_2.ytd_orders, fiscal_calendar.calendar_d_date]
    fill_fields: [fiscal_calendar.calendar_d_date]
    sorts: [fiscal_calendar.calendar_d_date]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: true
    show_x_axis_ticks: true
    listen:
      Anchor Date: anchor_date.anchor_date
    row: 12
    col: 0
    width: 24
    height: 8
    tab_name: 'Option 2: Measure Based'

  # ==========================================
  # OPTION 3
  # ==========================================
  - name: 'Option 3 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px;">Option 3: Pivoted Matrix Grid</h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>How it works:</strong> Leverages a Native Derived Table (NDT) to fetch Option 2's measures and unpivots them via SQL into rows and columns, enabling a grid view of measures by periods.
        </p>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043; border-top: 1px dashed #E0E0E0; padding-top: 8px;">
          <strong>Partition Scan Critique:</strong> <span style="color: #E27200; font-weight: bold;">Moderate Scan Cost</span>. Because all periods are requested to build the matrix, the underlying explore defaults to YTD scan range. Pruning works for partitions older than YTD.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 12px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 6px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Cleanest layout for executive summaries.</li>
              <li>Unpivots measures to rows and periods to columns.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 6px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Constant YTD partition scan cost due to base query requirements.</li>
            </ul>
          </div>
        </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 3: Pivoted Grid'

  - title: Option 3 - Pivoted Matrix
    name: Option 3 - Pivoted Matrix
    model: looker_period_over_period
    explore: order_items_option_3
    type: looker_grid
    fields: [option_3_pivoted.measure_name, option_3_pivoted.period, option_3_pivoted.ty_value, option_3_pivoted.ly_value]
    pivots: [option_3_pivoted.period]
    sorts: [option_3_pivoted.period]
    limit: 500
    column_limit: 50
    show_view_names: false
    table_calculations:
    - table_calculation: yoy_change
      label: "YoY % Change"
      expression: "(${option_3_pivoted.ty_value} - ${option_3_pivoted.ly_value}) / ${option_3_pivoted.ly_value}"
      value_format_name: percent_1
    listen:
      Anchor Date: anchor_date.anchor_date
    row: 6
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 3: Pivoted Grid'

  # ==========================================
  # OPTION 4
  # ==========================================
  - name: 'Option 4 Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px;">Option 4: Looker Native Custom Calendar</h2>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043;">
          <strong>How it works:</strong> Employs Looker's native <code>calendar_definition</code> and <code>period_over_period</code> measures.
        </p>
        <p style="font-size: 14px; line-height: 1.5; color: #3C4043; border-top: 1px dashed #E0E0E0; padding-top: 8px;">
          <strong>Partition Scan Critique:</strong> <span style="color: #C5221F; font-weight: bold;">Highly Inefficient (Full Table Scan)</span>. BigQuery cannot prune partitions of the fact table because the date filters are applied on attributes of the joined calendar table.
        </p>
        <div style="display: flex; gap: 16px; margin-top: 12px;">
          <div style="flex: 1; background: #E6F4EA; border-radius: 4px; padding: 12px; border-left: 4px solid #137333;">
            <h4 style="color: #137333; margin: 0 0 6px 0;">Pros</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #137333; line-height: 1.4;">
              <li>Native platform functionality (drag-and-drop PoP).</li>
              <li>Simple to maintain and model without complex Liquid scripts.</li>
            </ul>
          </div>
          <div style="flex: 1; background: #FCE8E6; border-radius: 4px; padding: 12px; border-left: 4px solid #C5221F;">
            <h4 style="color: #C5221F; margin: 0 0 6px 0;">Cons</h4>
            <ul style="margin: 0; padding-left: 20px; font-size: 13px; color: #C5221F; line-height: 1.4;">
              <li>Bypasses BigQuery partition pruning, leading to full table scans.</li>
              <li>Fails to handle Week 53 shifts (leads to NULL values for Week 53 comparisons).</li>
            </ul>
          </div>
        </div>
      </div>
    row: 0
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 4: Custom Calendar'

  - title: Option 4 - Data Table
    name: Option 4 - Data Table
    model: looker_period_over_period
    explore: order_items_option_4
    type: looker_grid
    fields: [order_items_option_4.created_custom_year, order_items_option_4.orders_count, order_items_option_4.orders_count_last_year, order_items_option_4.orders_count_yoy_change]
    sorts: [order_items_option_4.created_custom_year desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    filters:
      order_items_option_4.created_custom_year: "FY2025, FY2026"
    row: 6
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 4: Custom Calendar'

  - title: Option 4 - YoY Orders
    name: Option 4 - YoY Orders
    model: looker_period_over_period
    explore: order_items_option_4
    type: looker_line
    fields: [order_items_option_4.orders_count, order_items_option_4.orders_count_last_year, order_items_option_4.created_custom_year]
    filters:
      order_items_option_4.created_custom_year: "FY2025, FY2026"
    sorts: [order_items_option_4.created_custom_year desc]
    limit: 500
    column_limit: 50
    row: 12
    col: 0
    width: 24
    height: 8
    tab_name: 'Option 4: Custom Calendar'

  # ==========================================
  # FILTERS CONFIGURATION
  # ==========================================
  filters:
  - name: Anchor Date
    title: Anchor Date
    type: field_filter
    default_value: 2026/04/29
    allow_multiple_values: false
    required: false
    ui_config:
      type: date_picker
      display: inline
    model: looker_period_over_period
    explore: order_items_option_2
    listens_to_filters: []
    field: anchor_date.anchor_date
  - name: Fiscal Window
    title: Fiscal Window
    type: field_filter
    default_value: LW
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: looker_period_over_period
    explore: order_items_option_1
    listens_to_filters: []
    field: fiscal_calendar.fiscal_window
