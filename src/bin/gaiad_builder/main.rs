//! Main entry point for GaiadBuilder

#![deny(warnings, missing_docs, trivial_casts, unused_qualifications)]
#![forbid(unsafe_code)]

use gaiad_builder::application::APP;

/// Boot GaiadBuilder
fn main() {
    abscissa_core::boot(&APP);
}
