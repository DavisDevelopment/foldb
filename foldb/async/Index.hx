package foldb.async;

import tannus.ds.*;
import tannus.io.*;
import tannus.async.*;
import tannus.sys.Path;

import haxe.Constraints.Function;

import Slambda.fn;

using StringTools;
using tannus.ds.StringUtils;
using Lambda;
using tannus.ds.ArrayTools;
using Slambda;
using tannus.html.JSTools;

class Index {
    /* Constructor Function */
    public function new(i:IndexOption) {
        fieldName = i.fieldName;

        autoIncrement = (i.autoIncrement != null ? i.autoIncrement : false);
        unique = (i.unique != null ? i.unique : autoIncrement);
        sparse = (i.sparse != null ? i.sparse : false);
    }

/* === Instance Methods === */

    /**
      * reset [this] Index
      */
    public function reset():Void {
        //TODO
    }

/* === Instance Fields === */

    public var fieldName : String;
    public var autoIncrement : Bool;
    public var unique : Bool;
    public var sparse : Bool;
}

typedef IndexOptions = {
    fieldName: String,
    ?autoIncrement: Bool,
    ?unique: Bool,
    ?sparse: Bool
};
