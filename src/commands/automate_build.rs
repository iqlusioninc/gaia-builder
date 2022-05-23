use abscissa_core::{Command, Runnable};
use clap::Parser;

#[derive(Command, Debug, Parser)]
pub struct AutomateBuildCmd {}

impl Runnable for AutomateBuildCmd {
    fn run(&self) {}
}
