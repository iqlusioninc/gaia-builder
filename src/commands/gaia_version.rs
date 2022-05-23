use abscissa_core::{Command, Runnable};
use clap::Parser;

#[derive(Command, Debug, Parser)]
pub struct GaiaVersionCmd {}

impl Runnable for GaiaVersionCmd {
    fn run(&self) {}
}
