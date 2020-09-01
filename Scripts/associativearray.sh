declare -A test_array

test_array=(
[0]=10
[20]=20
[30]=30
)

declare -p test_array

echo ${test_array[0]}
echo ${test_array[20]}
echo "${test_array[@]}"
echo ${test_array[*]}
