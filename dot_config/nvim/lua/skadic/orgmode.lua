require("orgmode").setup_ts_grammar()

require('orgmode').setup({
  org_agenda_files = {'~/MEGAsync/org/*' },
  org_default_notes_file = '~/MEGAsync/org/refile.org',
})