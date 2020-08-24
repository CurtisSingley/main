for target in *
do
mv "$target" "${target// /_}"
done
