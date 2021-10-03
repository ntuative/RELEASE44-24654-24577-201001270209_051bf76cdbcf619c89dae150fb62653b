package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_997:String = "AssetLoaderEventUnload";
      
      public static const const_44:String = "AssetLoaderEventError";
      
      public static const const_816:String = "AssetLoaderEventOpen";
      
      public static const const_973:String = "AssetLoaderEventProgress";
      
      public static const const_867:String = "AssetLoaderEventStatus";
      
      public static const const_31:String = "AssetLoaderEventComplete";
       
      
      private var var_364:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_364 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_364;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_364);
      }
   }
}
