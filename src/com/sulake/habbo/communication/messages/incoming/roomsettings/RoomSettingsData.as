package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_455:int = 0;
      
      public static const const_115:int = 2;
      
      public static const const_165:int = 1;
      
      public static const const_715:Array = ["open","closed","password"];
       
      
      private var var_1602:int;
      
      private var var_1601:int;
      
      private var var_1604:int;
      
      private var var_1606:Array;
      
      private var var_1603:Boolean;
      
      private var var_1600:Boolean;
      
      private var var_1117:int;
      
      private var var_1605:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_600:Array;
      
      private var var_1110:String;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_1601;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1600 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1603 = param1;
      }
      
      public function get description() : String
      {
         return var_1110;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1603;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1602;
      }
      
      public function set description(param1:String) : void
      {
         var_1110 = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1117;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1602 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get controllerCount() : int
      {
         return var_1605;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1606;
      }
      
      public function get tags() : Array
      {
         return var_600;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1600;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1601 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1605 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_600 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1606 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1117 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1604 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1604;
      }
   }
}
