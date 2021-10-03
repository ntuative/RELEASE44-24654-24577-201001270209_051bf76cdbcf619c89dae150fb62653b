package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1179:int = 1;
      
      public static const const_1151:int = 4;
      
      public static const const_1521:int = 2;
      
      public static const const_1345:int = 1;
      
      public static const const_1216:int = 0;
      
      public static const const_1480:int = 0;
      
      public static const const_1227:int = 3;
       
      
      private var var_41:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         var_41 = new Array();
         super();
         this.var_41.push(param1);
         this.var_41.push(param2);
         this.var_41.push(param3);
         this.var_41.push(param4);
         this.var_41.push(param5);
         this.var_41.push(param6);
         this.var_41.push(false);
         this.var_41.push(false);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_41;
      }
      
      public function dispose() : void
      {
         this.var_41 = null;
      }
   }
}
