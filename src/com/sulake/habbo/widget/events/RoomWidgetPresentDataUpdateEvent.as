package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_433:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_417:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_73:String = "RWPDUE_CONTENTS";
      
      public static const const_403:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_366:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_58:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_202:String;
      
      private var var_2121:BitmapData;
      
      private var var_162:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_162 = param2;
         var_202 = param3;
         _controller = param4;
         var_2121 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_2121;
      }
      
      public function get text() : String
      {
         return var_202;
      }
      
      public function get objectId() : int
      {
         return var_162;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
