package foldb.async;

import tannus.ds.*;
import tannus.io.*;
import tannus.async.*;

import haxe.Constraints.Function;

using StringTools;
using tannus.ds.StringUtils;
using Lambda;
using tannus.ds.ArrayTools;
using Slambda;

class Port<T> {
    /* Constructor Function */
    public function new():Void { 
        //
    }

/* === Instance Methods === */

    public function read(done : Cb<T>):Void return done('not implemented', null); 
    public function write(data:T, done:VoidCb):Void return done('not implemented'); 

    public function pread():Promise<T> {
        return new Promise(function(yep, nope) {
            read(function(?error, ?result) {
                if (error != null)
                    return nope( error );
                else
                    return yep( result );
            });
        });
    }

    public function map<O>(i:T -> O, o:O -> T):Port<O> {
        return cast new MappedPort(this, {i:i, o:o});
    }
}

typedef PortMapper<TIn,TOut> = {
    i : TIn -> TOut,
    o : TOut -> TIn
};

class MappedPort <I, O> extends Port<O> {
    private var ip : Port<I>;
    private var m : PortMapper<I,O>;
    public function new(i:Port<I>, m:PortMapper<I,O>):Void {
        super();
        ip = i;
        this.m = m;
    }

    override function read(done : Cb<O>):Void {
        ip.read(function(?error, ?raw) {
            if (error != null) {
                return done(error, null);
            }
            else if (raw != null) {
                return done(null, m.i( raw ));
            }
            else 
                return done(null, null);
        });
    }

    override function write(o:O, done:VoidCb):Void {
        ip.write(m.o( o ), done);
    }
}
