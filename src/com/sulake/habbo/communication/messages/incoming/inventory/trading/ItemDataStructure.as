package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1040:String;
      
      private var var_1612:int;
      
      private var var_1613:int;
      
      private var var_1350:int;
      
      private var var_1608:int;
      
      private var _category:int;
      
      private var var_2317:int;
      
      private var var_1611:int;
      
      private var var_1607:int;
      
      private var var_1614:int;
      
      private var var_1610:int;
      
      private var var_1609:Boolean;
      
      private var var_1320:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1612 = param1;
         var_1040 = param2;
         var_1613 = param3;
         var_1614 = param4;
         _category = param5;
         var_1320 = param6;
         var_1350 = param7;
         var_1607 = param8;
         var_1611 = param9;
         var_1610 = param10;
         var_1608 = param11;
         var_1609 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1614;
      }
      
      public function get extra() : int
      {
         return var_1350;
      }
      
      public function get stuffData() : String
      {
         return var_1320;
      }
      
      public function get groupable() : Boolean
      {
         return var_1609;
      }
      
      public function get creationMonth() : int
      {
         return var_1610;
      }
      
      public function get roomItemID() : int
      {
         return var_1613;
      }
      
      public function get itemType() : String
      {
         return var_1040;
      }
      
      public function get itemID() : int
      {
         return var_1612;
      }
      
      public function get songID() : int
      {
         return var_1350;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1607;
      }
      
      public function get creationYear() : int
      {
         return var_1608;
      }
      
      public function get creationDay() : int
      {
         return var_1611;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
