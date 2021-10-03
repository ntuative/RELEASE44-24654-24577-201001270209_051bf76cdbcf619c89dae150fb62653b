package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1424:GarbageMonitor = null;
      
      private var var_1091:int = 0;
      
      private var var_1074:Boolean = false;
      
      private var var_1567:String = "";
      
      private var var_1425:String = "";
      
      private var var_345:Number = 0;
      
      private var var_1182:int = 10;
      
      private var var_2265:Array;
      
      private var var_609:int = 0;
      
      private var var_1183:int = 60;
      
      private var var_966:int = 0;
      
      private var var_967:int = 0;
      
      private var var_1564:String = "";
      
      private var var_1915:Number = 0;
      
      private var var_1185:int = 1000;
      
      private var var_1914:Boolean = true;
      
      private var var_1913:Number = 0.15;
      
      private var var_176:IHabboConfigurationManager = null;
      
      private var var_1563:String = "";
      
      private var var_1184:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2265 = [];
         super();
         var_1425 = Capabilities.version;
         var_1567 = Capabilities.os;
         var_1074 = Capabilities.isDebugger;
         var_1563 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1424 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1091 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1424.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1424.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_345;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1183 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1425;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_967;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1185)
         {
            ++var_966;
            _loc3_ = true;
         }
         else
         {
            ++var_609;
            if(var_609 <= 1)
            {
               var_345 = param1;
            }
            else
            {
               _loc4_ = Number(var_609);
               var_345 = var_345 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1091 > var_1183 * 1000 && var_1184 < var_1182)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_345);
            _loc5_ = true;
            if(var_1914 && var_1184 > 0)
            {
               _loc6_ = differenceInPercents(var_1915,var_345);
               if(_loc6_ < var_1913)
               {
                  _loc5_ = false;
               }
            }
            var_1091 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1915 = var_345;
               if(sendReport())
               {
                  ++var_1184;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1182 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1185 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1563,var_1425,var_1567,var_1564,var_1074,_loc4_,_loc3_,var_967,var_345,var_966);
            _connection.send(_loc1_);
            var_967 = 0;
            var_345 = 0;
            var_609 = 0;
            var_966 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_176 = param1;
         var_1183 = int(var_176.getKey("performancetest.interval","60"));
         var_1185 = int(var_176.getKey("performancetest.slowupdatelimit","1000"));
         var_1182 = int(var_176.getKey("performancetest.reportlimit","10"));
         var_1913 = Number(var_176.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1914 = Boolean(int(var_176.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
