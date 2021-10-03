package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_518;
         param1["bitmap"] = const_605;
         param1["border"] = const_496;
         param1["border_notify"] = const_1130;
         param1["button"] = const_399;
         param1["button_thick"] = const_621;
         param1["button_icon"] = const_1292;
         param1["button_group_left"] = const_709;
         param1["button_group_center"] = const_527;
         param1["button_group_right"] = const_619;
         param1["canvas"] = const_725;
         param1["checkbox"] = const_718;
         param1["closebutton"] = const_819;
         param1["container"] = const_292;
         param1["container_button"] = const_599;
         param1["display_object_wrapper"] = const_577;
         param1["dropmenu"] = const_473;
         param1["dropmenu_item"] = const_451;
         param1["frame"] = const_280;
         param1["frame_notify"] = const_1198;
         param1["header"] = const_703;
         param1["icon"] = const_838;
         param1["itemgrid"] = const_897;
         param1["itemgrid_horizontal"] = const_421;
         param1["itemgrid_vertical"] = const_564;
         param1["itemlist"] = const_878;
         param1["itemlist_horizontal"] = const_300;
         param1["itemlist_vertical"] = const_298;
         param1["maximizebox"] = const_1343;
         param1["menu"] = const_1296;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_951;
         param1["minimizebox"] = const_1219;
         param1["notify"] = const_1155;
         param1["null"] = const_352;
         param1["password"] = const_616;
         param1["radiobutton"] = const_720;
         param1["region"] = const_435;
         param1["restorebox"] = const_1225;
         param1["scaler"] = const_789;
         param1["scaler_horizontal"] = const_1258;
         param1["scaler_vertical"] = const_1267;
         param1["scrollbar_horizontal"] = const_430;
         param1["scrollbar_vertical"] = const_618;
         param1["scrollbar_slider_button_up"] = const_917;
         param1["scrollbar_slider_button_down"] = const_907;
         param1["scrollbar_slider_button_left"] = const_820;
         param1["scrollbar_slider_button_right"] = const_797;
         param1["scrollbar_slider_bar_horizontal"] = const_864;
         param1["scrollbar_slider_bar_vertical"] = const_883;
         param1["scrollbar_slider_track_horizontal"] = const_870;
         param1["scrollbar_slider_track_vertical"] = const_822;
         param1["scrollable_itemlist"] = const_1354;
         param1["scrollable_itemlist_vertical"] = const_405;
         param1["scrollable_itemlist_horizontal"] = const_967;
         param1["selector"] = const_679;
         param1["selector_list"] = const_657;
         param1["submenu"] = const_951;
         param1["tab_button"] = const_659;
         param1["tab_container_button"] = const_957;
         param1["tab_context"] = const_452;
         param1["tab_content"] = const_930;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_704;
         param1["input"] = const_541;
         param1["toolbar"] = const_1290;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
