return {
	settings = {
		ltex = {
      completionEnabled = true,
      checkFrequency = "save",
      latex = {
        commands = {
          ["\\cite[]{}"] = "ignore",
          ["\\cite{}"] = "ignore",
        },
      },
		},
	},
}
