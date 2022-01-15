local opts = {
    tools = {
        crate_graph = {
            backend = "gtk",
        }
    }
}

require('rust-tools').setup(opts)
