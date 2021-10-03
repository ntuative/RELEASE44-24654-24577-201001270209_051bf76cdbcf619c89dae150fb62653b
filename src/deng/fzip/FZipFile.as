package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_695:int = 8;
      
      public static const const_1570:int = 10;
      
      public static const const_1301:int = 6;
      
      private static var var_999:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1177:int = 0;
      
      public static const const_1451:int = 1;
      
      public static const const_1489:int = 2;
      
      public static const const_1514:int = 3;
      
      public static const const_1501:int = 4;
      
      public static const const_1524:int = 5;
      
      public static const const_1434:int = 9;
      
      public static const const_1495:int = 7;
       
      
      private var var_181:uint = 0;
      
      private var var_998:uint = 0;
      
      private var var_680:Date;
      
      private var var_2055:int = -1;
      
      private var parseFunc:Function;
      
      private var var_484:Boolean = false;
      
      private var var_2280:int = -1;
      
      private var var_1245:uint = 0;
      
      private var var_2054:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_838:uint;
      
      private var var_35:ByteArray;
      
      private var var_681:uint;
      
      private var var_1480:Boolean = false;
      
      private var var_2279:int = -1;
      
      private var var_1479:String = "2.0";
      
      private var var_180:Boolean = false;
      
      private var var_2053:Boolean = false;
      
      private var var_352:String;
      
      private var var_568:uint = 0;
      
      private var var_1244:int = 0;
      
      private var var_403:String = "";
      
      private var var_682:int = 8;
      
      private var var_1481:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_352 = param1;
         _extraFields = new Dictionary();
         var_35 = new ByteArray();
         var_35.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_568;
      }
      
      public function set filename(param1:String) : void
      {
         var_403 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_180 && false)
         {
            var_35.position = 0;
            if(var_999)
            {
               var_35.uncompress.apply(var_35,["deflate"]);
            }
            else
            {
               var_35.uncompress();
            }
            var_35.position = 0;
            var_180 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_403;
      }
      
      public function get date() : Date
      {
         return var_680;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1481)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_181 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_181)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1479;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_180)
         {
            uncompress();
         }
         var_35.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_35.readUTFBytes(var_35.bytesAvailable);
         }
         else
         {
            _loc3_ = var_35.readMultiByte(var_35.bytesAvailable,param2);
         }
         var_35.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_682 === const_695 && !var_1480)
         {
            if(var_999)
            {
               param1.readBytes(var_35,0,var_181);
            }
            else
            {
               if(!var_484)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_35.writeByte(120);
               _loc2_ = uint(~var_2055 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_35.writeByte(_loc2_);
               param1.readBytes(var_35,2,var_181);
               var_35.position = var_35.length;
               var_35.writeUnsignedInt(var_838);
            }
            var_180 = true;
         }
         else
         {
            if(var_682 != const_1177)
            {
               throw new Error("Compression method " + var_682 + " is not supported.");
            }
            param1.readBytes(var_35,0,var_181);
            var_180 = false;
         }
         var_35.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_998 + var_1245 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_35.length = 0;
         var_35.position = 0;
         var_180 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_35.writeUTFBytes(param1);
            }
            else
            {
               var_35.writeMultiByte(param1,param2);
            }
            var_681 = ChecksumUtil.CRC32(var_35);
            var_484 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_680 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1244 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1244 << 8 | 20);
         param1.writeShort(var_352 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_695);
         var _loc5_:Date = var_680 != null ? var_680 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_681);
         param1.writeUnsignedInt(var_181);
         param1.writeUnsignedInt(var_568);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_352 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_403);
         }
         else
         {
            _loc8_.writeMultiByte(var_403,var_352);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_484)
            {
               _loc16_ = var_180;
               if(_loc16_)
               {
                  uncompress();
               }
               var_838 = ChecksumUtil.Adler32(var_35,0,var_35.length);
               var_484 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_838);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_352 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_2054);
            }
            else
            {
               _loc8_.writeMultiByte(var_2054,var_352);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_181 > 0)
         {
            if(var_999)
            {
               _loc13_ = 0;
               param1.writeBytes(var_35,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_35,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_181;
      }
      
      protected function compress() : void
      {
         if(!var_180)
         {
            if(false)
            {
               var_35.position = 0;
               var_568 = var_35.length;
               if(var_999)
               {
                  var_35.compress.apply(var_35,["deflate"]);
                  var_181 = var_35.length;
               }
               else
               {
                  var_35.compress();
                  var_181 = -6;
               }
               var_35.position = 0;
               var_180 = true;
            }
            else
            {
               var_181 = 0;
               var_568 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_998 + var_1245)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_352 == "utf-8")
         {
            var_403 = param1.readUTFBytes(var_998);
         }
         else
         {
            var_403 = param1.readMultiByte(var_998,var_352);
         }
         var _loc2_:uint = var_1245;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_403 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_838 = param1.readUnsignedInt();
               var_484 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1244 = _loc2_ >> 8;
         var_1479 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_682 = param1.readUnsignedShort();
         var_1480 = (_loc3_ & 1) !== 0;
         var_1481 = (_loc3_ & 8) !== 0;
         var_2053 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_352 = "utf-8";
         }
         if(var_682 === const_1301)
         {
            var_2279 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2280 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_682 === const_695)
         {
            var_2055 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_680 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_681 = param1.readUnsignedInt();
         var_181 = param1.readUnsignedInt();
         var_568 = param1.readUnsignedInt();
         var_998 = param1.readUnsignedShort();
         var_1245 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_35,0,param1.length);
            var_681 = ChecksumUtil.CRC32(var_35);
            var_484 = false;
         }
         else
         {
            var_35.length = 0;
            var_35.position = 0;
            var_180 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_403 + "\n  date:" + var_680 + "\n  sizeCompressed:" + var_181 + "\n  sizeUncompressed:" + var_568 + "\n  versionHost:" + var_1244 + "\n  versionNumber:" + var_1479 + "\n  compressionMethod:" + var_682 + "\n  encrypted:" + var_1480 + "\n  hasDataDescriptor:" + var_1481 + "\n  hasCompressedPatchedData:" + var_2053 + "\n  filenameEncoding:" + var_352 + "\n  crc32:" + var_681.toString(16) + "\n  adler32:" + var_838.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_180)
         {
            uncompress();
         }
         return var_35;
      }
   }
}
