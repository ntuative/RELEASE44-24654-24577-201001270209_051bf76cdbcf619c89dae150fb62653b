package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_827:String = "price_type_none";
      
      public static const const_459:String = "pricing_model_multi";
      
      public static const const_476:String = "price_type_credits";
      
      public static const const_420:String = "price_type_credits_and_pixels";
      
      public static const const_424:String = "pricing_model_bundle";
      
      public static const const_461:String = "pricing_model_single";
      
      public static const const_714:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1123:String = "pricing_model_unknown";
      
      public static const const_368:String = "price_type_pixels";
       
      
      private var var_862:int;
      
      private var _offerId:int;
      
      private var var_861:int;
      
      private var var_415:String;
      
      private var var_588:String;
      
      private var var_2144:int;
      
      private var var_667:ICatalogPage;
      
      private var var_1286:String;
      
      private var var_414:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1286 = param1.localizationId;
         var_862 = param1.priceInCredits;
         var_861 = param1.priceInPixels;
         var_667 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_415;
      }
      
      public function get page() : ICatalogPage
      {
         return var_667;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2144 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_414;
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
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1286 = "";
         var_862 = 0;
         var_861 = 0;
         var_667 = null;
         if(var_414 != null)
         {
            var_414.dispose();
            var_414 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_588;
      }
      
      public function get previewCallbackId() : int
      {
         return var_2144;
      }
      
      public function get priceInCredits() : int
      {
         return var_862;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_415 = const_461;
            }
            else
            {
               var_415 = const_459;
            }
         }
         else if(param1.length > 1)
         {
            var_415 = const_424;
         }
         else
         {
            var_415 = const_1123;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_415)
         {
            case const_461:
               var_414 = new SingleProductContainer(this,param1);
               break;
            case const_459:
               var_414 = new MultiProductContainer(this,param1);
               break;
            case const_424:
               var_414 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_415);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_862 > 0 && var_861 > 0)
         {
            var_588 = const_420;
         }
         else if(var_862 > 0)
         {
            var_588 = const_476;
         }
         else if(var_861 > 0)
         {
            var_588 = const_368;
         }
         else
         {
            var_588 = const_827;
         }
      }
   }
}
