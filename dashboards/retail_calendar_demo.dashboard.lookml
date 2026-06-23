---
- dashboard: retail_calendar_demo
  title: Retail Calendar Demo
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8yrVUNmBv8KHfKJwSQH2Eb
  theme_name: ''
  layout: newspaper
  tabs:
  - name: 'Option 1: Parameter Based'
    label: 'Option 1: Parameter Based'
  - name: 'Option 2: Measure Based'
    label: 'Option 2: Measure Based'
  - name: 'Option 3: Pivoted Grid'
    label: 'Option 3: Pivoted Grid'
  - name: 'Option 4: Custom Visualization'
    label: 'Option 4: Custom Visualization'
  elements:
  - name: ''
    type: text
    body_text: |-
      **Method**: The user selects a time frame using the `Fiscal Window` parameter. A SQL preamble calculates the date range, and the entire query is restricted to that range.

      **Filters to Use**:
      - `Fiscal Window` (Required to change period)
      - `Anchor Date` (Optional, defaults to Today)

      **Pros**:
      - Highly performant (scans only the needed date range).
      - Simple to understand and implement.

      **Cons**:
      - Cannot compare different periods (like MTD and YTD) side-by-side in the same query.
    row: 0
    col: 0
    width: 24
    height: 4
    tab_name: 'Option 1: Parameter Based'
  - title: Option 1 - Orders Over Time
    name: Option 1 - Orders Over Time
    model: retail_calendar
    explore: order_items_option_1
    type: looker_line
    fields: [order_items_option_1.ty_orders, order_items_option_1.ly_orders, fiscal_calendar.calendar_d_date]
    fill_fields: [fiscal_calendar.calendar_d_date]
    filters:
      fiscal_calendar.fiscal_window: WTD
    sorts: [fiscal_calendar.calendar_d_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Fiscal Window: fiscal_calendar.fiscal_window
      Anchor Date: anchor_date.anchor_date
    row: 4
    col: 0
    width: 24
    height: 9
    tab_name: 'Option 1: Parameter Based'
  - name: " (2)"
    type: text
    body_text: |-
      **Method**: The system auto-detects the requested period based on the specific measures you select (e.g., selecting `MTD Orders` triggers MTD range). The preamble adjusts the scan range to the largest period requested.

      **Filters to Use**:
      - No period filter needed! Just select the measures for the periods you want.
      - `Anchor Date` (Optional)

      **Pros**:
      - Can compare different periods (MTD, YTD) side-by-side as columns.
      - No parameter selection required by user.

      **Cons**:
      - Always scans the maximum period requested (e.g., if you select YTD, it scans YTD even for the MTD column).
    row: 0
    col: 0
    width: 24
    height: 4
    tab_name: 'Option 2: Measure Based'
  - title: Option 2 - Period Summary
    name: Option 2 - Period Summary
    model: retail_calendar
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
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    discontinuous_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Anchor Date: anchor_date.anchor_date
    row: 4
    col: 0
    width: 24
    height: 9
    tab_name: 'Option 2: Measure Based'
  - name: " (3)"
    type: text
    body_text: |-
      **Method**: Uses a Native Derived Table to compute all period measures and then unpivots them in a SQL Derived Table. This allows putting measures in rows and periods in columns.

      **Filters to Use**:
      - `Anchor Date` (Optional)
      - You can filter on `Period` or `Measure Name` to limit the grid.

      **Pros**:
      - Most compact display (replicates the summary tiles requested).
      - Clean matrix layout.

      **Cons**:
      - Highest performance cost (always scans YTD to build the base NDT table).
    row: 0
    col: 0
    width: 24
    height: 4
    tab_name: 'Option 3: Pivoted Grid'
  - title: Option 3 - Pivoted Matrix
    name: Option 3 - Pivoted Matrix
    model: retail_calendar
    explore: order_items_option_3
    type: looker_grid
    fields: [option_3_pivoted.measure_name, option_3_pivoted.period, option_3_pivoted.ty_value,
      option_3_pivoted.ly_value]
    pivots: [option_3_pivoted.period]
    sorts: [option_3_pivoted.period]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Anchor Date: anchor_date.anchor_date
    row: 4
    col: 0
    width: 24
    height: 6
    tab_name: 'Option 3: Pivoted Grid'
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      **Method**: Uses a custom visualization to arrange icons in desired format. You can use Option 1 with merged results for each separate period or Option 2.

      **Pros**:
      - Complete custom layout that can be fine tuned to exact requirements needed.

      **Cons**:
      - None
    row: 0
    col: 0
    width: 24
    height: 3
    tab_name: 'Option 4: Custom Visualization'
  - title: KPI Canvas
    name: KPI Canvas
    model: retail_calendar
    explore: order_items_option_2
    type: kpi_canvas_git
    fields: [order_items_option_2.mtd_orders, order_items_option_2.ytd_orders, order_items_option_2.ly_mtd_orders,
      order_items_option_2.ly_ytd_orders]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    edit_mode: false
    row_integrity: false
    compact_mode: true
    scale_to_fit: true
    canvas_layout_state: '{"timestamp":1777497867186,"items":[{"i":"77yf5j2az","type":"text","x":0,"y":2,"w":1,"h":2,"style":{"fontSize":"24px","textAlign":"center","color":"#e60a0a"},"content":"Orders"},{"i":"okhhiov4s","type":"text","x":1,"y":0,"w":1,"h":2,"style":{"fontSize":"24px","textAlign":"center"},"content":"MTD"},{"i":"6nx7n4ren","type":"text","x":0,"y":0,"w":1,"h":2,"style":{"fontSize":"24px","textAlign":"center"},"content":""},{"i":"1uu9e4clk","fieldId":"order_items_option_2.mtd_orders:0","type":"measure","x":1,"y":2,"w":1,"h":2,"style":{"fontSize":"24px","textAlign":"center"},"value":"7,805","value_raw":7805,"html":"\n  7.8K\n  ","showLabel":false},{"i":"ekjetuaa8","type":"text","x":2,"y":0,"w":1,"h":2,"style":{"fontSize":"24px","textAlign":"center"},"content":"YTD"},{"i":"iz3yziv5t","fieldId":"order_items_option_2.ytd_orders:0","type":"measure","x":2,"y":2,"w":1,"h":2,"style":{"fontSize":"24px","textAlign":"center"},"value":"26,953","value_raw":26953,"html":"\n  27.0K\n  ","showLabel":false}]}'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    title_hidden: true
    listen: {}
    row: 3
    col: 0
    width: 11
    height: 5
    tab_name: 'Option 4: Custom Visualization'
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
    model: retail_calendar
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
    model: retail_calendar
    explore: order_items_option_1
    listens_to_filters: []
    field: fiscal_calendar.fiscal_window
