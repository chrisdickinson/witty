#![no_std]
#![feature(lang_items)]

wit_bindgen::generate!("component");

extern crate wee_alloc;

// Use `wee_alloc` as the global allocator.
#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

// Define a custom type and implement the generated `Host` trait for it which
// represents implementing all the necesssary exported interfaces for this
// component.
struct MyHost;

impl Hello for MyHost {
    fn hello(name: String) -> String {
        name
    }
}

export_hello!(MyHost);

#[cfg(not(test))]
#[lang = "eh_personality"]
fn eh_personality() {}

#[cfg(not(test))]
#[panic_handler]
fn panic(panic_info: &core::panic::PanicInfo) -> ! {
    loop {}
}
