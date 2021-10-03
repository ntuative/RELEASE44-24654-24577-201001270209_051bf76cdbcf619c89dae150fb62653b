package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1927:int;
      
      private var var_1428:int;
      
      private var var_1926:int;
      
      private var var_1925:int;
      
      private var var_1924:int;
      
      private var var_1427:int;
      
      private var var_1747:int;
      
      private var var_1638:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1927;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1428;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1747;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1925;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1924;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1427;
      }
      
      public function get commission() : int
      {
         return var_1926;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1638 = param1.readBoolean();
         var_1926 = param1.readInteger();
         var_1428 = param1.readInteger();
         var_1427 = param1.readInteger();
         var_1925 = param1.readInteger();
         var_1927 = param1.readInteger();
         var_1924 = param1.readInteger();
         var_1747 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1638;
      }
   }
}
