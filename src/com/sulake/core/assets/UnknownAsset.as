package com.sulake.core.assets
{
   import flash.utils.getQualifiedClassName;
   
   public class UnknownAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1121:AssetTypeDeclaration;
      
      private var var_894:String;
      
      private var var_35:Object = null;
      
      public function UnknownAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1121 = param1;
         var_894 = param2;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1121;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var_35 = param1;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         var_35 = param1.content as Object;
      }
      
      public function get content() : Object
      {
         return var_35;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get url() : String
      {
         return var_894;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + var_35;
      }
   }
}
