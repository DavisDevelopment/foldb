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

class Persistence {
    /* Constructor Function */
    public function new():Void {
        inMemoryOnly = false;
        filePath = null;
    }

/* === Instance Methods === */

    public function persistCachedDatabase(?done : VoidCb):Void {
        if (done == null)
            done = untyped fn(e => null);
        var toPersist = '';
        if ( inMemoryOnly )
            return done();
        //TODO
    }

/* === Instance Fields === */

    public var inMemoryOnly(default, null):Bool;
    public var filePath(default, null):Null<Path>;
}
