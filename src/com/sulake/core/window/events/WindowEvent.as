package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_304:String = "WE_CHILD_RESIZED";
      
      public static const const_1178:String = "WE_CLOSE";
      
      public static const const_1196:String = "WE_DESTROY";
      
      public static const const_135:String = "WE_CHANGE";
      
      public static const const_1172:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1424:String = "WE_PARENT_RESIZE";
      
      public static const const_89:String = "WE_UPDATE";
      
      public static const const_1202:String = "WE_MAXIMIZE";
      
      public static const const_429:String = "WE_DESTROYED";
      
      public static const const_862:String = "WE_UNSELECT";
      
      public static const const_1305:String = "WE_MAXIMIZED";
      
      public static const const_1527:String = "WE_UNLOCKED";
      
      public static const const_436:String = "WE_CHILD_REMOVED";
      
      public static const const_164:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1252:String = "WE_ACTIVATE";
      
      public static const const_233:String = "WE_ENABLED";
      
      public static const const_475:String = "WE_CHILD_RELOCATED";
      
      public static const const_1224:String = "WE_CREATE";
      
      public static const const_559:String = "WE_SELECT";
      
      public static const const_159:String = "";
      
      public static const const_1442:String = "WE_LOCKED";
      
      public static const const_1579:String = "WE_PARENT_RELOCATE";
      
      public static const const_1444:String = "WE_CHILD_REMOVE";
      
      public static const const_1430:String = "WE_CHILD_RELOCATE";
      
      public static const const_1500:String = "WE_LOCK";
      
      public static const const_246:String = "WE_FOCUSED";
      
      public static const const_537:String = "WE_UNSELECTED";
      
      public static const const_830:String = "WE_DEACTIVATED";
      
      public static const const_1356:String = "WE_MINIMIZED";
      
      public static const const_1483:String = "WE_ARRANGED";
      
      public static const const_1412:String = "WE_UNLOCK";
      
      public static const const_1427:String = "WE_ATTACH";
      
      public static const const_1200:String = "WE_OPEN";
      
      public static const const_1266:String = "WE_RESTORE";
      
      public static const const_1466:String = "WE_PARENT_RELOCATED";
      
      public static const const_1232:String = "WE_RELOCATE";
      
      public static const const_1573:String = "WE_CHILD_RESIZE";
      
      public static const const_1491:String = "WE_ARRANGE";
      
      public static const const_1245:String = "WE_OPENED";
      
      public static const const_1347:String = "WE_CLOSED";
      
      public static const const_1441:String = "WE_DETACHED";
      
      public static const const_1459:String = "WE_UPDATED";
      
      public static const const_1353:String = "WE_UNFOCUSED";
      
      public static const const_393:String = "WE_RELOCATED";
      
      public static const const_1164:String = "WE_DEACTIVATE";
      
      public static const const_184:String = "WE_DISABLED";
      
      public static const const_680:String = "WE_CANCEL";
      
      public static const const_519:String = "WE_ENABLE";
      
      public static const const_1310:String = "WE_ACTIVATED";
      
      public static const const_1197:String = "WE_FOCUS";
      
      public static const const_1488:String = "WE_DETACH";
      
      public static const const_1261:String = "WE_RESTORED";
      
      public static const const_1159:String = "WE_UNFOCUS";
      
      public static const const_53:String = "WE_SELECTED";
      
      public static const const_1249:String = "WE_PARENT_RESIZED";
      
      public static const const_1189:String = "WE_CREATED";
      
      public static const const_1507:String = "WE_ATTACHED";
      
      public static const const_1138:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1554:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1321:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1554 = param3;
         var_1321 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1321;
      }
      
      public function get related() : IWindow
      {
         return var_1554;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1321 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
