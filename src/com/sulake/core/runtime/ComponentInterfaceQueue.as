package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1144:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_769:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1144 = param1;
         var_769 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_769;
      }
      
      public function get identifier() : IID
      {
         return var_1144;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1144 = null;
            while(false)
            {
               var_769.pop();
            }
            var_769 = null;
         }
      }
   }
}
