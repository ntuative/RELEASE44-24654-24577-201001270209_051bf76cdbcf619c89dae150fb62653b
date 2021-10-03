package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1076:int;
      
      private var var_1572:int = -1;
      
      private var var_364:int;
      
      private var var_1569:int;
      
      private var var_1571:int;
      
      private var _offerId:int;
      
      private var var_1075:int;
      
      private var var_1573:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1573 = param2;
         var_1571 = param3;
         var_1076 = param4;
         var_364 = param5;
         var_1572 = param6;
         var_1569 = param7;
         var_1075 = param8;
      }
      
      public function get status() : int
      {
         return var_364;
      }
      
      public function get price() : int
      {
         return var_1076;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1572;
      }
      
      public function get offerCount() : int
      {
         return var_1075;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1571;
      }
      
      public function get averagePrice() : int
      {
         return var_1569;
      }
      
      public function get furniId() : int
      {
         return var_1573;
      }
   }
}
