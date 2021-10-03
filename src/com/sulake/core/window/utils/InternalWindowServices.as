package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_127:DisplayObject;
      
      private var var_2261:uint;
      
      private var var_773:IWindowToolTipAgentService;
      
      private var var_774:IWindowMouseScalingService;
      
      private var var_388:IWindowContext;
      
      private var var_775:IWindowFocusManagerService;
      
      private var var_772:IWindowMouseListenerService;
      
      private var var_776:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2261 = 0;
         var_127 = param2;
         var_388 = param1;
         var_776 = new WindowMouseDragger(param2);
         var_774 = new WindowMouseScaler(param2);
         var_772 = new WindowMouseListener(param2);
         var_775 = new FocusManager(param2);
         var_773 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_774;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_775;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_773;
      }
      
      public function dispose() : void
      {
         if(var_776 != null)
         {
            var_776.dispose();
            var_776 = null;
         }
         if(var_774 != null)
         {
            var_774.dispose();
            var_774 = null;
         }
         if(var_772 != null)
         {
            var_772.dispose();
            var_772 = null;
         }
         if(var_775 != null)
         {
            var_775.dispose();
            var_775 = null;
         }
         if(var_773 != null)
         {
            var_773.dispose();
            var_773 = null;
         }
         var_388 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_772;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_776;
      }
   }
}
