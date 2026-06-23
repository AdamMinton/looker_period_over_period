include: "/explores/order_items_option_2.explore.lkml"

view: option_3_ndt {
  derived_table: {
    explore_source: order_items_option_2 {
      column: wtd_orders { field: order_items_option_2.wtd_orders }
      column: ly_wtd_orders { field: order_items_option_2.ly_wtd_orders }
      column: mtd_orders { field: order_items_option_2.mtd_orders }
      column: ly_mtd_orders { field: order_items_option_2.ly_mtd_orders }
      column: qtd_orders { field: order_items_option_2.qtd_orders }
      column: ly_qtd_orders { field: order_items_option_2.ly_qtd_orders }
      column: ytd_orders { field: order_items_option_2.ytd_orders }
      column: ly_ytd_orders { field: order_items_option_2.ly_ytd_orders }

      column: wtd_items { field: order_items_option_2.wtd_items }
      column: ly_wtd_items { field: order_items_option_2.ly_wtd_items }
      column: mtd_items { field: order_items_option_2.mtd_items }
      column: ly_mtd_items { field: order_items_option_2.ly_mtd_items }
      column: qtd_items { field: order_items_option_2.qtd_items }
      column: ly_qtd_items { field: order_items_option_2.ly_qtd_items }
      column: ytd_items { field: order_items_option_2.ytd_items }
      column: ly_ytd_items { field: order_items_option_2.ly_ytd_items }
      bind_filters: {
        to_field: anchor_date.anchor_date
        from_field: anchor_date.anchor_date
      }
    }
  }

  dimension: wtd_orders { type: number }
  dimension: ly_wtd_orders { type: number }
  dimension: mtd_orders { type: number }
  dimension: ly_mtd_orders { type: number }
  dimension: qtd_orders { type: number }
  dimension: ly_qtd_orders { type: number }
  dimension: ytd_orders { type: number }
  dimension: ly_ytd_orders { type: number }

  dimension: wtd_items { type: number }
  dimension: ly_wtd_items { type: number }
  dimension: mtd_items { type: number }
  dimension: ly_mtd_items { type: number }
  dimension: qtd_items { type: number }
  dimension: ly_qtd_items { type: number }
  dimension: ytd_items { type: number }
  dimension: ly_ytd_items { type: number }
}
