library(MakefileR)

makefile() +
  make_group(
    make_comment("Definitions"),
    make_def("R_VERSION", R.version.string)
  ) +
  make_group(
    make_comment("Universal rule"),
    make_rule("all", c("butter.R", "komet2A.R"))
  ) +
  make_group(
    make_comment("Special rule"),
    make_rule(".FORCE")
  ) +
  make_comment(c("============", "Action rules", "============")) +
  make_rule("first_target", ".FORCE", "echo 'Building first target'") +
  make_rule("second_target", "first_target",
    c("echo 'Building second target'", "echo 'Done'"))
    