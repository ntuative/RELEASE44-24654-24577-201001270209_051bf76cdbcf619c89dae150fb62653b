package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_163:Array;
      
      private var var_46:Boolean = false;
      
      private var var_1452:int = 0;
      
      private var var_1450:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_477:Map;
      
      private var var_1975:int = 0;
      
      private var var_1451:int = 0;
      
      private var var_176:IHabboConfigurationManager;
      
      private var var_1217:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1453:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_46)
         {
            return;
         }
         if(getTimer() - var_1452 > var_1450)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1452 = getTimer();
         var_477.add(var_1217,var_1452);
         _connection.send(new LatencyPingRequestMessageComposer(var_1217));
         ++var_1217;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_176 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1450 = int(var_176.getKey("latencytest.interval"));
         var_1453 = int(var_176.getKey("latencytest.report.index"));
         var_1975 = int(var_176.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1450 < 1)
         {
            return;
         }
         var_477 = new Map();
         var_163 = new Array();
         var_46 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_477 == null || var_163 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_477.getValue(_loc2_.requestId);
         var_477.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_163.push(_loc4_);
         if(var_163.length == var_1453 && var_1453 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_163.length)
            {
               _loc5_ += var_163[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_163.length)
            {
               if(var_163[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_163[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_163 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1451) > var_1975 || var_1451 == 0)
            {
               var_1451 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_163.length);
               _connection.send(_loc11_);
            }
            var_163 = [];
         }
      }
      
      public function dispose() : void
      {
         var_46 = false;
         var_176 = null;
         _communication = null;
         _connection = null;
         if(var_477 != null)
         {
            var_477.dispose();
            var_477 = null;
         }
         var_163 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_176 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
