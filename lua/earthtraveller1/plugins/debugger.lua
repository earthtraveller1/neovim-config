local dap = require("dap")

dap.adapters.lldb = {
    type = "executable",
    command = (function()
        if jit.os == "Windows" then
            return "C:/Program Files/LLVM/bin/lldb-vscode.exe"
        else
            return "/usr/bin/lldb-vscode"
        end
    end)(),
    name = 'lldb',
    options = {
        detached = false 
    }
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local dapui = require('dapui')

vim.keymap.set("n", "<F5>", function()
    dap.continue()
    dapui.open()
end)

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_over)
vim.keymap.set("n", "<leader>dr", dap.repl.open)

dapui.setup()
vim.keymap.set("n", "<leader>dui", dapui.toggle)

