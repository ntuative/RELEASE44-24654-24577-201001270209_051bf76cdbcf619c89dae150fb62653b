package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_827:Array;
      
      private var var_862:int;
      
      private var var_1286:String;
      
      private var _offerId:int;
      
      private var var_861:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1286 = param1.readString();
         var_862 = param1.readInteger();
         var_861 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_827 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_827.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_827;
      }
      
      public function get priceInCredits() : int
      {
         return var_862;
      }
      
      public function get localizationId() : String
      {
         return var_1286;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_861;
      }
   }
}
