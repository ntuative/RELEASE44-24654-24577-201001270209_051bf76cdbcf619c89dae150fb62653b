package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2193:Boolean;
      
      private var var_1538:Array;
      
      private var var_2191:Boolean;
      
      private var var_2198:Boolean;
      
      private var var_2194:Boolean;
      
      private var var_154:Array;
      
      private var var_2195:Boolean;
      
      private var var_2192:Boolean;
      
      private var var_1539:Array;
      
      private var var_2196:Boolean;
      
      private var var_2197:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2197;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2193;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2191;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2195;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2192;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1538;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_154 = [];
         var_1538 = [];
         _roomMessageTemplates = [];
         var_1539 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_154.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1538.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1539.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2195 = param1.readBoolean();
         var_2194 = param1.readBoolean();
         var_2191 = param1.readBoolean();
         var_2198 = param1.readBoolean();
         var_2197 = param1.readBoolean();
         var_2192 = param1.readBoolean();
         var_2193 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2196 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2198;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1539;
      }
      
      public function get issues() : Array
      {
         return var_154;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2196;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2194;
      }
   }
}
