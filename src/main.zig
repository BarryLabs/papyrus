const std = @import("std");

const MathError = error{ DivideByZero, EmptyInput, InvalidNumber };

fn average(a: []const f64) f64 {
    var value: f64 = 0;
    for (a) |num| {
        value += num;
    }
    value / 2;
    return value;
}

fn div(a: f64, b: f64) !f64 {
    if (b == 0) return error.DivideByZero;
    return a / b;
}

fn sum(a: []const f64) f64 {
    var value: f64 = 0;
    for (a) |num| {
        value += num;
    }
    return value;
}

fn factorial(a: u64) u64 {
    if (a <= 1) return 1;
    return a * factorial(a - 1);
}

fn parseString(s: []const u8) !void {
    if (s.len == 0) return error.EmptyInput;
}

fn parseToFloat(s: []const u8) !u32 {
    if (s.len == 0) return error.EmptyInput;
    return std.fmt.parseFloat(u32, s, 10) catch error.InvalidNumber;
}

pub fn main() void {
    std.debug.print("Hello!\n", .{});
    std.debug.print("{}\n", .{sum(&[_]f64{ 1, 2, 3, 4.5 })});

    const result = div(9, 3) catch |err| {
        std.debug.print("{}", .{err});
        return;
    };
    std.debug.print("Result: {d}\n", .{result});
}

test "Divide" {
    const a: f64 = 9;
    const b: f64 = 3;
    try std.testing.expectEqual(div(a, b), 3);
}

test "Sum" {
    try std.testing.expectEqual(sum(&[_]f64{ 1, 6.9, 250 }), 257.9);
}
