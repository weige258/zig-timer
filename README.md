const timer=@import(timer.zig);
//import timer

pub fn main() !void{
   timer.start()
   //start the timer

   do something

   timer.end()
   //timing and print time

   timer.back_data(T)
   //timing and return data by type of T
}
