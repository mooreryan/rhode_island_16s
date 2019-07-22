library(rmarkdown)

args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 2) {
  write("usage: Rscript make_asv_table.R mnt_dir num_threads", file = stderr())
  quit(save = "no", status = 1, runLast = FALSE)
}

arg_mnt_dir <- args[1]
arg_num_threads = args[2]

write(paste0("INFO -- mnt dir is ", arg_mnt_dir), file = stderr())

html_outdir <- file.path(arg_mnt_dir, "html_output")

scripts_dir <- file.path("scripts", "make_asv_table")

scripts <- c(
  "1_set_up.Rmd",
  "3_make_asv_table.Rmd",
  "4_predict_taxonomy.Rmd",
  "5_tear_down.Rmd"
)

for (script in scripts) {
  render(file.path(arg_mnt_dir,
                   scripts_dir,
                   script),
         output_dir = html_outdir)
}
