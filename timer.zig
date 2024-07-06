const std = @import("std");

var start_time:i128=undefined;
var end_time:i128=undefined;

pub fn start() void{
    start_time = std.time.nanoTimestamp();
}

pub fn end() void{
    if (start_time==0){
      std.debug.print("timer is not started,using timer.start() get start", .{});
    }else {
      end_time = std.time.nanoTimestamp();
      var time:f64= @floatFromInt(end_time-start_time);
      time=time/std.time.ns_per_s;
      std.debug.print("\nrunning time is:{d}s", .{time});
    }    
}

pub fn back_data(T:anytype) !T{
    if (start_time==0){
      std.debug.print("\ntimer is not started,using timer.start() get start", .{});
      return error.timer_not_start;
    }else{
      end_time=std.time.nanoTimestamp();
      var time=end_time-start_time;
      switch (T) {
        usize=> {var back:T=@intCast(time);return back;},
        u8   => {var back:T=@intCast(time);return back;},
        u16  => {var back:T=@intCast(time);return back;},
        u32  => {var back:T=@intCast(time);return back;},
        u64  => {var back:T=@intCast(time);return back;},
        u128 => {var back:T=@intCast(time);return back;},
        isize=> {var back:T=@intCast(time);return back;},
        i8   => {var back:T=@intCast(time);return back;},
        i16  => {var back:T=@intCast(time);return back;},
        i32  => {var back:T=@intCast(time);return back;},
        i64  => {var back:T=@intCast(time);return back;},
        i128 => {var back:T=@intCast(time);return back;},
        f16  => {var back:T=@floatFromInt(time);return back;},
        f32  => {var back:T=@floatFromInt(time);return back;},
        f64  => {var back:T=@floatFromInt(time);return back;},
        f80  => {var back:T=@floatFromInt(time);return back;},
        f128 => {var back:T=@floatFromInt(time);return back;},
        else =>{std.debug.print("\ntimer can not back this type", .{});return error.can_not_support_this_type;},
      }
    }   
}
