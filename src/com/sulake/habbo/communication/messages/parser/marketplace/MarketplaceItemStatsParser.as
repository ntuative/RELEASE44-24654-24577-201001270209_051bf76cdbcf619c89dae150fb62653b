package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1494:Array;
      
      private var var_1569:int;
      
      private var var_2066:int;
      
      private var var_2065:int;
      
      private var var_2067:int;
      
      private var _dayOffsets:Array;
      
      private var var_2064:int;
      
      private var var_1495:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1494;
      }
      
      public function get furniTypeId() : int
      {
         return var_2066;
      }
      
      public function get historyLength() : int
      {
         return var_2067;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2065;
      }
      
      public function get offerCount() : int
      {
         return var_2064;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1495;
      }
      
      public function get averagePrice() : int
      {
         return var_1569;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1569 = param1.readInteger();
         var_2064 = param1.readInteger();
         var_2067 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1494 = [];
         var_1495 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1494.push(param1.readInteger());
            var_1495.push(param1.readInteger());
            _loc3_++;
         }
         var_2065 = param1.readInteger();
         var_2066 = param1.readInteger();
         return true;
      }
   }
}
