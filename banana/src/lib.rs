wit_bindgen::generate!("component");

// Define a custom type and implement the generated `Host` trait for it which
// represents implementing all the necesssary exported interfaces for this
// component.
struct MyHost;

impl Hello for MyHost {
    fn hello(name: String) -> String {
        format!("hello {}", name)
    }
}

export_hello!(MyHost);
