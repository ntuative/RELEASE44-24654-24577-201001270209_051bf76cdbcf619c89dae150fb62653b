package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_188:String = "e";
      
      public static const const_74:String = "i";
      
      public static const const_77:String = "s";
       
      
      private var var_1029:String;
      
      private var var_1297:String;
      
      private var var_1299:int;
      
      private var var_1988:int;
      
      private var var_1028:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1297 = param1.readString();
         var_1988 = param1.readInteger();
         var_1029 = param1.readString();
         var_1028 = param1.readInteger();
         var_1299 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1028;
      }
      
      public function get productType() : String
      {
         return var_1297;
      }
      
      public function get expiration() : int
      {
         return var_1299;
      }
      
      public function get furniClassId() : int
      {
         return var_1988;
      }
      
      public function get extraParam() : String
      {
         return var_1029;
      }
   }
}
