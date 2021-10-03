package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_1570:int;
      
      private var var_1076:int;
      
      private var var_1569:int;
      
      private var var_1572:int = -1;
      
      private var var_364:int;
      
      private var var_1571:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1075:int;
      
      private var var_1573:int;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = -1)
      {
         super();
         _offerId = param1;
         var_1573 = param2;
         var_1571 = param3;
         var_1076 = param4;
         var_364 = param5;
         var_1569 = param6;
         var_1075 = param7;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_1570 = param1;
      }
      
      public function get imageCallback() : int
      {
         return var_1570;
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
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_1572 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1076 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1075 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get status() : int
      {
         return var_364;
      }
      
      public function get averagePrice() : int
      {
         return var_1569;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get furniId() : int
      {
         return var_1573;
      }
   }
}
