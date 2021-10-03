package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1283:String = "WN_CREATED";
      
      public static const const_974:String = "WN_DISABLE";
      
      public static const const_996:String = "WN_DEACTIVATED";
      
      public static const const_962:String = "WN_OPENED";
      
      public static const const_831:String = "WN_CLOSED";
      
      public static const const_963:String = "WN_DESTROY";
      
      public static const const_1447:String = "WN_ARRANGED";
      
      public static const const_349:String = "WN_PARENT_RESIZED";
      
      public static const const_812:String = "WN_ENABLE";
      
      public static const const_956:String = "WN_RELOCATE";
      
      public static const const_847:String = "WN_FOCUS";
      
      public static const const_852:String = "WN_PARENT_RELOCATED";
      
      public static const const_343:String = "WN_PARAM_UPDATED";
      
      public static const const_538:String = "WN_PARENT_ACTIVATED";
      
      public static const const_190:String = "WN_RESIZED";
      
      public static const const_943:String = "WN_CLOSE";
      
      public static const const_952:String = "WN_PARENT_REMOVED";
      
      public static const const_226:String = "WN_CHILD_RELOCATED";
      
      public static const const_516:String = "WN_ENABLED";
      
      public static const const_266:String = "WN_CHILD_RESIZED";
      
      public static const const_829:String = "WN_MINIMIZED";
      
      public static const const_678:String = "WN_DISABLED";
      
      public static const const_193:String = "WN_CHILD_ACTIVATED";
      
      public static const const_346:String = "WN_STATE_UPDATED";
      
      public static const const_652:String = "WN_UNSELECTED";
      
      public static const const_371:String = "WN_STYLE_UPDATED";
      
      public static const const_1526:String = "WN_UPDATE";
      
      public static const const_440:String = "WN_PARENT_ADDED";
      
      public static const const_624:String = "WN_RESIZE";
      
      public static const const_635:String = "WN_CHILD_REMOVED";
      
      public static const const_1433:String = "";
      
      public static const const_903:String = "WN_RESTORED";
      
      public static const const_318:String = "WN_SELECTED";
      
      public static const const_922:String = "WN_MINIMIZE";
      
      public static const const_834:String = "WN_FOCUSED";
      
      public static const const_1240:String = "WN_LOCK";
      
      public static const const_293:String = "WN_CHILD_ADDED";
      
      public static const const_781:String = "WN_UNFOCUSED";
      
      public static const const_434:String = "WN_RELOCATED";
      
      public static const const_835:String = "WN_DEACTIVATE";
      
      public static const const_1223:String = "WN_CRETAE";
      
      public static const const_811:String = "WN_RESTORE";
      
      public static const const_281:String = "WN_ACTVATED";
      
      public static const const_1233:String = "WN_LOCKED";
      
      public static const const_381:String = "WN_SELECT";
      
      public static const const_886:String = "WN_MAXIMIZE";
      
      public static const const_832:String = "WN_OPEN";
      
      public static const const_609:String = "WN_UNSELECT";
      
      public static const const_1467:String = "WN_ARRANGE";
      
      public static const const_1167:String = "WN_UNLOCKED";
      
      public static const const_1449:String = "WN_UPDATED";
      
      public static const const_794:String = "WN_ACTIVATE";
      
      public static const const_1348:String = "WN_UNLOCK";
      
      public static const const_825:String = "WN_MAXIMIZED";
      
      public static const const_826:String = "WN_DESTROYED";
      
      public static const const_882:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1554,cancelable);
      }
   }
}
