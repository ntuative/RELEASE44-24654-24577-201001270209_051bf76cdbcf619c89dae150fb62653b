package com.sulake.core.assets
{
   import flash.utils.ByteArray;
   
   public class XmlAsset implements IAsset
   {
       
      
      private var var_35:XML;
      
      private var _disposed:Boolean = false;
      
      private var var_1121:AssetTypeDeclaration;
      
      private var var_894:String;
      
      public function XmlAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1121 = param1;
         var_894 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1121;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get url() : String
      {
         return var_894;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 is Class)
         {
            _loc2_ = new param1() as ByteArray;
            var_35 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is ByteArray)
         {
            _loc2_ = param1 as ByteArray;
            var_35 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is String)
         {
            var_35 = new XML(param1 as String);
            return;
         }
         if(param1 is XML)
         {
            var_35 = param1 as XML;
            return;
         }
         if(param1 is XmlAsset)
         {
            var_35 = XmlAsset(param1).var_35;
            return;
         }
      }
      
      public function get content() : Object
      {
         return var_35 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is XmlAsset)
         {
            var_35 = XmlAsset(param1).var_35;
            return;
         }
         throw Error("Provided asset is not of type XmlAsset!");
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_35 = null;
            var_1121 = null;
            var_894 = null;
         }
      }
   }
}
