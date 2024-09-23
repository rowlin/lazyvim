return {
  "ta-tikoma/php.easy.nvim",
  config = true,
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  opts = {
    onAppend = {
      engine = "LuaSnip",
    },
  },
  keys = {
    { "-b", "<CMD>PHPEasyDocBlock<CR>" },
    { "-r", "<CMD>PHPEasyReplica<CR>" },
    { "-c", "<CMD>PHPEasyCopy<CR>" },
    { "-d", "<CMD>PHPEasyDelete<CR>" },
    { "-uu", "<CMD>PHPEasyRemoveUnusedUses<CR>" },
    { "-e", "<CMD>PHPEasyExtends<CR>" },
    { "-i", "<CMD>PHPEasyImplements<CR>" },
    { "-II", "<CMD>PHPEasyInitInterface<CR>" },
    { "-IC", "<CMD>PHPEasyInitClass<CR>" },
    { "-IAC", "<CMD>PHPEasyInitAbstractClass<CR>" },
    { "-IT", "<CMD>PHPEasyInitTrait<CR>" },
    { "-IE", "<CMD>PHPEasyInitEnum<CR>" },
    { "-c", "<CMD>PHPEasyAppendConstant<CR>", mode = { "n", "v" } },
    { "-p", "<CMD>PHPEasyAppendProperty<CR>", mode = { "n", "v" } },
    { "-m", "<CMD>PHPEasyAppendMethod<CR>", mode = { "n", "v" } },
    { "-__", "<CMD>PHPEasyAppendConstruct<CR>" },
    { "-_i", "<CMD>PHPEasyAppendInvoke<CR>" },
    { "-a", "<CMD>PHPEasyAppendArgument<CR>" },
  },
}
