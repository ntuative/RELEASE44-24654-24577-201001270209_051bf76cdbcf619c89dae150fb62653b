package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1118:int = 80;
       
      
      private var var_510:Map;
      
      private var var_718:String = "";
      
      private var var_1313:Array;
      
      public function UserRegistry()
      {
         var_510 = new Map();
         var_1313 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_510.getValue(var_1313.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_718;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_510.getValue(param1) != null)
         {
            var_510.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_718);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_718 == "")
         {
            var_1313.push(param1);
         }
         var_510.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_510;
      }
      
      public function unregisterRoom() : void
      {
         var_718 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_510.length > const_1118)
         {
            _loc1_ = var_510.getKey(0);
            var_510.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_718 = param1;
         if(var_718 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
