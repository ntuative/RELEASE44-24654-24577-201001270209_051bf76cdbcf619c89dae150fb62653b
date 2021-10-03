package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_97;
         param1["bound_to_parent_rect"] = const_82;
         param1["child_window"] = const_966;
         param1["embedded_controller"] = const_302;
         param1["resize_to_accommodate_children"] = const_63;
         param1["input_event_processor"] = const_49;
         param1["internal_event_handling"] = const_600;
         param1["mouse_dragging_target"] = const_191;
         param1["mouse_dragging_trigger"] = const_310;
         param1["mouse_scaling_target"] = const_224;
         param1["mouse_scaling_trigger"] = const_456;
         param1["horizontal_mouse_scaling_trigger"] = const_200;
         param1["vertical_mouse_scaling_trigger"] = const_213;
         param1["observe_parent_input_events"] = const_798;
         param1["optimize_region_to_layout_size"] = const_344;
         param1["parent_window"] = const_1004;
         param1["relative_horizontal_scale_center"] = const_162;
         param1["relative_horizontal_scale_fixed"] = const_129;
         param1["relative_horizontal_scale_move"] = const_321;
         param1["relative_horizontal_scale_strech"] = const_261;
         param1["relative_scale_center"] = const_987;
         param1["relative_scale_fixed"] = const_549;
         param1["relative_scale_move"] = const_845;
         param1["relative_scale_strech"] = const_823;
         param1["relative_vertical_scale_center"] = const_155;
         param1["relative_vertical_scale_fixed"] = const_128;
         param1["relative_vertical_scale_move"] = const_317;
         param1["relative_vertical_scale_strech"] = const_244;
         param1["on_resize_align_left"] = const_701;
         param1["on_resize_align_right"] = const_355;
         param1["on_resize_align_center"] = const_347;
         param1["on_resize_align_top"] = const_663;
         param1["on_resize_align_bottom"] = const_465;
         param1["on_resize_align_middle"] = const_446;
         param1["on_accommodate_align_left"] = const_896;
         param1["on_accommodate_align_right"] = const_472;
         param1["on_accommodate_align_center"] = const_594;
         param1["on_accommodate_align_top"] = const_863;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_623;
         param1["route_input_events_to_parent"] = const_378;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_842;
         param1["scalable_with_mouse"] = const_948;
         param1["reflect_horizontal_resize_to_parent"] = const_361;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_251;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
