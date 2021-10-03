package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_920:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1239:Boolean = true;
      
      private var var_1184:int = 0;
      
      private var var_737:int = 0;
      
      private var var_1091:int = 0;
      
      private var var_738:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1182:int = 15;
      
      private var var_176:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1183:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1091 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1239)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_737,var_738);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1184;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_737 == 0 && var_738 == 0;
      }
      
      private function resetLog() : void
      {
         var_737 = 0;
         var_738 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1239)
         {
            return;
         }
         if(getTimer() - var_1091 > var_1183 * 1000 && var_1184 < var_1182)
         {
            var_1091 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_176 = param1;
         var_1183 = int(var_176.getKey("lagwarninglog.interval","60"));
         var_1182 = int(var_176.getKey("lagwarninglog.reportlimit","15"));
         var_1239 = Boolean(int(var_176.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_738 += 1;
            case const_920:
               var_737 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
