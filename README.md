# Rhode Island 16S Pipeline

## Running the Analyses

- Download this repository
- Add reads to the `original_reads` folder present in this repo (it should be empty when you download).  If it doesn't exist, create it in the root of the repository.

All the generated files will be in `pipeline_output` and `html_output`.

### Run various pipelines

To generate the ASV table, you use the `run_make_asv_table.sh` shell script.  If you have a Docker container running, you could run it from inside.  Alternatively, you can run it from your host with a command like this

```
run_make_asv_table.sh img_tag mnt_dir num_threads
```

So if you are in the root directory of this repository and wanted to use docker image with tag `0.15.0`, mount the current working directory and use 4 CPUs, the command would be 

```
$(pwd)/scripts/run_make_asv_table.sh 0.15.0 $(pwd) 4
```

## TODO

- Any files/folders created by the container have `root` as user and group.
