#![forbid(unsafe_code)]

pub mod config;

#[cfg(feature = "_tiles")]
mod source;
#[cfg(feature = "_tiles")]
pub use source::TileSources;

mod error;
pub use error::{MartinError, MartinResult};

pub mod srv;
