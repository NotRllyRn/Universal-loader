loadstring(game:HttpGet("https://raw.githubusercontent.com/NotRllyRn/Universal-loader/main/UniversalLoader.lua"))()

local Ui = {
    ["Info"] = {
        ["ClassName"] = "Window"
    },
    ["Children"] = {
        [1] = {
            ["Info"] = {
                ["ClassName"] = "Tab",
                ["Name"] = "Tab 1",
                ["Selected"] = false
            },
            ["Children"] = {
                [1] = {
                    ["Info"] = {
                        ["ClassName"] = "Toggle",
                        ["Text"] = "Yes or no",
                        ["Selected"] = true
                    },
                    ["Function"] = function(val)
                        print(val)
                    end
                },
                [2] = {
                    ["Info"] = {
                        ["ClassName"] = "Button",
                        ["Text"] = "print 22",
                        ["ActivateAmount"] = 10
                    },
                    ["Function"] = function()
                        print(22)
                    end
                }
            }
        },
        [2] = {
            ["Info"] = {
                ["ClassName"] = "Tab",
                ["Name"] = "AutoFarm",
                ["Selected"] = true
            },
            ["Children"] = {
                [1] = {
                    ["Info"] = {
                        ["ClassName"] = "Label",
                        ["Text"] = "AutoFarm"
                    }
                },
                [2] = {
                    ["Info"] = {
                        ["ClassName"] = "Seperator"
                    }
                },
                [3] = {
                    ["Info"] = {
                        ["ClassName"] = "Slider",
                        ["Text"] = "Print Number LOl",
                        ["Decimals"] = 3,
                        ["Minimum"] = 300,
                        ["Maximum"] = 1000,
                        ["StartValue"] = 983,
                        ["FireWhenEnd"] = true
                    },
                    ["Function"] = function(val)
                        print(val)
                    end
                },
                [4] = {
                    ["Info"] = {
                        ["ClassName"] = "Slider",
                        ["Text"] = "Print Number LOl",
                        ["Decimals"] = 3,
                        ["Minimum"] = 300,
                        ["Maximum"] = 1000,
                        ["StartValue"] = 983,
                        ["FireWhenEnd"] = true
                    },
                    ["Function"] = function(val)
                        print(val)
                    end
                },
                [5] = {
                    ["Info"] = {
                        ["ClassName"] = "Slider",
                        ["Text"] = "Print Number LOl",
                        ["Decimals"] = 3,
                        ["Minimum"] = 300,
                        ["Maximum"] = 1000,
                        ["StartValue"] = 983,
                        ["FireWhenEnd"] = true
                    },
                    ["Function"] = function(val)
                        print(val)
                    end
                },
                [6] = {
                    ["Info"] = {
                        ["ClassName"] = "Slider",
                        ["Text"] = "Print Number LOl",
                        ["Decimals"] = 3,
                        ["Minimum"] = 300,
                        ["Maximum"] = 1000,
                        ["StartValue"] = 983,
                        ["FireWhenEnd"] = true
                    },
                    ["Function"] = function(val)
                        print(val)
                    end
                },
                [7] = {
                    ["Info"] = {
                        ["ClassName"] = "Label",
                        ["Text"] = "Bruh"
                    }
                },
            }
        }
    }
}

BNOLib("Test",Ui)