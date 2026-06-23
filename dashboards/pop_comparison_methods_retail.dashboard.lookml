---
- dashboard: pop_comparison_methods_retail
  title: "Period over Period (PoP) Comparison Methods - Retail Calendar"
  preferred_viewer: dashboards-next
  layout: newspaper
  filters_location_top: false

  tabs:
  - name: 'PoP Compatibility Guide'
    label: 'PoP Compatibility Guide'
  - name: 'Liquid-Based Custom Calendar'
    label: 'Liquid-Based Custom Calendar'
  - name: 'Native Custom Calendar'
    label: 'Native Custom Calendar'

  elements:
  # ==========================================
  # COMPATIBILITY GUIDE TAB
  # ==========================================
  - name: 'PoP Compatibility Guide Content'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 20px; background-color: #FFFFFF; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px;">Guide: Basic PoP Methods vs. Custom Fiscal Calendars</h2>
        <p style="font-size: 14px; color: #5F6368; margin-bottom: 20px;">
          Standard Looker PoP methods are designed for the Gregorian calendar. When applied to custom fiscal/retail calendars (like NRF 4-5-4), automated date-math methods break. Below is the compatibility guide for each method.
        </p>
        <table style="width: 100%; border-collapse: collapse; font-family: sans-serif; font-size: 13px; text-align: left;">
          <thead>
            <tr style="background-color: #F8F9FA; border-bottom: 2px solid #E0E0E0;">
              <th style="padding: 12px; font-weight: bold; color: #3C4043; width: 10%;">Method</th>
              <th style="padding: 12px; font-weight: bold; color: #3C4043; width: 25%;">Description</th>
              <th style="padding: 12px; font-weight: bold; color: #3C4043; width: 20%;">Works with Custom Calendars?</th>
              <th style="padding: 12px; font-weight: bold; color: #3C4043; width: 15%;">Partition Scan Efficiency</th>
              <th style="padding: 12px; font-weight: bold; color: #3C4043; width: 30%;">Mechanics & Limitations</th>
            </tr>
          </thead>
          <tbody>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 1</td>
              <td style="padding: 12px;">Pivoted Native Timeframes</td>
              <td style="padding: 12px; color: #C5221F; font-weight: bold;">❌ No</td>
              <td style="padding: 12px; color: #137333;">High</td>
              <td style="padding: 12px;">Relies on Looker's native date dimension groups which are strictly Gregorian.</td>
            </tr>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 2</td>
              <td style="padding: 12px;">Pivoted with Liquid</td>
              <td style="padding: 12px; color: #C5221F; font-weight: bold;">❌ No</td>
              <td style="padding: 12px; color: #137333;">High</td>
              <td style="padding: 12px;">Still utilizes standard Gregorian date dimensions for its calculations.</td>
            </tr>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 3</td>
              <td style="padding: 12px;">Current vs Prior (Offset)</td>
              <td style="padding: 12px; color: #C5221F; font-weight: bold;">❌ No</td>
              <td style="padding: 12px; color: #137333;">High</td>
              <td style="padding: 12px;">Uses SQL date-math (e.g. <code>DATE_ADD</code>). Shifting by 1 year or 364 days shifts week boundaries and breaks retail season alignment.</td>
            </tr>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 4</td>
              <td style="padding: 12px;">Current vs Many Prior (Offsets)</td>
              <td style="padding: 12px; color: #C5221F; font-weight: bold;">❌ No</td>
              <td style="padding: 12px; color: #137333;">High</td>
              <td style="padding: 12px;">Fails for the same reason as Method 3 (Gregorian date offsets are non-linear in custom calendars).</td>
            </tr>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 5</td>
              <td style="padding: 12px;">Current vs Custom Arbitrary Range</td>
              <td style="padding: 12px; color: #E27200; font-weight: bold;">⚠️ Manual Only</td>
              <td style="padding: 12px; color: #137333;">High</td>
              <td style="padding: 12px;">Works only if the user manually selects the correct custom calendar start/end dates. Prone to human error.</td>
            </tr>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 6</td>
              <td style="padding: 12px;">Any Two Arbitrary Ranges</td>
              <td style="padding: 12px; color: #E27200; font-weight: bold;">⚠️ Manual Only</td>
              <td style="padding: 12px; color: #137333;">High</td>
              <td style="padding: 12px;">Works only if the user manually configures both date ranges to match the fiscal calendar.</td>
            </tr>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 7</td>
              <td style="padding: 12px;">Arbitrary vs Directly Prior</td>
              <td style="padding: 12px; color: #C5221F; font-weight: bold;">❌ No</td>
              <td style="padding: 12px; color: #137333;">High</td>
              <td style="padding: 12px;">Automatically offsets backward by the number of days selected, which does not map to custom fiscal months.</td>
            </tr>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 8</td>
              <td style="padding: 12px;">Arbitrary vs Many Prior</td>
              <td style="padding: 12px; color: #C5221F; font-weight: bold;">❌ No</td>
              <td style="padding: 12px; color: #137333;">High</td>
              <td style="padding: 12px;">Offset calculations are based on standard Gregorian interval shifts.</td>
            </tr>
            <tr style="border-bottom: 1px solid #E0E0E0;">
              <td style="padding: 12px; font-weight: bold; color: #1A73E8;">Method 9</td>
              <td style="padding: 12px;">Looker Native PoP Measure</td>
              <td style="padding: 12px; color: #E27200; font-weight: bold;">Conditional</td>
              <td style="padding: 12px; color: #C5221F;">Low</td>
              <td style="padding: 12px;">Works only if combined with <code>type: custom_calendar</code> configuration (Option 4). Otherwise behaves as Gregorian. Bypasses BigQuery partition pruning.</td>
            </tr>
          </tbody>
        </table>
      </div>
    row: 0
    col: 0
    width: 24
    height: 12
    tab_name: 'PoP Compatibility Guide'

  # ==========================================
  # OPTION 1
  # ==========================================
  - name: 'Liquid-Based Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px;">Liquid-Based Custom Calendar</h2>
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
    tab_name: 'Liquid-Based Custom Calendar'

  - title: Liquid-Based - Data Table
    name: Liquid-Based - Data Table
    model: looker_period_over_period
    explore: order_items_liquid
    type: looker_grid
    fields: [fiscal_calendar.fiscal_month_begin_date, order_items_liquid.ty_orders, order_items_liquid.ly_orders]
    sorts: [fiscal_calendar.fiscal_month_begin_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    table_calculations:
    - table_calculation: relative_change
      label: "YoY % Change"
      expression: "(${order_items_liquid.ty_orders} - ${order_items_liquid.ly_orders}) / ${order_items_liquid.ly_orders}"
      value_format_name: percent_1
    listen:
      Fiscal Window: fiscal_calendar.fiscal_window
      Anchor Date: anchor_date.anchor_date
    row: 6
    col: 0
    width: 12
    height: 8
    tab_name: 'Liquid-Based Custom Calendar'

  - title: Liquid-Based - Orders Over Time
    name: Liquid-Based - Orders Over Time
    model: looker_period_over_period
    explore: order_items_liquid
    type: looker_line
    fields: [order_items_liquid.ty_orders, order_items_liquid.ly_orders, fiscal_calendar.fiscal_month_begin_date]
    sorts: [fiscal_calendar.fiscal_month_begin_date]
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
    row: 6
    col: 12
    width: 12
    height: 8
    tab_name: 'Liquid-Based Custom Calendar'

  # ==========================================
  # OPTION 4
  # ==========================================
  - name: 'Native Custom Calendar Overview'
    type: text
    body_text: |-
      <div style="border: 1px solid #E0E0E0; border-radius: 8px; padding: 16px; background-color: #F8F9FA; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
        <h2 style="color: #1A73E8; margin-top: 0; border-bottom: 2px solid #1A73E8; padding-bottom: 8px;">Native Custom Calendar</h2>
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
    tab_name: 'Native Custom Calendar'

  - title: Native Custom Calendar - Data Table
    name: Native Custom Calendar - Data Table
    model: looker_period_over_period
    explore: order_items_native
    type: looker_grid
    fields: [order_items_native.created_custom_period, order_items_native.orders_count, order_items_native.orders_count_last_year, order_items_native.orders_count_yoy_change]
    sorts: [order_items_native.created_custom_period desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    listen:
      "Custom Year": order_items_native.created_custom_year
    row: 6
    col: 0
    width: 12
    height: 8
    tab_name: 'Native Custom Calendar'

  - title: Native Custom Calendar - YoY Orders
    name: Native Custom Calendar - YoY Orders
    model: looker_period_over_period
    explore: order_items_native
    type: looker_line
    fields: [order_items_native.orders_count, order_items_native.orders_count_last_year, order_items_native.created_custom_period]
    sorts: [order_items_native.created_custom_period]
    limit: 500
    column_limit: 50
    listen:
      "Custom Year": order_items_native.created_custom_year
    row: 6
    col: 12
    width: 12
    height: 8
    tab_name: 'Native Custom Calendar'

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
    explore: order_items_liquid
    listens_to_filters: []
    field: anchor_date.anchor_date

  - name: Fiscal Window
    title: Fiscal Window
    type: field_filter
    default_value: YTD
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: looker_period_over_period
    explore: order_items_liquid
    listens_to_filters: []
    field: fiscal_calendar.fiscal_window

  - name: "Custom Year"
    title: "Custom Year"
    type: field_filter
    default_value: "FY2025, FY2026"
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: looker_period_over_period
    explore: order_items_native
    listens_to_filters: []
    field: order_items_native.created_custom_year
