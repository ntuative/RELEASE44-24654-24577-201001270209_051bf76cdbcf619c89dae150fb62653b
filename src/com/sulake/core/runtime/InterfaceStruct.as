package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_376:uint;
      
      private var var_935:IUnknown;
      
      private var var_1127:String;
      
      private var var_934:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_934 = param1;
         var_1127 = getQualifiedClassName(var_934);
         var_935 = param2;
         var_376 = 0;
      }
      
      public function get iid() : IID
      {
         return var_934;
      }
      
      public function get disposed() : Boolean
      {
         return var_935 == null;
      }
      
      public function get references() : uint
      {
         return var_376;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_376) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_935;
      }
      
      public function get iis() : String
      {
         return var_1127;
      }
      
      public function reserve() : uint
      {
         return ++var_376;
      }
      
      public function dispose() : void
      {
         var_934 = null;
         var_1127 = null;
         var_935 = null;
         var_376 = 0;
      }
   }
}
